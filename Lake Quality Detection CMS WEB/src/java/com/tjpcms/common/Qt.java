/**
 * 作者:tjp
 * QQ号：57454144
 * QQ群：168895774
 * 官网：http://www.tjpcms.com
 * 码云：https://git.oschina.net/tjpcms/tjpcms
 * 更新日期：2017-01-22
 * tjpcms - 最懂你的cms
 */

package com.tjpcms.common;

import javax.servlet.http.HttpServletRequest;

import com.tjpcms.spring.model.Ssousr;



public class Qt {
	public static Ssousr getUsr(HttpServletRequest request){
		return (Ssousr)request.getSession().getAttribute(CL.ses_ssousr);
	}
	
	public static String getUid(HttpServletRequest request){
		Ssousr so = (Ssousr)request.getSession().getAttribute(CL.ses_ssousr);
		if (so != null){
			return so.getId();
		}
		return "";
	}
	
	public static void setUsr(HttpServletRequest request, Ssousr so){
		if (request!=null && so !=null){
			request.getSession().setMaxInactiveInterval(CL.SES_QT_TO);
			request.getSession().setAttribute(CL.ses_ssousr,so);
		}
	}
	
}
