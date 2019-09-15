package com.tjpcms.common;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;

import com.tjpcms.common.Crud.Crud;
import com.tjpcms.spring.model.Ssousr;

public class Hook {
	
	//保存字典项中的栏目名称时，要把栏目表中lx为此名称的栏目也一并更新了
	public String lmmcBaocunbef(Object para1, Object para2, Object para3, Object beiyong){
		HttpServletRequest request = (HttpServletRequest)para1;
		Crud o = (Crud)para2;
		
		Map<String, Object> obj = Hanshu.obj(o.getMp(), "tjpcms_zdx", request.getParameter("id"));
		if (obj !=null){
			String oldmc = (String)obj.get("zdxmc");
			String newmc = request.getParameter("zdxmc");
			if (StringUtils.isNotEmpty(oldmc) && StringUtils.isNotEmpty(newmc)){
				if (!oldmc.equals(newmc)) {//字典项有了新的名称，那就需要
					o.getMp().upd("update tjpcms_lanmu set lx='"+newmc+"' where lx='"+oldmc+"'");
				}
				return "0";//名称相同就不需要做额外的更新操作了
			}
		}

		return "-1";
	}

	//这个是删除栏目类型中的某个字典项时，该栏目不能已被栏目列表中某个栏目引用
	public String befDelZdx(Object para1, Object para2, Object para3, Object beiyong){
		HttpServletRequest request = (HttpServletRequest)para1;
		Crud o = (Crud)para2;

		String arr[] = request.getParameter("ids").split(",");
		String s = "select count(*) from tjpcms_lanmu t where t.lx in (select zdxmc from tjpcms_zdx t1 left join tjpcms_zdb t2 on t1.pid=t2.id where t2.py='lanmuleixing' ";
		s += " and t1.id in"+Hanshu.arr2instr(arr)+" )";
		int cnt = o.getMp().cnt(s);

		return cnt>0?"删除失败！请先在【栏目列表】中将使用了该类型的 "+cnt+" 个栏目"+(cnt>1?"全部":"")+"删除，才能删除该类型！":"0";
	}

	//普通用户修改头像前执行这个，防止第三方登录的用户修改头像
	public String befCmnUsrTxnc(Object para1, Object para2, Object para3, Object beiyong){
		HttpServletRequest request = (HttpServletRequest)para1;
		
		String uid = Qt.getUid(request);
		if (StringUtils.isEmpty(uid)) {
			return "请重新登录";
		}

		if (!uid.startsWith(Edllx.GR_.toString())){
			return "第三方登录的用户无法修改密码、头像和昵称";
		}

		Map<String, String[]> pa = (Map<String, String[]>)para3;
		if (pa !=null && pa.get("nc") !=null){
			String nc = pa.get("nc")[0];
			if (StringUtils.isEmpty(nc) || Pattern.compile("\\s+").matcher(nc).find() || nc.length() >15 || nc.length()<2) {
				return "昵称长度范围需为2-15位，不能含有空格";
			}
		}
	
		return "0";
	}
	
	//用户修改自己的头像昵称后，session要更新一下
	public Map<String,Object> aftCmnUsrTxnc(Object para1, Object para2, Object para3, Object beiyong){
		Map<String, Object> rtn = new HashMap<String, Object>();
		rtn.put("ret", "-1");
		HttpServletRequest request = (HttpServletRequest)para1;
		Crud o= (Crud)para2;
		Ssousr so = Qt.getUsr(request);
		Map<String, Object> obj = o.getMp().obj("select nc,tx from tjpcms_usr where id='"+so.getId()+"'");//也可以不查出来，自己拼，这样就是方便点，不怕业务方便有修改
		if (obj!=null){
			so.setNc((String)obj.get("nc"));
			so.setTx((String)obj.get("tx"));
			request.getSession().setAttribute(CL.ses_ssousr, so);
			rtn.put("ret", "0");
			rtn.put("tx", so.getTx());
			rtn.put("nc", so.getNc());
		}

		return rtn;
	}
	
}
