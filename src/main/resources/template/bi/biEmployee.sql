#namespace("bi.employee")
  #sql ("totalContract")
  select count(a.contract_id) as contractNum,IFNULL(sum(a.money),0) as contractMoney,IFNULL(sum(b.money),0) as receivablesMoney,(IFNULL(sum(a.money),0)-IFNULL(sum(b.money),0)) as unreceivedMoney
  from wms_crm_contract as a left join wms_crm_receivables as b on a.contract_id = b.contract_id
  where DATE_FORMAT(a.order_date,#para(sqlDateFormat)) between #para(beginTime) and #para(finalTime) and a.check_status = 2 and a.owner_user_id in (0
  #if(userIds)
  ,#para(userIds)
  #end
  )
  #end
#end
