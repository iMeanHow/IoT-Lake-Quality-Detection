package com.tjpcms.common;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;

import com.tjpcms.common.Crud.Crud;
import com.tjpcms.spring.mapper.EntMapper;

public class Cmn {

	
	public static String jddj(HttpServletRequest request, HttpServletResponse response, EntMapper entMapper) throws UnsupportedEncodingException {
		String ses_xqhd_referer = (String)request.getSession().getAttribute("ses_xqhd_referer");
		if (StringUtils.isEmpty(ses_xqhd_referer)) {
			ses_xqhd_referer = request.getHeader("referer");
			request.getSession().setAttribute("ses_xqhd_referer", ses_xqhd_referer);
		}
		String b = request.getParameter("b");
		Crud o = new Crud(entMapper,request, "tjpcms_jddj", Hanshu.zzBread("返回上级 -"+b.substring(b.indexOf("：")+1, b.length()), ses_xqhd_referer, ""));
		o.getAev().setNeeda(false);
		o.getAev().setNeede(false);
		o.getR().setExwhere("pid="+request.getParameter("id"));
		o.getR().setExwhere("delf=0");
		o.getD().setZdysql("update tjpcms_jddj set delf=1");
		
		//查询的配置
		String cxs[][]= {{"联系电话","lxdh"},{"邮箱","yx"},{"日期","rq"}};
		String hds[][]= {{"对接内容","djnr"},{"联系电话","lxdh"},{"邮箱","yx"},{"日期","rq"},{"排序","px"}};
		Hanshu.setList(o,hds, cxs);

		//aev的配置
		String aev[][]= {
			{"对接内容","djnr",AevZdType.TEXTAREA.toString()},{"联系电话","lxdh"},{"邮箱","yx"}
		};
		Hanshu.setAev(o,aev);

		return "adm/list";
	}
}
