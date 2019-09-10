package com.chenxing.wms.erp.admin.entity.base;

import com.jfinal.plugin.activerecord.IBean;
import com.jfinal.plugin.activerecord.Model;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings({"serial", "unchecked"})
public abstract class BaseAdminScene<M extends BaseAdminScene<M>> extends Model<M> implements IBean {

	public M setSceneId(Integer sceneId) {
		set("scene_id", sceneId);
		return (M)this;
	}

	public Integer getSceneId() {
		return getInt("scene_id");
	}

	public M setType(Integer type) {
		set("type", type);
		return (M)this;
	}

	public Integer getType() {
		return getInt("type");
	}

	public M setName(String name) {
		set("name", name);
		return (M)this;
	}

	public String getName() {
		return getStr("name");
	}

	public M setUserId(Long userId) {
		set("user_id", userId);
		return (M)this;
	}

	public Long getUserId() {
		return getLong("user_id");
	}

	public M setSort(Integer sort) {
		set("sort", sort);
		return (M)this;
	}

	public Integer getSort() {
		return getInt("sort");
	}

	public M setData(String data) {
		set("data", data);
		return (M)this;
	}

	public String getData() {
		return getStr("data");
	}

	public M setIsHide(Integer isHide) {
		set("is_hide", isHide);
		return (M)this;
	}

	public Integer getIsHide() {
		return getInt("is_hide");
	}

	public M setIsSystem(Integer isSystem) {
		set("is_system", isSystem);
		return (M)this;
	}

	public Integer getIsSystem() {
		return getInt("is_system");
	}

	public M setBydata(String bydata) {
		set("bydata", bydata);
		return (M)this;
	}

	public String getBydata() {
		return getStr("bydata");
	}

	public M setCreateTime(java.util.Date createTime) {
		set("create_time", createTime);
		return (M)this;
	}

	public java.util.Date getCreateTime() {
		return getDate("create_time");
	}

	public M setUpdateTime(java.util.Date updateTime) {
		set("update_time", updateTime);
		return (M)this;
	}

	public java.util.Date getUpdateTime() {
		return getDate("update_time");
	}

}