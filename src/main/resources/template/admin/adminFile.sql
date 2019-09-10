#namespace("admin.file")
    #sql("saveFile")
      INSERT INTO `wms_admin_file`
      (`types`, `name`, `size`, `create_user_id`, `create_time`, `file_path`, `batch_id`)
       VALUES (?,?,?,?,?,?,?);
    #end
    #sql("queryByBatchId")
      SELECT a.file_id,a.name, CONCAT(FLOOR(a.size/1000),"KB") as size,a.create_user_id,b.realname as create_user_name,a.create_time,a.file_path,a.file_type,a.batch_id
      FROM `wms_admin_file` as a inner join `wms_admin_user` as b on a.create_user_id = b.user_id
      where a.batch_id=?
    #end
    #sql("queryPathByBatchId")
      SELECT path FROM `wms_admin_file` as a where a.batch_id=?
    #end
#end
