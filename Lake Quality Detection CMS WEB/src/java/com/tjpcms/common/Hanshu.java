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

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tjpcms.cfg.XT;
import com.tjpcms.common.Crud.Crud;
import com.tjpcms.common.Crud.Retrieve;
import com.tjpcms.spring.mapper.EntMapper;

@Component
public class Hanshu {
	private static final Log logger = LogFactory.getLog(Hanshu.class);
	
	public static void flushResponse(HttpServletResponse response, Object responseContent) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter writer = null;
		try {
			writer = response.getWriter();
			writer.write(ConvertUtils.convert(responseContent));
		} catch (IOException e) {
			
		} finally {
			writer.flush();
			writer.close();
		}
	}

	public static void setGlobal( HttpServletRequest reques) {
		reques.setAttribute("WZMC", CL.WZMC);
		reques.setAttribute("GGY", CL.GGY);
		reques.setAttribute("GGY2", CL.GGY2);
		reques.setAttribute("YUMING", CL.YUMING);
		reques.setAttribute("glylj", XT.glylj);
		reques.setAttribute("dlhtlj", XT.dlhtlj);
		reques.setAttribute("grzxlj", XT.grzxlj);
	}

	//这是上传图片到服务器的处理
	public static void ajaxupload(MultipartFile file, HttpServletRequest request, HttpServletResponse response, EntMapper entMapper) throws IllegalStateException, IOException{
		Map<String, Object> m = new HashMap<String, Object>();
		if (file==null){
			m.put("ret","请先选择文件！");
			Hanshu.flushResponse(response, JSONObject.fromObject(m));
			return;
		}
		
		String uptag = request.getParameter("up_size_check_tag");
		if (!"pic".equals(uptag) && !"vdo".equals(uptag) ){
			m.put("ret","上传异常，请联系管理员！");
			Hanshu.flushResponse(response, JSONObject.fromObject(m));
			return;
		}
		
		String oriName= file.getOriginalFilename();
	    String prefix=oriName.substring(oriName.lastIndexOf("."));//如  .png
		if ("pic".equals(uptag) && !".jpg".equalsIgnoreCase(prefix) && !".png".equalsIgnoreCase(prefix) 
			&&  !".gif".equalsIgnoreCase(prefix) && !".jpeg".equalsIgnoreCase(prefix)){
			m.put("ret","请选择jpg、jpeg、png或gif格式的图片！");
			Hanshu.flushResponse(response, JSONObject.fromObject(m));
			return;
		}
		if ("vdo".equals(uptag) && !".mp4".equalsIgnoreCase(prefix) && !".flv".equalsIgnoreCase(prefix)){
			m.put("ret","请选择mp4或flv格式的视频！");
			Hanshu.flushResponse(response, JSONObject.fromObject(m));
			return;
		}
		
		Date date = new Date();
		SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String YY = fmt.format(date).substring(0, 4);
		String MM = fmt.format(date).substring(4, 6);
		String path = request.getServletContext().getRealPath("")+"\\upload\\"+uptag+"\\"+YY+"\\"+MM.toString()+"\\";
	    File mulu = new File(path);
		if (!mulu.exists()){
			mulu.mkdirs();
		}
		String uid = UUID.randomUUID().toString();
		String upSrc = fmt.format(date).substring(0,14)+uid.substring(3, 6)+fmt.format(date).substring(14,17)+uid.substring(9, 12)+uid.substring(19, 23)+prefix;
		File bcFile = new File(path+upSrc);  
		file.transferTo(bcFile);  

		m.put("ret","0");
		m.put("src",request.getContextPath()+"/upload/pic/"+YY+"/"+MM+"/"+upSrc);
		m.put("size", String.format("%.2f MB",(double)bcFile.length()/1048576));

		Hanshu.flushResponse(response, JSONObject.fromObject(m));
	}

	public static void delete(HttpServletRequest request, HttpServletResponse response, EntMapper entMapper){
		Crud o = (Crud)request.getSession(false).getAttribute(request.getParameter("u"));
		if (o==null){
			Hanshu.flushResponse(response, "-1");
			return;
		}
		String ids = request.getParameter("ids");
		if (StringUtils.isEmpty(ids)){
			Hanshu.flushResponse(response, "-1");
			return;
		}
		String arr[] = ids.split(",");
		if (arr == null || arr.length<=0){
			Hanshu.flushResponse(response, "-1");
			return;
		}

		//删除前钩子
		if (StringUtils.isNotEmpty(o.getD().getHook_befdel())) {
			Object ret = execHook(o.getD().getHook_befdel(), request, o, null, null);
			if (ret==null || !"0".equals(ret.toString())){
				flushResponse(response,ret.toString());
				return;
			}
		}

		String batdel ="";
		if (StringUtils.isNotEmpty(o.getD().getZdysql())){
			batdel = Hanshu.zdydel(o, arr);
		}else{//不是自定义的，需要检查一下权限
			List<String> zjFromDb = getZjFromDb(getListZiduan(o));
			String exw="";
			if (zjFromDb.contains("uid")){
				exw="and uid="+Qt.getUid(request);
			}else if ("tjpcms_usr".equalsIgnoreCase(o.getTb())){
				exw="and id="+Qt.getUid(request);
			}
			batdel = Hanshu.batdel(o.getMp(), o.getTb(), arr, exw);
		}
		if (!"0".equals(batdel)){
			flushResponse(response,batdel);
			return;
		}

		//删除后钩子
		if (StringUtils.isNotEmpty(o.getD().getHook_aftdel())) {
			Object ret = execHook(o.getD().getHook_aftdel(), request, o, null, null);//如果有更新前钩子，执行一下
			if (ret==null || !"0".equals(ret.toString())){
				flushResponse(response,"-1");
				return;
			}
		}

		request.getSession().setAttribute("ses_ht_tip", "删除成功！");
		Hanshu.flushResponse(response, "0");
	}

	public static void unique(HttpServletRequest request, HttpServletResponse response, EntMapper entMapper){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("getdata", "false");

		Crud o = (Crud)request.getSession(false).getAttribute(request.getParameter("u"));
		String id = request.getParameter("id");
		String lx = request.getParameter("lx");
		String val = request.getParameter("val");
		String zdm = request.getParameter("zdm");
		if (o==null ||StringUtils.isEmpty(val)||StringUtils.isEmpty(zdm) || !("0".equals(lx) || "1".equals(lx)) || ("1".equals(lx) && StringUtils.isEmpty(id))){
			Hanshu.flushResponse(response, JSONObject.fromObject(map));
			return;
		}

		String ex = "";
		String filter = request.getParameter("___extfilter");
		if (StringUtils.isNotEmpty(filter)) {
			ex += " and  "+filter+" ";
		}
		ex += " and  ("+zdm+" = '"+val+"') ";
		if ("1".equals(lx)) {//编辑
			ex += " and  (id!='"+id+"') ";
		}
		map.put("getdata", String.valueOf(Hanshu.cnt(o.getMp(), o.getTb(), ex)<=0));
		flushResponse(response, JSONObject.fromObject(map));
	}

	private static Object execHook(String hook, HttpServletRequest request, Crud o, Object pa, Object beiyong){
		if (StringUtils.isNotEmpty(hook) && request!=null && o!=null){
			int dtIndx = hook.lastIndexOf(".");
			if (dtIndx != -1) {
				String clsnm = hook.substring(0, dtIndx);
				String metd = hook.substring(dtIndx+1, hook.length());
				if (StringUtils.isNotEmpty(clsnm) && StringUtils.isNotEmpty(metd)) {
					try{
						Class<?> classT = Class.forName(clsnm);//获取对应类
						Method methodT = classT.getMethod(metd, Object.class, Object.class, Object.class, Object.class);
						Object obj = classT.newInstance();//创建类对象 
						return methodT.invoke(obj, (Object)request, (Object)o, (Object)pa, null);
					}catch(Exception e){
						e.printStackTrace();
						return null;
					}
				}
			}
		}

		return null;
	}

	//栏目那边通用的新增保存功能
	public static void addedit(HttpServletRequest request, HttpServletResponse response, EntMapper entMapper){
		Map<String,Object> qtjson = new HashMap<String, Object>();
		qtjson.put("ret", "-1");
		Crud o = (Crud)request.getSession(false).getAttribute(request.getParameter("u"));
		if (o==null) {
			qtjson.put("ret", "操作失败！请查看登录是否已过期，建议保存重要信息后再刷新页面");
			flushResponse(response, JSONObject.fromObject(qtjson));
			return;
		}

		boolean isadd = false;
		List<Map<String, Object>> listZiduan = getListZiduan(o);
		List<String> objzjs = o.getAev().getObjzjs();//看是否自定义了查obj的主键，当然其实这里可以设置任意字段名，只要能找到唯一记录就行了，比如tjpcms_fwb里的cid字段
		if (CollectionUtils.isEmpty(objzjs)) objzjs = getZjFromDb(listZiduan);//如果没设置的话，从表的主键里读
		if (CollectionUtils.isEmpty(objzjs)){
			qtjson.put("ret", "操作失败！请检查"+o.getTb()+"是否正确配置了主键");
			flushResponse(response, JSONObject.fromObject(qtjson));
			return;
		}

		//这边要给用户留一个修改提交参数的机会，因为这边可能会有业务上的需要，比如上次一个网友说要修改价格什么的，但是又不能在前端把业务逻辑暴露出来，那就在这边的钩子里修改
		Map<String, String[]> pa = new HashMap<String, String[]>(request.getParameterMap());
		String wh = "";
		String uid = Qt.getUid(request);
		int eppcnt = 0;//记录主键值为空的数量
		for (int i=0;i<objzjs.size();i++){
			String zjval = request.getParameter(objzjs.get(i));//取主键值
			if (StringUtils.isEmpty(zjval)) {
				if (eppcnt==0 && !o.isGlytj()){//如果非管理员提交的，且是遍历时第一次遇到空主键，以UID来代替
					zjval = uid;
				}else{
					eppcnt++;
				}
			}
			if (StringUtils.isNotEmpty(zjval)) wh +=" and ("+objzjs.get(i)+"='"+zjval+"') ";
		}
		if (eppcnt!=0 && eppcnt != objzjs.size()){
			qtjson.put("ret", "操作失败！提交的表单中主键值必须都存在或都不存在");
			flushResponse(response, JSONObject.fromObject(qtjson));
			return;
		}

		isadd = (eppcnt == objzjs.size());//主键值都为空，即为新增
		List<Map<String, Object>> lstUpd = null;
		if (!isadd){
			lstUpd = o.getMp().r("select * from "+o.getTb()+" where 1=1 "+wh);
			logger.info ("==============数据库检索3"+ lstUpd); 
			if (lstUpd.size()!=1 && lstUpd.size()!=0){
				qtjson.put("ret", "操作失败！给定的主键值查出的记录不是0条或1条");
				flushResponse(response, JSONObject.fromObject(qtjson));
				return;
			}
			if (lstUpd.size()==0){
				isadd = true;//说明用UID来代替不对
			}
		}

		if (o.isGlytj()){
			//管理员提交的目前都放行
			pa.put("uid", new String[]{(String)request.getSession().getAttribute(CL.ses_admin)});
			pa.put("shzt",  new String[]{"审核通过"});
			
		}else if (isadd){//普通用户新增
			
			//目前这里还没有完善的校验新增的权限，先写死了，下面的工作就是把用户分组权限这块完善一下
			String reccid = o.getCid()[0];
			String[] cids = {"141","146","153","154","155","174","156","164","165","167","177","178"};
			if (StringUtils.isEmpty(reccid) || !"tjpcms_tywz".equals(o.getTb()) && !"t_dashi".equals(o.getTb()) && !"t_kfbj".equals(o.getTb()) 
				|| !Arrays.asList(cids).contains(reccid)){
				qtjson.put("ret", "操作失败！您没有新增的权限");
				flushResponse(response, JSONObject.fromObject(qtjson));
				return;
			}
			
			if (pa.get("uid")!=null){
				qtjson.put("ret", "建议不要把uid配在aev里，这样会暴露给前台");
				flushResponse(response, JSONObject.fromObject(qtjson));
				return;
			}
			pa.put("uid", new String[]{uid});
			
		}else{//普通用户编辑
			String zduid = lstUpd.get(0).get("uid")!=null?lstUpd.get(0).get("uid").toString():"";//检查是谁发布的
			String zdid = lstUpd.get(0).get("id")!=null?lstUpd.get(0).get("id").toString():"";
			if (StringUtils.isNotEmpty(zduid) && zduid.equals(uid) || StringUtils.isNotEmpty(zdid) && zdid.equals(uid)){
				//权限检查没有问题
			}else{
				qtjson.put("ret", "操作失败！您没有权限编辑该条记录，请检查是否登录了其他账号");
				flushResponse(response, JSONObject.fromObject(qtjson));
				return;
			}

			if (pa.get("uid")!=null){
				qtjson.put("ret", "建议不要把uid配在aev里，这样会暴露给前台");//或者后面到把hidden类型的加密一下，也能用
				flushResponse(response, JSONObject.fromObject(qtjson));
				return;
			}
			pa.put("uid", new String[]{uid});
			pa.put("shzt", new String[]{"待审核"});
			pa.put("shyj", new String[]{""});
		}

		//新增前钩子
		if (isadd && StringUtils.isNotEmpty(o.getAev().getHook_befad())) {
			Object rtn = execHook(o.getAev().getHook_befad(), request, o, pa, null);//如果有更新前钩子，执行一下
			if (rtn==null) {
				qtjson.put("ret", "-1");
				flushResponse(response, JSONObject.fromObject(qtjson));
				return;
			}
			if (rtn instanceof String &&  !"0".equals(rtn.toString())){
				qtjson.put("ret",  rtn.toString());
				flushResponse(response, JSONObject.fromObject(qtjson));
				return;
			}
			if (rtn instanceof Map){
				Map<String,Object> mp = (Map<String,Object>)rtn;
				if (!"0".equals((String)mp.get("ret"))){
					qtjson.put("ret", mp.get("ret"));
					flushResponse(response, JSONObject.fromObject(qtjson));
					return;
				}
			}
		}

		//更新前的钩子
		if (!isadd && StringUtils.isNotEmpty(o.getAev().getHook_befgx())) {
			Object rtn = execHook(o.getAev().getHook_befgx(), request, o, pa, null);//如果有更新前钩子，执行一下
			if (rtn==null) {
				qtjson.put("ret", "-1");
				flushResponse(response, JSONObject.fromObject(qtjson));
				return;
			}
			if (rtn instanceof String &&  !"0".equals(rtn.toString())){
				qtjson.put("ret",  rtn.toString());
				flushResponse(response, JSONObject.fromObject(qtjson));
				return;
			}
			if (rtn instanceof Map){
				Map<String,Object> mp = (Map<String,Object>)rtn;
				if (!"0".equals((String)mp.get("ret"))){
					qtjson.put("ret", mp.get("ret"));
					flushResponse(response, JSONObject.fromObject(qtjson));
					return;
				}
			}
		}

		//执行新增或更新
		String rtnmsg = ppbc(o.getMp(), o.getTb(), request, pa, isadd, objzjs, wh,  listZiduan);
		if (!"0".equals(rtnmsg)){
			flushResponse(response, JSONObject.fromObject(qtjson));
			return;
		}

		//更新后钩子
		if (!isadd && StringUtils.isNotEmpty(o.getAev().getHook_aftgx())) {
			Object rtn = execHook(o.getAev().getHook_aftgx(), request, o, pa, null);//如果有更新后钩子，执行一下
			if (rtn==null) {
				qtjson.put("ret", "-1");
				flushResponse(response, JSONObject.fromObject(qtjson));
				return;
			}
			if (rtn instanceof String &&  !"0".equals(rtn.toString())){
				qtjson.put("ret",  rtn.toString());
				flushResponse(response, JSONObject.fromObject(qtjson));
				return;
			}
			if (rtn instanceof Map){
				Map<String,Object> mp = (Map<String,Object>)rtn;
				if (!"0".equals((String)mp.get("ret"))){
					qtjson.put("ret", mp.get("ret"));
					flushResponse(response, JSONObject.fromObject(qtjson));
					return;
				}else if(StringUtils.isNotEmpty(o.getAev().getJsAftbc())){
					 String parseJsAftbc = parseJsAftbc(mp, o);
					 if (StringUtils.isNotEmpty(parseJsAftbc)) {
						 qtjson.put("extjs", parseJsAftbc);
					}
				}
			}
		}

		//新增后的钩子
		if (isadd && StringUtils.isNotEmpty(o.getAev().getHook_aftad())) {
			Object rtn = execHook(o.getAev().getHook_aftad(), request, o, pa, null);
			if (rtn==null) {
				qtjson.put("ret", "-1");
				flushResponse(response, JSONObject.fromObject(qtjson));
				return;
			}
			if (rtn instanceof String &&  !"0".equals(rtn.toString())){
				qtjson.put("ret",  rtn.toString());
				flushResponse(response, JSONObject.fromObject(qtjson));
				return;
			}
			if (rtn instanceof Map){
				Map<String,Object> mp = (Map<String,Object>)rtn;
				if (!"0".equals((String)mp.get("ret"))){
					qtjson.put("ret", mp.get("ret"));
					flushResponse(response, JSONObject.fromObject(qtjson));
					return;
				}else if(StringUtils.isNotEmpty(o.getAev().getJsAftbc())){
					 String parseJsAftbc = parseJsAftbc(mp, o);
					 if (StringUtils.isNotEmpty(parseJsAftbc)) {
						 qtjson.put("extjs", parseJsAftbc);
					}
				}
			}
		}

		request.getSession().setAttribute("ses_ht_tip",isadd?"新增成功":"更新成功");

		qtjson.put("ret", "0");
		flushResponse(response, JSONObject.fromObject(qtjson));
	}

	private static String  parseJsAftbc(Map<String,Object> mp, Crud o){
		if (mp==null || o==null) return null;
		
		String s = o.getAev().getJsAftbc();
		if (StringUtils.isEmpty(s)) return null;
		
		int you = s.lastIndexOf(")");
		if (you==-1)  return null;
		int zuo = s.lastIndexOf("(", you);
		if (zuo==-1)  return null;
		String nr = s.substring(zuo+1, you);
		if (StringUtils.isEmpty(nr)) return null;
		String[] split = nr.split(",\\s*");
		if (split==null || split.length<=0) return null;
		String ti ="";//替换
		for (String kee : split) {
			String val = (String)mp.get(kee);
			if (StringUtils.isNotEmpty(val)){
				ti+="'"+val+"',";
			}
		}

		return s.substring(0,zuo)+"("+ti.substring(0,ti.length()-1)+")";
	}
	
	public static ModelAndView aev(HttpServletRequest request, EntMapper entMapper){
		String t = request.getParameter("t");
		String id = request.getParameter("id");
		Crud o = (Crud)request.getSession(false).getAttribute(request.getParameter("u"));
		if ((!"0".equals(t) && !"1".equals(t) && !"2".equals(t)) || o==null || (!"0".equals(t) && StringUtils.isEmpty(id))){
			return new ModelAndView("adm/welcome", null);
		}

		String[] arr = {"新增","编辑","查看"};
		String bread = o.getBread();
		int idxeq = bread.indexOf("aevH=\'");
		int idxblk = bread.indexOf("\'", idxeq+6);
		int idxpz = bread.lastIndexOf("-");
		if (idxeq!=-1 && idxblk!=-1){
			bread = bread.substring(idxeq+6, idxblk);
		}else if (idxpz!=-1){
			bread = bread.substring(idxpz+1, bread.length());
		}else{
			bread = bread.substring(bread.indexOf("：")+1, bread.length());
		}

		o.getAev().setTitle(arr[Integer.valueOf(t)]+bread);
		request.setAttribute("lx", t);
		Map<String, Object> curele = null;
		if (!"0".equals(t)){//编辑或者查看
			for(Map<String, Object>e:o.getR().getTbs()){
				if (e.get("id").toString().equals(id)){//在表体里找到这条数据，但数据有可能不全，如申请入会的情况
					curele = e;
					break;
				}
			}
		}
		//此处先执行aev包含的自定义的函数
		o.setRq(request);
		String hook = o.getAev().getDynaev();
		if (StringUtils.isNotEmpty(hook)) {
			int dtIndx = hook.lastIndexOf(".");
			if (dtIndx != -1) {
				String clsnm = hook.substring(0, dtIndx);
				String metd = hook.substring(dtIndx+1, hook.length());
				if (StringUtils.isNotEmpty(clsnm) && StringUtils.isNotEmpty(metd)) {
					try{
						Class<?> classT = Class.forName(clsnm);//获取对应类
						Method methodT = classT.getMethod(metd, Crud.class, String.class, Map.class);
						Object obj = classT.newInstance();//创建类对象 
						methodT.invoke(obj, (Object)o, (Object)t, (Object)curele);
					}catch(Exception e){e.printStackTrace();}
				}
			}
		}

		request.setAttribute("obj", curele);
		HttpSession ses = request.getSession();
		ses.setMaxInactiveInterval(CL.SESTO_CRUD);
		ses.setAttribute("o", o);
		if ("1".equals(t)){//编辑
			String hdnpara = o.getAev().getHdnpara();
			o.getAev().setHdnpara(hdnpara+"<input type='hidden' name='id' value='"+id+"'></input>");
		}
	
		return new ModelAndView("adm/aev", null);
	}
	
	//这2个供外部调用
	public static String ppbc(EntMapper _e, String tb, HttpServletRequest request){
		boolean isadd = StringUtils.isEmpty(request.getParameter("id"));

		return ppbc(_e, tb, request,null, isadd, Arrays.asList("id")," and id='"+request.getParameter("id")+"'", null);
	}
	public static String ppbc(EntMapper _e, String tb, HttpServletRequest request, Map<String,String[]> pa){//这种情况是因为有可能不需要所有的字段，只用一部分
		if (pa==null || pa.size()<=0){
			logger.error("如果传递了pa参数，那就使用pa来getParameter了");
			return "-1";
		}
		
		boolean isadd = StringUtils.isEmpty(pa.get("id")[0]);
		
		return ppbc(_e, tb, request, pa, isadd, Arrays.asList("id")," and id='"+pa.get("id")[0]+"'", null);
	}

	//返回"ret:0"表示执行正确，返回"ret:-1"表示执行失败，logger.error输出错误信息，ppbc：匹配保存
	@Transactional
	private static String ppbc(EntMapper _e, String tb, HttpServletRequest request , Map<String,String[]> pa, boolean isadd, List<String> objzjs, String wh, List<Map<String, Object>> listZiduan){
		if (StringUtils.isEmpty(tb) ||CollectionUtils.isEmpty(objzjs)){
			return "-1";
		}
		
		if (pa==null || pa.size()<=0){//如果pa有值就用pa的
			pa = request.getParameterMap();
		}
		if (pa==null || pa.size()<=0){
			return "-1";
		}
		
		if (CollectionUtils.isEmpty(listZiduan)){
			listZiduan = _e.getTblZiduan(tb, CL.DB);
		}
		if (CollectionUtils.isEmpty(listZiduan)) {
			return "-1";
		}

		boolean hasGxZd = false, gxzdHasVal = false;
		boolean hasUrlZd =false;
		for (int i = 0;i<listZiduan.size();i++){
			String col_name = (String)listZiduan.get(i).get("COLUMN_NAME");
			if ("url".equalsIgnoreCase(col_name)) hasUrlZd = true;//表中有url字段
			else if ("gx".equalsIgnoreCase(col_name)) hasGxZd = true;//表中有gx字段
		}

		if (!isadd){//是更新
			String upd = "";
			for (Map.Entry<String,  String[]> e : pa.entrySet()) {//遍历提交的表单
				String k = e.getKey();
				for (int i = 0;i<listZiduan.size();i++){
					String col_name = (String)listZiduan.get(i).get("COLUMN_NAME");
					if (col_name.equalsIgnoreCase(k)){
						if (!objzjs.contains(k)){//不是主键字段
							String[] vlus = e.getValue();
							if (vlus.length==1){
								String v = e.getValue()[0];
								if ("on".equalsIgnoreCase(v)){
									v="1";
								}
								upd += k+"='"+v+"',";
								if ("gx".equalsIgnoreCase(k))gxzdHasVal = true;//设置过了gx的值，下面就不再给其赋值了
							}else{
								upd += k+"='"+StringUtils.join(vlus, ",")+"',";
							}
						}
						listZiduan.remove(i);
						break;
					}
				}
			}
			if (!"".equals(upd)){
				String s = "update "+tb+" set "+upd.substring(0, upd.length()-1);
				if (hasGxZd && !gxzdHasVal) s+=" ,gx= '"+CL.fmt.format(new Date())+"'  ";
				s+=" where 1=1 "+wh;
				if (_e.upd(s)==1) return "0";
			}
		}else{//是add，如果是新增栏目内容，为该表加上url（前台只使用这个字段就可以了）,url_s和url_d三个字段
			String into = "", vls="", strCidVal = "";
			for (Map.Entry<String,  String[]> e : pa.entrySet()) {
				String k = e.getKey();
				for (int i = 0;i<listZiduan.size();i++){
					String col_name = (String)listZiduan.get(i).get("COLUMN_NAME");
					if (col_name.equalsIgnoreCase(k)){
						if (!objzjs.contains(k)){//不是主键字段
							String[] vlus = e.getValue();
							if (vlus.length==1){
								String v = e.getValue()[0];
								into += k+",";
								if ("on".equalsIgnoreCase(v)){
									v="1";
								}
								if ("cid".equalsIgnoreCase(k)){
									strCidVal = v;
								}
								vls += "'"+v+"',";
								if ("gx".equalsIgnoreCase(k))gxzdHasVal = true;
							}else{//有多个
								into += k+",";
								vls += "'"+StringUtils.join(vlus, ",")+"',";
							}
						}
						listZiduan.remove(i);
						break;
					}
				}
			}
			if (!"".equals(into)){
				String strUrl3 = "";
				if (StringUtils.isNotEmpty(strCidVal)){//如果需要栏目内容静态化，提交的表单中有必须有cid字段
					List<Map<String, Object>> lstNrTbl = _e.r("select distinct id,url3 from tjpcms_lanmu where nrtbl='"+tb+"' ");
					if (CollectionUtils.isNotEmpty(lstNrTbl)){//要存的这张表内容是可以静态化的，不管栏目内容当前设置是否是只动态化显示，即使只动态显示，后面也可以改成静态显示的
						strUrl3 = getTbUrl3(lstNrTbl, strCidVal, _e);//根据表名和cid值算出url3字段的值，预备存入url_d字段，为静态化做好准备
						if (StringUtils.isNotEmpty(strUrl3) && !hasUrlZd) {
							if(_e.upd("alter table "+tb+" add url varchar(100), add url_s varchar(100),add url_d varchar(100)")<=0) {
								strUrl3 = "";
							}
						}
					}
				}
				String s = "insert into "+tb+"("+into.substring(0, into.length()-1);
				if (hasGxZd && !gxzdHasVal) {
					s+=",gx";
				}
				if (StringUtils.isNotEmpty(strUrl3)){
					s+=",url_d";//url在插入成功后填充，url_s在静态化的时候再填充
				}
				s+= ") values("+vls.substring(0, vls.length()-1);
				if (hasGxZd && !gxzdHasVal) {
					s+=",'"+CL.fmt.format(new Date())+"' ";
				}
				if (StringUtils.isNotEmpty(strUrl3)){
					s += ",'"+strUrl3+"' ";
				}
				s+=")";
				Map<String, Object> pmp= new HashMap<String, Object>();
				pmp.put("id", "");//用于存这次插入的记录的id
				pmp.put("sql", s);
				if (1==_e.ins(pmp)) {
					if (StringUtils.isNotEmpty(strUrl3) && StringUtils.isNotEmpty((String)pmp.get("id"))){//插入后更新url字段
						_e.upd("update "+tb+" set url='"+request.getContextPath()+"/"+strUrl3+".dhtml?id="+pmp.get("id")+"' where id="+pmp.get("id"));
					}
					 return "0";
				}
			}
		}

		return "-1";
	}

	private static String getTbUrl3(List<Map<String, Object>> lst, String strCidVal, EntMapper mp){
		List<Map<String, Object>> r = mp.r("select id,pId,url3 from tjpcms_lanmu");
		while (StringUtils.isNotEmpty(strCidVal)){
			for (Map<String, Object> e : lst) {
				if (e.get("id").toString().equals(strCidVal)){
					return (String)e.get("url3");
				}
			}
			int i=0;
			for (;i<r.size();i++) {
				if (strCidVal.equals(r.get(i).get("id").toString())){
					if (r.get(i).get("pId")==null)continue;
					strCidVal = r.get(i).get("pId").toString();//往上跳一级继续找
					break;
				}
			}
			if(i>=r.size()) break;
		}
		
		return "";
	}
	
	private static String batdel(EntMapper mp, String tb, String[] arr, String exw){
		
		if (mp==null || arr==null || arr.length<=0|| StringUtils.isEmpty(tb)){
			return "-1";
		}
		String s = "delete from "+tb+" where id in(";
		for(int i =0;i<arr.length;i++){
			s +="'"+arr[i]+"',";
		}

		return (mp.del(s.substring(0,s.length()-1)+") "+exw)==arr.length)?"0":"-4";
	}

	public static String zdydel(Crud o, String[] arr){
		if (o==null || o.getMp()==null || StringUtils.isEmpty(o.getTb()) || StringUtils.isEmpty(o.getD().getZdysql()) || arr==null || arr.length<=0){
			return "-1";
		}

		String zdy = o.getD().getZdysql();
		String s = zdy+" where id in( ";
		for(int i =0;i<arr.length;i++){
			s +="'"+arr[i]+"',";
		}
		if (zdy.trim().toLowerCase().startsWith("update")){
			return (o.getMp().upd(s.substring(0,s.length()-1)+")")==arr.length)?"0":"-4";
		}
		
		return (o.getMp().del(s.substring(0,s.length()-1)+")")==arr.length)?"0":"-4";
	}

	//根据sql直接查个数
	public static int cnt(EntMapper mp, String tb, String ex){
		if (mp==null || StringUtils.isEmpty(tb)){
			return -1;
		}

		String s ="select count(*) from "+tb+" where 1=1 "+(StringUtils.isNotEmpty(ex)?ex:"");
		logger.info ("==============数据库检索752"+ s); 
		return mp.cnt(s);
	}
	
	//crud中的retrieve，带pg
	public static List<Map<String,Object>> rpg(EntMapper mp, String tb, HttpServletRequest rq){
		String pg = rq.getParameter("pg");
		Integer npg = 0;
		try{
			npg = Integer.valueOf(pg);
		}catch(Exception e){
			npg = 1;
			pg = "1";
		}
		String c = "select count(*) from "+tb;
		
		Integer cnt = mp.cnt(c);
		if (!(npg>=1 && npg<=cnt)){
			return null;
		}

		String s = "select * from "+tb+" order by px desc,gx desc limit "+(npg-1)*CL.PER_PAGE+","+CL.PER_PAGE;

		return mp.r(s);
	}

	public static int vpx(EntMapper mp, String tb){
		String s = "select IFNULL(max(px)+1, 1) from "+tb;

		return mp.vpx(s);
	}

	//根据字典表得到select的option
	public static List<Map<String,Object>> fnsel(String a0lxm, EntMapper mp, String py, String exw){
		List<Map<String, Object>> sel= new ArrayList<Map<String, Object>>();

		if ("zdb".equals(a0lxm) && mp!=null && StringUtils.isNotEmpty(py)){
			String s = "select s.zdxmc txt,s.zdxval val,s.sys from tjpcms_zdb t left join tjpcms_zdx s on t.id = s.pid where (t.py = '"+py+"') ";
			if (StringUtils.isNotEmpty(exw)) {
				s+= " and ("+exw+")";
			}
			s+=" order by s.px desc ,s.gx desc";
			for (Map<String, Object> e : mp.r(s)) {
				sel.add(e);
			}
		}else if (("sel".equals(a0lxm) || "select".equals(a0lxm)) && mp!=null && StringUtils.isNotEmpty(py)){
			String[] split = py.split(",\\s*");
			if (split !=null && split.length>0){
				for (String s : split) {
					Map<String, Object> tpmp = new HashMap<String, Object>();
					tpmp.put("val", s);
					tpmp.put("txt", s);
					sel.add(tpmp);
				}
			}
		}

		return sel;
	}

	//hds[][]中当该字段类型为text:zdb时，从字典表中读出map
	public static Map<Object,Object> textzdbmap(EntMapper mp, String zdb){
		Map<Object, Object> ret= new HashMap<Object, Object>();

		if (mp!=null && StringUtils.isNotEmpty(zdb)){
			List<Map<Object, Object>> ro = mp.ro( "select  zdxmc txt, zdxval val from tjpcms_zdx t left join tjpcms_zdb s on t.pid = s.id where (s.py='"+zdb+"')");
			for (Map<Object, Object> e : ro) {
				String py = (String)e.get("val");
		        if(Pattern.compile("^-?\\d+$").matcher(py).matches()){//是整数
		        	ret.put(Long.valueOf(py), e.get("txt"));
		        }else{
		        	ret.put(py, e.get("txt"));
		        }
			}
		}

		return ret;
	}

	public static Map<String,Object> obj(EntMapper mp, String tb, String id){
		if (mp==null || StringUtils.isEmpty(tb) || StringUtils.isEmpty(id)){
			return null;
		}

		String s = "select * from "+tb+" where (id ="+id+")";
		logger.info ("==============数据库检索1"+ s); 

		return mp.obj(s);
	}

	public static Map<String,Object> objw(EntMapper mp, String tb, String w){
		if (mp==null || StringUtils.isEmpty(tb) || StringUtils.isEmpty(w)){
			return null;
		}

		String s = "select * from "+tb+" where 1=1 and "+w+" limit 0,1";
		logger.info ("==============数据库检索2"+ s); 
		return mp.obj(s);
	}

	//之前用的一个方便后台查数据的接口，现在已经被Crud替代了，不过前台还是可以用用的
	public static Map<String,Object> listpg(EntMapper mp, String tb, HttpServletRequest rq, String bread){
		Map<String,Object> m = new HashMap<String,Object>();
		m.put("recTotal",0);
		m.put("pgTotal",0);
		m.put("perPage",CL.PER_PAGE);
		if (mp==null || StringUtils.isEmpty(tb) || rq==null){
			return m;
		}
		String pg = rq.getParameter("pg");
		Integer npg = 0;
		try{
			npg = Integer.valueOf(pg);
		}catch(Exception e){
			npg = 1;
			pg = "1";
		}
		Integer recTotal = mp.cnt("select count(*) from "+tb);
		Integer pgTotal = (int)Math.ceil(recTotal/(double)CL.PER_PAGE);
		if (!(npg>=1 && npg<=recTotal)){
			return m;
		}

		String s = "select * from "+tb+" order by px desc,gx desc limit "+(npg-1)*CL.PER_PAGE+","+CL.PER_PAGE;
		m.put("list",mp.r(s));
		m.put("recTotal",recTotal);
		m.put("pgTotal",pgTotal);
		m.put("pg", pg);
		m.put("bread", bread);

		String msg = rq.getParameter("msg");
		if("0".equals(msg) || "1".equals(msg) || "2".equals(msg)){
			Integer idx = Integer.valueOf(msg);
			String arr[] = {"新增成功！", "删除成功！","编辑成功！"};
			m.put("msg", arr[idx]);
		}

		return m;
	}

	//把上面那个再改造一下
	public static Map<String,Object> listpgex(Map<String,Object> map, EntMapper _e, HttpServletRequest request, String tb, Integer pp, String zd, String wh){
		map.put("recTotal",0);
		map.put("pgTotal",0);
		map.put("perPage", pp);
		if (_e==null || StringUtils.isEmpty(tb) || request==null){
			return map;
		}
		String pg = request.getParameter("pg");
		Integer npg = 0;
		try{
			npg = Integer.valueOf(pg);
		}catch(Exception e){
			npg = 1;
			pg = "1";
		}
		if (pp==null || pp<=0)pp = CL.PER_PAGE;
		Integer recTotal = _e.cnt("select count(*) from "+tb+" "+(StringUtils.isNotEmpty(wh)?("where "+wh):""));
		logger.info ("==============数据库检索910"+ recTotal); 
		Integer pgTotal = (int)Math.ceil(recTotal/(double)pp);
		if (recTotal>0 && !(npg>=1 && npg<=recTotal)){
			return map;
		}

		String s = "select t.*"+(StringUtils.isNotEmpty(zd)?(","+zd):"")+" from "+tb+" t "+(StringUtils.isNotEmpty(wh)?("where "+wh):"")+" order by px desc,gx desc limit "+(npg-1)*pp+","+pp;
		map.put("lst",_e.r(s));
		map.put("recTotal",recTotal);
		map.put("pgTotal",pgTotal);
		map.put("pg", pg);
	
		return map;
	}
	//最新数据
		public static Map<String,Object> listpgexnewdata(Map<String,Object> map, EntMapper _e, HttpServletRequest request, String tb, Integer pp, String zd, String wh){
			map.put("recTotal",0);
			map.put("pgTotal",0);
			map.put("perPage", pp);
			if (_e==null || StringUtils.isEmpty(tb) || request==null){
				return map;
			}
			String pg = request.getParameter("pg");
			Integer npg = 0;
			try{
				npg = Integer.valueOf(pg);
			}catch(Exception e){
				npg = 1;
				pg = "1";
			}
			if (pp==null || pp<=0){
				pp = CL.PER_PAGE;
			}
			Integer recTotal = _e.cnt("select count(*) from "+tb+" "+(StringUtils.isNotEmpty(wh)?("where "+wh):""));
			logger.info ("==============数据库检索910"+ recTotal); 
			Integer pgTotal = (int)Math.ceil(recTotal/(double)pp);
			if (recTotal>0 && !(npg>=1 && npg<=recTotal)){
				return map;
			}

			String s = "select a.* from nb_data a where 1 > (select count(*) from nb_data where Node_ID = a.Node_ID and Time > a.Time ) order by a.Node_ID";
			map.put("lst",_e.r(s));
			map.put("recTotal",recTotal);
			map.put("pgTotal",pgTotal);
			map.put("pg", pg);
		
			return map;
		}
		//历史数据
				public static Map<String,Object> listpgexhisdata(Map<String,Object> map, EntMapper _e, HttpServletRequest request, String tb, Integer pp, String zd, String wh){
					map.put("recTotal",0);
					map.put("pgTotal",0);
					map.put("perPage", pp);
					if (_e==null || StringUtils.isEmpty(tb) || request==null){
						return map;
					}
					String pg = request.getParameter("pg");
					Integer npg = 0;
					try{
						npg = Integer.valueOf(pg);
					}catch(Exception e){
						npg = 1;
						pg = "1";
					}
					if (pp==null || pp<=0){
						pp = CL.PER_PAGE;
					}
					Integer recTotal = _e.cnt("select count(*) from "+tb+" "+(StringUtils.isNotEmpty(wh)?("where "+wh):""));
					logger.info ("==============数据库检索910"+ recTotal); 
					Integer pgTotal = (int)Math.ceil(recTotal/(double)pp);
					if (recTotal>0 && !(npg>=1 && npg<=recTotal)){
						return map;
					}

					//String s = "select * from nb_hisdata order by Node_ID,time DESC";
					String s = "select t.*"+(StringUtils.isNotEmpty(zd)?(","+zd):"")+" from "+tb+" t "+(StringUtils.isNotEmpty(wh)?("where "+wh):"")+" order by px desc,gx desc limit "+(npg-1)*pp+","+pp;
					
					map.put("lst",_e.r(s));
					map.put("recTotal",recTotal);
					map.put("pgTotal",pgTotal);
					map.put("pg", pg);
				
					return map;
				}
				
				//历史数据
				public static Map<String,Object> listpgexequip(Map<String,Object> map, EntMapper _e, HttpServletRequest request, String tb, Integer pp, String zd, String wh){
					map.put("recTotal",0);
					map.put("pgTotal",0);
					map.put("perPage", pp);
					if (_e==null || StringUtils.isEmpty(tb) || request==null){
						return map;
					}
					String pg = request.getParameter("pg");
					Integer npg = 0;
					try{
						npg = Integer.valueOf(pg);
					}catch(Exception e){
						npg = 1;
						pg = "1";
					}
					if (pp==null || pp<=0){
						pp = CL.PER_PAGE;
					}
					Integer recTotal = _e.cnt("select count(*) from "+tb+" "+(StringUtils.isNotEmpty(wh)?("where "+wh):""));
					logger.info ("==============数据库检索910"+ recTotal); 
					Integer pgTotal = (int)Math.ceil(recTotal/(double)pp);
					if (recTotal>0 && !(npg>=1 && npg<=recTotal)){
						return map;
					}

					String s = "select * from nb_equip order by Node_ID";
					map.put("lst",_e.r(s));
					map.put("recTotal",recTotal);
					map.put("pgTotal",pgTotal);
					map.put("pg", pg);
				
					return map;
				}

	//字段是否在数据库字段列中
	public static boolean zdInDbcol(String zdm, List<Map<String,Object>> listZiduan){
		if (StringUtils.isEmpty(zdm) || CollectionUtils.isEmpty(listZiduan)){
			return false;
		}

		for(Map<String,Object> e:listZiduan){
			String col_name = ((String)e.get("COLUMN_NAME"));
			if (col_name.equalsIgnoreCase(zdm)){
				return true;
			}
		}

		return false;
	}

	//字段是否在数据库字段列中，或者在hds中。在的话就可以从list中取数据。
	private static boolean zdInHdsOrDbOrJoin(String[][] v, String zdm, Crud o){
		if (StringUtils.isEmpty(zdm) || o==null) {
			return false;
		}

		List<Map<String,Object>> listZiduan = getListZiduan(o);
		if (CollectionUtils.isEmpty(listZiduan)){
			return false;
		}

		if (zdInDbcol(zdm, listZiduan)){
			return true;
		}
		
		List<String> exjoinzdm = o.getR().getExjoinzdm();
		if (CollectionUtils.isNotEmpty(exjoinzdm)) {
			for (String s : exjoinzdm) {
				String[] split = s.trim().split("\\s+");//按空白符号分割
				if (split.length>=2){//有空白符
					if (zdm.equals(split[1].trim()))return true;
				}else{//单独的
					split = s.trim().split(".");
					if (zdm.equals(split[split.length-1].trim()))return true;
				}
			}
		}

		if (v==null){
			return false;
		}
		for (int i = 0; i < v.length; i++) {
			if (v[i]!=null && v[i].length>1 && v[i][1].equals(zdm)) return true;
		}
		
		return false;
	}

	//列表区表头解析
	private static Map<String,Object> getTblHead(String[][] v, Crud o, String[][] czs){
		if (v==null || v.length<=0 || o==null){
			return null;
		}

		Map<String,Object> map = new HashMap<String,Object>();
		List<Map<String,Object>> ths = new ArrayList<Map<String,Object>>();
		List<Map<String,Object>> zds = new ArrayList<Map<String,Object>>();
		if (o.getD().isBatdel()){
			Map<String,Object> e = new HashMap<String,Object>();
			e.put("title", "<input  type='checkbox'/>");
			e.put("notip", true);
			e.put("style", "width:3em");
			ths.add(e);
		}
		{
			Map<String,Object> e = new HashMap<String,Object>();
			e.put("style", "width:5em;padding-left:1px;padding-right:1px;");
			e.put("title", "序号");
			ths.add(e);
		}

		String extSelect = "";
		for (int i=0;i<v.length;i++) {
			Map<String,Object> e = new HashMap<String,Object>();
			String head = v[i][0];
			if ("操作".equals(head)){
				continue;
			}else{
				String zdm = v[i][1];//字段名
				e.put("title", head);
				e.put("zdm", zdm);
				e.put("empcoltip", null);
				e.put("zdType", "normal");//最普通的就是列表字段
				for (int j = 2; j <= 7; j++) {//第2,3,4,5,6,7字段位置可以不固定，根据具体内容来判断来判断类型
					if (v[i].length>=j+1 && StringUtils.isNotEmpty(v[i][j])){
						String cont = v[i][j].trim();
						String tparr[] = cont.split(":");
						if (cont.startsWith("sql")){//说明是自定义字段
							if (tparr.length > 1) extSelect+=" ("+tparr[1]+")"+zdm+",";
						}else if (cont.startsWith("style")){//是style字段
							int indexOf = cont.indexOf("=");
							if(indexOf==-1) indexOf = cont.indexOf(":");
							if (indexOf+1 < cont.length()) e.put("style", cont.substring(indexOf+1, cont.length()));
						}else if (cont.startsWith("pic")){//该字段是图片类型
							e.put("zdType", "pic");
							if (tparr.length > 1) e.put("empcoltip",tparr[1]);
						}else if (cont.startsWith("ext")){//该字段要额外添加文字
							e.put("exts", "(");//默认的追加文字
							e.put("exttail", true);//head还是tail
							if (cont.endsWith("::")){
								e.put("exte", "");e.put("exts", "");
							}else if (tparr.length==2){
								e.put("exte", ")");
							}else if (tparr.length==3) {
								e.put("exts", tparr[2]);
							}else if (tparr.length==4) {
								e.put("exte", tparr[3]);e.put("exts", tparr[2]);
							}else if (tparr.length>=5) {
								e.put("exte", tparr[3]);e.put("exts", tparr[2]);e.put("exttail", "tail".equals(tparr[4]));
							}
							if (tparr.length > 1) {
								e.put("extc", tparr[1]);//内容
								e.put("extdbzd", Hanshu.zdInHdsOrDbOrJoin(v, tparr[1], o));
							}
						}else if (cont.startsWith("text")){//不从查询sql里根据字段取值了，可以是val、zdb、sql
							e.put("zdType", "text");
							if (tparr.length>=3){
								if ("val".equals( tparr[1])){
									e.put("textval", tparr[1]);
								}else if ("zdb".equals( tparr[1])){
									e.put("textmap", textzdbmap(o.getMp(), tparr[2]));
									e.put("textmpzd", tparr.length>=4?tparr[3]:zdm);
								}else if ("sql".equals( tparr[1])){//统一使用val、txt
									//e.put("textmap", textzdbmap(o.getMp(), tparr[2]));
									//e.put("textmpzd", tparr.length>=4?tparr[3]:zdm);
								}
							}
						}else if (cont.startsWith("href")){//该字段可以点击
							parseHdsHref(tparr, e);
						}else{//剩下的这个是字段值为空时的提示文字
							e.put("empcoltip", v[i][j]);
						}
					}
				}
				
				if (StringUtils.isEmpty((String)e.get("style"))){
					if ("id".equals(zdm) || "px".equals(zdm) || "pid".equalsIgnoreCase(zdm)) e.put("style", "width:5em;padding-left:1px;padding-right:1px;");
					else if ("gx".equals(zdm) || "rq".equals(zdm)) e.put("style", "width:10em;");
				}
				zds.add(e);
				if(e.size()>0) ths.add(e);
			}
		}

		//如果点击是的fulanmu_nr，则额外增加一个栏目列，以区分内容是哪个栏目的
		if (o.getCid()!=null && o.getCid().length>1 && !"fulanmu_zi".equals(o.getRq().getParameter("___lxpy"))){
			Map<String,Object> e = new HashMap<String,Object>();
			e.put("title", "栏目");
			ths.add(e);
			List<Map<String, Object>> cxs = o.getR().getCxs();
			@SuppressWarnings("unchecked")
			List<Map<String,Object>> selopslst = (List<Map<String,Object>>)cxs.get(cxs.size()-1).get("selops");
			Map<String,String> txtmp = new HashMap<String,String>();
			for (Map<String,Object> esel:selopslst){
				txtmp.put(esel.get("val").toString(), (String)esel.get("txt"));
			}
			e.put("textmap", txtmp);
			e.put("textmpzd", "cid");
			e.put("zdType", "text");
			zds.add(e);
		}
		//如果有操作列，则增加上该列
		if (o.getAev().isNeeda() || o.getAev().isNeede() || o.getAev().isNeedv() || o.getD().isNeed() || (czs!=null && czs.length>0)){
			Map<String,Object> e = new HashMap<String,Object>();
			e.put("title", "操作");
			ths.add(e);
		}
		map.put("ths", ths);
		map.put("zds", zds);
		if (StringUtils.isNotEmpty(extSelect)) map.put("extSelect", extSelect.substring(0,extSelect.length()-1));

		return map;
	}

	private static void parseHdsHref(String tparr[], Map<String,Object> e ){
		if (tparr!=null && tparr.length>=2 && tparr.length<=3){
			String sHf="";
			boolean tgblank = false;
			for(int i=1;i<=(tparr.length-1);i++){
				if ("_blank".equalsIgnoreCase(tparr[i])){
					tgblank = true;
				}else if (StringUtils.isNotEmpty(tparr[i])){
					sHf = tparr[i];
				}
			}
			if (StringUtils.isEmpty(sHf)){
				return;
			}

			int dhIdx = sHf.indexOf(".dhtml");
			if (dhIdx!=-1 && !sHf.startsWith(".dhtml")){
				int whIdx = sHf.indexOf("?",dhIdx);
				if(whIdx==-1) {
					e.put("href", sHf);
					e.put("tgblank", tgblank);
				}else{//有参数   xqhd_detail.dhtml?id=${pid}
					List<Map<String, Object>> hrefmp = new ArrayList<Map<String, Object>>();
					int eqIdx = sHf.indexOf("=",whIdx+1);
					while (eqIdx!=-1){
						int zdSt = sHf.lastIndexOf("&",eqIdx-1);
						if (zdSt==-1 || zdSt<whIdx)zdSt = sHf.lastIndexOf("?",eqIdx-1);
						if (zdSt!=-1 && zdSt<eqIdx){
							String zdm = sHf.substring(zdSt+1, eqIdx).trim();
							if (StringUtils.isNotEmpty(zdm)) {
								Map<String, Object> eZd = new HashMap<String, Object>();
								eZd.put("zdm", zdm);
								int adIdx = sHf.indexOf("&", eqIdx+1);
								if (adIdx==-1) adIdx = sHf.length();
								if (eqIdx+1<adIdx){
									String szdz = sHf.substring(eqIdx+1, adIdx).trim();
									if (StringUtils.isNotEmpty(szdz)) {
										if (szdz.startsWith("$") && szdz.endsWith("}")){
											int lkhidx = szdz.indexOf("{");
											if (lkhidx != -1) {
												String tplzdm = szdz.substring(lkhidx+1,szdz.length()-1).trim();
												eZd.put("tplzdm", tplzdm);
											}
										}else{
											eZd.put("zdz", szdz);
										}
									}
								}
								hrefmp.add(eZd);
							}
						}
						eqIdx = sHf.indexOf("=",eqIdx+1);
					}
					if (CollectionUtils.isNotEmpty(hrefmp)) {
						e.put("href", sHf.substring(0, dhIdx+".dhtml".length()));
						e.put("hrefmp", hrefmp);
						e.put("tgblank", tgblank);
					}
				}
			}
		}
	}
	
	//表单字段是否在栏目配置中
	private static int fmzdInlmpz(String name, List<Map<String,Object>> lstZd, int[] lmpzidx){
		if (StringUtils.isEmpty(name) || CollectionUtils.isEmpty(lstZd)){
			return -1;
		}

		if (name.endsWith("___kssj") || name.endsWith("___jssj")){
			for(int i=0;i<lstZd.size();i++){
				Map<String, Object> m = lstZd.get(i);
				if ("sj".equals(m.get("lx").toString())){//该字段是否是时间类型
					String zdm = (String)m.get("zdm");
					String cls = (String)m.get("cls");
					String postfix = name.endsWith("___kssj")?"___kssj":"___jssj";
					String gvzd= name.substring(0,name.indexOf(postfix));
					if (zdm.equalsIgnoreCase(gvzd) && postfix.contains(cls)){//时间类型的话，不仅字段名要相同，开始结束的类型也要相同索引才对
						lmpzidx[0] = i;
						return i;
					}
				}
			}
		}else{
			for(int i=0;i<lstZd.size();i++){
				if (name.equalsIgnoreCase((String)lstZd.get(i).get("zdm"))){
					lmpzidx[0] = i;
					return i;
				}
			}
		}

		return -1;
	}

	//根据操作字符串生成listOp
	private static List<Map<String,Object>> getCxqOps(String opstr){
		List<Map<String,Object>> ops = new ArrayList<Map<String,Object>>();
		if (StringUtils.isEmpty(opstr)){
			Map<String,Object> one = new HashMap<String,Object>();
			one.put("val", "like");
			one.put("text", "包含");
			ops.add(one);
		}else{
			String[] arr = opstr.split(",");
			for(int x=0;x<arr.length;x++) {
				Map<String,Object> one = new HashMap<String,Object>();
				one.put("val", "eq".equalsIgnoreCase(arr[x])?"=":arr[x]);
				String[][] seltxt = {{"eq","like",">","<",">=","<=","=","==","!="},{"等于","包含","大于","小于","大于等于","小于等于","等于","等于","不等于"}};
				for (int i = 0; i < seltxt[0].length; i++) {
					if (arr[x].equalsIgnoreCase(seltxt[0][i])){
						one.put("text", seltxt[1][i]);
						break;
					}
				}
				
				ops.add(one);
			}
		}
		
		return ops;
	}

	//查询区单个字段长度的计算
	private static int calcCzqWzWidth(List<Map<String,Object>> listCx){
		int cxqWzwidth = -1;
		int FZISE=16;
		for (int i = 0; i < listCx.size(); i++) {
			int cxw = ((String)listCx.get(i).get("wz")).length()*FZISE;
			if (cxw>cxqWzwidth) cxqWzwidth = cxw;
			if (cxqWzwidth<=FZISE*2)  cxqWzwidth*=1.2;//两个字的时候因为还要放个：，就有点挤了，微调一下
		}

		return cxqWzwidth;
	}

	//如果查询页面某字段有初始值，那和查询区提交的表单字段合并一下
	private static Map<String, String[]> unionParaMap(List<Map<String,Object>> listDef, Map<String, String[]> mp){
		Map<String, String[]> retmp = new HashMap<String, String[]>(mp);
		if (CollectionUtils.isNotEmpty(listDef) && mp !=null) {
			for (Map<String, Object> e : listDef) {
				if (mp.get((String)e.get("zdm")) == null){//不能是已经存在的，存在说明页面查询区做了选择，要覆盖掉默认值
					retmp.put((String)e.get("zdm"),   new String[]{(String)e.get("val")});
					retmp.put(e.get("zdm")+"___op",  new String[]{(String)e.get("op")});
				}
			}
		}

		return retmp;
	}
	
	private static boolean isStrKaishi(String str){
		return StringUtils.isNotEmpty(str) && (str.trim().equals("ks") || str.trim().equals("kaishi") || str.trim().equals("start") || str.trim().equals("k"));
	}
	
	//解析查询区时间类型的def值
	private static void parseCxqSjDef(List<Map<String,Object>> listDef, String[] line, Map<String,Object> ks , Map<String,Object> js, HttpServletRequest rq){
		if (line==null || ks==null || js==null){
			return;
		}
		
/*		String header = rq.getHeader("Referer");
		if (StringUtils.isNotEmpty(header) && !header.endsWith(XT.glylj+"/index.dhtml") && !header.endsWith(XT.glylj+"/")){
			return;
		}*/
		
		//如果是点了页面中的查询或者翻页，或者右键TAB项刷新，都不需要出现默认项的框框
		if (line.length>=3 && Pattern.compile("^\\s*def\\s*:").matcher(line[2]).find()){//该字段设置了有默认值，如def:ks:eq:2017-02-14:js:eq:xxxx
			String zdm=line[1];
			String pzVal = line[2].substring(line[2].indexOf(":")+1);
			String arr[] = pzVal.split(":");
			if (arr.length==2){//可以省略是开始还是结束，默认是开始
				if (StringUtils.isEmpty(rq.getParameter(zdm+"___kssj"))) ks.put("hasDef", 1);
				Map<String, Object> edef = new HashMap<String, Object>();
				edef.put("zdm", zdm+"___kssj");//时间的字段名要加后缀___kssj, ___jssj
				edef.put("val", arr[1].trim());
				edef.put("op", "eq".equalsIgnoreCase(arr[0])?"=":"like");
				listDef.add(edef);
			}else if (arr.length==3){//配置了一个日期的默认值
				if (isStrKaishi(arr[0]) && StringUtils.isEmpty(rq.getParameter(zdm+"___kssj"))) {ks.put("hasDef", 1);}
				else if (!isStrKaishi(arr[0]) && StringUtils.isEmpty(rq.getParameter(zdm+"___jssj"))) {js.put("hasDef", 1);}
				Map<String, Object> edef = new HashMap<String, Object>();
				edef.put("zdm", zdm+(isStrKaishi(arr[0])?"___kssj":"___jssj"));
				edef.put("val", arr[2].trim());
				edef.put("op", "eq".equals(arr[1])?"=":"like");
				listDef.add(edef);
			}else if (arr.length==6){//配置了两个日期的默认值
				if (StringUtils.isEmpty(rq.getParameter(zdm+"___kssj")) && StringUtils.isEmpty(rq.getParameter(zdm+"___jssj"))) {ks.put("hasDef", 1);js.put("hasDef", 1);}
				for (int i=0;i<2;i++){
					boolean isSt = isStrKaishi(arr[i*3]);
					Map<String, Object> edef = new HashMap<String, Object>();
					edef.put("zdm", zdm+(isSt?"___kssj":"___jssj"));
					edef.put("val", arr[i*3+2].trim());
					edef.put("op", "eq".equals(arr[i*3+1])?"=":"like");
					listDef.add(edef);
				}
			}
		}
	}
	
	//列表页查询区配置解析（时间类型要也可以加def）
	private static Map<String,Object> getTblCxs(Crud o, String[][] cxs){
		HttpServletRequest rq = o.getRq();
		if (o==null ||rq==null ||o.getMp()==null || StringUtils.isEmpty(o.getTb()) ||  cxs==null || cxs.length<=0){
			return null;
		}

		//查询区内容及排版
		Map<String,Object> map = new HashMap<String,Object>();
		List<Map<String,Object>> listCx = new ArrayList<Map<String,Object>>();
		List<Map<String,Object>> listDef= new ArrayList<Map<String,Object>>();//记录哪些字段有默认值
		rq.setAttribute("cxqOpSelect", false);
		for (int i=0;i<cxs.length;i++) {
			String wz = cxs[i][0];
			String zdm = cxs[i][1];
			if("gx".equalsIgnoreCase(zdm)) {//是时间段
				Map<String,Object> ks =  new HashMap<String,Object>();
				ks.put("wz", "开始"+wz);
				ks.put("zdm", "gx");
				ks.put("lx", "sj");//时间类型
				ks.put("cls", "kssj");//时间类型
				listCx.add(ks);
				Map<String,Object> js =  new HashMap<String,Object>();
				js.put("wz", "结束"+wz);
				js.put("zdm", "gx");
				js.put("lx", "sj");
				js.put("cls", "jssj");
				listCx.add(js);
				rq.setAttribute("cxqHaveShijian", true);//查询区有时间字段
				parseCxqSjDef(listDef, cxs[i], ks, js, rq);
			}else if ("rq".equalsIgnoreCase(zdm)){//查的是记录产生的日期
				Map<String,Object> ks =  new HashMap<String,Object>();
				ks.put("wz", wz+"开始");
				ks.put("zdm", "rq");
				ks.put("lx", "sj");//时间类型
				ks.put("cls", "kssj");//时间类型
				listCx.add(ks);
				Map<String,Object> js =  new HashMap<String,Object>();
				js.put("wz", wz+"结束");
				js.put("zdm", "rq");
				js.put("lx", "sj");
				js.put("cls", "jssj");
				listCx.add(js);
				rq.setAttribute("cxqHaveShijian", true);//查询区有时间字段
				parseCxqSjDef(listDef, cxs[i], ks, js, rq);
			}else{//普通字段
				Map<String,Object> e =  new HashMap<String,Object>();
				e.put("wz", wz);
				e.put("zdm", zdm);
				e.put("lx","input");//默认是input
				e.put("ops", getCxqOps(null));//默认操作符(like)
				for(int m=2;m<4;m++){
					if (cxs[i].length>=m+1 && StringUtils.isNotEmpty(cxs[i][m])){
						String cont = cxs[i][m].trim();
						String arr[] = cont.split(":");
						if (arr.length>=2){
							String a0lxm = arr[0].trim().toLowerCase();
							if ("zdb".equals(a0lxm) || "sel".equals(a0lxm)||"select".equals(a0lxm)){
								e.put("lx", "sel");//zdb也是sel类型
								e.put("selops", fnsel(a0lxm, o.getMp(), arr[1].trim(), ""));
							}else if ("op".equals(a0lxm)){
								List<Map<String, Object>> cxqOps = getCxqOps(arr[1]);
								e.put("ops", cxqOps);//默认操作符
								if (cxqOps.size()>=2) rq.setAttribute("cxqOpSelect", true);//查询区有下拉的操作符
							}else if ("def".equals(a0lxm)){//该字段设置了有默认值，如def:eq:待审核
								if (arr.length>=3){
									e.put("val", arr[2]);
									if (StringUtils.isEmpty(rq.getParameter(zdm))) e.put("hasDef", 1);
									Map<String, Object> edef = new HashMap<String, Object>();
									edef.put("zdm", zdm);
									edef.put("val", arr[2]);
									edef.put("op", "eq".equals(arr[1])?"=":"like");
									listDef.add(edef);
								}
							}else if ("lx".equals(a0lxm)){
								e = null;
								if ("sj".equalsIgnoreCase((String)arr[1].trim())){
									Map<String,Object> ks =  new HashMap<String,Object>();
									ks.put("wz", wz+"开始");
									ks.put("zdm", zdm);
									ks.put("lx", "sj");//时间类型
									ks.put("cls", "kssj");//时间类型
									listCx.add(ks);
									Map<String,Object> js =  new HashMap<String,Object>();
									js.put("wz", wz+"结束");
									js.put("zdm", zdm);
									js.put("lx", "sj");
									js.put("cls", "jssj");
									listCx.add(js);
									rq.setAttribute("cxqHaveShijian", true);//查询区有时间字段
									parseCxqSjDef(listDef, cxs[i], ks, js, rq);
								}
							}
						}
					}
				}
				if (e!=null) listCx.add(e);
			}
		}
		//这种情况（点击了栏目树的fulanmu_nr）就需要可以选栏目，额外增加这里的判断，额外又多了一个查询条件
		if (o.getCid()!=null && o.getCid().length>1 && !"fulanmu_zi".equals(o.getRq().getParameter("___lxpy"))){
			Map<String,Object> e =  new HashMap<String,Object>();
			e.put("wz", "栏目");
			e.put("zdm", "cid");
			e.put("lx","sel");
			e.put("selops", o.getMp().r("select id val,name txt from tjpcms_lanmu where id in"+arr2instr(o.getCid())));
			listCx.add(e);
		}
		rq.setAttribute("cxqWzwidth", calcCzqWzWidth(listCx));
		map.put("cxq", listCx);

		//查询区有值的话，这边再拼出过滤的sql
		String cxfilter="";
		Map<String, String[]> pa = unionParaMap(listDef, rq.getParameterMap());//把表单提交的字段值和设置的字段默认值合并到新的pa里，下面就遍历pa来拼sql了
		if (pa!=null && pa.size()>0){
			List<Map<String,String>> fmZds = new ArrayList<Map<String,String>>();//记录提交过来的字段
			Map<String,String> fmopmp = new HashMap<String,String>();
			for (Map.Entry<String,  String[]> e : pa.entrySet()) {//先把操作符弄出来
				String[] value = e.getValue();
				if (value !=null && value.length>0 && StringUtils.isNotEmpty(value[0])){
					String name = e.getKey();
					if (name.endsWith("___op") && !name.startsWith("___op")){//有操作符
						fmopmp.put(name.substring(0,name.indexOf("___op")), " "+value[0]+" ");
					}
				}
			}

			for (Map.Entry<String,  String[]> e : pa.entrySet()) {//遍历提交的表单项
				String[] value = e.getValue();
				if (value !=null && value.length>0 && StringUtils.isNotEmpty(value[0])){
					String name = e.getKey();
					int[] lmpzidx =new int[1];
					if (name.endsWith("___kssj")){//开始日期字段
						if (fmzdInlmpz(name, listCx,lmpzidx)!=-1){
							cxfilter += " and  left("+name.substring(0,name.indexOf("___kssj"))+",10) >= '"+value[0]+"' ";
							listCx.get(lmpzidx[0]).put("val", value[0]);
						}
					}else if (name.endsWith("___jssj")){//结束日期字段
						if (fmzdInlmpz(name, listCx, lmpzidx)!=-1){
							cxfilter += " and  left("+ name.substring(0,name.indexOf("___jssj"))+",10) <= '"+value[0]+"' ";
							listCx.get(lmpzidx[0]).put("val", value[0]);
						}
					}else if (name.endsWith("___op") && !name.startsWith("___op")){//有操作符
						continue;
					}else if (fmzdInlmpz(name, listCx, lmpzidx)!=-1){//是普通字段
						Map<String,String> onezd = new HashMap<String,String>();
						onezd.put("name", name);
						onezd.put("value", value[0]);
						onezd.put("lx", (String)listCx.get(lmpzidx[0]).get("lx"));
						fmZds.add(onezd);
						listCx.get(lmpzidx[0]).put("val", value[0]);
						if(fmopmp.get(name)!=null) listCx.get(lmpzidx[0]).put("op", fmopmp.get(name).trim());
					}
				}
			}
			for(Map<String,String> e:fmZds){//fmZds此时可以直接从fmopmp取操作符了，如果没有默认like
				String op = " like ";
				String name = e.get("name");
				String value = e.get("value");
				String lx = e.get("lx");
				if (StringUtils.isNotEmpty(fmopmp.get(name))) op = fmopmp.get(name);
				else if ("sel".equalsIgnoreCase((String)e.get("lx"))) op = "=";
				if (op.contains("like")){
					value = " '%"+value+"%' ";
					cxfilter += " and ("+name+op+value+") ";
				}else if (!"sel".equalsIgnoreCase(lx) || !"___-1".equals(value)){
					value= " '"+value+"' "; 
					cxfilter += " and ("+name+op+value;
					if (op.contains(">") || op.contains("<"))cxfilter+="+0 ";
					cxfilter+=" ) ";
				}
			}
		}
		map.put("cxfilter", cxfilter);

		return map;
	}
	
	//先按照字符串中不能有空格来，href可以传递带空格的参数吗？
	private static String[] getCzqHref(String href, Map<String, Object> onerec){
		
/*		if (StringUtils.isNotEmpty(href) && onerec !=null){
			int whIdx = href.indexOf("?");
			if (whIdx!=-1){
				int eqIdx = whIdx+1;
				do{
					eqIdx = href.indexOf("=", eqIdx);
					if (){
						
					}
				}while(eqIdx!=-1);
			}
		}*/

		String retarr[]= new String[2];
		String[] split = href.split(":");
		for (int i = 0; i < split.length; i++) {
			if ("_blank".equalsIgnoreCase(split[i])){
				retarr[1] = "_blank";
			}else if (StringUtils.isNotEmpty(split[i])){
				href = split[i];
			}
		}
		retarr[0]=href;

		//../sqrh.dhtml
		List<Map<String, Object>> posLst = new ArrayList<Map<String, Object>>();
		int whIdx = href.indexOf("?");
		if (whIdx!=-1){
			int eqIdx = whIdx+1;
			do{
				eqIdx = href.indexOf("=&", eqIdx);
				if (eqIdx !=-1){
					int adlast = href.lastIndexOf("&", eqIdx-1);
					if (adlast==-1){adlast = href.lastIndexOf("?", eqIdx-1);}
					if (adlast!=-1){
						Map<String, Object> e = new HashMap<String, Object>();
						e.put("pos", eqIdx+1);//等于号下一位置
						e.put("zdm", href.substring(adlast+1, eqIdx));
						posLst.add(e);
					}
					eqIdx+=2;
				}
			}while(eqIdx!=-1);
			//再加一个结尾是=的情况
			if (href.endsWith("=")){
				Map<String, Object> e = new HashMap<String, Object>();
				e.put("pos", href.length());
				int adlast = href.lastIndexOf("&", href.length()-2);
				if (adlast==-1){adlast = href.lastIndexOf("?", href.length()-2);}
				e.put("zdm", href.substring(adlast+1, href.length()-1));
				posLst.add(e);
			}
		}

		if (CollectionUtils.isNotEmpty(posLst)) {
			retarr[0]="";
			String copy = new String(href);
			for (int i = 0; i < posLst.size(); i++) {
				Integer pos = (Integer)posLst.get(i).get("pos");
				String zdm = (String)posLst.get(i).get("zdm");
				int st = (i==0?0:pos);
				int ed = (i==posLst.size()-1?copy.length():(Integer)posLst.get(i+1).get("pos"));
				retarr[0] += copy.substring(st,pos)+onerec.get(zdm)+ copy.substring(pos,ed);
			}
		}
		
		return retarr;
	}
	
	private static String getCzqJs(Crud o, String js, Map<String, Object> onerec) {
		String ret="";
		int idx1 = js.indexOf("(");
		int idx2 = js.indexOf(")");
		if (idx1!=-1 && idx2!=-1){
			if (idx1+1==idx2){//没有参数的情况
				ret = js.substring(0,idx2+1);
			}else{
				String paras = js.substring(idx1+1,idx2);
				if (StringUtils.isNotEmpty(paras)){
					ret = js.substring(0,idx1+1);
					String[] split = paras.split(",");
					List<Map<String,Object>> listZiduan = getListZiduan(o);
					for (int i = 0; i < split.length; i++) {
						String string = split[i];
						if ("this".equals(string)){
							ret += string+",";
						}else if (onerec.get(string)!=null || zdInDbcol(string, listZiduan)){
							ret += "'"+onerec.get(string)+"',";
						}else{
							ret += "'"+string+"',";
						}
					}
					ret =ret.substring(0,ret.length()-1)+")";
				}
			}
		}
		
		return StringUtils.isEmpty(ret)?js:ret;
	}
	
	//解析表体的操作区(这块的规则稍微有点复杂，配的时候估计会容易错)
	private static void getTblCzs(Crud o, String[][] v){
		if (o==null || o.getR()==null || CollectionUtils.isEmpty(o.getR().getTbs())){//v可以为空，即没有自定义的操作
			return;
		}

		//这里根据配置加上查看、编辑、删除，和自定义的使用同样的规则，如果某条记录计算结束有重复名称，后面的覆盖前面的
		String[][] arrh = new String[3][];
		int count=0;
		if (o.getAev().isNeedv()) {
			arrh[count++] = new String[]{"text:查看","href:aev.dhtml?id=&t=2&u="+o.getU()};
		}
		if (o.getAev().isNeede()) {
			arrh[count++] = new String[]{"text:编辑","href:aev.dhtml?t=1&u="+o.getU()+"&id="};
		}
		if (o.getD().isNeed()) {
			arrh[count++] = new String[]{"text:删除","js:___fn_del(this,id)"};
		}
		int cntWx = arrh.length-count;
		for (int i = 0; i < cntWx; i++) {
			arrh= (String[][]) ArrayUtils.remove(arrh, arrh.length-1);
		}
		v = (String[][])ArrayUtils.addAll(arrh, v);
		if (v==null || v.length<=0) return;

		//遍历查询出来的记录，每条记录的操作可能都不一样
		for (Map<String, Object> onerec : o.getR().getTbs()) {//遍历list页面查出来的记录
			List<Map<String, Object>> lstczq = new ArrayList<Map<String, Object>>();//记录该条记录在操作区的所有信息，列表长度即为操作区按钮个数
			for (int i=0;i<v.length;i++) {//遍历所有操作
				if (v[i]==null) continue;
				Map<String, Object> elst= new HashMap<String, Object>();//存储的是该操作项的相关属性
				for (int j = 0; j <= 3; j++) {//字段位置可以不固定
					if (v[i].length>=j+1 && StringUtils.isNotEmpty(v[i][j])){
						String trim = v[i][j].trim();
						int idxMh = trim.indexOf(":");
						if (idxMh!=-1){
							String prefix = trim.substring(0,idxMh);
							String cont = trim.substring(idxMh+1,trim.length());
							if ("idx".equals(prefix)){//文字类型可以不加text:
								Integer idx = -1;
								try{idx  =Integer.valueOf(cont);}catch(Exception exc){idx = -1;}
								if (idx !=-1) elst.put("idx", idx);
							}else if (StringUtils.isNotEmpty(cont) && StringUtils.isNotEmpty(prefix)){
								elst.put(prefix.trim(), cont.trim());
							}
						}
					}
				}
				String cz_text = (String)elst.get("text");
				if (elst.size()>0 && StringUtils.isNotEmpty(cz_text)){
					elst.put("czx","");
					String cz_js = (String)elst.get("js");
					String cz_href = (String)elst.get("href");
					if (cz_text.contains("case:")){//有条件选择，要根据这条记录的实际情况填充内容
						String[] split = cz_text.split("#");
						for (int j = 0; j < split.length; j++) {
							String[] splitmh = split[j].split(":");//case:sh=未审核:val:同意#case:sh=未审核:val:不同意
							String strcase= null;
							String strText = null;
							for (int k = 0; k < splitmh.length; k++) {
								if ("case".equals(splitmh[k])){
									if (k+1<splitmh.length) strcase = splitmh[k+1];
								}else if ("val".equals(splitmh[k]) || "gray".equals(splitmh[k]) || "grey".equals(splitmh[k])){
									if (k+1<splitmh.length) strText = splitmh[k]+":"+splitmh[k+1];
								}
							}
							if (StringUtils.isNotEmpty(strcase) && StringUtils.isNotEmpty(strText) && recMeetCase(onerec, strcase)) {
								if (StringUtils.isNotEmpty(cz_href)){//写了href
									zzczxhref(onerec, elst, strText);
								}else if (StringUtils.isNotEmpty(cz_js)){//写了js，用onclick来响应
									pushUniuqeExtjs(zzczxjs(o, onerec, elst, strText), o);
								}
							}//splitmh
						}
					}else{//没有条件选择，也就是除非操作项名称有冲突，否则该操作要么走href，要么走js
						String astr="<a ";
						String[] hrwzarr = cz_text.split("val:");
						String hrwz=hrwzarr[hrwzarr.length-1];
						if (StringUtils.isNotEmpty(cz_href)){//写了href
							String[] czqHref = getCzqHref(cz_href, onerec);
							if (czqHref!=null && StringUtils.isNotEmpty(czqHref[0])){
								astr+=" href='"+czqHref[0]+"' ";
								if (StringUtils.isNotEmpty(czqHref[1])) {
									astr+=" target='_blank' ";
								}
								astr+=">";
								astr += hrwz+"</a>";
								elst.put("czx", elst.get("czx")+" "+astr);
								elst.put("cztext", hrwz);
							}
						}else if (StringUtils.isNotEmpty(cz_js)){//写了js，用onclick来响应
							String czqJs = getCzqJs(o, cz_js, onerec);
							if (StringUtils.isNotEmpty(czqJs)){
								astr+=" href='javascript:' onclick=\""+czqJs+"\">";
								astr += hrwz+"</a>";
								elst.put("czx", elst.get("czx")+" "+astr);
								elst.put("cztext", hrwz);
								czqAddExtjs(cz_js, o);
							}
						}
					}
					if (StringUtils.isNotEmpty((String)elst.get("czx"))) lstczq.add(elst);
				}
			}
			lstczq= uniqueOps(lstczq);//对lstczq查一下重复，后面覆盖前面的
			lstczq = sortOps(lstczq);//最后排序
			onerec.put("lstczq", lstczq);
		}//遍历记录
	}

	private static void pushUniuqeExtjs(String[] jsoarr, Crud o){
		if (jsoarr==null || jsoarr.length<=0){
			return;
		}

		for (int xx = 0;xx<jsoarr.length;xx++){
			String tpp = (String)jsoarr[xx];
			List<String> lst = null;
			if (StringUtils.isNotEmpty(tpp) && tpp.endsWith(".js")){
				lst = o.getR().getExtjs();
			}else if ( StringUtils.isNotEmpty(tpp) && tpp.endsWith(".jsp")){
				lst = o.getR().getExtjsp();
			}
			if (lst !=null){
				int yy=0;
				for (;yy<lst.size();yy++){
					if (((String)lst.get(yy)).equalsIgnoreCase(tpp)){
						break;
					}
				}
				if (yy>=lst.size())lst.add(tpp);
			}
		}
	}
	
	private static void czqAddExtjs(String js, Crud o){
		String[] split = js.split(":");
		if (split!=null && split.length>1){
			for (int i = 0; i < split.length; i++) {
				if (StringUtils.isNotEmpty(split[i]) && (split[i].endsWith(".js") || split[i].endsWith(".jsp"))){
					pushUniuqeExtjs(split[i].split(","), o);
					break;
				}
			}
		}
	}

	private static List<Map<String, Object>> uniqueOps(List<Map<String, Object>> lstczq){
		List<Map<String, Object>> ret = new ArrayList<Map<String, Object>>();
		if (CollectionUtils.isNotEmpty(lstczq)) {
			for (int i=0;i<lstczq.size();i++){
				for (int j=i+1;j<lstczq.size();j++){
					String c1 = (String)lstczq.get(i).get("cztext");
					String c2 = (String)lstczq.get(j).get("cztext");
					if (c1.equals(c2)){
						lstczq.get(i).put("delf", 1);
						break;
					}
				}
			}
			for (Map<String, Object> e:lstczq){
				if (e.get("delf")==null){
					ret.add(e);
				}
			}
		}

		return ret;
	}
	
	private static List<Map<String, Object>> sortOps(List<Map<String, Object>> lstczq){
		List<Map<String, Object>> ret = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> tail = new ArrayList<Map<String, Object>>();
		Map<Integer, Map<String, Object>> stmp = new HashMap<Integer, Map<String, Object>>();
		if (CollectionUtils.isNotEmpty(lstczq)) {
			for (Map<String, Object> e : lstczq) {
				Integer idx = (Integer)e.get("idx");
				if (idx!=null && idx>=0 && idx<lstczq.size()){
					stmp.put((Integer)e.get("idx"), e);
				}else{
					tail.add(e);
				}
			}
			for (int i=0;i<lstczq.size();i++){
				if (stmp.get(i)!=null) {
					ret.add(stmp.get(i));
				}else if (CollectionUtils.isNotEmpty(tail)){
					ret.add(tail.get(0));
					tail.remove(0);
				}
			}
		}

		return ret;
	}

	private static void zzczxhref(Map<String, Object> onerec, Map<String, Object> elst, String strText){
		if (onerec==null || elst==null || StringUtils.isEmpty(strText)){
			return;
		}

		String cz_href = (String)elst.get("href");
		String[] czqHref = getCzqHref(cz_href, onerec);
		if (czqHref!=null && StringUtils.isNotEmpty(czqHref[0])){
			String czx="";
			String[] split = strText.split(":");
			if (split.length>1){//val:删除
				czx+= "<a ";
				czx+=" href='"+czqHref[0]+"' ";
				if (StringUtils.isNotEmpty(czqHref[1])) {
					czx+=" target='_blank' ";
				}
				if ("gray".equalsIgnoreCase(split[0]) || "grey".equalsIgnoreCase(split[0])) czx+=" class='czxgray' ";
				czx += " >"+split[1]+"</a>";
			}
			if (StringUtils.isNotEmpty(czx)) {
				elst.put("czx", elst.get("czx")+" "+czx);
				elst.put("cztext", split[1]);
			}
		}
	}

	private static String[] zzczxjs(Crud o, Map<String, Object> onerec, Map<String, Object> elst, String strText){
		if (o==null || onerec==null || elst==null || StringUtils.isEmpty(strText)){
			return null;
		}

		String[] cz_js = ((String)elst.get("js")).split(":");//fn_delrhsq(this,id,sh):listczq.js
		if (cz_js!=null){
			String czqJs = getCzqJs(o, cz_js[0], onerec);
			if (StringUtils.isNotEmpty(czqJs)){
				String czx="";
				String[] split = strText.split(":");//eg. val:删除
				if (split.length>1){//val:删除
					czx+="<a ";
					if ("gray".equalsIgnoreCase(split[0]) || "grey".equalsIgnoreCase(split[0])) czx+=" class='czxgray'";
					czx+=" href='javascript:' onclick=\""+czqJs+"\" >"+split[1]+"</a>";
				}
				if (StringUtils.isNotEmpty(czx)) {
					elst.put("czx", elst.get("czx")+" "+czx);
					elst.put("cztext", split[1]);
					if (cz_js.length>1) return cz_js[1].split(",");
				}
			}
		}
		
		return null;
	}

	private static List<Map<String, Object>> partiCaseStr(String strcase){
		return null;
	}
	
	
	//判断某条记录是否符合case，符合的话就要增加该操作项
	private static boolean recMeetCase(Map<String, Object> onerec, String strcase){
		if (onerec==null || StringUtils.isEmpty(strcase)){
			return false;
		}

		//先把case字符partiCaseStr串拆解成N个判断块，单个块就不包含外围的大括号了
		//List<Map<String, Object>> partiCaseStr = partiCaseStr(strcase);
		
		String[] opparr = {">=", "<=","==","!=","=",">","<"};
		for (int i = 0; i < opparr.length; i++) {
			int iop = strcase.indexOf(opparr[i]);
			if (iop != -1){
				String zdm = strcase.substring(0, iop);
				String val = strcase.substring(iop+opparr[i].length(), strcase.length());
				if (StringUtils.isNotEmpty(zdm) && StringUtils.isNotEmpty(val)) {
					Object zdobj = onerec.get(zdm);
					if (zdobj ==null) return false;
					double dbvzd = 0;
					if ( zdobj instanceof Integer){//字段值是数值类型
						dbvzd = (Integer)zdobj;
					}else if (zdobj instanceof Long){
						dbvzd = (Long)zdobj;
					}else if (zdobj instanceof Double){
						dbvzd = (Double)zdobj;
					}else if (zdobj instanceof Float){
						dbvzd = (Float)zdobj;
					}else if (zdobj instanceof String){
						if (Pattern.compile("^(\\d*\\.)?\\d+$").matcher(zdobj.toString()).matches()){
							dbvzd = Double.valueOf(zdobj.toString());
						}else{
							return (("==".equals(opparr[i]) || "=".equals(opparr[i])) && val.equalsIgnoreCase(String.valueOf(zdobj.toString()))
								|| ("!=".equals(opparr[i]) && !val.equalsIgnoreCase(String.valueOf(zdobj.toString()))));
						}
					}else{
						return false;
					}
					
					if (Pattern.compile("^(\\d*\\.)?\\d+$").matcher(val).matches()){
						double n1 = dbvzd;
						double n2 = Double.valueOf(val).doubleValue();
						if (">=".equals(opparr[i])) return n1 >= n2;
						else if ("<=".equals(opparr[i])) return  n1 <= n2;
						else if (">".equals(opparr[i])) return   n1 > n2;
						else if ("<".equals(opparr[i])) return  n1 < n2;
						else if ("==".equals(opparr[i]) || "=".equals(opparr[i])) return  n1 == n2;
						else if ("!=".equals(opparr[i])) return  n1 != n2;
					} else {
						return (("==".equals(opparr[i]) || "=".equals(opparr[i])) && val.equalsIgnoreCase(String.valueOf(dbvzd)));
					}
				}
				break;
			}
			
		}
		
		return false;
	}
	
	//解析按钮区的内容
	private static List<Map<String, Object>> parseAnq(Crud o, String[][] v){
		if (o==null){
			return null;
		}
		
		//这里根据配置加上新增、批量删，和自定义的使用同样的规则，如果某条记录计算结束有重复名称，后面的覆盖前面的
		String[][] arrh = new String[3][];
		int count=0;
		if (o.getAev().isNeeda()) {
			arrh[count++] = new String[]{"新增",
					"js:location.href='aev.dhtml?t=0&u="+o.getU()+"'","style:background: url(../images/btn_add.gif) 0px -1px no-repeat;"};
		}
		if (o.getD().isBatdel()) {
			arrh[count++] = new String[]{"批量删", "js:___fn_batdel()", "style:background: url(../images/btn_recycle.gif) 0px -1px no-repeat;"};
		}
		int cntWx = arrh.length-count;
		for (int i = 0; i < cntWx; i++) {
			arrh = (String[][]) ArrayUtils.remove(arrh, arrh.length-1);
		}
		v = (String[][])ArrayUtils.addAll(arrh, v);
		if (v==null || v.length<=0) return null;
		
		List<Map<String, Object>> lst = new ArrayList<Map<String, Object>>();
		for (int i=0; i< v.length;i++){
			Map<String, Object> elst= new HashMap<String, Object>();//存储的是该操作项的相关属性
			if (v[i]==null || StringUtils.isEmpty(v[i][0])) continue;
			elst.put("cztext", v[i][0]);//行内第一个默认是操作名称
			for (int j = 1; j <= 3; j++) {//后3个字段位置可以不固定，js、style、idx
				if (v[i].length>=j+1 && StringUtils.isNotEmpty(v[i][j])){
					String trim = v[i][j].trim();
					if (Pattern.compile("^\\s*js\\s*:").matcher(trim).find()){
						String[] split = trim.split(":");
						for (int k=0;k<split.length;k++){
							String astp = split[k].trim();
							if (astp.endsWith(".js") || astp.endsWith(".jsp") ){
								pushUniuqeExtjs(astp.split("\\s*,"), o);
							}else{
								elst.put("fn", astp);
							}
						}
					}else if (Pattern.compile("^\\s*style\\s*:").matcher(trim).find()){
						elst.put("style", trim.substring(trim.indexOf(":")+1, trim.length()));
					}else if (Pattern.compile("^\\s*idx\\s*:").matcher(trim).find()){
						String[] split = trim.split(":");
						if (split.length>=2){
							Integer vidx = -1;
							try{vidx  =Integer.valueOf(split[1].trim());}catch(Exception exc){vidx = -1;}
							if (vidx !=-1) elst.put("idx", vidx);
						}
					}else if (Pattern.compile("^\\s*id\\s*:").matcher(trim).find()){//给按钮加一个id
						String[] split = trim.split(":");
						if (split.length>=2){
							elst.put("id", split[1].trim());
						}
					}
				}
			}
			if (elst.size()>=2){
				if (elst.get("fn") != null){
					String sty = (String)elst.get("style");
					if (StringUtils.isEmpty(sty) || sty.indexOf("background")==-1){
						sty = StringUtils.isEmpty(sty) ? "":sty+";";
						elst.put("style", sty+"background:url(../images/tjpcms/btn_bg.gif) 0px -1px no-repeat;padding-left: 0; text-align: center;");
					}
				}
				lst.add(elst);
			}
		}
		
		return sortOps(uniqueOps(lst));//先做唯一，再排序
	}
	
	public static void setList(Crud o, String[][] hds){//只有表，没有查询区、操作区和按钮区
		setList(o,hds,null, null, null);
	}
	public static void setList(Crud o, String[][] hds, String[][] cxs){//只有表和查询区，没有操作区和按钮区
		setList(o,hds,cxs, null, null);
	}
	public static void setList(Crud o, String[][] hds, String[][] cxs, String[][] czs){//有表、查询区和操作区，没有按钮区
		setList(o,hds,cxs, czs, null);
	}

	//list页面表头和表体的内容
	@SuppressWarnings("unchecked")
	public static void setList(Crud o, String[][] hds, String[][] cxs, String[][] czs, String[][] ans) {
		//调用了该函数就设置需要列表页为true
		o.getR().setNeed(true);

		if (o==null || hds==null || hds.length<=0||o.getRq()==null ||o.getMp()==null || StringUtils.isEmpty(o.getTb())){
			return;
		}

		Retrieve r = o.getR();
		String tb = o.getTb();
		HttpServletRequest rq = o.getRq();
		String requestURI = rq.getRequestURI();
		String queryString = rq.getQueryString();

		String wzurl = requestURI.substring(requestURI.lastIndexOf('/')+1,requestURI.length());
		r.setListloc(wzurl+(StringUtils.isNotEmpty(queryString)?("?"+queryString):""));
		Map<String, Object> tblCxs = getTblCxs(o, cxs);//查询区
		if (tblCxs!=null) r.setCxs((List<Map<String,Object>>)tblCxs.get("cxq"));
		Map<String, Object> tblHead = getTblHead(hds, o, czs);//表头区
		if (tblHead!=null) r.setThs((List<Map<String,Object>>)tblHead.get("ths"));
		r.setAns(parseAnq(o, ans));//解析按钮区

		String pg = rq.getParameter("___pg");
		Integer npg = -1;
		r.setRecTotal(0);
		r.setPgTotal(0);
		if (StringUtils.isEmpty(pg)){//初始访问时不带pg参数
			pg="1";
		}
		try{
			npg = Integer.valueOf(pg);
		}catch(Exception e){
			npg = -1;
			pg = "-1";
		}
		if (npg!=-1){
			String ses_ht_tip = (String)rq.getSession(false).getAttribute("ses_ht_tip");
			if (StringUtils.isNotEmpty(ses_ht_tip)) {
				rq.setAttribute("ses_ht_tip", ses_ht_tip);
				rq.getSession(false).removeAttribute("ses_ht_tip");
			}

			String s = " from(select ";
			if (tblHead!=null && StringUtils.isNotEmpty((String)tblHead.get("extSelect"))) s+=(String)tblHead.get("extSelect")+",";
			if (CollectionUtils.isNotEmpty(o.getR().getExjoinzdm())) for (String eexjstr: o.getR().getExjoinzdm()) s += eexjstr+",";
			s += "t.*  from "+tb+" t ";
			if (StringUtils.isNotEmpty(o.getR().getExjoinstr())) s += o.getR().getExjoinstr();
			s += ")tt where 1=1 ";
			if (StringUtils.isNotEmpty(r.getExwhere())) s += " "+r.getExwhere()+" ";
			if (tblCxs!=null) s += tblCxs.get("cxfilter");
			Integer recTotal = o.getMp().cnt("select count(*) "+s);
			//System.out.println("~~~~~~~~~~~~~~~~~select count(*) "+s);
			Integer pp =o.getR().getPerPage();
			if (recTotal>0 && pp>0 && pp<=500){
				Integer pgTotal = (int)Math.ceil(recTotal/(double)pp);
				if (!(npg>=1 && npg<=pgTotal)) {npg=pgTotal;pg = npg.toString();}
				s += " order by ";
				if (Hanshu.zdInDbcol("px", getListZiduan(o))) s+=" tt.px desc, ";
				if (Hanshu.zdInDbcol("gx", getListZiduan(o))) s+=" tt.gx desc, ";
				s+=" tt.rq desc";
				s += " limit "+(npg-1)*pp+","+pp;
				r.setTbs(o.getMp().r("select * "+s));//表体区
				r.setRecTotal(recTotal);
				r.setPgTotal(pgTotal);
				r.setPg(pg);
				if (tblHead!=null) r.setZds((List<Map<String,Object>>)tblHead.get("zds"));
				getTblCzs(o, czs);//对每一条记录专门计算出其应该有的菜单
			}
		}
	}

	//都通过这个函数来取表字段，减少数据库操作，但那个ecache是怎么用来着的
	public static List<Map<String,Object>> getListZiduan(Crud o){
		List<Map<String,Object>> listZiduan = null;
		if (CollectionUtils.isEmpty(o.getLsttbZd())){//没查过就去库里查一下再存起来
			listZiduan = o.getMp().getTblZiduan(o.getTb(), CL.DB);
			o.setLsttbZd(new ArrayList<Map<String,Object>>(listZiduan));//复制一份，因为下面的代码会删listZiduan
		}else{
			listZiduan = new ArrayList<Map<String,Object>>(o.getLsttbZd());
		}
		
		return listZiduan;
	}

	private static boolean  isAevAdType(String v){
		boolean valid = false;
		for(AevZdType e:AevZdType.values()){
			if (e.toString().equalsIgnoreCase(v)){
				return true;
			}
		}

		return valid;
	}
	
	//判断是不是校验字符串，如果是对其做补充
	private static boolean  isValidateStr(String title, String v, Map<String,Object> mp){
		if (StringUtils.isEmpty(title) || StringUtils.isEmpty(v) || v.startsWith("\\")){
			return false;
		}
		String arr[] = v.trim().split("\\s+");
		if (arr==null || arr.length<=0){
			return false;
		}

		boolean isVdt = false;
		String vdtstr = "";
		for (int i = 0; i < arr.length; i++) {
			int mhidx  = arr[i].indexOf(":");
			if (arr[i].startsWith("required")){//如果是需要内容为required，写成\required
				isVdt = true;
				if (mhidx==-1 ){//没写冒号
					vdtstr +=" required:::"+title+"的值不能为空";
					mp.put("required", true);
				}else if (mhidx+1<arr[i].length()){
					vdtstr +=" required:::"+arr[i].substring(mhidx+1, arr[i].length());
					mp.put("required", true);
				}
			}else if (arr[i].startsWith("unique")){//该字段唯一，可以带筛选参数
				isVdt = true;
				if (mhidx==-1 ){//没写冒号
					vdtstr += " "+ arr[i]+":::"+title+"的值已经存在，请检查";
					mp.put("unique", true);
				}else if (mhidx+1<arr[i].length()){
					vdtstr += " "+arr[i].substring(0, mhidx)+":::"+arr[i].substring(mhidx+1, arr[i].length());
					mp.put("unique", true);
				}
			}else if (mhidx!=-1 && mhidx-1>=0 && mhidx+1<arr[i].length()){
				isVdt = true;
				vdtstr += " "+arr[i].substring(0,mhidx)+":::"+arr[i].substring(mhidx+1, arr[i].length());
			}
		}
		if (isVdt)mp.put("validate", vdtstr.trim());

		return isVdt;
	}
	
	//判断是不是补充js字符串
	private static boolean  isExtjsStr(Crud o, String v, Map<String,Object> e){
		if (o ==null || StringUtils.isEmpty(v) || v.startsWith("\\") || !v.contains("=")){
			return false;
		}

		String arr[] = v.trim().split("=");
		if (arr==null || arr.length<=2){
			return false;
		}

		e.put("event", " "+arr[0]+"='"+arr[1]+"' ");
		o.getAev().setExtjs(arr[2]);

		return true;
	}

	private static void putMaxLen(Map<String,Object> e, List<Map<String,Object>> listZiduan ){
		String zdm = ((String)e.get("zdm")).toLowerCase();
		String zdtp = ((String)e.get("type")).toUpperCase();
		if (AevZdType.INPUT.toString().equals(zdtp) 
				|| AevZdType.RICH.toString().equals(zdtp) 
				|| AevZdType.TEXTAREA.toString().equals(zdtp)
				|| AevZdType.PASSWORD.toString().equals(zdtp)
				|| AevZdType.ZDB.toString().equals(zdtp)){
			for (int j = 0;j<listZiduan.size();j++){
				String datyle = ((String)listZiduan.get(j).get("data_type")).toString().toLowerCase();
				String col_name = ((String)listZiduan.get(j).get("COLUMN_NAME")).toLowerCase();
				if (col_name.equals(zdm)){
					if ("varchar".equals(datyle)){
						e.put("maxlen", listZiduan.get(j).get("CHARACTER_MAXIMUM_LENGTH"));
					}else if ("int".equals(datyle)){
						e.put("maxlen", 9);
					}
					break;
				}
			}
		}
	}

	//解析aev的字符串数组，title和zdm
	public static void setAev(Crud o, String[][] v){
		if (o==null || v==null || v.length<=0||o.getRq()==null ||o.getMp()==null || StringUtils.isEmpty(o.getTb())){
			return;
		}

		//把数据库中定义的字段长度取出来
		List<Map<String,Object>> listZiduan = getListZiduan(o);
		if (CollectionUtils.isEmpty(listZiduan)){
			return;
		}

		List<Map<String,Object>> zds = new ArrayList<Map<String,Object>>();//存储解析出来的字段信息
		boolean ismultiLm = o.getCid()!=null && o.getCid().length>1;
		boolean islxpyFlmzi = "fulanmu_zi".equals(o.getRq().getParameter("___lxpy"));
		if (ismultiLm && !islxpyFlmzi){//多个栏目的内容且点击的不是fulanmu_zi
			Map<String,Object> e = new HashMap<String,Object>();
			e.put("title", "栏目");
			e.put("zdm", "cid");
			e.put("type", AevZdType.SELECT.toString());
			e.put("required", true);
			List<Map<String, Object>> cxs = o.getR().getCxs();
			e.put("selops", cxs.get(cxs.size()-1).get("selops"));
			zds.add(e);
		}

		boolean aevarrHasHdnCid = false;//记录数组里是否有cid这个hidden类型
		String hdnpara = "";
		for (int i=0;i<v.length;i++) {
			if ("cid".equals(v[i][0])) aevarrHasHdnCid=true;
			if (AevZdType.HIDDEN.toString().equals(v[i][0]) || AevZdType.HIDDEN.toString().equals(v[i][1])){//是hidden类型
				if (v[i].length>=3 && StringUtils.isNotEmpty(v[i][2])) {
					if (ismultiLm && "cid".equals(v[i][0])){
						//这种情况是不需要加这个hidden域的
					}else{
						hdnpara+="<input type='hidden' name='"+(AevZdType.HIDDEN.toString().equals(v[i][0])?v[i][1]:v[i][0])+"' value='"+v[i][2]+"'>"+"</input>";
					}
				}
			}else if (v[i].length>=3 && (AevZdType.TEXT.toString().equals(v[i][1]) || AevZdType.TEXT.toString().equals(v[i][2]))){//是纯文本，可以在位置1,2
				String tytext = AevZdType.TEXT.toString();
				Map<String,Object> e = new HashMap<String,Object>();
				e.put("type", tytext);
				e.put("title", v[i][0]);//中文title必须是第一个
				String col3 = tytext.equals(v[i][1])?v[i][2]:v[i][1];
				if (zdInDbcol(col3, listZiduan)){
					e.put("zdm", col3);
				}else{
					e.put("val", col3);
				}
				zds.add(e);
			}else if ("px".equals(v[i][1])){//px类型默认必填正整数
				if (zdInDbcol("px", listZiduan)){
					Map<String,Object> e = new HashMap<String,Object>();
					e.put("title", v[i][0]);
					e.put("zdm", v[i][1].toLowerCase());
					e.put("val", vpx(o.getMp(), o.getTb()));
					e.put("type", AevZdType.INPUT.toString());
					if (StringUtils.isEmpty((String)e.get("validate"))){//排序默认是必填、正整数
						e.put("required", true);
						e.put("validate", "required:::排序的值不能为空 plusinteger:::排序请输入正整数");
					}
					putMaxLen(e, listZiduan);
					zds.add(e);
				}
			}else{
				Map<String,Object> e = new HashMap<String,Object>();
				e.put("title", v[i][0]);
				e.put("zdm", v[i][1].toLowerCase());
				e.put("required", false);
				e.put("validate", "");
				for (int j = 2; j <= 5; j++) {//后4个字段可以随意排
					if (v[i].length>=j+1 && StringUtils.isNotEmpty(v[i][j])){
						if (isAevAdType(v[i][j])){//是类型
							e.put("type", v[i][j].toUpperCase());
						}else if (Pattern.compile("^\\s*zdb\\s*:").matcher(v[i][j]).find()){//zdb :，这个判断要排在前面
							String py = v[i][j].split(":")[1].trim();
							Map<String, Object> obj = o.getMp().obj("select GROUP_CONCAT(s.zdxmc) val from tjpcms_zdb t left join tjpcms_zdx s on t.id = s.pid where (t.py = '"+py
									+"') order by s.px asc ,s.gx desc");
							if (obj !=null){
								e.put("val",obj.get("val"));
							}
						}else if (isValidateStr(v[i][0], v[i][j], e)){
							
						}else if (isExtjsStr(o, v[i][j], e)){
							
						}else{
							if (v[i][j].startsWith("\\")){//初始化参数
								v[i][j]  =v[i][j].substring(1,v[i][j].length());
							}
							e.put("val",v[i][j]);
						}
					}
				}
				if (e.get("type")==null) e.put("type", AevZdType.INPUT.toString());
				if (AevZdType.SELECT.toString().equalsIgnoreCase((String)e.get("type"))){//是字典表类型
					e.put("selops", fnsel("zdb", o.getMp(), (String)e.get("val"), ""));
				}else if (AevZdType.ZDB.toString().equalsIgnoreCase((String)e.get("type"))){
					e.put("zdbops",o.getMp().r("select id val,mc txt from tjpcms_zdb"));
					e.put("zdbHaveZdy", "zdy".equals((String)e.get("val")));
				}
				putMaxLen(e,listZiduan);
				zds.add(e);
			}
		}

		if (o.getCid()!=null && o.getCid().length==1 && !islxpyFlmzi
			&& StringUtils.isNotEmpty(o.getCid()[0]) && !aevarrHasHdnCid){//只有一个子栏目，就不需要选栏目了，直接设置成隐藏域cid
			hdnpara+="<input type='hidden' name='cid' value='"+o.getCid()[0]+"'>"+"</input>";
		}
		o.getAev().setHdnpara(hdnpara);
		o.getAev().setZds(zds);

		String ses_ht_tip = (String)o.getRq().getSession(false).getAttribute("ses_ht_tip");
		if (StringUtils.isNotEmpty(ses_ht_tip)){
			o.getRq().setAttribute("ses_ht_tip", ses_ht_tip);
			o.getRq().getSession(false).removeAttribute("ses_ht_tip");
		}else if (!o.getR().isNeed() && !o.getAev().isNoBtns()){//只有编辑页
			o.getRq().setAttribute("ses_ht_tip", "点击【编辑】按钮后，方可编辑内容");
		}
	}

	//从查出的数据库表字段信息里得到主键字段
	private static List<String> getZjFromDb(List<Map<String,Object>> listZiduan){
		List<String> retLst = new ArrayList<String>();
		for (Map<String, Object> map : listZiduan) {
			if ("PRI".equalsIgnoreCase((String)map.get("COLUMN_KEY"))){
				retLst.add((String)map.get("COLUMN_NAME"));
			}
		}

		if (CollectionUtils.isEmpty(retLst)){
			logger.error("getZjFromDb---表没设置主键的话aev编辑和查看的时候无法正常工作，因为没法查是哪条记录");
		}

		return retLst;
	}

	//组装bread
	public static String zzBread(String txt,String href, String aevH){
		String ret="";
		if (StringUtils.isNotEmpty(txt) || StringUtils.isNotEmpty(href)){
			ret += "<div aevH='"+aevH+"'><a href='"+href+"'  class='icon-fanhui fanhui'> "+txt+"</a></div>";
		}
		
		return ret;
	}
	
	public static String arr2instr(String[] arr){
		String ret="";
		
		if (arr!=null && arr.length>0){
			ret = " ( ";
			for (int i = 0; i < arr.length; i++) {
				ret += "  '"+arr[i]+"' ,";
			}
			ret = ret.substring(0,ret.length()-1)+" ) ";
		}
		
		return ret;
	}
	
	public static void getStrCidIn(String[] ret,String id, List<Map<String, Object>> alllm){
		for (int i=0;i<alllm.size();i++ ) {
			Object pid = alllm.get(i).get("pId");
			if (pid!=null && id.equals(pid.toString())){
				String innerlmid = alllm.get(i).get("id").toString();
				ret[0] += innerlmid+",";
				getStrCidIn(ret, innerlmid, alllm);
			}
		}
	}
	
}
