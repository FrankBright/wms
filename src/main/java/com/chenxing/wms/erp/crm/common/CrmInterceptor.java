package com.chenxing.wms.erp.crm.common;

import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Record;
import com.chenxing.wms.common.constant.BaseConstant;
import com.chenxing.wms.erp.crm.entity.*;
import com.chenxing.wms.utils.AuthUtil;
import com.chenxing.wms.utils.BaseUtil;
import com.chenxing.wms.utils.R;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public class CrmInterceptor implements Interceptor {
    @Override
    public void intercept(Invocation inv){
        Controller controller = inv.getController();
        HttpServletRequest request = controller.getRequest();
        String requestURI = request.getRequestURI();
        String[] split = requestURI.split("/");
        Long userId = BaseUtil.getUserId();
        boolean flag = false;
        Map<String,String> tablePara =  AuthUtil.getCrmTablePara(split[1]);
        if(! userId.equals(BaseConstant.SUPER_ADMIN_USER_ID)){
            if(tablePara != null){
                if("addOrUpdate".equals(split[2]) || "saveAndUpdate".equals(split[2])){
                    String rawData = controller.getRawData();
                    JSONObject jsonObject = JSON.parseObject(rawData);
                    if("wms_crm_customer".equals(tablePara.get("tableName"))){
                        CrmCustomer entity = jsonObject.getObject("entity", CrmCustomer.class);
                        if(entity.getCustomerId() != null){
                            flag =  AuthUtil.isCrmAuth(tablePara, entity.getCustomerId());
                        }
                    }else if("wms_crm_leads".equals(tablePara.get("tableName"))){
                        CrmLeads entity = jsonObject.getObject("entity", CrmLeads.class);
                        if(entity.getLeadsId() != null){
                            flag =   AuthUtil.isCrmAuth(tablePara, entity.getLeadsId());
                        }
                    }else if("wms_crm_contract".equals(tablePara.get("tableName"))){
                        CrmContract entity = jsonObject.getObject("entity", CrmContract.class);
                        if(entity.getContractId() != null){
                            flag =   AuthUtil.isCrmAuth(tablePara, entity.getContractId());
                        }
                    }else if("wms_crm_contacts".equals(tablePara.get("tableName"))){
                        CrmContacts entity = jsonObject.getObject("entity", CrmContacts.class);
                        if(entity.getContactsId() != null){
                            flag =   AuthUtil.isCrmAuth(tablePara, entity.getContactsId());
                        }
                    }else if("wms_crm_business".equals(tablePara.get("tableName"))){
                        CrmBusiness entity = jsonObject.getObject("entity", CrmBusiness.class);
                        if(entity.getBusinessId() != null){
                            flag =   AuthUtil.isCrmAuth(tablePara, entity.getBusinessId());
                        }
                    }else if("wms_crm_receivables".equals(tablePara.get("tableName"))){
                        CrmReceivables entity = jsonObject.getObject("entity", CrmReceivables.class);
                        if(entity.getReceivablesId() != null){
                            flag =   AuthUtil.isCrmAuth(tablePara,entity.getReceivablesId());
                        }
                    }
                }else if("deleteByIds".equals(split[2])){
                    String[] next = controller.getParaMap().values().iterator().next();
                    String[] idsArr = next[0].split(",");
                    for(String id : idsArr){
                        if(StrUtil.isNotEmpty(id)){
                            flag =   AuthUtil.isCrmAuth(tablePara, Integer.valueOf(id));
                        }
                    }
                }else if("queryById".equals(split[2])){
                    String[] next = controller.getParaMap().values().iterator().next();
                    if(next != null && next.length > 0){
                        flag =   AuthUtil.isCrmAuth(tablePara, Integer.valueOf(next[0]));
                    }
                }
                if(flag){
                    if("queryById".equals(split[2])){
                        controller.renderJson(R.ok().put("data",new Record().set("dataAuth",0)));
                        return ;
                    }else {
                        controller.renderJson(R.error("无权操作"));
                        return;
                    }

                }
            }
        }
        inv.invoke();
    }
}
