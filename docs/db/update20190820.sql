ALTER TABLE `wms_admin_field`
ADD COLUMN `relevant`  int(11) NULL COMMENT 'ֻ��������Ҫ��װ���ͻ����Զ����ֶ�ID' AFTER `field_type`;

ALTER TABLE `wms_crm_contract`
ADD COLUMN `total_price`  decimal(10,2) NULL COMMENT '��Ʒ�ܽ��' AFTER `discount_rate`;

ALTER TABLE `wms_crm_business`
ADD COLUMN `total_price`  decimal(10,2) NULL COMMENT '��Ʒ�ܽ��' AFTER `discount_rate`;

INSERT INTO `wms_admin_menu` VALUES ('146', '2', '�칫����', 'oa', '1', '10', '1', null);
INSERT INTO `wms_admin_menu` VALUES ('147', '146', '�鿴', 'read', '3', '1', '1', null);