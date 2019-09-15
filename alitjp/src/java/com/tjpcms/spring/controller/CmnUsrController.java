/**
 * 作者:tjp
 * QQ号：57454144
 * QQ群：168895774
 * 官网：http://www.tjpcms.com
 * 码云：https://git.oschina.net/tjpcms/tjpcms
 * 更新日期：2017-01-22
 * tjpcms - 最懂你的cms
 */

package com.tjpcms.spring.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ndktools.javamd5.Mademd5;
import com.tjpcms.cfg.XT;
import com.tjpcms.common.AevZdType;
import com.tjpcms.common.CL;
import com.tjpcms.common.Edllx;
import com.tjpcms.common.Hanshu;
import com.tjpcms.common.Qt;
import com.tjpcms.common.Crud.Crud;
import com.tjpcms.spring.mapper.EntMapper;
import com.tjpcms.spring.model.Ssousr;


/*
 * 这块以后要合并到nedadmcontroller里，通过权限来区别
 * */

@Controller
@RequestMapping(XT.grzxlj)
public class CmnUsrController {
	private static final Log logger = LogFactory.getLog(CmnUsrController.class);
	@Resource(name = "entMapper")
	private EntMapper _e;
	
	@RequestMapping(value = "index")
	public String index_get(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Hanshu.setGlobal(request);
		return"usr/index_us";
	}

	//=====================================================================================
	//=====================================================================================
	@RequestMapping(value = "aev")
	public ModelAndView aev(HttpServletRequest request, HttpServletResponse response) throws IOException {
		return Hanshu.aev(request, _e);
	}

	@RequestMapping(value = "addedit")
	public void addedit(HttpServletRequest request, HttpServletResponse response) throws InterruptedException, IOException {
		Hanshu.addedit(request, response, _e);
	}

	//新增和编辑时检测字段值是否唯一
	@RequestMapping(value = "unique")
	public void unique(HttpServletRequest request, HttpServletResponse response) throws InterruptedException, IOException {
		Hanshu.unique(request, response, _e);
	}

	@RequestMapping(value = "delete")
	public void delete(HttpServletRequest request, HttpServletResponse response) throws InterruptedException, IOException {
		Hanshu.delete(request, response, _e);
	}

	@RequestMapping(value = "ajaxupload")
	public void ajaxupload(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws  Exception  {
		Hanshu.ajaxupload(file,request,response,_e);
	}
	
	//点击父栏目，显示子栏目列表
	@RequestMapping(value = "fulanmu_zi")
	public String fulanmu_zi(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

		Crud o = new Crud(_e,request, "tjpcms_lanmu");
		if(o.getCid() ==null){return "adm/welcome";}
		o.getR().setExjoinstr("left join tjpcms_zdx s on t.lx=s.zdxmc left join tjpcms_zdb d on s.pid=d.id");
		List<String> exjoinzdm = new ArrayList<String>();
		exjoinzdm.add("s.zdxpy py");
		o.getR().setExjoinzdm(exjoinzdm);

		//查询的配置
		String cxs[][]= {{"栏目名称","name"},{"导航栏显示","nav","zdb:navxs"},{"栏目类型","lx","zdb:lanmuleixing"}};
		String hds[][]= {
			{"栏目id","id"},{"父栏目id","pId"},{"栏目名称","name"},{"导航栏显示","nav"},{"栏目类型","lx","ext:py: (:)"},{"前台url","url_d"},
			{"直接子栏目数","cnt","sql:select count(*) from tjpcms_lanmu where pid=t.id"},{"排序","px"},{"更新时间","gx"}
		};
		Hanshu.setList(o,hds, cxs);

		//aev的配置
		String br  =o.getBread();
		String aev[][]= {
			{"上级栏目",AevZdType.TEXT.toString(),br.substring(br.indexOf("：")+1, br.length())},
			{"栏目名称","name"},
			{"导航栏显示","nav",AevZdType.SELECT.toString(),"navxs"},
			{"栏目类型","lx"},
			{"排序","px"}
		};
		Hanshu.setAev(o,aev);
		
		return "adm/list";
	}
	
	//配置系统预置的【富文本】类型
	@RequestMapping(value = "fuwenben")
	public String fuwenben(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

		Crud o = new Crud(_e,request, "tjpcms_fwb");
		if(o.getCid() ==null){return "adm/welcome";}

		//aev的配置
		Map<String, Object> objw = Hanshu.objw(_e, o.getTb(), "cid="+o.getCid()[0]);
		String id ="";	
		if (objw !=null) id = objw.get("id").toString();
		String aev[][]= {
				{"标题","title",""},
				{"摘要","zy", AevZdType.TEXTAREA.toString()},
				{"内容","nr",AevZdType.RICH.toString(),"required"},
				{"图片","tu",AevZdType.PIC.toString()},
				{"id",AevZdType.HIDDEN.toString(),id}
		};
		Hanshu.setAev(o,aev);
		request.setAttribute("obj", objw);

		return "adm/aev";//o.r.need默认为false，如果调用了Hanshu.setList，会设置为true
	}
	
	//通用文章
	@RequestMapping(value = "tywz")
	public String tywz(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

		Crud o = new Crud(_e,request, "tjpcms_tywz", "");
		if(o.getCid() ==null){return "adm/welcome";}
		o.getR().setExwhere("uid="+Qt.getUid(request));

		//查询的配置
		String cxs[][]= {{"标题","title"},{"关键词", "gjc"},{"日期","gx"},{"审核状态","shzt","zdb:wzshzt"}};//除了时间，其他字段默认的操作符是like,可以多个操作符
		String hds[][]= {{"id","id"},{"标题","title"},{"审核状态（审核意见）","shzt","ext:shyj:（:）"},{"关键词", "gjc"},{"缩略图","tu", "pic:未上传图片"},{"点击次数","cs"},{"排序","px"},{"更新时间","gx"}};
		String czs[][]={{"text:val:编辑","js:fn_usr_tipedit(id):listczq.js","idx:1"}};
		Hanshu.setList(o,hds, cxs, czs);

		//aev的配置
		String aev[][]= {
				{"标题","title","required"},
				{"内容","nr",AevZdType.RICH.toString(),"required"},
				{"排序","px"},
				{"缩略图","tu", AevZdType.PIC.toString()},
				{"摘要","zy",AevZdType.TEXTAREA.toString()},
				{"关键词","gjc"},
				{"备注","bz"},
				{"点击次数","cs",AevZdType.TEXT.toString()},
				{"更新日期","gx",AevZdType.DATE.toString()},
		};
		Hanshu.setAev(o,aev);

		return "adm/list";
	}
	
	//栏目列表页面初始化
	@RequestMapping(value = "getlmtree")
	public void getlmtree(HttpServletRequest request, HttpServletResponse response) throws InterruptedException {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("all", _e.usrGetLm());
		Hanshu.flushResponse(response, JSONObject.fromObject(m));
	}

	//=====================================================================================
	//=====================================================================================

	//修改头像
	@RequestMapping(value = "xgtx")
	public String xgtx(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
		Crud o = new Crud(_e, request, "tjpcms_usr","修改头像");
		o.getAev().setTip("注：第三方登录的用户无法修改头像！");
		o.getAev().setNoBtns(!Qt.getUid(request).startsWith(Edllx.GR_.toString()));
		o.getAev().setHook_befadgx("com.tjpcms.common.Hook.befCmnUsrTxnc");
		o.getAev().setHook_aftadgx("com.tjpcms.common.Hook.aftCmnUsrTxnc");

		//aev的配置
		String aev[][]= {
			{"头像","tx",AevZdType.PIC.toString(),"required"}
		};
		Hanshu.setAev(o,aev);
		request.setAttribute("obj",  Hanshu.objw(_e, o.getTb(), "id='"+Qt.getUid(request)+"'"));
		
		return "adm/aev";
	}

	//修改昵称
	@RequestMapping(value = "xgnc")
	public String xgnc(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{
		Crud o = new Crud(_e, request, "tjpcms_usr","修改昵称");
		o.getAev().setTip("注：第三方登录的用户无法修改昵称！");
		String uid = Qt.getUid(request);
		boolean isgr = uid.startsWith(Edllx.GR_.toString());
		if (!isgr)o.getAev().setNoBtns(true);//第三方登录的用户不可以编辑昵称
		o.getAev().setHook_befadgx("com.tjpcms.common.Hook.befCmnUsrTxnc");
		o.getAev().setHook_aftadgx("com.tjpcms.common.Hook.aftCmnUsrTxnc");
		o.getAev().setJsAftbc("parent.sxnc(nc, 	 tx)");//刷新昵称

		//aev的配置
		String aev[][]= {
			{"昵称","nc",isgr?AevZdType.INPUT.toString():AevZdType.TEXT.toString(),"required length#<=15:长度必须小于15  length#>=2:长度必须大于2"}
		};
		Hanshu.setAev(o,aev);
		request.setAttribute("obj",  Hanshu.objw(_e, o.getTb(), "id='"+uid+"'"));
		
		return "adm/aev";
	}

	//修改密码
	@RequestMapping(value = "xgmm")
	public String xgmm(HttpServletRequest request, HttpServletResponse response) throws InterruptedException, UnsupportedEncodingException {
		Crud o = new Crud(_e,request, "tjpcms_usr","修改密码");
		o.getAev().setZdybc("aj_xgmm");//得返回JSON格式
		o.getAev().setTip("注：第三方登录的用户无法修改密码！");
		o.getAev().setNoBtns(!Qt.getUid(request).startsWith(Edllx.GR_.toString()));
		o.getAev().setHook_befadgx("com.tjpcms.common.Hook.befCmnUsrTxnc");
	
		//aev的配置
		String aev[][]= {
				{"旧密码","old",AevZdType.PASSWORD.toString(),"required"},
				{"新密码(6-12位)","new1",AevZdType.PASSWORD.toString(),"required regexp#^[a-zA-Z0-9]{6,12}$:请输入6-12位的密码  not_have_kg:密码不能含有空格"},
				{"确认新密码","new2",AevZdType.PASSWORD.toString(),"required repeat#new1:两次输入的密码不一致 "}
		};
		Hanshu.setAev(o,aev);
		
		return "adm/aev";
	}

	//自定义了aev的保存
	@RequestMapping(value = "aj_xgmm")
	public void aj_xgmm(HttpServletRequest request, HttpServletResponse response) throws InterruptedException {
		Ssousr so = (Ssousr)request.getSession().getAttribute(CL.ses_ssousr);
		String old = request.getParameter("old");
		String new1 = request.getParameter("new1");
		String new2 = request.getParameter("new2");
		Map<String, Object> qtjson = new HashMap<String, Object>();
		qtjson.put("ret", "-1");
		if (so==null || StringUtils.isEmpty(old) || StringUtils.isEmpty(new1) || StringUtils.isEmpty(new2) || !new1.equals(new2)
			|| Pattern.compile("\\s+").matcher(new1).find() || new1.length()<6 || new1.length()>12) {
			Hanshu.flushResponse(response, JSONObject.fromObject(qtjson));
			return;
		}

		Map<String, Object> obj = Hanshu.objw(_e, "tjpcms_usr", "id='"+so.getId()+"'");
		if (obj!=null){
			String uid = (String)obj.get("id");
			Mademd5 mad=new Mademd5();
			String iptold = mad.toMd5(mad.toMd5(old), uid);
			if (!((String)obj.get("mm")).equals(iptold)) {
				qtjson.put("ret", "旧密码不正确！");
				Hanshu.flushResponse(response, JSONObject.fromObject(qtjson));
				return;
			}

			Map<String, String[]> e = new HashMap<String, String[]>();
			e.put("id", new String[]{uid});
			e.put("mm", new String[]{mad.toMd5(mad.toMd5(new1), uid)});
			qtjson.put("ret", Hanshu.ppbc(_e, "tjpcms_usr", request,e));
			Hanshu.flushResponse(response, JSONObject.fromObject(qtjson));
			request.getSession().setAttribute("ses_ht_tip","密码修改成功");//自己写个提示
			return;
		}

		Hanshu.flushResponse(response, JSONObject.fromObject(qtjson));
	}

	//用户退出登录
	@RequestMapping(value = "aj_qt_tuichu")
	public void aj_qt_tuichu(HttpServletRequest request, HttpServletResponse response) throws InterruptedException {
		request.getSession().removeAttribute(CL.ses_ssousr);
		Hanshu.flushResponse(response, "0");
	}
	
	//后台“我的主页”
	@RequestMapping(value = "welcome")
	public ModelAndView htlgn_login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		return new ModelAndView("adm/welcome", map);
	}
	
	//大事记
	@RequestMapping(value = "dashiji")
	public String dashiji(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		
		Crud o = new Crud(_e,request, "t_dashi", "大事记");
		if(o.getCid() ==null){return "adm/welcome";}
		o.getR().setExwhere("uid="+Qt.getUid(request));

		//查询的配置
		String cxs[][]= {{"标题","title"},{"日期","gx"}, {"审核状态","shzt","zdb:wzshzt"}};//除了时间，其他字段默认的操作符是like,可以多个操作符
		String hds[][]= {{"标题","title"},{"审核状态（审核意见）","shzt","ext:shyj:（:）"},{"年","nian"},{"里程碑","lcb"},{"点击次数","cs"},{"排序","px"},{"更新时间","gx"}};
		String czs[][]={{"text:val:编辑","js:fn_usr_tipedit(id):listczq.js","idx:1"}};
		Hanshu.setList(o,hds, cxs, czs);
		
		//aev的配置
		String aev[][]= {
				{"标题","title","required"},
				{"内容","nr",AevZdType.RICH.toString(),"required"},
				{"年","nian","required"},
				{"里程碑","lcb","required"},
				{"点击次数","cs",AevZdType.TEXT.toString()},
				{"排序","px"}
		};
		Hanshu.setAev(o,aev);

		return "adm/list";
	}

	//开发笔记
	@RequestMapping(value = "kaifabiji")
	public String kaifabiji(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

		Crud o = new Crud(_e,request, "t_kfbj", "开发笔记");
		if(o.getCid() ==null){return "adm/welcome";}
		o.getR().setExwhere("uid="+Qt.getUid(request));

		//查询的配置
		String cxs[][]= {{"标题","title"},{"地点","dd"},{"日期","gx"}, {"审核状态","shzt","zdb:wzshzt"}};
		String hds[][]= {{"内容","nr"},{"审核状态（审核意见）","shzt","ext:shyj:（:）"},{"地点","dd"},{"头像","tu","pic"},{"排序","px"},{"更新时间","gx"}};
		String czs[][]={{"text:val:编辑","js:fn_usr_tipedit(id):listczq.js","idx:1"}};
		Hanshu.setList(o,hds, cxs, czs);

		//aev的配置
		String aev[][]= {
				{"标题","title"},
				{"内容","nr","required",AevZdType.RICH.toString()},
				{"地点","dd","required","\\江苏南京"},
				{"头像","tu","required",AevZdType.PIC.toString(),"\\"+request.getContextPath()+"/upload/pic/2017/02/"+"20170122160120bb7396dc58618.png"},
				{"排序","px"}
		};
		Hanshu.setAev(o,aev);

		return "adm/list";
	}
}













