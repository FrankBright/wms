#namespace("admin.examineStep")
   #sql("queryExamineStepByExamineId")
        select * from wms_admin_examine_step where  examine_id = ?
   #end
   #sql("deleteExamineStepByExamineId")
        DELETE  FROM  wms_admin_examine_step WHERE examine_id = ?
   #end
   #sql("queryExamineStepByExamineIdOrderByStepNum")
        SELECT * FROM wms_admin_examine_step WHERE examine_id = ? ORDER BY step_num LIMIT 0,1
   #end
   #sql("queryExamineStepByNextExamineIdOrderByStepId")
        SELECT * FROM wms_admin_examine_step WHERE examine_id = ?
        and step_num =  (SELECT step_num FROM wms_admin_examine_step where step_id = ?) + 1
   #end
   #sql("queryExamineRecordById")
     SELECT saer.* ,sau.img,sau.realname from wms_admin_examine_record as  saer
     LEFT JOIN wms_admin_user as sau on sau.user_id = saer.create_user
     WHERE saer.record_id = ?
   #end
#end
