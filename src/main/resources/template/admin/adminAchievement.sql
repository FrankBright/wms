#namespace("admin.achievement")
  #sql("queryDeptInfo")
    select a.* from wms_crm_achievement a right join wms_admin_dept b on a.obj_id = b.dept_id  where a.year = ? and a.type = ? and b.dept_id = ? and a.status = ?
  #end
  #sql("queryUserInfo")
    select a.* from wms_crm_achievement a right join wms_admin_user b on a.obj_id = b.user_id  where a.year = ? and a.type = ? and b.user_id = ? and a.status = ?
  #end
  #sql("deleteAchievement")
    delete wms_crm_achievement from wms_crm_achievement where obj_id = ? and type = ? and year = ? and status = ?
  #end
  #sql("queryDeptById")
      select dept_id,name from wms_admin_dept where dept_id = ?
  #end
  #sql("queryDeptByPid")
      select dept_id,name from wms_admin_dept where pid = ?
  #end
  #sql("queryUserById")
    select user_id,realname as name from wms_admin_user where user_id = ?
  #end
  #sql("queryUserByDeptId")
    select user_id,realname as name  from wms_admin_user where dept_id = ?
  #end
#end
