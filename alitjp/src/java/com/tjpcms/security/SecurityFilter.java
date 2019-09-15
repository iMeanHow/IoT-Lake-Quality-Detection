
package com.tjpcms.security;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.tjpcms.cfg.XT;
import com.tjpcms.common.CL;
import com.tjpcms.common.Edllx;
import com.tjpcms.common.Hanshu;
import com.tjpcms.common.Qt;
import com.tjpcms.common.Crud.Crud;
import com.tjpcms.spring.mapper.EntMapper;
import com.tjpcms.spring.model.Ssousr;
import com.tjpcms.wrapper.JsidWrapper;

public class SecurityFilter implements Filter {
	private static final Log logger = LogFactory.getLog(SecurityFilter.class);
	private static String fenyeptn = "___[0-9]*[1-9][0-9]*";
	
	@Override
	public void destroy() {

	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		
	}

	private String getJthStr(HttpServletRequest httpRequest , String py){
		if (StringUtils.isEmpty(py) || httpRequest==null) {
			return null;
		}

		//这边检查静态化（filter中不好注入entMapper，要使用WebApplicationContext的方式）
		WebApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(httpRequest.getSession().getServletContext());
		if (ac != null){
			EntMapper mp = (EntMapper) ac.getBean("entMapper");
			Map<String, Object> cfg = mp.obj("select val from tjpcms_cfg where py='"+py.toUpperCase()+"' ");
			if (cfg !=null){
				return (String)cfg.get("val");
			}
		}

		return null;
	}

	//url-pattern为/*即匹配的是所有的url，/是restful风格的。*.html就只拦截html结尾的
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,FilterChain filterChain) throws IOException, ServletException {
		if (!(request instanceof HttpServletRequest)) {  
			filterChain.doFilter(request, response);  
			return;  
		}  
		// wrap response to remove URL encoding  
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpServletResponseWrapper jswrapper = new JsidWrapper(httpResponse);
		
		String contextPath = httpRequest.getContextPath();
		String requestAction = httpRequest.getRequestURI().substring(	contextPath.length());
		//String basePath = httpRequest.getScheme()+"://"+httpRequest.getServerName()+":"+httpRequest.getServerPort()+httpRequest.getContextPath() + "/";

		if (requestAction.equals("/error.html")){
			filterChain.doFilter(request, jswrapper);
			return;
		}
		
		
/*		if (!("/"+CL.ROOT).equals(contextPath)){
			String queryString = httpRequest.getQueryString();
			httpResponse.sendRedirect("/"+CL.ROOT+requestAction+(StringUtils.isNotEmpty(queryString)?"?"+queryString:""));
			return;
		}*/
		
		// clear session if session id in URL  
		if (httpRequest.isRequestedSessionIdFromURL()) {  
			HttpSession session = httpRequest.getSession();  
           	if (session != null) session.invalidate();  
		}  
 
		boolean succ = false;
		if (requestAction.endsWith(".dhtml") || requestAction.endsWith("/")){//拦截的是动态页面
			if (requestAction.startsWith("/"+XT.glylj+"/")) {//链接带nedadm的是后台，要检查管理员登录情况
				succ = true;
				String ses = (String) httpRequest.getSession().getAttribute(CL.ses_admin);
				if (StringUtils.isEmpty(ses)) {
					httpRequest.getSession().setAttribute(CL.ses_admin,"admin");
					httpResponse.sendRedirect(contextPath+"/"+XT.dlhtlj+".dhtml");
					return;
				}
			}else if (requestAction.startsWith("/"+XT.grzxlj+"/")){//是前台注册用户的链接，也是需要登录的
				succ = true;
				Ssousr so = (Ssousr) httpRequest.getSession().getAttribute(CL.ses_ssousr);
				if (so==null) {
					String from = request.getParameter("f");
					String header = httpRequest.getHeader("Referer");
					if ("test".equalsIgnoreCase(from) && StringUtils.isNotEmpty(header) && (header.endsWith("yanshi.dhtml") || header.endsWith("yanshi.html"))){
						so = new Ssousr();
						so.setId(Edllx.GR_.toString()+"test");
						so.setNc("测试用户");
						so.setTx(contextPath+"/images/tjpcms/logo4.png");
						Qt.setUsr(httpRequest, so);
					}else{
						httpResponse.sendRedirect(contextPath+"/");
						return;
					}
				}
			}else{//非管理员的链接自行检查登陆情况
				succ = true;
				if (requestAction.equals("/") || requestAction.equals("/index.dhtml")){//访问的是动态首页
					succ = true;
					if (StringUtils.isEmpty(request.getParameter("___opjth"))){//是静态化功能访问首页动态链接
						String jthStr = getJthStr(httpRequest, "syjth");
						if ("静态化".equals(jthStr)) {//设置了首页静态化，但是访问了动态的首页链接
							httpResponse.sendRedirect("static/index.html");
							return;
						}else if (!"动态化".equals(jthStr)){
							succ = false;
						}
					}
				}else{
					WebApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(httpRequest.getSession().getServletContext());
					if (ac == null){
						succ = false;
					}else{
						EntMapper mp = (EntMapper)ac.getBean("entMapper");
						Map<String, Object> lmobj = mp.obj("select url_d,donly2 from tjpcms_lanmu where url_d is not null and url_d !='' and concat('/',url_d,'.dhtml')='"+requestAction+"'");
						if (lmobj!=null){//说明是栏目的链接，继续检查是否需要跳转到对应的静态链
							succ = true;
							String jthStr = getJthStr(httpRequest, "lmjth");
							if ("静态化".equals(jthStr)) {//设置了栏目静态化，但是访问了动态的栏目链接，且该栏目没有设置“只动态显示”
								if ("否".equals(lmobj.get("donly2"))){
									httpResponse.sendRedirect("static/lanmu/"+lmobj.get("url_d")+".html");
									return;
								}
							}else if (!"动态化".equals(jthStr)){
								succ = false;
							}
						}else{
							succ = true;
							Map<String, Object> nrobj = mp.obj("select distinct url3,donly3,id from tjpcms_lanmu where url3 is not null and url3 !='' and concat('/',url3,'.dhtml')='"+requestAction+"'");
							if (nrobj!=null){//说明是栏目内容的动态链接
								String lmnrjth = getJthStr(httpRequest, "lmnrjth");
								if ("静态化".equals(lmnrjth)) {//设置了栏目内容静态化，但是访问了动态的栏目内容链接，且该栏目内容没有设置“只动态显示”
									if ("否".equals(nrobj.get("donly3"))){
										httpResponse.sendRedirect("static/neirong/"+nrobj.get("url3")+"/"+request.getParameter("id")+".html");
										return;
									}
								}else if (!"动态化".equals(lmnrjth)){
									succ = false;
								}
							}
						}
					}
				}
			}
		}else if (requestAction.endsWith(".html")){//拦截的是静态页面
			if (requestAction.equals("/static/index.html")){//访问静态首页
				succ = true;
				String jthStr = getJthStr(httpRequest, "syjth");
				if ("动态化".equals(jthStr)) {//设置了首页动态化，但是访问了静态的首页链接
					httpResponse.sendRedirect("../");
					return;
				}else if (!"静态化".equals(jthStr)){
					succ = false;
				}
			}else{//不是访问静态首页
				WebApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(httpRequest.getSession().getServletContext());
				if (ac == null){
					succ = false;
				}else{
					EntMapper mp = (EntMapper)ac.getBean("entMapper");
					String actionOri = requestAction;
					requestAction = requestAction.replaceAll(fenyeptn, "");
					Map<String, Object> lmobj = mp.obj("select url_s,url_d,donly2 from tjpcms_lanmu where url_s is not null and url_s !='' and url_s='/"+CL.ROOT+requestAction+"'");
					if (lmobj!=null){//说明是栏目的链接，继续检查是否需要跳转到对应的动态链
						succ = true;
						String lmjth = getJthStr(httpRequest, "lmjth");
						String parapg = request.getParameter("pg");
						boolean vldPg = true;
						if (StringUtils.isNotEmpty(parapg)) try{Integer.valueOf(parapg);}catch(Exception e){vldPg = false;}
						if (!"动态化".equals(lmjth) && !"静态化".equals(lmjth) || !vldPg){
							succ = false;
						}else if (StringUtils.isNotEmpty(parapg) && "否".equals(lmobj.get("donly2")) && "静态化".equals(lmjth)) {
							String dynurl = requestAction.substring(requestAction.lastIndexOf("/")+1,requestAction.lastIndexOf(".html"));
							if (nedGxFenye(mp, parapg, dynurl, request)){//需要重新生成该分页
								final ByteArrayOutputStream os = new ByteArrayOutputStream();  
								final ServletOutputStream stream = new ServletOutputStream() {  
							        public void write(byte[] data, int offset, int length) {    os.write(data, offset, length);  }  
							        public void write(int b) throws IOException {    os.write(b);   }  
							    };
							    final PrintWriter pw = new PrintWriter(new OutputStreamWriter(os, "UTF-8"));  
							    HttpServletResponse rep = new HttpServletResponseWrapper(httpResponse) {  
							        public ServletOutputStream getOutputStream() {    return stream;   }
							        public PrintWriter getWriter() {   return pw;   }
							    };
							    
								File mulu = new File(request.getServletContext().getRealPath("")+"\\static\\lanmu\\");
								if (!mulu.exists()){
									mulu.mkdirs();
								}
								
								RequestDispatcher rd = request.getServletContext().getRequestDispatcher("/"+dynurl+".dhtml?___opjth=1&___url_d="+dynurl);
								rd.include(request, rep);
								pw.flush();
								FileOutputStream fos = new FileOutputStream(request.getServletContext().getRealPath("")+"\\static\\lanmu\\"+dynurl+"___"+parapg+".html");
								os.writeTo(fos);
							}
							
							//判断需要不需要跳转
							if (NedRedirect(parapg, actionOri)){//需要跳转
								httpResponse.sendRedirect(contextPath+"/static/lanmu/"+dynurl+("1".equals(parapg)?"":"___"+parapg)+".html?pg="+parapg);
								return;
							}
						}else if ("是".equals(lmobj.get("donly2")) || "动态化".equals(lmjth)){//什么情况下要跳到该静态栏目对应的动态链接：1、该栏目只动态访问，2、栏目非只动态访问但是设置了栏目动态化
							httpResponse.sendRedirect(contextPath+"/"+lmobj.get("url_d")+".dhtml");
							return;
						}
					}else{//判断是不是栏目内容的链接
						succ=true;
						int idxlast = requestAction.lastIndexOf("/");
						int idxHtm= requestAction.lastIndexOf(".html");
						if (idxlast==-1 || idxHtm==-1 || idxlast>=idxHtm-1 || StringUtils.isEmpty(requestAction.substring(idxlast+1, idxHtm))){
							succ = false;
						}else{
							String recid = requestAction.substring(idxlast+1, idxHtm);
							Map<String, Object> nrobj = mp.obj("select distinct url3,donly3,id from tjpcms_lanmu where url3 is not null and url3 !='' and concat('/static/neirong/',url3,"
																				+"'/"+recid+".html')='"+requestAction+"'");
							if (nrobj!=null){//说明是栏目内容的静态链接
								String lmnrjth = getJthStr(httpRequest, "lmnrjth");
								if (!"动态化".equals(lmnrjth) && !"静态化".equals(lmnrjth)){
									succ = false;
								}else if ("是".equals(nrobj.get("donly3")) || "动态化".equals(lmnrjth)){//什么情况下要跳到该静态链接对应的动态链接：1、该栏目只动态访问，2、非动态访问但是设置了动态化
									httpResponse.sendRedirect(contextPath+"/"+nrobj.get("url3")+".dhtml?id="+recid);
									return;
								}
							}
						}
					}
				}
			}
		}

		if(succ) {
			try{
				filterChain.doFilter(request, jswrapper);
			}
			catch(Exception e){
				e.printStackTrace();
				logger.error("requestAction="+e.toString());
				httpResponse.sendRedirect(contextPath+"/error.html");
				return;
			}
		}else {
			httpResponse.sendRedirect(contextPath + "/error.html");
		}
	}
	
	//判断是否需要更新分页的html文件
	private boolean nedGxFenye(EntMapper mp ,String pg, String dynurl, ServletRequest request){
		String filePath = request.getServletContext().getRealPath("")+"\\static\\lanmu\\"+dynurl+"___"+pg+".html";
		File file=new File(filePath);  
		if(!file.exists()) {
			return true;
		}
		
		//文件最后修改的时间
		long lastModified = file.lastModified();
		Calendar wjsj = Calendar.getInstance();  
		wjsj.setTimeInMillis(lastModified); 
		
		//上一次栏目静态的时间
		Map<String, Object> obj = mp.obj("select gx from tjpcms_cfg where PY='LMJTH'");
		if (obj ==null || obj.get("gx")==null){
			logger.error("nedGxFenye,get LMJTH error");
			return true;	
		}
		Calendar lmjthsj = Calendar.getInstance();
		Date parse = null;
		try{
			parse = CL.fmt.parse((String)obj.get("gx"));
		}catch(Exception e){
			parse = null;
		}
		if (parse==null){
			logger.error("nedGxFenye,parse LMJTH error");
			return true;
		}

		lmjthsj.setTime(parse);
		return wjsj.before(lmjthsj);
	}
	
	
	private boolean NedRedirect(String pg, String acori){
		
		Pattern pattern = Pattern.compile(fenyeptn);
		Matcher matcher = pattern.matcher(acori);
		if(matcher.find()){//链接中有___d
			String group = matcher.group(0);
			String sz = group.substring(group.indexOf("___")+"___".length(), group.length());
			if (!sz.equals(pg)){
				return true;
			}
		}else if (!pg.equals("1")){
			return true;
		}

		return false;
	}
}
