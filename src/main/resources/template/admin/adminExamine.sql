#namespace("admin.examine")
  #sql("getExaminePageList")
    select * from wms_admin_examine where  is_deleted = ?
  #end
  #sql("totalRowSql")
   select count(examine_id) from wms_admin_examine where  is_deleted = ?
  #end
  #sql("updateIsDeleted")
    UPDATE wms_admin_examine SET `is_deleted` = 1 WHERE examine_id = ?
  #end
  #sql("queryByFlowId")
   select * from wms_admin_examine_step where flow_id = ? order by sort
  #end
  #sql("updateStatus")
   UPDATE wms_admin_examine SET `status` = ABS(`status` - 1) WHERE examine_id = ?
  #end
  #sql("queryListByStatus")
   select * from wms_admin_examine where status = 1 and is_deleted = 0
  #end
  #sql("getExamineById")
    select * from wms_admin_examine where  examine_id = ?
  #end
  #sql("getExamineByCategoryType")
    select * from wms_admin_examine where  category_type = ? AND status = 1 order by update_time desc limit 1
  #end
  #sql("queryAllExamine")
      select adminExamine.*,adminUser.realname from wms_admin_examine as adminExamine
    LEFT JOIN wms_admin_user as adminUser on adminUser.user_id = adminExamine.update_user_id
    where  adminExamine.status = 1
  #end
  #sql("queryExaminePage")
     select adminExamine.*,adminUser.realname as updateUserName,createUser.realname as createUserName
     from wms_admin_examine as adminExamine
    LEFT JOIN wms_admin_user as adminUser on adminUser.user_id = adminExamine.update_user_id
    LEFT JOIN wms_admin_user as createUser on createUser.user_id = adminExamine.create_user_id
    where  adminExamine.status != 2
  #end
  #sql("queryExaminePageTotal")
    select count(*) from wms_admin_examine where status != 2
  #end
#end
