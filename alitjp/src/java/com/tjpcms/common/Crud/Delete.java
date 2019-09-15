package com.tjpcms.common.Crud;


public class Delete {
	boolean need = true;
	boolean batdel = false;//批量删除
	String zdysql;//删除的自定义sql
	
	String hook_befdel;//删除之前的钩子
	String hook_aftdel;//删除之后的钩子
	
	public String getHook_befdel() {
		return hook_befdel;
	}
	public void setHook_befdel(String hook_befdel) {
		this.hook_befdel = hook_befdel;
	}
	public String getHook_aftdel() {
		return hook_aftdel;
	}
	public void setHook_aftdel(String hook_aftdel) {
		this.hook_aftdel = hook_aftdel;
	}
	public String getZdysql() {
		return zdysql;
	}
	public void setZdysql(String zdysql) {
		this.zdysql = zdysql;
	}
	public boolean isNeed() {
		return need;
	}
	public void setNeed(boolean need) {
		this.need = need;
	}
	public boolean isBatdel() {
		return batdel;
	}
	public Delete setBatdel(boolean batdel) {
		this.batdel = batdel;
		return this;
	}
}
