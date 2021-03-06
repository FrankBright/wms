package com.chenxing.wms.erp;

import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.chenxing.wms.erp.admin.entity.*;
import com.chenxing.wms.erp.crm.entity.*;
import com.chenxing.wms.erp.oa.entity.*;
import com.chenxing.wms.erp.work.entity.*;

public class _MappingKit {

	public static void mapping(ActiveRecordPlugin arp) {
		arp.addMapping("wms_admin_dept", "dept_id", AdminDept.class);
		arp.addMapping("wms_admin_examine", "examine_id", AdminExamine.class);
		arp.addMapping("wms_admin_config", "setting_id", AdminConfig.class);
		arp.addMapping("wms_admin_examine_record", "record_id", AdminExamineRecord.class);
		arp.addMapping("wms_admin_examine_step", "step_id", AdminExamineStep.class);
		arp.addMapping("wms_admin_examine_log", "log_id", AdminExamineLog.class);
		arp.addMapping("wms_admin_field", "field_id", AdminField.class);
		arp.addMapping("wms_admin_field_sort", "field_id", AdminFieldSort.class);
		arp.addMapping("wms_admin_field_style", "id", AdminFieldStyle.class);
		arp.addMapping("wms_admin_fieldv", "id", AdminFieldv.class);
		arp.addMapping("wms_admin_file", "file_id", AdminFile.class);
		arp.addMapping("wms_admin_menu", "menu_id", AdminMenu.class);
		arp.addMapping("wms_admin_record", "record_id", AdminRecord.class);
		arp.addMapping("wms_admin_role", "role_id", AdminRole.class);
		arp.addMapping("wms_admin_role_menu", "id", AdminRoleMenu.class);
		arp.addMapping("wms_admin_scene", "scene_id", AdminScene.class);
		arp.addMapping("wms_admin_scene_default", "default_id", AdminSceneDefault.class);
		arp.addMapping("wms_admin_user", "user_id", AdminUser.class);
		arp.addMapping("wms_admin_user_role", "id", AdminUserRole.class);
		arp.addMapping("wms_crm_business", "business_id", CrmBusiness.class);
		arp.addMapping("wms_crm_achievement", "achievement_id", CrmAchievement.class);
		arp.addMapping("wms_crm_action_record", "id", CrmActionRecord.class);
		arp.addMapping("wms_crm_business_product", "r_id", CrmBusinessProduct.class);
		arp.addMapping("wms_crm_business_status", "status_id", CrmBusinessStatus.class);
		arp.addMapping("wms_crm_business_type", "type_id", CrmBusinessType.class);
		arp.addMapping("wms_crm_contacts", "contacts_id", CrmContacts.class);
		arp.addMapping("wms_crm_contacts_business", "id", CrmContactsBusiness.class);
		arp.addMapping("wms_crm_contract", "contract_id", CrmContract.class);
		arp.addMapping("wms_crm_contract_product", "r_id", CrmContractProduct.class);
		arp.addMapping("wms_crm_customer", "customer_id", CrmCustomer.class);
		arp.addMapping("wms_crm_customer_stats", "id", CrmCustomerStats.class);
		arp.addMapping("wms_crm_leads", "leads_id", CrmLeads.class);
		arp.addMapping("wms_crm_owner_record", "record_id", CrmOwnerRecord.class);
		arp.addMapping("wms_crm_product", "product_id", CrmProduct.class);
		arp.addMapping("wms_crm_product_category", "category_id", CrmProductCategory.class);
		arp.addMapping("wms_crm_receivables", "receivables_id", CrmReceivables.class);
		arp.addMapping("wms_crm_receivables_plan", "plan_id", CrmReceivablesPlan.class);
		arp.addMapping("wms_oa_action_record", "log_id", OaActionRecord.class);
		arp.addMapping("wms_oa_announcement", "announcement_id", OaAnnouncement.class);
		arp.addMapping("wms_oa_event", "event_id", OaEvent.class);
		arp.addMapping("wms_oa_event_relation", "eventrelation_id", OaEventRelation.class);
		arp.addMapping("wms_oa_examine_category", "category_id", OaExamineCategory.class);
		arp.addMapping("wms_oa_examine_relation", "r_id", OaExamineRelation.class);
		arp.addMapping("wms_oa_examine_travel", "travel_id", OaExamineTravel.class);
		arp.addMapping("wms_oa_examine", "examine_id", OaExamine.class);
		arp.addMapping("wms_oa_examine_log", "log_id", OaExamineLog.class);
		arp.addMapping("wms_oa_examine_record", "record_id", OaExamineRecord.class);
		arp.addMapping("wms_oa_examine_step", "step_id", OaExamineStep.class);
		arp.addMapping("wms_oa_log", "log_id", OaLog.class);
		arp.addMapping("wms_oa_log_relation", "r_id", OaLogRelation.class);
		arp.addMapping("wms_task", "task_id", Task.class);
		arp.addMapping("wms_task_comment", "comment_id", TaskComment.class);
		arp.addMapping("wms_task_relation", "r_id", TaskRelation.class);
		arp.addMapping("wms_work", "work_id", Work.class);
		arp.addMapping("wms_work_task_class", "class_id", WorkTaskClass.class);
		arp.addMapping("wms_work_task_label", "label_id", WorkTaskLabel.class);
		arp.addMapping("wms_work_task_log", "log_id", WorkTaskLog.class);
		arp.addMapping("wms_work_user", "id", WorkUser.class);
		arp.addMapping("wms_crm_business_change", "change_id", CrmBusinessChange.class);
	}
}

