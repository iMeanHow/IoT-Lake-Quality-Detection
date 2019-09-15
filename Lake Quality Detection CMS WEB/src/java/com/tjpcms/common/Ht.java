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



public class Ht {

	public static String getGly(HttpServletRequest request){

		return (String)request.getSession().getAttribute(CL.ses_admin);
	}
	
}
