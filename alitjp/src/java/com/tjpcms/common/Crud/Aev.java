package com.tjpcms.common.Crud;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


public class Aev {
	boolean needa = true;
	boolean neede = true;
	boolean needv = true;
	String title;
	String zdybc;//自定义新增、编辑页面的保存url，即自定义保存，注意要回返回JSON格式，可参考Hanshu中addedit或cmnusr中aj_xgmm的写法
	String hdnpara;
	List<Map<String,Object>> zds;
	String extjs;//额外的js，这个是定义aev数组时，可以额外引入的js文件
	
	String dynaev;//动态设置aev，如申请入会（单位或个人申请表不同）的情况
	String hook_befgx;//保存时切入一个钩子，在更新之前执行
	String hook_aftgx;//保存时切入一个钩子，在更新之后执行
	
	String hook_befad;//保存时切入一个钩子，在新增之前执行，返回"0"表示正确，其他表示错误，会中断后续的保存
	String hook_aftad;
	
	String tip;//页面提示信息

	//只单独配一个aev页面，无list页面的那种情况下，默认是根据表的主键字段和提交表单中对应的主键值来取记录的
	//但是如果取记录不是根据主键，而是根据其他字段（比如fwb的配置就是根据cid来取记录）来查记录，则配置crud时设置该字段的值
	List<String> objzjs = new ArrayList<String>();

	boolean noBtns = false;//可以设置编辑页面直接不要按钮，当然后面aev页面的按钮也要做成可以自定义的
	
	String jsAftbc;//设置在保存之后前台需要执行的额外js代码
	
	


	public String getJsAftbc() {
		return jsAftbc;
	}

	public void setJsAftbc(String jsAftbc) {
		this.jsAftbc = jsAftbc;
	}

	public boolean isNoBtns() {
		return noBtns;
	}

	public void setNoBtns(boolean noBtns) {
		this.noBtns = noBtns;
	}

	public List<String> getObjzjs() {
		return objzjs;
	}

	public void setObjzjs(List<String> objzjs) {
		this.objzjs = objzjs;
	}
	
	public void setObjzjs(String zj) {
		objzjs.add(zj);
	}

	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}

	public String getHook_befad() {
		return hook_befad;
	}

	public void setHook_befad(String hook_befad) {
		this.hook_befad = hook_befad;
	}

	public String getHook_aftad() {
		return hook_aftad;
	}

	public void setHook_aftad(String hook_aftad) {
		this.hook_aftad = hook_aftad;
	}

	public String getHook_aftgx() {
		return hook_aftgx;
	}

	public void setHook_aftgx(String hook_aftgx) {
		this.hook_aftgx = hook_aftgx;
	}
	
	public void setHook_aftadgx(String hook_atf) {
		this.hook_aftad = hook_atf;
		this.hook_aftgx = hook_atf;
	}
	public void setHook_befadgx(String hook_bef) {
		this.hook_befad = hook_bef;
		this.hook_befgx = hook_bef;
	}

	public String getDynaev() {
		return dynaev;
	}

	public void setDynaev(String dynaev) {
		this.dynaev = dynaev;
	}

	public String getHook_befgx() {
		return hook_befgx;
	}

	public void setHook_befgx(String hook_befgx) {
		this.hook_befgx = hook_befgx;
	}

	public String getExtjs() {
		return extjs;
	}

	public void setExtjs(String extjs) {
		this.extjs = extjs;
	}

	public String getHdnpara() {
		return hdnpara;
	}

	public void setHdnpara(String hdnpara) {
		this.hdnpara = hdnpara;
	}

	public boolean isNeeda() {
		return needa;
	}

	public void setNoaev() {
		setNeeda(false);
		setNeede(false);
		setNeedv(false);
	}
	public void setNeeda(boolean needa) {
		this.needa = needa;
	}

	public boolean isNeede() {
		return neede;
	}

	public void setNeede(boolean neede) {
		this.neede = neede;
	}

	public boolean isNeedv() {
		return needv;
	}

	public void setNeedv(boolean needv) {
		this.needv = needv;
	}
	
	public List<Map<String, Object>> getZds() {
		return zds;
	}

	public void setZds(List<Map<String, Object>> zds) {
		this.zds = zds;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getZdybc() {
		return zdybc;
	}

	public void setZdybc(String zdybc) {
		this.zdybc = zdybc;
	}


	
}
