package com.chenxing.wms.erp.admin.controller;

import com.alibaba.fastjson.JSON;
import com.jfinal.aop.Clear;
import com.jfinal.aop.Inject;
import com.chenxing.wms.common.annotation.Permissions;
import com.chenxing.wms.common.config.redis.RedisManager;
import com.chenxing.wms.erp.admin.service.AdminFileService;
import com.chenxing.wms.utils.BaseUtil;
import com.chenxing.wms.utils.R;
import com.jfinal.core.Controller;
import com.jfinal.kit.Kv;
import com.jfinal.upload.UploadFile;

import java.util.Map;

/**
 * 系统配置
 * @author hmb
 */
public class AdminSysConfigController extends Controller {

    private static final String SYS_CONFIG_KEY = "sys_config";

    @Inject
    private AdminFileService adminFileService;

    /**
     * 设置系统配置
     * @author hmb
     */
    @Permissions("manage:system")
    public void setSysConfig(){
        String prefix=BaseUtil.getDate();
        UploadFile file = getFile("file", prefix);
        Kv kv = getKv();
        if(file!=null){
            R r=adminFileService.upload(file,null,"file","/"+prefix);
            kv.set("logo",r.get("url"));
        }
        RedisManager.getRedis().set(SYS_CONFIG_KEY, JSON.toJSONString(kv));
        renderJson(R.ok());
    }

    /**
     * 查询系统配置
     * @author hmb
     */
    @Clear
    public void querySysConfig(){
        if (RedisManager.getRedis().get(SYS_CONFIG_KEY) == null){
            renderJson(R.ok().put("data",Kv.by("logo","").set("name","")));
            return;
        }
        String data = RedisManager.getRedis().get(SYS_CONFIG_KEY);
        Map map = JSON.parseObject(data, Map.class);
        renderJson(R.ok().put("data",map));
    }
}
