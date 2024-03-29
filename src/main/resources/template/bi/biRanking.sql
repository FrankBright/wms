#namespace("bi.ranking")
  #sql ("contractRanKing")
      SELECT IFNULL(SUM(cct.money), 0) as money,cau.realname,cct.owner_user_id,cad.name as structureName
      FROM
        wms_crm_contract as cct
      LEFT JOIN wms_admin_user as cau on cau.user_id = cct.owner_user_id
       left join wms_admin_dept as cad on cad.dept_id = cau.dept_id
      WHERE
        check_status = 2
        and  cct.owner_user_id in (
         #for(i : userIds)
            #(for.index > 0 ? "," : "")#para(i)
         #end
         )
        #if(type == 1)
          and to_days(NOW()) = TO_DAYS(order_date)
          #end
           #if(type == 2)
          and to_days(NOW()) - TO_DAYS(order_date) = 1
          #end
           #if(type == 3)
          and YEARWEEK(date_format(order_date,'%Y-%m-%d')) = YEARWEEK(now())
          #end
           #if(type == 4)
          and YEARWEEK(date_format(order_date,'%Y-%m-%d')) = YEARWEEK(now()) -1
          #end
           #if(type == 5)
          and date_format(order_date,'%Y-%m')=date_format(now(),'%Y-%m')
          #end
           #if(type == 6)
          and date_format(order_date,'%Y-%m')=date_format(DATE_SUB(curdate(), INTERVAL 1 MONTH),'%Y-%m')
          #end
           #if(type == 7)
          and QUARTER(order_date)=QUARTER(now()) AND YEAR(order_date)=YEAR(NOW())
          #end
           #if(type == 8)
          and QUARTER(order_date)=QUARTER(DATE_SUB(now(),interval 1 QUARTER)) and YEAR(DATE_SUB(order_date,interval 1 QUARTER)) = YEAR(DATE_SUB(NOW(),interval 1 QUARTER))
          #end
           #if(type == 9)
          and YEAR(order_date)=YEAR(NOW())
          #end
           #if(type == 10)
          and YEAR(order_date)=YEAR(date_sub(now(),interval 1 year))
          #end
           #if(type == 11)
            and  TO_DAYS(order_date) >= TO_DAYS(#para(startTime))
            and  TO_DAYS(order_date) <= TO_DAYS(#para(endTime))
          #end
        GROUP BY cct.owner_user_id
        ORDER BY IFNULL(SUM(cct.money), 0) DESC
  #end
  #sql ("receivablesRanKing")
      SELECT IFNULL(SUM(cct.money), 0) as money,cau.realname,cad.name as structureName
      FROM
        wms_crm_receivables as cct
      LEFT JOIN wms_admin_user as cau on cau.user_id = cct.owner_user_id
      left join wms_admin_dept as cad on cad.dept_id = cau.dept_id
      WHERE
        check_status = 2
        and  cct.owner_user_id in (
         #for(i : userIds)
            #(for.index > 0 ? "," : "")#para(i)
         #end
         )
        #if(type == 1)
          and to_days(NOW()) = TO_DAYS(return_time)
          #end
           #if(type == 2)
          and to_days(NOW()) - TO_DAYS(return_time) = 1
          #end
           #if(type == 3)
          and YEARWEEK(date_format(return_time,'%Y-%m-%d')) = YEARWEEK(now())
          #end
           #if(type == 4)
          and YEARWEEK(date_format(return_time,'%Y-%m-%d')) = YEARWEEK(now()) -1
          #end
           #if(type == 5)
          and date_format(return_time,'%Y-%m')=date_format(now(),'%Y-%m')
          #end
           #if(type == 6)
          and date_format(return_time,'%Y-%m')=date_format(DATE_SUB(curdate(), INTERVAL 1 MONTH),'%Y-%m')
          #end
           #if(type == 7)
          and QUARTER(return_time)=QUARTER(now()) AND YEAR(return_time)=YEAR(NOW())
          #end
           #if(type == 8)
          and QUARTER(return_time)=QUARTER(DATE_SUB(now(),interval 1 QUARTER)) and YEAR(DATE_SUB(return_time,interval 1 QUARTER)) = YEAR(DATE_SUB(NOW(),interval 1 QUARTER))
          #end
           #if(type == 9)
          and YEAR(return_time)=YEAR(NOW())
          #end
           #if(type == 10)
          and YEAR(return_time)=YEAR(date_sub(now(),interval 1 year))
          #end
           #if(type == 11)
            and  TO_DAYS(return_time) >= TO_DAYS(#para(startTime))
            and  TO_DAYS(return_time) <= TO_DAYS(#para(endTime))
          #end
        GROUP BY cct.owner_user_id
        ORDER BY IFNULL(SUM(cct.money), 0) DESC
  #end
  #sql ("contractCountRanKing")
      SELECT count(1) as `count`,cau.realname,cct.owner_user_id,cad.name as structureName
      FROM
        wms_crm_contract as cct
      LEFT JOIN wms_admin_user as cau on cau.user_id = cct.owner_user_id
       left join wms_admin_dept as cad on cad.dept_id = cau.dept_id
      WHERE
        check_status = 2
        and  cct.owner_user_id in (
         #for(i : userIds)
            #(for.index > 0 ? "," : "")#para(i)
         #end
         )
        #if(type == 1)
          and to_days(NOW()) = TO_DAYS(order_date)
          #end
           #if(type == 2)
          and to_days(NOW()) - TO_DAYS(order_date) = 1
          #end
           #if(type == 3)
          and YEARWEEK(date_format(order_date,'%Y-%m-%d')) = YEARWEEK(now())
          #end
           #if(type == 4)
          and YEARWEEK(date_format(order_date,'%Y-%m-%d')) = YEARWEEK(now()) -1
          #end
           #if(type == 5)
          and date_format(order_date,'%Y-%m')=date_format(now(),'%Y-%m')
          #end
           #if(type == 6)
          and date_format(order_date,'%Y-%m')=date_format(DATE_SUB(curdate(), INTERVAL 1 MONTH),'%Y-%m')
          #end
           #if(type == 7)
          and QUARTER(order_date)=QUARTER(now()) AND YEAR(order_date)=YEAR(NOW())
          #end
           #if(type == 8)
          and QUARTER(order_date)=QUARTER(DATE_SUB(now(),interval 1 QUARTER)) and YEAR(DATE_SUB(order_date,interval 1 QUARTER)) = YEAR(DATE_SUB(NOW(),interval 1 QUARTER))
          #end
           #if(type == 9)
          and YEAR(order_date)=YEAR(NOW())
          #end
           #if(type == 10)
          and YEAR(order_date)=YEAR(date_sub(now(),interval 1 year))
          #end
           #if(type == 11)
            and  TO_DAYS(order_date) >= TO_DAYS(#para(startTime))
            and  TO_DAYS(order_date) <= TO_DAYS(#para(endTime))
          #end
        GROUP BY cct.owner_user_id
        ORDER BY count(1) DESC
  #end
   #sql ("productCountRanKing")
     SELECT count(1) as `count`,cau.realname,cct.owner_user_id,cad.name as structureName
      FROM
        wms_crm_contract_product as ccp
      LEFT JOIN wms_crm_contract as cct on ccp.contract_id = cct.contract_id
      LEFT JOIN wms_admin_user as cau on cau.user_id = cct.owner_user_id
       left join wms_admin_dept as cad on cad.dept_id = cau.dept_id
      WHERE
        check_status = 2
        and  cct.owner_user_id in (
         #for(i : userIds)
            #(for.index > 0 ? "," : "")#para(i)
         #end
         )
        #if(type == 1)
          and to_days(NOW()) = TO_DAYS(order_date)
          #end
           #if(type == 2)
          and to_days(NOW()) - TO_DAYS(order_date) = 1
          #end
           #if(type == 3)
          and YEARWEEK(date_format(order_date,'%Y-%m-%d')) = YEARWEEK(now())
          #end
           #if(type == 4)
          and YEARWEEK(date_format(order_date,'%Y-%m-%d')) = YEARWEEK(now()) -1
          #end
           #if(type == 5)
          and date_format(order_date,'%Y-%m')=date_format(now(),'%Y-%m')
          #end
           #if(type == 6)
          and date_format(order_date,'%Y-%m')=date_format(DATE_SUB(curdate(), INTERVAL 1 MONTH),'%Y-%m')
          #end
           #if(type == 7)
          and QUARTER(order_date)=QUARTER(now()) AND YEAR(order_date)=YEAR(NOW())
          #end
           #if(type == 8)
          and QUARTER(order_date)=QUARTER(DATE_SUB(now(),interval 1 QUARTER)) and YEAR(DATE_SUB(order_date,interval 1 QUARTER)) = YEAR(DATE_SUB(NOW(),interval 1 QUARTER))
          #end
           #if(type == 9)
          and YEAR(order_date)=YEAR(NOW())
          #end
           #if(type == 10)
          and YEAR(order_date)=YEAR(date_sub(now(),interval 1 year))
          #end
           #if(type == 11)
            and  TO_DAYS(order_date) >= TO_DAYS(#para(startTime))
            and  TO_DAYS(order_date) <= TO_DAYS(#para(endTime))
          #end
        GROUP BY cct.owner_user_id
        ORDER BY count(1) DESC
  #end
  #sql ("customerCountRanKing")
      SELECT count(1) as `count`,cau.realname,cct.create_user_id,cad.name as structureName
      FROM
        wms_crm_customer as cct
      LEFT JOIN wms_admin_user as cau on cau.user_id = cct.create_user_id
       left join wms_admin_dept as cad on cad.dept_id = cau.dept_id
      WHERE
         cct.create_user_id in (
         #for(i : userIds)
            #(for.index > 0 ? "," : "")#para(i)
         #end
         )
        #if(type == 1)
          and to_days(NOW()) = TO_DAYS(cct.create_time)
          #end
           #if(type == 2)
          and to_days(NOW()) - TO_DAYS(cct.create_time) = 1
          #end
           #if(type == 3)
          and YEARWEEK(date_format(cct.create_time,'%Y-%m-%d')) = YEARWEEK(now())
          #end
           #if(type == 4)
          and YEARWEEK(date_format(cct.create_time,'%Y-%m-%d')) = YEARWEEK(now()) -1
          #end
           #if(type == 5)
          and date_format(cct.create_time,'%Y-%m')=date_format(now(),'%Y-%m')
          #end
           #if(type == 6)
          and date_format(cct.create_time,'%Y-%m')=date_format(DATE_SUB(curdate(), INTERVAL 1 MONTH),'%Y-%m')
          #end
           #if(type == 7)
          and QUARTER(cct.create_time)=QUARTER(now()) AND YEAR(cct.create_time)=YEAR(NOW())
          #end
           #if(type == 8)
          and QUARTER(cct.create_time)=QUARTER(DATE_SUB(now(),interval 1 QUARTER)) and YEAR(DATE_SUB(cct.create_time,interval 1 QUARTER)) = YEAR(DATE_SUB(NOW(),interval 1 QUARTER))
          #end
           #if(type == 9)
          and YEAR(cct.create_time)=YEAR(NOW())
          #end
           #if(type == 10)
          and YEAR(cct.create_time)=YEAR(date_sub(now(),interval 1 year))
          #end
           #if(type == 11)
            and  TO_DAYS(cct.create_time) >= TO_DAYS(#para(startTime))
            and  TO_DAYS(cct.create_time) <= TO_DAYS(#para(endTime))
          #end
        GROUP BY cct.create_user_id
        ORDER BY count(1) DESC
  #end
  #sql ("contactsCountRanKing")
      SELECT count(1) as `count`,cau.realname,cct.create_user_id,cad.name as structureName
      FROM
        wms_crm_contacts as cct
      LEFT JOIN wms_admin_user as cau on cau.user_id = cct.create_user_id
       left join wms_admin_dept as cad on cad.dept_id = cau.dept_id
      WHERE
         cct.create_user_id in (
         #for(i : userIds)
            #(for.index > 0 ? "," : "")#para(i)
         #end
         )
        #if(type == 1)
          and to_days(NOW()) = TO_DAYS(cct.create_time)
          #end
           #if(type == 2)
          and to_days(NOW()) - TO_DAYS(cct.create_time) = 1
          #end
           #if(type == 3)
          and YEARWEEK(date_format(cct.create_time,'%Y-%m-%d')) = YEARWEEK(now())
          #end
           #if(type == 4)
          and YEARWEEK(date_format(cct.create_time,'%Y-%m-%d')) = YEARWEEK(now()) -1
          #end
           #if(type == 5)
          and date_format(cct.create_time,'%Y-%m')=date_format(now(),'%Y-%m')
          #end
           #if(type == 6)
          and date_format(cct.create_time,'%Y-%m')=date_format(DATE_SUB(curdate(), INTERVAL 1 MONTH),'%Y-%m')
          #end
           #if(type == 7)
          and QUARTER(cct.create_time)=QUARTER(now()) AND YEAR(cct.create_time)=YEAR(NOW())
          #end
           #if(type == 8)
          and QUARTER(cct.create_time)=QUARTER(DATE_SUB(now(),interval 1 QUARTER)) and YEAR(DATE_SUB(cct.create_time,interval 1 QUARTER)) = YEAR(DATE_SUB(NOW(),interval 1 QUARTER))
          #end
           #if(type == 9)
          and YEAR(cct.create_time)=YEAR(NOW())
          #end
           #if(type == 10)
          and YEAR(cct.create_time)=YEAR(date_sub(now(),interval 1 year))
          #end
           #if(type == 11)
            and  TO_DAYS(cct.create_time) >= TO_DAYS(#para(startTime))
            and  TO_DAYS(cct.create_time) <= TO_DAYS(#para(endTime))
          #end
        GROUP BY cct.create_user_id
        ORDER BY count(1) DESC
  #end
  #sql ("customerGenjinCountRanKing")
      SELECT count(1) as `count`,cau.realname,cct.owner_user_id,cad.name as structureName
      FROM
        wms_crm_customer as cct
      LEFT JOIN wms_admin_user as cau on cau.user_id = cct.owner_user_id
       left join wms_admin_dept as cad on cad.dept_id = cau.dept_id
      WHERE
         cct.owner_user_id in (
         #for(i : userIds)
            #(for.index > 0 ? "," : "")#para(i)
         #end
         )
        #if(type == 1)
          and to_days(NOW()) = TO_DAYS(update_time)
          #end
           #if(type == 2)
          and to_days(NOW()) - TO_DAYS(update_time) = 1
          #end
           #if(type == 3)
          and YEARWEEK(date_format(update_time,'%Y-%m-%d')) = YEARWEEK(now())
          #end
           #if(type == 4)
          and YEARWEEK(date_format(update_time,'%Y-%m-%d')) = YEARWEEK(now()) -1
          #end
           #if(type == 5)
          and date_format(update_time,'%Y-%m')=date_format(now(),'%Y-%m')
          #end
           #if(type == 6)
          and date_format(update_time,'%Y-%m')=date_format(DATE_SUB(curdate(), INTERVAL 1 MONTH),'%Y-%m')
          #end
           #if(type == 7)
          and QUARTER(update_time)=QUARTER(now()) AND YEAR(update_time)=YEAR(NOW())
          #end
           #if(type == 8)
          and QUARTER(update_time)=QUARTER(DATE_SUB(now(),interval 1 QUARTER)) and YEAR(DATE_SUB(update_time,interval 1 QUARTER)) = YEAR(DATE_SUB(NOW(),interval 1 QUARTER))
          #end
           #if(type == 9)
          and YEAR(update_time)=YEAR(NOW())
          #end
           #if(type == 10)
          and YEAR(update_time)=YEAR(date_sub(now(),interval 1 year))
          #end
           #if(type == 11)
            and  TO_DAYS(update_time) >= TO_DAYS(#para(startTime))
            and  TO_DAYS(update_time) <= TO_DAYS(#para(endTime))
          #end
        GROUP BY cct.owner_user_id
        ORDER BY count(1) DESC
  #end
  #sql ("recordCountRanKing")
      SELECT count(1) as `count`,cau.realname,ccr.create_user_id,cad.name as structureName
      FROM
        wms_admin_record as ccr
      LEFT JOIN wms_admin_user as cau on cau.user_id = ccr.create_user_id
       left join wms_admin_dept as cad on cad.dept_id = cau.dept_id
      WHERE
         ccr.create_user_id in (
         #for(i : userIds)
            #(for.index > 0 ? "," : "")#para(i)
         #end
         )
        #if(type == 1)
          and to_days(NOW()) = TO_DAYS(ccr.create_time)
          #end
           #if(type == 2)
          and to_days(NOW()) - TO_DAYS(ccr.create_time) = 1
          #end
           #if(type == 3)
          and YEARWEEK(date_format(ccr.create_time,'%Y-%m-%d')) = YEARWEEK(now())
          #end
           #if(type == 4)
          and YEARWEEK(date_format(ccr.create_time,'%Y-%m-%d')) = YEARWEEK(now()) -1
          #end
           #if(type == 5)
          and date_format(ccr.create_time,'%Y-%m')=date_format(now(),'%Y-%m')
          #end
           #if(type == 6)
          and date_format(ccr.create_time,'%Y-%m')=date_format(DATE_SUB(curdate(), INTERVAL 1 MONTH),'%Y-%m')
          #end
           #if(type == 7)
          and QUARTER(ccr.create_time)=QUARTER(now()) AND YEAR(ccr.create_time)=YEAR(NOW())
          #end
           #if(type == 8)
          and QUARTER(ccr.create_time)=QUARTER(DATE_SUB(now(),interval 1 QUARTER)) and YEAR(DATE_SUB(ccr.create_time,interval 1 QUARTER)) = YEAR(DATE_SUB(NOW(),interval 1 QUARTER))
          #end
           #if(type == 9)
          and YEAR(ccr.create_time)=YEAR(NOW())
          #end
           #if(type == 10)
          and YEAR(ccr.create_time)=YEAR(date_sub(now(),interval 1 year))
          #end
           #if(type == 11)
            and  TO_DAYS(ccr.create_time) >= TO_DAYS(#para(startTime))
            and  TO_DAYS(ccr.create_time) <= TO_DAYS(#para(endTime))
          #end
        GROUP BY ccr.create_user_id
        ORDER BY count(1) DESC
  #end
   #sql ("contractProductRanKing")
     SELECT IFNULL(SUM(cccp.num),0) as num ,ccpc.`name` as categoryName,ccp.`name` as productName,ccpc.category_id , ccp.product_id
      FROM wms_crm_contract_product  as cccp
      LEFT JOIN wms_crm_contract as cct on cct.contract_id = cccp.contract_id
      LEFT JOIN wms_crm_product as ccp on ccp.product_id = cccp.product_id
      LEFT JOIN wms_crm_product_category as ccpc ON ccpc.category_id = ccp.category_id
      WHERE
        check_status = 2
        and  cct.owner_user_id in (
         #for(i : userIds)
            #(for.index > 0 ? "," : "")#para(i)
         #end
         )
        #if(type == 1)
          and to_days(NOW()) = TO_DAYS(cct.order_date)
          #end
           #if(type == 2)
          and to_days(NOW()) - TO_DAYS(cct.order_date) = 1
          #end
           #if(type == 3)
          and YEARWEEK(date_format(cct.order_date,'%Y-%m-%d')) = YEARWEEK(now())
          #end
           #if(type == 4)
          and YEARWEEK(date_format(cct.order_date,'%Y-%m-%d')) = YEARWEEK(now()) -1
          #end
           #if(type == 5)
          and date_format(cct.order_date,'%Y-%m')=date_format(now(),'%Y-%m')
          #end
           #if(type == 6)
          and date_format(cct.order_date,'%Y-%m')=date_format(DATE_SUB(curdate(), INTERVAL 1 MONTH),'%Y-%m')
          #end
           #if(type == 7)
          and QUARTER(cct.order_date)=QUARTER(now()) AND YEAR(cct.order_date)=YEAR(NOW())
          #end
           #if(type == 8)
          and QUARTER(cct.order_date)=QUARTER(DATE_SUB(now(),interval 1 QUARTER)) and YEAR(DATE_SUB(cct.order_date,interval 1 QUARTER)) = YEAR(DATE_SUB(NOW(),interval 1 QUARTER))
          #end
           #if(type == 9)
          and YEAR(cct.order_date)=YEAR(NOW())
          #end
           #if(type == 10)
          and YEAR(cct.order_date)=YEAR(date_sub(now(),interval 1 year))
          #end
           #if(type == 11)
            and  TO_DAYS(cct.order_date) >= TO_DAYS(#para(startTime))
            and  TO_DAYS(cct.order_date) <= TO_DAYS(#para(endTime))
          #end
        GROUP BY cccp.product_id
  #end
  #sql ("travelCountRanKing")
      SELECT count(1) as `count`,cau.realname,coe.create_user_id,cad.name as structureName
      FROM
        wms_oa_examine_travel as coet
         LEFT JOIN wms_oa_examine as coe on coe.examine_id = coet.examine_id
      LEFT JOIN wms_admin_user as cau on cau.user_id = coe.create_user_id
       left join wms_admin_dept as cad on cad.dept_id = cau.dept_id
      WHERE
         coe.create_user_id in (
         #for(i : userIds)
            #(for.index > 0 ? "," : "")#para(i)
         #end
         )
        #if(type == 1)
          and to_days(NOW()) = TO_DAYS(coet.start_time)
          #end
           #if(type == 2)
          and to_days(NOW()) - TO_DAYS(coet.start_time) = 1
          #end
           #if(type == 3)
          and YEARWEEK(date_format(coet.start_time,'%Y-%m-%d')) = YEARWEEK(now())
          #end
           #if(type == 4)
          and YEARWEEK(date_format(coet.start_time,'%Y-%m-%d')) = YEARWEEK(now()) -1
          #end
           #if(type == 5)
          and date_format(coet.start_time,'%Y-%m')=date_format(now(),'%Y-%m')
          #end
           #if(type == 6)
          and date_format(coet.start_time,'%Y-%m')=date_format(DATE_SUB(curdate(), INTERVAL 1 MONTH),'%Y-%m')
          #end
           #if(type == 7)
          and QUARTER(coet.start_time)=QUARTER(now()) AND YEAR(coet.start_time)=YEAR(NOW())
          #end
           #if(type == 8)
          and QUARTER(coet.start_time)=QUARTER(DATE_SUB(now(),interval 1 QUARTER)) and YEAR(DATE_SUB(coet.start_time,interval 1 QUARTER)) = YEAR(DATE_SUB(NOW(),interval 1 QUARTER))
          #end
           #if(type == 9)
          and YEAR(coet.start_time)=YEAR(NOW())
          #end
           #if(type == 10)
          and YEAR(coet.start_time)=YEAR(date_sub(now(),interval 1 year))
          #end
           #if(type == 11)
            and  TO_DAYS(coet.start_time) >= TO_DAYS(#para(startTime))
            and  TO_DAYS(coet.start_time) <= TO_DAYS(#para(endTime))
          #end
        GROUP BY coe.create_user_id
        ORDER BY count(1) DESC
  #end
  #sql("productSellRanKing")
    SELECT cct.contract_id,ccs.customer_id,ccp.product_id,ccpc.category_id,cct.`name` as contractName,
      ccpc.`name` as categoryName,ccs.customer_name as customerName,cccp.num as num,cccp.subtotal ,cccp.sales_price as salesPrice,
      cct.num as contractNum,cct.owner_user_id  ,cau.realname,cccp.unit,cccp.discount,cccp.price
      FROM wms_crm_contract as cct
      LEFT JOIN wms_crm_contract_product as cccp ON cccp.contract_id = cct.contract_id
      LEFT JOIN wms_crm_customer as ccs on ccs.customer_id = cct.customer_id
      LEFT JOIN wms_crm_product as ccp on ccp.product_id = cccp.product_id
      LEFT JOIN wms_crm_product_category as ccpc ON ccp.category_id = ccpc.category_id
      LEFT JOIN wms_admin_user as cau on cau.user_id = cct.owner_user_id
      where
          cct.check_status = 2
        and  cct.owner_user_id in (
         #for(i : userIds)
            #(for.index > 0 ? "," : "")#para(i)
         #end
         )
        #if(type == 1)
          and to_days(NOW()) = TO_DAYS(cct.order_date)
          #end
           #if(type == 2)
          and to_days(NOW()) - TO_DAYS(cct.order_date) = 1
          #end
           #if(type == 3)
          and YEARWEEK(date_format(cct.order_date,'%Y-%m-%d')) = YEARWEEK(now())
          #end
           #if(type == 4)
          and YEARWEEK(date_format(cct.order_date,'%Y-%m-%d')) = YEARWEEK(now()) -1
          #end
           #if(type == 5)
          and date_format(cct.order_date,'%Y-%m')=date_format(now(),'%Y-%m')
          #end
           #if(type == 6)
          and date_format(cct.order_date,'%Y-%m')=date_format(DATE_SUB(curdate(), INTERVAL 1 MONTH),'%Y-%m')
          #end
           #if(type == 7)
          and QUARTER(cct.order_date)=QUARTER(now()) AND YEAR(cct.order_date)=YEAR(NOW())
          #end
           #if(type == 8)
          and QUARTER(cct.order_date)=QUARTER(DATE_SUB(now(),interval 1 QUARTER)) and YEAR(DATE_SUB(cct.order_date,interval 1 QUARTER)) = YEAR(DATE_SUB(NOW(),interval 1 QUARTER))
          #end
           #if(type == 9)
          and YEAR(cct.order_date)=YEAR(NOW())
          #end
           #if(type == 10)
          and YEAR(cct.order_date)=YEAR(date_sub(now(),interval 1 year))
          #end
           #if(type == 11)
            and  TO_DAYS(cct.order_date) >= TO_DAYS(#para(startTime))
            and  TO_DAYS(cct.order_date) <= TO_DAYS(#para(endTime))
          #end
      #end
      #sql("addressAnalyse")
        SELECT  COUNT(1) as allCustomer,
        ifnull((SELECT COUNT(1) FROM wms_crm_customer where deal_status = '已成交' and left(address,INSTR(address, ',') - 1) = left(ccc.address,INSTR(ccc.address, ',') - 1)) ,0)as dealCustomer,
        #para(address) as address
        FROM wms_crm_customer as ccc
        where  left(ccc.address,INSTR(ccc.address, ',') - 1) like concat('%',#para(address),'%')
      #end
       #sql("portrait")
          SELECT (SELECT COUNT(1) FROM customerview WHERE `客户行业` =ccc.`客户行业`) as allCustomer,
        (SELECT COUNT(1) FROM customerview where deal_status = '已成交' and `客户行业` =ccc.`客户行业`) as dealCustomer,
        CASE
        when  ccc.`客户行业` = '' then  '未知'
        ELSE ccc.`客户行业` end
        as industry
         FROM customerview as ccc
         where   ccc.owner_user_id in (
         #for(i : userIds)
            #(for.index > 0 ? "," : "")#para(i)
         #end
         )
          #if(type == 1)
          and to_days(NOW()) = TO_DAYS(ccc.create_time)
          #end
           #if(type == 2)
          and to_days(NOW()) - TO_DAYS(ccc.create_time) = 1
          #end
           #if(type == 3)
          and YEARWEEK(date_format(ccc.create_time,'%Y-%m-%d')) = YEARWEEK(now())
          #end
           #if(type == 4)
          and YEARWEEK(date_format(ccc.create_time,'%Y-%m-%d')) = YEARWEEK(now()) -1
          #end
           #if(type == 5)
          and date_format(ccc.create_time,'%Y-%m')=date_format(now(),'%Y-%m')
          #end
           #if(type == 6)
          and date_format(ccc.create_time,'%Y-%m')=date_format(DATE_SUB(curdate(), INTERVAL 1 MONTH),'%Y-%m')
          #end
           #if(type == 7)
          and QUARTER(ccc.create_time)=QUARTER(now()) AND YEAR(ccc.create_time)=YEAR(NOW())
          #end
           #if(type == 8)
          and QUARTER(ccc.create_time)=QUARTER(DATE_SUB(now(),interval 1 QUARTER)) and YEAR(DATE_SUB(ccc.create_time,interval 1 QUARTER)) = YEAR(DATE_SUB(NOW(),interval 1 QUARTER))
          #end
           #if(type == 9)
          and YEAR(ccc.create_time)=YEAR(NOW())
          #end
           #if(type == 10)
          and YEAR(ccc.create_time)=YEAR(date_sub(now(),interval 1 year))
          #end
           #if(type == 11)
            and  TO_DAYS(ccc.create_time) >= TO_DAYS(#para(startTime))
            and  TO_DAYS(ccc.create_time) <= TO_DAYS(#para(endTime))
          #end
        GROUP BY ccc.`客户行业`
       #end
       #sql("portraitLevel")
         SELECT (SELECT COUNT(1) FROM customerview WHERE `客户级别` =ccc.`客户级别`) as allCustomer,
          (SELECT COUNT(1) FROM customerview where deal_status = '已成交' and `客户级别` =ccc.`客户级别`) as dealCustomer,
          CASE
          when  ccc.`客户级别` = '' then  '未知'
          ELSE ccc.`客户级别` end
          as level
          FROM customerview as ccc
          where   ccc.owner_user_id in (
         #for(i : userIds)
            #(for.index > 0 ? "," : "")#para(i)
         #end
         )
          #if(type == 1)
          and to_days(NOW()) = TO_DAYS(ccc.create_time)
          #end
           #if(type == 2)
          and to_days(NOW()) - TO_DAYS(ccc.create_time) = 1
          #end
           #if(type == 3)
          and YEARWEEK(date_format(ccc.create_time,'%Y-%m-%d')) = YEARWEEK(now())
          #end
           #if(type == 4)
          and YEARWEEK(date_format(ccc.create_time,'%Y-%m-%d')) = YEARWEEK(now()) -1
          #end
           #if(type == 5)
          and date_format(ccc.create_time,'%Y-%m')=date_format(now(),'%Y-%m')
          #end
           #if(type == 6)
          and date_format(ccc.create_time,'%Y-%m')=date_format(DATE_SUB(curdate(), INTERVAL 1 MONTH),'%Y-%m')
          #end
           #if(type == 7)
          and QUARTER(ccc.create_time)=QUARTER(now()) AND YEAR(ccc.create_time)=YEAR(NOW())
          #end
           #if(type == 8)
          and QUARTER(ccc.create_time)=QUARTER(DATE_SUB(now(),interval 1 QUARTER)) and YEAR(DATE_SUB(ccc.create_time,interval 1 QUARTER)) = YEAR(DATE_SUB(NOW(),interval 1 QUARTER))
          #end
           #if(type == 9)
          and YEAR(ccc.create_time)=YEAR(NOW())
          #end
           #if(type == 10)
          and YEAR(ccc.create_time)=YEAR(date_sub(now(),interval 1 year))
          #end
           #if(type == 11)
            and  TO_DAYS(ccc.create_time) >= TO_DAYS(#para(startTime))
            and  TO_DAYS(ccc.create_time) <= TO_DAYS(#para(endTime))
          #end
        GROUP BY ccc.`客户级别`
       #end
       #sql("portraitSource")
        SELECT (SELECT COUNT(1) FROM customerview WHERE `客户来源` =ccc.`客户来源`) as allCustomer,
          (SELECT COUNT(1) FROM customerview where deal_status = '已成交' and `客户来源` =ccc.`客户来源`) as dealCustomer,
          CASE
          when  ccc.`客户来源` = '' then  '未知'
          ELSE ccc.`客户来源` end
          as source
           FROM customerview as ccc
          where   ccc.owner_user_id in (
         #for(i : userIds)
            #(for.index > 0 ? "," : "")#para(i)
         #end
         )
          #if(type == 1)
          and to_days(NOW()) = TO_DAYS(ccc.create_time)
          #end
           #if(type == 2)
          and to_days(NOW()) - TO_DAYS(ccc.create_time) = 1
          #end
           #if(type == 3)
          and YEARWEEK(date_format(ccc.create_time,'%Y-%m-%d')) = YEARWEEK(now())
          #end
           #if(type == 4)
          and YEARWEEK(date_format(ccc.create_time,'%Y-%m-%d')) = YEARWEEK(now()) -1
          #end
           #if(type == 5)
          and date_format(ccc.create_time,'%Y-%m')=date_format(now(),'%Y-%m')
          #end
           #if(type == 6)
          and date_format(ccc.create_time,'%Y-%m')=date_format(DATE_SUB(curdate(), INTERVAL 1 MONTH),'%Y-%m')
          #end
           #if(type == 7)
          and QUARTER(ccc.create_time)=QUARTER(now()) AND YEAR(ccc.create_time)=YEAR(NOW())
          #end
           #if(type == 8)
          and QUARTER(ccc.create_time)=QUARTER(DATE_SUB(now(),interval 1 QUARTER)) and YEAR(DATE_SUB(ccc.create_time,interval 1 QUARTER)) = YEAR(DATE_SUB(NOW(),interval 1 QUARTER))
          #end
           #if(type == 9)
          and YEAR(ccc.create_time)=YEAR(NOW())
          #end
           #if(type == 10)
          and YEAR(ccc.create_time)=YEAR(date_sub(now(),interval 1 year))
          #end
           #if(type == 11)
            and  TO_DAYS(ccc.create_time) >= TO_DAYS(#para(startTime))
            and  TO_DAYS(ccc.create_time) <= TO_DAYS(#para(endTime))
          #end
        GROUP BY ccc.`客户来源`
       #end
#end
