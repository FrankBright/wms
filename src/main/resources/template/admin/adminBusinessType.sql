#namespace("admin.businessType")
  #sql("queryBusinessTypeList")
      select a.type_id,a.name,a.create_time,a.dept_ids,a.create_user_id,(select c.username from wms_admin_user c where c.user_id = a.create_user_id) as createName from wms_crm_business_type a
  #end
  #sql("getBusinessType")
    select a.type_id,a.name,a.dept_ids from wms_crm_business_type a where type_id = ?
  #end
  #sql("deleteBusinessStatus")
    delete from wms_crm_business_status where type_id = ?
  #end
  #sql("queryBusinessStatus")
    select * from wms_crm_business_status where type_id = ? order by order_num
  #end
#end
