#namespace("admin.dept")
    #sql("queryByIds")
      select dept_id as id,name from wms_admin_dept where dept_id in (
        #for(x:ids)
          #(for.index == 0 ? "" : ",")
              #para(x)
        #end
      )
    #end
    #sql("deptSql")
     select name,dept_id from wms_admin_dept ORDER BY num
    #end
#end
