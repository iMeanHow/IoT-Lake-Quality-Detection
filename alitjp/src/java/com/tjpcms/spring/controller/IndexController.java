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

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.interfaces.RSAPublicKey;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.codec.binary.Hex;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import weibo4j.Users;

import com.baidu.api.Baidu;
import com.baidu.api.BaiduApiException;
import com.baidu.api.BaiduOAuthException;
import com.baidu.api.store.BaiduCookieStore;
import com.baidu.api.store.BaiduStore;
import com.ndktools.javamd5.Mademd5;
import com.qq.connect.QQConnectException;
import com.qq.connect.api.OpenID;
import com.qq.connect.utils.QQConnectConfig;
import com.qq.connect.utils.http.HttpClient;
import com.qq.connect.utils.http.PostParameter;
import com.tjpcms.cfg.XT;
import com.tjpcms.common.BaiduAppConstant;
import com.tjpcms.common.CL;
import com.tjpcms.common.Edllx;
import com.tjpcms.common.Hanshu;
import com.tjpcms.common.Qt;
import com.tjpcms.security.RSAUtils;
import com.tjpcms.spring.mapper.EntMapper;
import com.tjpcms.spring.model.Ssousr;
import com.tjpcms.utils.NetworkUtil;

@Controller
@RequestMapping("/")
public class IndexController {
	private static final Log logger = LogFactory.getLog(IndexController.class);

	@Resource(name = "entMapper")
	private EntMapper _e;//e是entity（实体），加个_是怕和e重名，这样两次按键就可以打出来非常高频使用的这个变量了，方便实用，跟别我讲变量名起得不好

	//首页
	@RequestMapping(value = "index")
	public ModelAndView index_get(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		String stationSelect = request.getParameter("stationSelect");
		getCmn(request, map);
		map.put("bb", _e.obj("select val,left(gx,10)gx from tjpcms_cfg where py='BB'"));
		map.put("ljs", _e.r("select * from tjpcms_yqlj order by px "));
		map.put("news", _e.r("select * from tjpcms_news order by px desc limit 0,4"));
		map.put("lst", _e.r("select * from nb_equip order by Node_ID  "));
		map.put("his", _e.r("select * from nb_hisdata where Node_ID = "+ stationSelect +" order by Time   "));
		
		
		return new ModelAndView("index", map);
	}
	
	
	@RequestMapping(value = "fordata", method={RequestMethod.POST})
	public void fordata(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String stationSelect = request.getParameter("stationSelect");
		JSONObject jo = new JSONObject();
		//jo.element("test", " this is test data");
		
		List<Map<String, Object>> lstzfoxy = _e.r("select Oxy from nb_hisdata where Node_ID = "+ stationSelect +" order by Time");
		
		List<Map<String, Object>> lstzftime = _e.r("select Time from nb_hisdata where Node_ID = "+ stationSelect +" order by Time");
		////List<double[]> fordataList = new ArrayList<double[]>();
		////List<long []> fortimeList = new ArrayList<long []>();
		
		double[] fordataList = new double[lstzfoxy.size()];
		long[] fortimeList = new long[lstzfoxy.size()];
		if (CollectionUtils.isEmpty(lstzfoxy)) {
				Hanshu.flushResponse(response, "暂无数据！");
		}
		if (CollectionUtils.isEmpty(lstzftime)) {
			Hanshu.flushResponse(response, "暂无数据！");
	}
		for(int i = 0; i<lstzfoxy.size();i++){
			fordataList[i] = Double.parseDouble(lstzfoxy.get(i).values().toString().replace("[", "").replace("]",""));
			
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		for(int i = 0; i<lstzftime.size();i++){
			String dataDate =lstzftime.get(i).values().toString().replace("[", "").replace("]","");
			String [] dataa = dataDate.split("-");			
			String [] data2=dataa[2].split(":");			
			String datafrist=data2[0].substring(0,2);
			String datalist=data2[0].substring(3,5);
			int year = Integer.parseInt(dataa[0]);
			int mon = Integer.parseInt(dataa[1]);
			int day = Integer.parseInt(datafrist);
			int hour = Integer.parseInt(datalist);
			int min = Integer.parseInt(data2[1]);
			int ms = Integer.parseInt(data2[2]);
			Calendar c=Calendar.getInstance();
			c.set(year,mon,day,hour,min,ms);
			long answer=c.getTimeInMillis();
			long ts = df.parse( (String) dataDate ).getTime() + 8 * 60 * 60 * 1000;
			fortimeList[i] = answer;
		}


			JSONArray dataJson = new JSONArray();
			for( int idx = 0; idx < lstzfoxy.size(); idx++ ){
				JSONArray tempJ = new JSONArray();
				tempJ.add(0, fortimeList[idx]);
				tempJ.add(1, fordataList[idx]);
				dataJson.add(idx, tempJ);
			}

		JSONArray jsonArray = JSONArray.fromObject(dataJson);
		jo.element("test",jsonArray);
		
		
		//Hanshu.flushResponse(response,  "dfadfadfad" + stationSelect);
				response.setHeader("Cache-Control", "no-cache");
				response.setContentType("text/json; charset=utf-8");
				response.getWriter().print(jo.toString());
				response.getWriter().flush(); 
		return ;
	}
	
	//重复代码，后期需要替换
	@RequestMapping(value = "fordata6", method={RequestMethod.POST})
	public void fordata6(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		String stationSelect = request.getParameter("stationSelect");
		JSONObject jo = new JSONObject();
		//jo.element("test", " this is test data");
		
		List<Map<String, Object>> lstzfoxy = _e.r("select Oxy from nb_hisdata where Node_ID = "+ stationSelect +" order by Time");
		
		List<Map<String, Object>> lstzftime = _e.r("select Time from nb_hisdata where Node_ID = "+ stationSelect +" order by Time");
		////List<double[]> fordataList = new ArrayList<double[]>();
		////List<long []> fortimeList = new ArrayList<long []>();
		
		double[] fordataList = new double[lstzfoxy.size()];
		long[] fortimeList = new long[lstzfoxy.size()];
		if (CollectionUtils.isEmpty(lstzfoxy)) {
				Hanshu.flushResponse(response, "暂无数据！");
		}
		if (CollectionUtils.isEmpty(lstzftime)) {
			Hanshu.flushResponse(response, "暂无数据！");
	}
		for(int i = 0; i<lstzfoxy.size();i++){
			fordataList[i] = Double.parseDouble(lstzfoxy.get(i).values().toString().replace("[", "").replace("]",""));
			
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		for(int i = 0; i<lstzftime.size();i++){
			String dataDate =lstzftime.get(i).values().toString().replace("[", "").replace("]","");
			String [] dataa = dataDate.split("-");
			//System.out.println("打印==++"+dataa[0]+" "+dataa[1]+" "+dataa[2]+" ");
			String [] data2=dataa[2].split(":");
			//System.out.println("打印==++"+data2[0]+" "+data2[1]+" "+data2[2]+" ");
			String datafrist=data2[0].substring(0,2);
			String datalist=data2[0].substring(3,5);
			//System.out.println("打印==++"+dataa[0]+" "+dataa[1]+" "+datafrist+" "+datalist+" "+data2[1]+" "+data2[2]+" ");
			
			int year = Integer.parseInt(dataa[0]);
			int mon = Integer.parseInt(dataa[1]);
			int day = Integer.parseInt(datafrist);
			int hour = Integer.parseInt(datalist);
			int min = Integer.parseInt(data2[1]);
			int ms = Integer.parseInt(data2[2]);
			//System.out.println("打印==++"+year+" "+mon+" "+day+" "+hour+" "+min+" "+ms+" ");
			Calendar c=Calendar.getInstance();
			c.set(year,mon,day,hour,min,ms);
			long answer=c.getTimeInMillis();
			long ts = df.parse( (String) dataDate ).getTime() + 8 * 60 * 60 * 1000;
			fortimeList[i] = answer;
			System.out.println("打印输出===="+fortimeList[i] );
		}


			JSONArray dataJson = new JSONArray();
			for( int idx = 0; idx < lstzfoxy.size(); idx++ ){
				JSONArray tempJ = new JSONArray();
				tempJ.add(0, fortimeList[idx]);
				tempJ.add(1, fordataList[idx]);
				dataJson.add(idx, tempJ);
			}

		JSONArray jsonArray = JSONArray.fromObject(dataJson);
		jo.element("test",jsonArray);
		
		
		//Hanshu.flushResponse(response,  "dfadfadfad" + stationSelect);
				response.setHeader("Cache-Control", "no-cache");
				response.setContentType("text/json; charset=utf-8");
				response.getWriter().print(jo.toString());
				response.getWriter().flush(); 
		return ;
	}
	
	
	
	private int Integer(String string) {
		// TODO Auto-generated method stub
		return 0;
	}


	//要算出这个链接在导航栏第一级上的栏目ID
	private Integer getNavId(Integer id, Integer pid){
		if (pid.intValue()==CL.TREE_ROOT_ID.intValue()){
			return id;
		}

		List<Map<String, Object>> r = _e.r("select id,pid from tjpcms_lanmu where 1=1");
		if (CollectionUtils.isNotEmpty(r)){
			while (pid !=null){
				int i=0;
				for (;i<r.size();i++) {
					Integer cureid = (Integer)r.get(i).get("id");
					Integer curepid = (Integer)r.get(i).get("pid");
					if (cureid.intValue()==pid.intValue()){//找到父节点了
						if (curepid.intValue()==CL.TREE_ROOT_ID.intValue()){
							return cureid;//当前节点的父节点已是一级的，则找到了自己属于导航栏的位置
						}else{
							pid = curepid;
							break;
						}
					}
				}
				if (i>=r.size()){
					break;
				}
			}
		}

		return null;
	}
	
	//这边就是保证无论是动态还是静态访问前台的栏目，导航栏的选中项不能错
	private void getCmn(HttpServletRequest request,Map<String, Object> map){
		//这块是静态化用到的
		String rqu = request.getRequestURI();
		if ("1".equals(request.getParameter("___opjth"))){//是静态化
			String parauld = request.getParameter("___url_d");
			rqu = request.getContextPath()+"/";
			if (!"/".equals(parauld)) {
				rqu +=parauld+".dhtml";
			}
		}

		//查导航栏高亮
		Integer pid = null;
		if (!(request.getContextPath()+"/").equals(rqu)){//不是首页
			String lmurl = rqu.substring(rqu.lastIndexOf("/")+1,rqu.lastIndexOf(".dhtml"));
			Map<String, Object> pob = _e.obj("select id,pid from tjpcms_lanmu where url_d='"+lmurl+"' or url3='"+lmurl+"' limit 1");
			if (pob!=null && pob.get("pid")!=null){
				pid = getNavId((Integer)pob.get("id"), (Integer)pob.get("pid"));
			}
		}

		//把导航栏数据查出来
		List<Map<String, Object>> lstnav = _e.getnav();
		map.put("lms", lstnav);
		for (Map<String, Object> e:lstnav){
			if (pid!=null && pid.intValue()==((Integer)e.get("id")).intValue()){
				e.put("issel", 1);
			}
			List<Map<String, Object>> zlmlist = _e.getzlmlist(e.get("id"));
			e.put("zlm",  zlmlist);
			for (Map<String, Object> f:zlmlist){
				f.put("zlm",  _e.getzlmlist(f.get("id")));//前台导航栏一共三层，目前写死，此处应有更精妙写法
			}
		}

		//塞一些公共的变量
		map.put("rqu", rqu.substring(0,rqu.length()-1));
		map.put("bah", _e.obj("select title from tjpcms_dhwb where cid=161").get("title"));//备案号
		map.put("META_DES", CL.META_DES);
		String idprefix = request.getParameter("id");
		map.put("cyid", CL.WZMC+"_"+getMethodName()+(StringUtils.isNotEmpty(idprefix)?("_id"+idprefix):""));//畅言的sourceId
		Hanshu.setGlobal(request);

		//这是前台页面刷新时的提示语
		String qtmsg = (String)request.getSession().getAttribute(CL.SES_QT_TIP);//注销登录时，刷新页面后还要输出一个msg
		if (StringUtils.isNotEmpty(qtmsg)) {
			map.put(CL.SES_QT_TIP, qtmsg);
			request.getSession().removeAttribute(CL.SES_QT_TIP);
		}
		
		//这是前台RSA加密注册信息用的
		RSAPublicKey rsakey = RSAUtils.getDefaultPublicKey();
		map.put("rsa_modulus", new String(Hex.encodeHex(rsakey.getModulus().toByteArray())));
		map.put("rsa_exponent", new String(Hex.encodeHex(rsakey.getPublicExponent().toByteArray())));
	}
	
	private String getMethodName() {//[2]是当前执行函数名，[3]是调用的函数名
        StackTraceElement[] stacktrace = Thread.currentThread().getStackTrace();  
        StackTraceElement e = stacktrace[3];  
        String methodName = e.getMethodName();  
        return methodName;  
    }
	
	//后台登录页面
	@RequestMapping(value = XT.dlhtlj)
	public String htlgn_login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Hanshu.setGlobal(request);
		return "loginhtad";
	}
	
	//登录后台
	@RequestMapping(value = "ljdl_ad", method={RequestMethod.POST})
	public void ljdl_ad(HttpServletRequest request, HttpServletResponse response) {
		
		String yhm = request.getParameter("yhm");
		String mm = request.getParameter("mm");
		//String yzm = request.getParameter("yzm");
		
		//String yzmSes = (String)request.getSession().getAttribute("idCode");
		if (StringUtils.isEmpty(yhm) || StringUtils.isEmpty(mm)){
			Hanshu.flushResponse(response, "用户名或密码错误！");
			return;
		}
		
		/*		if (StringUtils.isEmpty(yzmSes) || StringUtils.isEmpty(yzm) || !yzmSes.equalsIgnoreCase(yzm)){
			Hanshu.flushResponse(response, "验证码错误！");
			return;
		}*/
		
		Mademd5 mad=new Mademd5();
		if (!"test".equalsIgnoreCase(yhm) || !"test".equalsIgnoreCase(mm)){
			Hanshu.flushResponse(response, "用户名或密码错误！");
			return;
		}
		
		Hanshu.flushResponse(response, "0");
		HttpSession ses = request.getSession();   
		ses.setMaxInactiveInterval(CL.ses_timeout);  
		ses.setAttribute(CL.ses_admin, yhm);
	}
	
	@RequestMapping(value = "jz")
	public ModelAndView jz(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);

		int perPage = 20;
		List<Map<String, Object>> r = _e.r("select * from t_jz where delf=0 order by jzrq desc");
		map.put("recs", r);
		map.put("perPage", perPage);
		map.put("recTotal", r.size());
		map.put("pgTotal", (int)Math.ceil(r.size()/(double)perPage));
		List<Map<String, Object>> lstzf = _e.r("select title from tjpcms_dhwb where cid=176 order by gx desc limit 1");
		if (CollectionUtils.isNotEmpty(lstzf)) {
			map.put("zfy", lstzf.get(0).get("title"));
		}

		return new ModelAndView("jz", map);
	}

	@RequestMapping(value = "jzfk")
	public void jzfk(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, String[]> e = new HashMap<String, String[]>();
		e.put("lx", new String[]{"捐赠反馈"});
		e.put("nr", new String[]{request.getParameter("nr")});
		e.put("ip", new String[]{NetworkUtil.getIpAddress(request)});
		e.put("ag", new String[]{request.getHeader("User-Agent")});
		e.put("cid", new String[]{"169"});
		Hanshu.flushResponse(response, "0".equals(Hanshu.ppbc(_e, "t_hd", request,e))?0:-1);
	}

	@RequestMapping(value = "syxiazai")
	public ModelAndView syxiazai(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String agt = request.getHeader("User-Agent");
		String ip = NetworkUtil.getIpAddress(request);
		Map<String, Object> obj = _e.obj("select DATE_FORMAT(rq,'%Y-%m-%d %H:%i:%s')rq  from t_hd where ip='"+ip+"' and ag='"+agt+"' order by rq desc limit 1");
		if (obj!=null && obj.get("rq")!=null){
			long last = (CL.fmt.parse((String)obj.get("rq"))).getTime();
			long now = new Date().getTime();
			if ((now - last)<=20000){//走页面的20秒内只能下载一次
				request.getSession().setAttribute(CL.SES_QT_TIP, "请 勿 频 繁 下 载 哦 ，亲！");
				response.sendRedirect(request.getContextPath());
				return null;
			}
		}

		if (agt.indexOf("www.google.com/bot.html")==-1 && agt.indexOf("Googlebot") ==-1){
			_e.add("insert into t_hd(cid,lx,ip,ag) values(173,'首页下载','"+ip+"','"+agt+"')");
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/octet-stream");
		String flnm = new String((CL.GGY+"("+request.getParameter("v")+").zip").getBytes("gb2312"), "ISO8859-1" );
		response.setHeader("Content-disposition", "attachment;filename="+flnm);
		
		Class<?> clazz = IndexController.class;
		java.net.URL urls = clazz.getResource("");
		String str = urls.toString();
		str = str.substring(6, str.length());
		str = str.replaceAll("%20", " ");
		int num = str.indexOf("WEB-INF");
		str = str.substring(0, num + "classes".length());
		
		String ver = (String)_e.obj("select val from tjpcms_cfg where py='BB'").get("val");
		BufferedInputStream  input=new BufferedInputStream(new FileInputStream(str+"/xiazai/"+ver+".zip"));
		ServletOutputStream output=response.getOutputStream();
		byte[] bt=new byte[1024];
		while(input.read(bt)!=-1){
		    output.write(bt);
		}
		output.close();
		input.close();

		return null;
	}

	@RequestMapping(value = "myxiazai")
	public ModelAndView myxiazai(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String agt = request.getHeader("User-Agent");
		if (agt.indexOf("www.google.com/bot.html")==-1 && agt.indexOf("Googlebot") ==-1){
			_e.add("insert into t_hd(nr,cid,lx,ip,ag) values('码云',173,'首页下载','"+NetworkUtil.getIpAddress(request)+"','"+agt+"')");
		}

		response.sendRedirect("https://git.oschina.net/tjpcms/tjpcms/repository/archive/master");
		return null;
	}
	
	@RequestMapping(value = "syzan")
	public void syzan(HttpServletRequest request, HttpServletResponse response) throws InterruptedException, IOException {
		
		String ag = request.getHeader("User-Agent");
		String ip = NetworkUtil.getIpAddress(request);
		if (StringUtils.isEmpty(ag) || StringUtils.isEmpty(ip) || _e.cnt("select count(*) from t_hd where lx='首页点赞' and ag='"+ag+"' and ip='"+ip+"'")>=1){
			Hanshu.flushResponse(response, "-1");
			return;
		}

		Hanshu.flushResponse(response, 1==_e.add("insert into t_hd(cid,lx, ip,ag) values(172,'首页点赞','"+ip+"','"+ag+"')")?"0":"-1");
	}

	//关于
	@RequestMapping(value = "guanyu")
	public ModelAndView guanyu(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		
		return new ModelAndView("guanyu", map);
	}
	
	//版本更新
	@RequestMapping(value = "bbgx")
	public ModelAndView bbgx(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		Hanshu.listpgex(map, _e, request, "tjpcms_tywz", 20, "left(t.gx,10)gx1", " cid=164 and delf=0 and shzt='审核通过'");
		map.put("bread", "动态,版本更新");
		map.put("kaicb", "记录版本更新的情况，也方便寻找历史版本。");
		
		return new ModelAndView("cmn2", map);
	}
	
	@RequestMapping(value = "bbgx_detail")
	public ModelAndView bbgx_detail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select t.*,left(t.gx,10)gx1 from tjpcms_tywz t where  shzt='审核通过' and cid=164 and id="+request.getParameter("id")));
		map.put("bread", "动态,版本更新,详情");
		
		return new ModelAndView("fwb", map);
	}
	//开发笔记
	@RequestMapping(value = "kfbj")
	public ModelAndView kfbj(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		Hanshu.listpgex(map, _e, request, "t_kfbj", 10, "", "cid=165 and delf=0 and shzt='审核通过'");
		map.put("bread", "动态,开发笔记");

		return new ModelAndView("kfbj", map);
	}
	//大事记
	@RequestMapping(value = "dashi")
	public ModelAndView dashi(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		 List<Map<String, Object>> r = _e.r("select * from t_dashi where cid=167 and delf=0 and shzt='审核通过' order by px desc");
		map.put("bread", "动态,大事记");
		
		LinkedHashMap<String, ArrayList<Map<String,Object>>> ys = new LinkedHashMap<String, ArrayList<Map<String,Object>>>();
		for (Map<String, Object> o : r) {
			String nian = (String)o.get("nian");
			ArrayList<Map<String,Object>> oner = ys.get(nian);
			if (oner==null){
				oner = new ArrayList<Map<String,Object>>();
				ys.put(nian, oner);
			}
			Map<String, Object> qtmp = new HashMap<String, Object>();
			qtmp.put("title", o.get("title"));
			qtmp.put("url", o.get("url"));
			qtmp.put("lcb", o.get("lcb"));
			oner.add(qtmp);
		}
		map.put("ys", ys);

		return new ModelAndView("dashi", map);
	}
	@RequestMapping(value = "dashi_detail")
	public ModelAndView dashi_detail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select t.*,left(t.gx,10)gx1 from t_dashi t where cid=167 and id="+request.getParameter("id")));
		map.put("bread", "动态,大事记,详情");
		
		return new ModelAndView("fwb", map);
	}
	//最近访客
	@RequestMapping(value = "zjfk")
	public ModelAndView zjfk(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select * from tjpcms_fwb where cid=163"));
		map.put("bread", "互动,最近访客");
		map.put("needcy", "0");
		
		return new ModelAndView("fwb", map);
	}
	//Bug反馈
	@RequestMapping(value = "bgfk")
	public ModelAndView bgfk(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select * from tjpcms_fwb where cid=166"));
		map.put("bread", "互动,最近访客");
		map.put("needcy", "0");
		
		return new ModelAndView("fwb", map);
	}
	
	//简介
	@RequestMapping(value = "wenda")
	public ModelAndView wenda(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select * from tjpcms_fwb where cid=159"));
		map.put("bread", "互动, 问答");
		map.put("needcy", "0");
		
		return new ModelAndView("fwb", map);
	}
	
	//简介
	@RequestMapping(value = "jianjie")
	public ModelAndView jianjie(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select * from tjpcms_fwb where cid=149"));
		map.put("bread", "关于作者, 简介");
		
		return new ModelAndView("fwb", map);
	}
	
	//视频教程
	@RequestMapping(value = "spjc")
	public ModelAndView spjc(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select * from tjpcms_fwb where cid=147"));
		map.put("bread", "教程,视频教程");

		return new ModelAndView("fwb", map);
	}
	
	//案例
	@RequestMapping(value = "anli")
	public ModelAndView anli(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select * from tjpcms_fwb where cid=143"));
		map.put("bread", "案例");
		
		return new ModelAndView("fwb", map);
	}
	
	//申请友链
	@RequestMapping(value = "sqyl")
	public ModelAndView sqyl(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select * from tjpcms_fwb where cid=162"));
		map.put("bread", "互动,申请友链");

		return new ModelAndView("fwb", map);
	}
	
	//留言
	@RequestMapping(value = "liuyan")
	public ModelAndView liuyan(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select * from tjpcms_fwb where cid=157"));
		map.put("bread", "互动,留言");
		
		return new ModelAndView("fwb", map);
	}

	//演示
	@RequestMapping(value = "yanshi")
	public ModelAndView yanshi(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		
		return new ModelAndView("yanshi", map);
	}

	//杂谈
	@RequestMapping(value = "zatan")
	public ModelAndView zatan(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		Hanshu.listpgex(map, _e, request, "tjpcms_tywz", 20, "left(t.gx,10)gx1", " cid=152 and delf=0  and shzt='审核通过'");
		map.put("bread", "关于作者,杂谈");
		map.put("kaicb", "这里是灌水的。。");

		return new ModelAndView("cmn2", map);
	}

	@RequestMapping(value = "zatan_detail")
	public ModelAndView zatan_detail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select t.*,left(t.gx,10)gx1 from tjpcms_tywz t where  shzt='审核通过' and cid=152 and id="+request.getParameter("id")));
		map.put("bread", "关于作者,杂谈,详情");

		return new ModelAndView("fwb", map);
	}
	
	//技术分享
	@RequestMapping(value = "jsfx")
	public ModelAndView jsfx(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		Hanshu.listpgex(map, _e, request, "tjpcms_tywz", 20, "left(t.gx,10)gx1", " cid=151 and delf=0 and  shzt='审核通过'");
		map.put("bread", "关于作者,技术分享");
		map.put("kaicb", "这里记录一些web开发比较有用的技术点、工具等等。");
		
		return new ModelAndView("cmn2", map);
	}
	
	@RequestMapping(value = "jsfx_detail")
	public ModelAndView jsfx_detail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select t.*,left(t.gx,10)gx1 from tjpcms_tywz t where  shzt='审核通过' and  cid=151 and id="+request.getParameter("id")));
		map.put("bread", "关于作者,技术分享,详情");
		
		return new ModelAndView("fwb", map);
	}
	
	//新闻
		@RequestMapping(value = "news")
		public ModelAndView news(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			Map<String, Object> map = new HashMap<String, Object>();
			getCmn(request, map);
			Hanshu.listpgex(map, _e, request, "tjpcms_news", 20, "left(t.gx,10)gx1", " cid=180 and delf=0 and  shzt='审核通过'");
			map.put("bread", "新闻");
			map.put("kaicb", "时事新闻");
			
			return new ModelAndView("cmn2", map);
		}
		
		@RequestMapping(value = "news_detail")
		public ModelAndView news_detail(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			Map<String, Object> map = new HashMap<String, Object>();
			getCmn(request, map);
			map.put("jj", _e.obj("select t.*,left(t.gx,10)gx1 from tjpcms_news t where  shzt='审核通过' and  cid=180 and id="+request.getParameter("id")));
			map.put("bread", "时事新闻详情");
			
			return new ModelAndView("fwb", map);
		}
		
		//设备
				@RequestMapping(value = "equip")
				public ModelAndView equip(HttpServletRequest request, HttpServletResponse response) throws Exception {
					
					Map<String, Object> map = new HashMap<String, Object>();
					getCmn(request, map);
					Hanshu.listpgex(map, _e, request, "nb_equip", 20, "left(t.gx,10)gx1", " cid=181 ");
					
					map.put("bread", "设备列表");
					map.put("kaicb", "设备列表");
					
					return new ModelAndView("cmn5", map);
				}
				
				@RequestMapping(value = "equip_detail")
				public ModelAndView equip_detail(HttpServletRequest request, HttpServletResponse response) throws Exception {
					
					Map<String, Object> map = new HashMap<String, Object>();
					getCmn(request, map);
					map.put("jj", _e.obj("select t.*,left(t.gx,10)gx1 from nb_equip t where  shzt='审核通过' and  cid=151 and id="+request.getParameter("id")));
					map.put("bread", "设备详情");
					
					return new ModelAndView("fwb", map);
				}
				
				@RequestMapping(value = "newdata")
				public ModelAndView newdata(HttpServletRequest request, HttpServletResponse response) throws Exception {
					
					Map<String, Object> map = new HashMap<String, Object>();
					getCmn(request, map);
					Hanshu.listpgexnewdata(map, _e, request, "nb_data", 20, "left(t.gx,10)gx1", " cid=183 ");
					map.put("lstequip", _e.r("select * from nb_equip  "));
					map.put("bread", "最新数据");
					map.put("kaicb", "最新数据");
					
					return new ModelAndView("cmn4", map);
				}
				@RequestMapping(value = "hisdata")
				public ModelAndView hisdata(HttpServletRequest request, HttpServletResponse response) throws Exception {
					
					Map<String, Object> map = new HashMap<String, Object>();
					getCmn(request, map);
					Hanshu.listpgexhisdata(map, _e, request, "nb_hisdata", 20, "left(t.gx,10)gx1", " cid=184 ");
					map.put("lstequip", _e.r("select * from nb_equip order by Node_ID  "));
					map.put("bread", "历史数据");
					map.put("kaicb", "历史数据");
					
					return new ModelAndView("cmn6", map);
				}

	//小作品
	@RequestMapping(value = "xzp")
	public ModelAndView xzp(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		Hanshu.listpgex(map, _e, request, "tjpcms_tywz", 20, "left(t.gx,10)gx1", " cid=150 and delf=0 and  shzt='审核通过'");
		map.put("bread", "关于作者,小作品");
		map.put("kaicb", "这里记录一些作者曾经开发过的小程序，或者有过独特想法和思考的东西。");
		
		return new ModelAndView("cmn2", map);
	}

	@RequestMapping(value = "xzp_detail")
	public ModelAndView xzp_detail(HttpServletRequest request, HttpServletResponse response) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select t.*,left(t.gx,10)gx1 from tjpcms_tywz t where  shzt='审核通过' and cid=150 and id="+request.getParameter("id")));
		map.put("bread", "关于作者,小作品,详情");
		
		return new ModelAndView("fwb", map);
	}
	
	//进阶应用
	@RequestMapping(value = "jinjie")
	public ModelAndView jinjie(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		Hanshu.listpgex(map, _e, request, "tjpcms_tywz", 20, "left(t.gx,10)gx1", " cid=155 and delf=0 and  shzt='审核通过'");
		map.put("bread", "教程,图文教程,进阶应用");
		map.put("kaicb", "这里给出tjpcms面对更复杂需求时的配置，尽可能的减少重复劳动的必要。");
		
		return new ModelAndView("cmn2", map);
	}
	
	@RequestMapping(value = "jinjie_detail")
	public ModelAndView jinjie_detail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select t.*,left(t.gx,10)gx1 from tjpcms_tywz t where  shzt='审核通过' and cid=155 and id="+request.getParameter("id")));
		map.put("bread", "教程,图文教程,进阶应用,详情");
		
		return new ModelAndView("fwb", map);
	}
	
	//二次开发
	@RequestMapping(value = "erci")
	public ModelAndView erci(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		Hanshu.listpgex(map, _e, request, "tjpcms_tywz", 20, "left(t.gx,10)gx1", " cid=174 and delf=0 and  shzt='审核通过'");
		map.put("bread", "教程,图文教程,二次开发");
		map.put("kaicb", "需求变化多端，基于框架的二次开发也就必不可少了，下面以一些具体的例子来展示如何在tjpcms已有的基础进行二开。");
		
		return new ModelAndView("cmn2", map);
	}

	@RequestMapping(value = "erci_detail")
	public ModelAndView erci_detail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select t.*,left(t.gx,10)gx1 from tjpcms_tywz t where  shzt='审核通过' and cid=174 and id="+request.getParameter("id")));
		map.put("bread", "教程,图文教程,二次开发,详情");
		
		return new ModelAndView("fwb", map);
	}
	
	//简单应用
	@RequestMapping(value = "jiandan")
	public ModelAndView jiandan(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		Hanshu.listpgex(map, _e, request, "tjpcms_tywz", 20, "left(t.gx,10)gx1", " cid=154 and delf=0 and  shzt='审核通过'");
		map.put("bread", "教程,图文教程,简单应用");
		map.put("kaicb", "这里给出tjpcms最基础的一些配置，帮助你即时生成各种crud的页面。");
		
		return new ModelAndView("cmn2", map);
	}
	
	@RequestMapping(value = "jiandan_detail")
	public ModelAndView jiandan_detail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select t.*,left(t.gx,10)gx1 from tjpcms_tywz t where  shzt='审核通过' and cid=154 and id="+request.getParameter("id")));
		map.put("bread", "教程,图文教程,简单应用,详情");
		
		return new ModelAndView("fwb", map);
	}
	
	//技术博文
	@RequestMapping(value = "jsbw")
	public ModelAndView jsbw(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		Hanshu.listpgex(map, _e, request, "tjpcms_tywz", 20, "left(t.gx,10)gx1", " cid=178 and delf=0 and  shzt='审核通过'");
		map.put("bread", "教程,网友专栏,技术博文");
		map.put("kaicb", "这里是网友们的一片天地，登录后可以在官网的【教程】和【动态】两个栏目里发布自己的文章，欢迎你们~");

		return new ModelAndView("cmn2", map);
	}
	
	@RequestMapping(value = "jsbw_detail")
	public ModelAndView jsbw_detail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select t.*,left(t.gx,10)gx1 from tjpcms_tywz t where  shzt='审核通过' and cid=178 and id="+request.getParameter("id")));
		map.put("bread", "教程,网友专栏,技术博文,详情");
		
		return new ModelAndView("fwb", map);
	}
	
	//环境配置
	@RequestMapping(value = "huanjing")
	public ModelAndView huanjing(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		Hanshu.listpgex(map, _e, request, "tjpcms_tywz", 20, "left(t.gx,10)gx1", " cid=153 and delf=0 and  shzt='审核通过'");
		map.put("bread", "教程,图文教程,环境搭建");
		map.put("kaicb", "环境配置是最基础的。基于tjpcms来开发，没有什么特殊要求的话，最好用跟作者完全相同的一套开发组件，不然可能会有兼容性问题，那就比较头疼了，当然如果你不怕麻烦的话，一般上网搜搜也能找到"
				+ "解决方案，有些组件太老的话也确实会有漏洞，自己权衡吧。");

		return new ModelAndView("cmn2", map);
	}
	
	@RequestMapping(value = "huanjing_detail")
	public ModelAndView huanjing_detail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		getCmn(request, map);
		map.put("jj", _e.obj("select t.*,left(t.gx,10)gx1 from tjpcms_tywz t where  shzt='审核通过' and cid=153 and id="+request.getParameter("id")));
		map.put("bread", "教程,图文教程,环境搭建,详情");
		
		return new ModelAndView("fwb", map);
	}
	
	//富文本页面获取阅读次数
	@RequestMapping(value = "fwbgetcs")
	public void fwbgetcs(HttpServletRequest request, HttpServletResponse response) throws InterruptedException, IOException {
		
		String u = request.getParameter("u");
		if (StringUtils.isNotEmpty(u)){
			int idx1 = u.indexOf(".dhtml");
			if (idx1==-1) idx1 = u.indexOf(".html");
			if (idx1!=-1){
				int idx2 = u.lastIndexOf('/', idx1);
				if (idx2 != -1){
					String url3 = u.substring(idx2+1,idx1);
					if (StringUtils.isNotEmpty(url3)) {
						Map<String, Object> obj = _e.obj("select id,nrtbl from tjpcms_lanmu where url3='"+url3+"'");
						if (obj !=null){
							int uret =1;
							String ipAddress = NetworkUtil.getIpAddress(request);
							String nrtbl = (String)obj.get("nrtbl");
							if ("tjpcms_fwb".equals(nrtbl)){
								if ("0:0:0:0:0:0:0:1".equals(ipAddress) || "127.0.0.1".equals(ipAddress)){
									
								}else{
									uret = _e.upd("update tjpcms_fwb set cs=cs+1 where cid="+obj.get("id"));
									log("read", Qt.getUid(request), u, request);//阅读日志
								}
								if (uret==1){
									Hanshu.flushResponse(response, _e.obj("select cs from tjpcms_fwb where cid="+obj.get("id")).get("cs"));
									return ;
								}
							}else if (StringUtils.isNotEmpty(nrtbl)){
								String regEx = "id=(\\d+)";
								Pattern pat = Pattern.compile(regEx);
								Matcher mat = pat.matcher(u);
								if (mat.find()){
									String paraid = mat.group(1);
									if ("0:0:0:0:0:0:0:1".equals(ipAddress) || "127.0.0.1".equals(ipAddress)){
										
									}else{
										uret = _e.upd("update "+nrtbl+" set cs=cs+1 where id="+paraid);
										log("read",  Qt.getUid(request), u, request);
									}
									if (uret==1){
										Hanshu.flushResponse(response, _e.obj("select cs from "+nrtbl+" where id="+paraid).get("cs"));
										return ;
									}
								}
							}
						}
					}
				}
			}
		}

		Hanshu.flushResponse(response, "100");//返回阅读了100次
	}


	//==========================================================================
	//畅言单点登录
	//畅言的getUserInfo
	@RequestMapping(value = "cyGui")
	public void cyGui(HttpServletRequest request, HttpServletResponse response) throws InterruptedException {
		
		Map<String, Object>m = new HashMap<String, Object>();
		Ssousr sso = (Ssousr)request.getSession().getAttribute(CL.ses_ssousr);
		if (sso !=null) {
			m.put("is_login", 1);
			Map<String, Object> user = new HashMap<String, Object>();
			user.put("img_url", sso.getTx());
			user.put("nickname", sso.getNc());
			user.put("profile_url", "");//先空着，没看到在哪用到
			user.put("user_id", sso.getId());
			user.put("sign", "wohuigaosunimeiyouyongma");
			m.put("user", user);
		}else{
			m.put("is_login", 0);
		}
		
		Hanshu.flushResponse(response, request.getParameter("callback")+"("+JSONObject.fromObject(m)+")");
	}
	
	//畅言的Logout，畅言退出时调用该接口，让个人的网站也同步退出登录
	@RequestMapping(value = "cyLout")
	public void cyLout(HttpServletRequest request, HttpServletResponse response) throws InterruptedException {
		request.getSession().removeAttribute(CL.ses_ssousr);
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("code", "1");
		m.put("reload_page", "1");
		String[] arr = new  String[]{"http://www.tjpcms.com/alitjp/js/cyLout.js"};
		m.put("js_src", JSONArray.fromObject(arr));
		Hanshu.flushResponse(response, request.getParameter("callback")+"("+JSONObject.fromObject(m)+")");
	}
	//畅言单点登录
	//==========================================================================
		

	//这几个第三方登录都是参考demo的写法，简单来说就是先根据client_id得到code，再把code和secret一起post给第三方得到token，就可以根据token来获取用户信息了
	//之所以要这样的流程，我想因为secret是要保密的，要在服务器端投递到第三方换取token，都是oauth2协议，具体没研究，能用就行
	//微信第三方登录好像要开发者认证，一年300块，无力负担，所以弄了个百度，百度的还不用审核
	//==========================================================================
	//百度第三方登录
	@RequestMapping(value = "dsf_bdlog_log")
	public void dsf_bdlog_log(HttpServletRequest request,   HttpServletResponse response, HttpSession session) throws IOException {

		session.setAttribute("ses_dsf_from_url", request.getHeader("Referer"));
        BaiduStore store = new BaiduCookieStore(BaiduAppConstant.CLIENTID, request, response);
        Baidu baidu = null;
        try {
            baidu = new Baidu(BaiduAppConstant.CLIENTID, BaiduAppConstant.CLIENTSECRET, BaiduAppConstant.REDIRECTURI, store, request);
            String state = baidu.getState();
            Map<String, String> params = new HashMap<String, String>();
            params.put("state", state);
            String authorizeUrl = baidu.getBaiduOAuth2Service().getAuthorizeUrl(params);
            response.sendRedirect(authorizeUrl);
        } catch (BaiduOAuthException e) {
            logger.debug("BaiduOAuthException ", e);
        } catch (BaiduApiException e) {
            logger.debug("BaiduApiException ", e);
        }
	}

	@RequestMapping(value = "dsf_bdlog_re")
	public String dsf_bdlog_re(HttpServletRequest request,  HttpServletResponse response, HttpSession session) throws IOException  {

        BaiduStore store = new BaiduCookieStore(BaiduAppConstant.CLIENTID, request, response);
        Baidu baidu = null;
        com.baidu.api.domain.User user = null;
        try {
            baidu = new Baidu(BaiduAppConstant.CLIENTID, BaiduAppConstant.CLIENTSECRET, BaiduAppConstant.REDIRECTURI, store, request);
            user = baidu.getLoggedInUser();
        } catch (BaiduApiException e) {
        	log("第三方登录","百度","登录失败-百度api异常", request);
			session.setAttribute(CL.SES_QT_TIP, "百度api异常，请重试！");
			return dsf_redirect_refer(request, response, session);
        } catch (BaiduOAuthException e) {
        	log("第三方登录","百度","登录失败-百度认证异常", request);
			session.setAttribute(CL.SES_QT_TIP, "百度认证异常，请重试！");
			return dsf_redirect_refer(request, response, session);
        }
        if (user != null) {
			Ssousr so = new Ssousr();
			so.setNc(user.getUname());//微博昵称
			if (StringUtils.isNotEmpty(user.getPortrait())) {
				so.setTx("http://tb.himg.baidu.com/sys/portraitn/item/"+user.getPortrait());
			}
			so.setId(Edllx.BD_.toString()+user.getUid());
			if (!dsfRecUsrLogin(so, session, request)){
				log("第三方登录","百度","登录失败-dsfRecUsrLogin执行失败", request);
				session.setAttribute(CL.SES_QT_TIP, "登录失败，请重试！");
			}
        }
		
		return dsf_redirect_refer(request, response, session);
	}
	//百度第三方登录
	//==========================================================================
	
	
	//==========================================================================
	//QQ第三方登录
	@RequestMapping(value = "dsf_qqlog_log")
	public void dsf_qqlog_log(HttpServletRequest request,   HttpServletResponse response, HttpSession session) throws IOException {
		
		session.setAttribute("ses_dsf_from_url", request.getHeader("Referer"));
        try {
            response.sendRedirect(new com.qq.connect.oauth.Oauth().getAuthorizeURL(request));
        } catch (QQConnectException e) {
            e.printStackTrace();
        }
	}
	
	@RequestMapping(value = "dsf_qqlog_re")
	public String dsf_qqlog_re(HttpServletRequest request,  HttpServletResponse response, HttpSession session) throws IOException  {
		
		 try {
			 com.qq.connect.javabeans.AccessToken accessTokenObj = (com.qq.connect.javabeans.AccessToken)((new  com.qq.connect.oauth.Oauth()).getAccessTokenByRequest(request));
			 if (accessTokenObj.getAccessToken().equals("")) {
				 log("第三方登录","QQ","登录失败-没有获取到响应参数", request);
				 session.setAttribute(CL.SES_QT_TIP, "没有获取到响应参数，请重试！");
				 return dsf_redirect_refer(request, response, session);
			 }else {
				 String accessToken = accessTokenObj.getAccessToken();
				 OpenID openIDObj =  new OpenID(accessToken);
				 String openID = openIDObj.getUserOpenID();
				 
				 HttpClient client = new HttpClient();//QQ的demo我也是醉了，头像竟然还要自己搞
				 client.setToken(accessToken);
				 client.setOpenID(openID);
				 com.qq.connect.utils.json.JSONObject json = client.get(
					 QQConnectConfig.getValue("getUserInfoURL"),
					 new PostParameter[] {new PostParameter("openid", openID),
					 new PostParameter("oauth_consumer_key", 
		 			 QQConnectConfig.getValue("app_ID")),
					 new PostParameter("access_token", client.getToken()),
					 new PostParameter("format", "json")}).asJSONObject();
				 if (json!=null && json.getInt("ret")==0) {
						Ssousr so = new Ssousr();
						so.setNc(json.getString("nickname"));
						so.setTx(json.getString("figureurl_qq_1"));
						so.setId(Edllx.QQ_+so.getTx());
						if (!dsfRecUsrLogin(so, session,request)){
							log("第三方登录",so.getId(),"登录失败-dsfRecUsrLogin执行失败", request);
							session.setAttribute(CL.SES_QT_TIP, "登录失败，请重试！");
						}
				 } else {
					 log("第三方登录","QQ","登录失败-解析json消息体失败", request);
					 session.setAttribute(CL.SES_QT_TIP, "解析json消息体失败，请重试");
					 return dsf_redirect_refer(request, response, session);
				 }
			 }
		 }catch(Exception e){
			 log("第三方登录","QQ","登录失败-未知异常错误", request);
			 session.setAttribute(CL.SES_QT_TIP, "QQ第三方登录未知异常错误，请重试");
			 return dsf_redirect_refer(request, response, session);
		 }

		return dsf_redirect_refer(request, response, session);
	}
	//QQ第三方登录
	//==========================================================================


	//==========================================================================
	//新浪微博第三方登录
	//跳转到新浪微博的第三方登录
	@RequestMapping(value = "dsf_sinalog_log")
	public String dsf_sinalog_log(HttpServletRequest request,   HttpServletResponse response, HttpSession session) throws weibo4j.model.WeiboException, IOException {

		session.setAttribute("ses_dsf_from_url", request.getHeader("Referer"));
		weibo4j.Oauth oauth = new weibo4j.Oauth();
        String url = oauth.authorize("code");
        return "redirect:" + url;
	}
	
	private String dsf_redirect_refer(HttpServletRequest request,  HttpServletResponse response, HttpSession session) throws IOException{
		String fromurl = (String)session.getAttribute("ses_dsf_from_url");
		if (StringUtils.isEmpty(fromurl)) {
			fromurl = request.getContextPath()+"/";
		}else{
			session.removeAttribute("ses_dsf_from_url");
		}

		response.sendRedirect(fromurl);
		return null;//"redirect:" + fromurl;
	}
	
	//新浪登录页面，点击授权或取消
	@RequestMapping(value = "dsf_sinalog_re")
	public String dsf_sinalog_re(HttpServletRequest request,  HttpServletResponse response, HttpSession session) throws  IOException {

		String code = request.getParameter("code");
		if (StringUtils.isNotEmpty(code)) {
			weibo4j.http.AccessToken accessTokenByCode = null;
			try{
				weibo4j.Oauth oauth = new weibo4j.Oauth();
				accessTokenByCode = oauth.getAccessTokenByCode(request.getParameter("code"));
			} catch (weibo4j.model.WeiboException e) {
				log("第三方登录","新浪","登录失败-获取AccessToken失败", request);
				session.setAttribute(CL.SES_QT_TIP, "获取AccessToken失败，请重试！");
				return dsf_redirect_refer(request, response, session);
			}
			Users um = new Users(accessTokenByCode.getAccessToken());
			try {
				weibo4j.model.User user = um.showUserById(accessTokenByCode.getUid());
				Ssousr so = new Ssousr();
				so.setNc(user.getScreenName());//微博昵称
				if (StringUtils.isNotEmpty(user.getProfileImageUrl())) {
					so.setTx(user.getProfileImageUrl());
				}
				so.setId(Edllx.SN_+user.getId());
				if (!dsfRecUsrLogin(so, session,request)){
					log("第三方登录",so.getId(),"登录失败-dsfRecUsrLogin执行失败", request);
					session.setAttribute(CL.SES_QT_TIP, "登录失败，请重试！");
				}
			} catch (weibo4j.model.WeiboException e) {
				log("第三方登录","新浪","登录失败-获取用户信息失败", request);
				session.setAttribute(CL.SES_QT_TIP, "获取用户信息失败，请重试！");
				return dsf_redirect_refer(request, response, session);
			}
		}

		return dsf_redirect_refer(request, response, session);
	}

	//用户在我的应用里取消新浪微博登录授权
	@RequestMapping(value = "dsf_sinalog_qx")
	public void dsf_sinalog_qx(HttpServletRequest request, HttpServletResponse response) {
		logger.error("测试一下取消授权有没有效果");
		File mulu = new File("c:/test_dsf_sinalog_qx");
		if (!mulu.exists()){
			mulu.mkdirs();
		}
	}

	//记录用户的登录
	private boolean dsfRecUsrLogin(Ssousr so, HttpSession session, HttpServletRequest request) throws IOException{
		if (so==null || session==null){
			return false;
		}

		boolean isValid = false;
		for(Edllx e:Edllx.values()){
			if (so.getId().startsWith(e.toString())){
				isValid = true;
				break;
			}
		}
		if (!isValid || StringUtils.isEmpty(so.getNc()) || StringUtils.isEmpty(so.getId())){
			return false;
		}

		session.setMaxInactiveInterval(CL.SES_QT_TO);
		session.setAttribute(CL.SES_QT_TIP, "登录成功！");
		session.setAttribute(CL.ses_ssousr, so);

		//保存登录信息到数据库
		if (!so.getId().startsWith(Edllx.GR_.toString())){//这是第三方的登录，不能是GR_开头的
			String ip = log("第三方登录",so.getId(),"登录成功", request);
			if (_e.cnt("select count(*) from tjpcms_usr where id='"+so.getId()+"'")<=0){
				_e.add("insert into tjpcms_usr(id,nc,tx,gx,ip,mm) values('"+so.getId()+"', '"+so.getNc()+"', '"+so.getTx()+"','"+CL.fmt.format(new Date())+"','"+ip+"','"+UUID.randomUUID().toString()+"')");
			}else{
				_e.upd("update tjpcms_usr set gx='"+CL.fmt.format(new Date())+"', nc='"+so.getNc()+"',tx='"+so.getTx()+"',ip='"+ip+"' where id='"+so.getId()+"'");
			}
			return true;
		}

		return false;
	}
	//新浪微博第三方登录
	//==========================================================================


	//检查验证码是否正确
	@RequestMapping(value = "zcdl_chk_yzm")
	public void zcdl_chk_yzm(HttpServletRequest request, HttpServletResponse response) throws InterruptedException {
		String yzmSes = (String)request.getSession().getAttribute("idCode");
		String yzm = request.getParameter("yzm");

		Hanshu.flushResponse(response, StringUtils.isNotEmpty(yzm) && yzm.equalsIgnoreCase(yzmSes)?"0":"-1");
	}

	//检查邮箱是否唯一
	@RequestMapping(value = "zcdl_chk_yx")
	public void zcdl_chk_yx(HttpServletRequest request, HttpServletResponse response) throws InterruptedException {
		String yx = request.getParameter("yx");
		if (StringUtils.isEmpty(yx)) {
			Hanshu.flushResponse(response, "-1");
			return;
		}

		Hanshu.flushResponse(response, zcUniyx(yx)?"0":"-1");
	}

	//判断tjpcms_usr表中注册用的邮箱是否唯一
	private boolean zcUniyx(String yx){
		if (StringUtils.isEmpty(yx)) {
			return false;
		}

		return _e.cnt("select count(*) from tjpcms_usr where left(id,3)='"+Edllx.GR_.toString()+"' and  substring(id,4)='"+yx+"'")<=0;
	}

	//前台点击退出，注销登录
	@RequestMapping(value = "ssousr_tc")
	public void ssousr_tc(HttpServletRequest request, HttpServletResponse response) throws InterruptedException {
		request.getSession().removeAttribute(CL.ses_ssousr);
		request.getSession().setAttribute(CL.SES_QT_TIP, "退出成功！");
		Hanshu.flushResponse(response, "0");
	}
	
	//前台登录
	@RequestMapping(value = "aj_sso_dl")
	public void aj_sso_dl(HttpServletRequest request, HttpServletResponse response) throws InterruptedException, IOException {
		
		List<Map<String, Object>> err = new ArrayList<Map<String, Object>>();
		Map<String, Object> json = new HashMap<String, Object>();
		json.put("ret", "-1");
		json.put("err", err);

		String pas[][] = {{"yx","邮箱",""},{"mm","密码",""},{"yzm","验证码",""}};
		for (int i=0;i<pas.length;i++){
			pas[i][2] = request.getParameter(pas[i][0]);
			if (StringUtils.isEmpty(pas[i][2])){
				Map<String, Object> mp = new HashMap<String, Object>();
				mp.put("zd", pas[i][0]);
				mp.put("cw", pas[i][1]+"不能为空");
				err.add(mp);
			}
		}
		if (CollectionUtils.isNotEmpty(err)) {
			log("用户登陆", "err.size="+err.size(), "登陆信息有空", request);
			Hanshu.flushResponse(response, JSONObject.fromObject(json));
			return;
		}

		//校验邮箱是否输入异常
		String yx = RSAUtils.decryptStringByJs(pas[0][2]);
		if (Pattern.compile("\\s+").matcher(yx).find()){
			Map<String, Object> mp = new HashMap<String, Object>();
			mp.put("zd", "yx");
			mp.put("cw", "输入的值不能含有空格");
			err.add(mp);
		}else if (StringUtils.isEmpty(yx) || yx.length() >32){
			Map<String, Object> mp = new HashMap<String, Object>();
			mp.put("zd", "yx");
			mp.put("cw", "请填入邮箱，长度不超过32位");
			err.add(mp);
		}

		//校验密码是否输入异常
		String mm = RSAUtils.decryptStringByJs(pas[1][2]);
		if (Pattern.compile("\\s+").matcher(mm).find()){
			Map<String, Object> mp = new HashMap<String, Object>();
			mp.put("zd", "mm");
			mp.put("cw", "输入的值不能含有空格");
			err.add(mp);
		}else if (StringUtils.isEmpty(mm) || StringUtils.isEmpty(mm) || mm.length()<6 || mm.length()>12){
			Map<String, Object> mp = new HashMap<String, Object>();
			mp.put("zd", "mm");
			mp.put("cw", "请输入6-12位的密码");
			err.add(mp);
		}

		//校验验证码是否正确
		String yzm = pas[2][2];
		if (!yzm.equalsIgnoreCase((String)request.getSession().getAttribute("idCode"))){
			Map<String, Object> mp = new HashMap<String, Object>();
			mp.put("zd", "yzm");
			mp.put("cw", "验证码错误（点击图案可更换）");
			err.add(mp);
		}
		request.getSession().removeAttribute("idCode");//提交过来了就用一次费一次，不然可以联系用同一个验证码了
		
		if (CollectionUtils.isNotEmpty(err)) {
			log("用户登录", Edllx.GR_.toString()+yx, "登录信息校验不通过", request);
			Hanshu.flushResponse(response, JSONObject.fromObject(json));
			return;
		}

		String uid = Edllx.GR_.toString()+yx;
		Mademd5 mad=new Mademd5();
		mm =  mad.toMd5(mad.toMd5(mm), uid);
		List<Map<String, Object>> r = _e.r("select * from tjpcms_usr where id='"+uid+"' and mm='"+mm+"'");
		if (r==null || r.size()!=1){
			Map<String, Object> mp = new HashMap<String, Object>();
			mp.put("zd", "yx");
			mp.put("cw", "用户名或密码错误，请重试");
			err.add(mp);
		}
		if (CollectionUtils.isNotEmpty(err)) {
			log("用户登录", uid, "用户或密码错误", request);
			Hanshu.flushResponse(response, JSONObject.fromObject(json));
			return;
		}

		Ssousr so  =new Ssousr();
		so.setNc((String)r.get(0).get("nc"));
		so.setId((String)r.get(0).get("id"));
		so.setTx((String)r.get(0).get("tx"));
		json.put("ret", "0");
		request.getSession().setMaxInactiveInterval(CL.SES_QT_TO);
		request.getSession().setAttribute(CL.ses_ssousr,so);
		request.getSession().setAttribute(CL.SES_QT_TIP, "登录成功！");
		log("用户登录",so.getId(),"登录成功",request);
		Hanshu.flushResponse(response, JSONObject.fromObject(json));
	}

	//前台注册
	@RequestMapping(value = "aj_zhuce")
	public void aj_zhuce(HttpServletRequest request, HttpServletResponse response) throws InterruptedException, IOException {
		
		List<Map<String, Object>> err = new ArrayList<Map<String, Object>>();
		Map<String, Object> json = new HashMap<String, Object>();
		json.put("ret", "-1");
		json.put("err", err);

		String pas[][] = {{"yx","邮箱",""},{"mm","密码",""},{"qrmm","确认密码",""},{"nc","昵称",""},{"yzm","验证码",""}};
		for (int i=0;i<pas.length;i++){
			pas[i][2] = request.getParameter(pas[i][0]);
			if (StringUtils.isEmpty(pas[i][2])){
				Map<String, Object> mp = new HashMap<String, Object>();
				mp.put("zd", pas[i][0]);
				mp.put("cw", pas[i][1]+"不能为空");
				err.add(mp);
			}
		}
		if (CollectionUtils.isNotEmpty(err)) {
			log("用户注册", "err.size="+err.size(), "注册信息有空", request);
			Hanshu.flushResponse(response, JSONObject.fromObject(json));
			return;
		}

		//校验注册项
		String yx = RSAUtils.decryptStringByJs(pas[0][2]);
		String mm = RSAUtils.decryptStringByJs(pas[1][2]);
		String qrmm = RSAUtils.decryptStringByJs(pas[2][2]);
		String nc = pas[3][2];
		String yzm = pas[4][2];

		//校验邮箱
		if (Pattern.compile("\\s+").matcher(yx).find()){
			Map<String, Object> mp = new HashMap<String, Object>();
			mp.put("zd", "yx");
			mp.put("cw", "输入的值不能含有空格");
			err.add(mp);
		}else if (StringUtils.isEmpty(yx) || yx.length() >32){
			Map<String, Object> mp = new HashMap<String, Object>();
			mp.put("zd", "yx");
			mp.put("cw", "请填入邮箱，长度不超过32位");
			err.add(mp);
		}else if (!Pattern.matches("^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+", yx)){
			Map<String, Object> mp = new HashMap<String, Object>();
			mp.put("zd", "yx");
			mp.put("cw", "邮箱格式不正确");
			err.add(mp);
		}else if (!zcUniyx(yx)){
			Map<String, Object> mp = new HashMap<String, Object>();
			mp.put("zd", "yx");
			mp.put("cw", "该邮箱已被注册");
			err.add(mp);
		}

		//校验密码
		if (Pattern.compile("\\s+").matcher(mm).find()){
			Map<String, Object> mp = new HashMap<String, Object>();
			mp.put("zd", "mm");
			mp.put("cw", "输入的值不能含有空格");
			err.add(mp);
		}else if (StringUtils.isEmpty(mm) || mm.length()<6 || mm.length()>12){
			Map<String, Object> mp = new HashMap<String, Object>();
			mp.put("zd", "mm");
			mp.put("cw", "请输入6-12位的密码");
			err.add(mp);
		}else if (!mm.equals(qrmm)){
			Map<String, Object> mp = new HashMap<String, Object>();
			mp.put("zd", "qrmm");
			mp.put("cw", "两次输入的密码不一致");
			err.add(mp);
		}

		//校验昵称
		if (Pattern.compile("\\s+").matcher(nc).find()){
			Map<String, Object> mp = new HashMap<String, Object>();
			mp.put("zd", "nc");
			mp.put("cw", "输入的值不能含有空格");
			err.add(mp);
		}else if (StringUtils.isEmpty(nc) || nc.length() >15 || nc.length()<2){
			Map<String, Object> mp = new HashMap<String, Object>();
			mp.put("zd", "nc");
			mp.put("cw", "昵称长度范围需为2-15位");
			err.add(mp);
		}
		
		//校验验证码
		if (!yzm.equalsIgnoreCase((String)request.getSession().getAttribute("idCode"))){
			Map<String, Object> mp = new HashMap<String, Object>();
			mp.put("zd", "yzm");
			mp.put("cw", "验证码错误（点击图案可更换）");
			err.add(mp);
		}
		request.getSession().removeAttribute("idCode");
		
		if (CollectionUtils.isNotEmpty(err)) {
			log("用户注册", Edllx.GR_.toString()+yx, "注册信息校验不通过", request);
			Hanshu.flushResponse(response, JSONObject.fromObject(json));
			return;
		}

		//通过校验则保存到数据库
		Ssousr sso = new Ssousr();
		sso.setNc(nc);
		sso.setId(Edllx.GR_+yx);
		Mademd5 mad=new Mademd5();
        String md5mm = mad.toMd5(mad.toMd5(mm), sso.getId());  
		if (_e.add("insert into tjpcms_usr(id,mm,nc,gx,ip) values('"+sso.getId()+"','"+md5mm+"','"+nc+"','"+CL.fmt.format(new Date())+"', '"+NetworkUtil.getIpAddress(request)+"') ")==1){
			json.put("ret", "0");
			request.getSession().setMaxInactiveInterval(CL.SES_QT_TO);
			request.getSession().setAttribute(CL.ses_ssousr,sso);
			request.getSession().setAttribute(CL.SES_QT_TIP, "注册成功，已为您登录！");
			log("用户注册",sso.getId(),"注册成功",request);
			Hanshu.flushResponse(response, JSONObject.fromObject(json));
		}else{
			log("用户注册", sso.getId(), "用户注册信息插数据库失败", request);
			json.put("em", "用户注册信息插数据库失败");
			Hanshu.flushResponse(response, JSONObject.fromObject(json));
		}
	}
	
	//前台log
	private String log(String lx, String uid, String bz, HttpServletRequest request) throws IOException{
		if (request==null) return null;
		String ip = NetworkUtil.getIpAddress(request);
		if (StringUtils.isEmpty(ip) && StringUtils.isEmpty(lx) && StringUtils.isEmpty(uid) && StringUtils.isEmpty(bz)){
			logger.error("log的参数都为空");
			return null;
		}
		String s ="insert into tjpcms_log(", v="";
		if (StringUtils.isNotEmpty(lx)) {
			s +="lx,";
			v +="'"+lx+"',";
		}
		if (StringUtils.isNotEmpty(uid)) {
			s +="uid,";
			v +="'"+uid+"',";
		}
		if (StringUtils.isNotEmpty(bz)) {
			s +="bz,";
			v +="'"+bz+"',";
		}
		if (StringUtils.isNotEmpty(ip)) {
			s +="ip,";
			v +="'"+ip+"',";
		}
		_e.add(s.substring(0,s.length()-1)+") values("+v.substring(0,v.length()-1)+")");
		
		return ip;
	}

	//top栏获取登录状态
	@RequestMapping(value = "aj_getdls")
	public void aj_getdls(HttpServletRequest request, HttpServletResponse response) throws InterruptedException {
		Map<String, Object> e = new HashMap<String, Object>();
		Ssousr sso = (Ssousr)Qt.getUsr(request);
		if (sso !=null) {
			e.put("nc", sso.getNc());
			e.put("tx", sso.getTx());
		}
		e.put("hds", _e.r("select lx,count(*)cnt from t_hd where lx!='捐赠反馈' and delf=0 group by lx"));

		Hanshu.flushResponse(response, JSONObject.fromObject(e));
	}
	
	@RequestMapping(value = "aj_getidCode")
	public void aj_getidCode(HttpServletRequest request, HttpServletResponse response) throws InterruptedException {
		Hanshu.flushResponse(response, /*request.getSession().getAttribute("idCode")*/"-1");
	}
	
	@RequestMapping(value = "g2gly")
	public String g2gly(HttpServletRequest request){
		return "redirect:/"+XT.glylj+"/index.dhtml";
	}
	
	@RequestMapping(value = "g2grzx")
	public String g2grzx(HttpServletRequest request){
		return "redirect:/"+XT.grzxlj+"/index.dhtml";
	}
}
