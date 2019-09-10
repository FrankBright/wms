#namespace("crm.receivablesplan")
  #sql("queryByContractId")
    SELECT * FROM wms_crm_receivables_plan where contract_id = ? order by num desc limit 0,1
   #end
   #sql("queryListByContractId")
     select scrp.plan_id,  scrp.num,scc.customer_name ,scco.num as contract_num ,scrp.remind,
     scrp.money,scrp.return_date,return_type,
     scrp.remind,scrp.remark
                     from wms_crm_receivables_plan as scrp
                    LEFT JOIN wms_crm_customer as scc on scc.customer_id = scrp.customer_id
                     LEFT JOIN wms_crm_contract as scco on scco.contract_id = scrp.contract_id
                    where scrp.contract_id = ?
   #end
    #sql("queryListByCustomerId")
    select scrp.plan_id,  scrp.num,scc.customer_name ,scco.num as contract_num ,scrp.remind,
     scrp.money,scrp.return_date,return_type,
     scrp.remind,scrp.remark
                     from wms_crm_receivables_plan as scrp
                    LEFT JOIN wms_crm_customer as scc on scc.customer_id = scrp.customer_id
                     LEFT JOIN wms_crm_contract as scco on scco.contract_id = scrp.contract_id
                    where scrp.customer_id = ?
   #end
   #sql("queryByNumCustomerId")
     SELECT * from wms_crm_receivables_plan WHERE num = ? and contract_id = ? and customer_id = ?
   #end
   #sql("queryByCustomerIdContractId")
     SELECT * from wms_crm_receivables_plan WHERE receivables_id is null and contract_id = ? and customer_id = ?
   #end
   #sql("queryReceivablesPlanById")
     select * from wms_crm_receivables_plan where contract_id = ?
   #end

  #sql ("deleteByIds")
    delete from wms_crm_receivables_plan where receivables_id = ?
  #end
    #sql("queryReceivablesReceivablesId")
     select * from wms_crm_receivables_plan where receivables_id in(
                #for(i : receivablesIds)
                    #(for.index > 0 ? "," : "")#para(i)
               #end
     )
   #end
  #sql ("queryUpdateField")
  select a.customer_id,b.customer_name,a.contract_id,c.num,a.money,a.return_date,a.return_type,a.remind,a.remark
  from wms_crm_receivables_plan as a left join wms_crm_customer as b on a.customer_id = b.customer_id
  left join wms_crm_contract as c on a.contract_id = c.contract_id
  where a.plan_id = ?
  #end
#end
