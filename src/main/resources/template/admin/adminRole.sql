#namespace("admin.role")
    #sql ("getMenuIdByRoleId")
      select menu_id from wms_admin_role_menu where role_id = ?
    #end

    #sql ("getRoleUser")
      select *,b.name as dept_name,c.name as post_name
      from wms_admin_user as a inner join wms_admin_dept as b inner join wms_admin_post as c inner join
      wms_admin_user_role as d inner join wms_admin_role as e
      where a.dept_id = b.dept_id and a.post = c.id and a.user_id = d.user_id and d.role_id = e.role_id and role_type = ?
    #end

    #sql ("deleteRole")
      delete from wms_admin_role where role_id = ?
    #end

    #sql ("deleteRoleMenu")
      delete from wms_admin_role_menu where role_id = ?
    #end

    #sql ("getMenuIdsList")
      select menu_id from wms_admin_role_menu where role_id = ?
    #end

    #sql ("getRoleListByRoleType")
      select role_id as id ,role_name as title,role_name as remark,data_type as type,status,role_type as pid,label from wms_admin_role WHERE role_type=? and is_hidden = 1
    #end

    #sql ("getRoleMenu")
      select b.menu_id
      from wms_admin_role_menu as a inner join wms_admin_menu as b on a.menu_id = b.menu_id
      where a.role_id = ?
			and (b.parent_id in (SELECT menu_id FROM wms_admin_menu WHERE parent_id = ?) or b.parent_id = ?)
    #end

    #sql ("queryAnnouncementByUserId")
      SELECT a.* FROM wms_admin_role as a
      LEFT JOIN wms_admin_user_role as saur on saur.role_id = a.role_id
      WHERE saur.user_id = ? and a.role_type = 1 and a.role_name = '公告管理员' and a.status = 1
    #end
    #sql("queryDataTypeByUserId")
      SELECT DISTINCT a.data_type FROM wms_admin_role as a LEFT JOIN wms_admin_user_role as b on a.role_id=b.role_id WHERE b.user_id=?  ORDER BY a.data_type desc
    #end
    #sql("queryRoleIdsByUserId")
      SELECT role_id FROM wms_admin_user_role as a WHERE a.user_id=?
    #end
     #sql("queryUserRoleListByUserId")
        SELECT
            k.data_type,
            k.menu_id,
            am.menu_name,
            am.parent_realm as realm
        FROM
            (
                SELECT
                    t.*, arm.menu_id
                FROM
                    (
                        SELECT DISTINCT
                            a.data_type,
                            a.role_name,
                            a.role_id,
                            b.user_id
                        FROM
                            wms_admin_role AS a
                        LEFT JOIN wms_admin_user_role AS b ON a.role_id = b.role_id
                    ) t
                LEFT JOIN wms_admin_role_menu arm ON t.role_id = arm.role_id
            ) k
        INNER JOIN (SELECT x.*,y.realm as parent_realm from wms_admin_menu as x LEFT JOIN wms_admin_menu as y on x.parent_id = y.menu_id) am ON k.menu_id = am.menu_id
        WHERE
         k.user_id =#para(userId)
         #if(realm)
            and am.parent_realm = #para(realm) and am.realm = 'index'
         #end
        ORDER BY
            k.data_type DESC
    #end
#end
