package com.tjpcms.common.Crud;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.tjpcms.filter.injFilter;


public class Retrieve {
	private static final Log lg = LogFactory.getLog(Retrieve.class);

	boolean need = false;//只要调用了setList就把该字段设置为true
	Integer perPage = 10;//每页记录数，默认10
	Integer recTotal;//记录总数
	Integer pgTotal;//分页总数
	
	String sql;//查询列表的自定义sql语句
	String pg;//当前第几页
	
	List<Map<String,Object>> ths;//表头
	List<Map<String,Object>> tbs;//表体
	
	List<Map<String,Object>> zds;
	
	String listloc;
	String exwhere="";
	
	String exjoinstr;//额外的join语句
	List<String> exjoinzdm;//额外的join字段名
	
	List<Map<String,Object>> cxs;//列表查询区的内容
	
	List<String> extjs = new ArrayList<String>();//列表查询区的内容
	List<String> extjsp = new ArrayList<String>();//还可以带额外的jsp
	
	boolean useIcon = false;
	
	List<Map<String,Object>> ans;//按钮区
	
	
	public List<Map<String, Object>> getAns() {
		return ans;
	}
	public void setAns(List<Map<String, Object>> ans) {
		this.ans = ans;
	}
	public List<String> getExtjsp() {
		return extjsp;
	}
	public void setExtjsp(List<String> extjsp) {
		this.extjsp = extjsp;
	}
	public boolean isUseIcon() {
		return useIcon;
	}
	public void setUseIcon(boolean useIcon) {
		this.useIcon = useIcon;
	}
	public List<String> getExtjs() {
		return extjs;
	}
	public void setExtjs(List<String> extjs) {
		this.extjs = extjs;
	}
	public boolean isNeed() {
		return need;
	}
	public void setNeed(boolean need) {
		this.need = need;
	}
	public String getExjoinstr() {
		return exjoinstr;
	}
	public void setExjoinstr(String exjoinstr) {
		this.exjoinstr = exjoinstr;
	}
	public List<String> getExjoinzdm() {
		return exjoinzdm;
	}
	public void setExjoinzdm(List<String> exjoinzdm) {
		this.exjoinzdm = exjoinzdm;
	}
	public List<Map<String, Object>> getCxs() {
		return cxs;
	}
	public void setCxs(List<Map<String, Object>> cxs) {
		this.cxs = cxs;
	}
	public String getExwhere() {
		return exwhere;
	}

	private boolean iskongbai(char c){
		return Pattern.compile("\\s+").matcher(String.valueOf(c)).matches();
	}

	private boolean canfoundt(String s, int i){
		
		if (StringUtils.isEmpty(s) || !(i>=0 && i<s.length())) return false;
		
		while(i-1>=0 && s.charAt(i-1)!='t') i--;;
		
		
		return i-1>=0;
	}

	//这边为where中的字段加上t.   防止字段重名
	public void setExwhere(String exwhere) {
		
/*		List<Integer> bsfidx = new ArrayList<Integer>();
		if (StringUtils.isNotEmpty(exwhere)){//这边自动加上t.，不然组sql时可能会字段名重复
			int eqidx = -1;
			do{
				eqidx = exwhere.indexOf("=", ++eqidx);
				if (eqidx!=-1){
					int inneridx = eqidx;
					do{
						inneridx--;
					}while(inneridx>=0 && iskongbai(exwhere.charAt(inneridx)));//退出循环的条件是eqidx<0或者不是空白符了
					if (inneridx>=0){
						do{
							inneridx--;
						}while(inneridx>=0 && !iskongbai(exwhere.charAt(inneridx)));
						if (inneridx+1<exwhere.length() && exwhere.charAt(inneridx+1)=='t' 
							&& inneridx+2<exwhere.length() && exwhere.charAt(inneridx+2)=='.'){//写了t.的话就不加了
							
						}else{//还要看是不是类似     	t  		.   id  = 10			t	.id=10 	这种带空白符的写法
							int bswz = inneridx+1;
							boolean mhfound = exwhere.charAt(bswz)=='.';
							do{inneridx--;}while(inneridx>=0 && iskongbai(exwhere.charAt(inneridx)));
							if(inneridx>=0) {
								if (exwhere.charAt(inneridx)=='t' && mhfound){	//说明是	t	.id的情况
									
								}else if (exwhere.charAt(inneridx)=='.' && !mhfound && canfoundt(exwhere, inneridx)){//说明是	t	.	id的情况
									
								}else{
									bsfidx.add(bswz);//此处索引为标识符第一个字符
								}
							}else{
								bsfidx.add(bswz);//此处索引为标识符第一个字符
							}
						}
					}
				}
			}while(eqidx!=-1);
		}
		if (CollectionUtils.isNotEmpty(bsfidx)) {
			String copy = new String(exwhere);
			exwhere="";
			for (int i = 0; i < bsfidx.size(); i++) {
				int st = (i==0?0:bsfidx.get(i));
				int ed = (i==bsfidx.size()-1?copy.length():bsfidx.get(i+1));
				exwhere += copy.substring(st,bsfidx.get(i))+"t."+ copy.substring(bsfidx.get(i),ed);
			}
		}*/
		if (StringUtils.isNotEmpty(exwhere)) {
			String[] split = exwhere.split("=");
			if (split.length<=1){
				this.exwhere += " and ("+exwhere+") ";
			}else{
				String zdz = split[1];
				if (zdz.indexOf("'")==-1){
					zdz = "'"+zdz+"'";
				}
				this.exwhere += " and ("+split[0]+"="+zdz+") ";
			}
		}
	}
	public String getListloc() {
		return listloc;
	}
	public void setListloc(String listloc) {
		this.listloc = listloc;
	}
	public Integer getRecTotal() {
		return recTotal;
	}
	public void setRecTotal(Integer recTotal) {
		this.recTotal = recTotal;
	}
	public Integer getPgTotal() {
		return pgTotal;
	}
	public void setPgTotal(Integer pgTotal) {
		this.pgTotal = pgTotal;
	}
	public List<Map<String, Object>> getThs() {
		return ths;
	}
	public void setThs(List<Map<String, Object>> ths) {
		this.ths = ths;
	}
	public List<Map<String, Object>> getTbs() {
		return tbs;
	}
	public void setTbs(List<Map<String, Object>> tbs) {
		this.tbs = tbs;
	}

	public Integer getPerPage() {
		return perPage;
	}
	public void setPerPage(Integer perPage) {
		this.perPage = perPage;
	}
	public String getSql() {
		return sql;
	}
	public void setSql(String sql) {
		this.sql = sql;
	}
	public String getPg() {
		return pg;
	}
	public void setPg(String pg) {
		this.pg = pg;
	}
	public List<Map<String, Object>> getZds() {
		return zds;
	}
	public void setZds(List<Map<String, Object>> zds) {
		this.zds = zds;
	}
	
	public static void main(String[] args) throws Exception {
		Retrieve re = new Retrieve();
		
		String t[] = {
				" pid  		= 1 and t.delf 			=	 0	 ",
				" t.pid  		= 1 and t.delf 			=	 0	 ",
				"	 pid  		= 1 and t.delf 			=	 0	",
				"    	 t	. 		pid  		= 1 and t.delf 			=	 0	 ",
				" pid  		= 1 and 		delf 			=	 0	 ",
				" pid  		= 1 and t		.delf 			=	 0	 ",
				" pid  		= 1 and t.		delf 			=	 0	 ",
				"t				.pid  		= 1 and t.				delf 			=	 0	 ",
				" t.pid  		= 1 and t.				delf 			=	 0	 ",
				"t.pid  		= 1 and t.				delf 			=	 0	 ",
				" t				pid  		= 1 and t			.			delf 			=	 0	 ",
				".				pid  		= 1 and t			.			delf 			=	 0	 ",
				"",
				"t.",
				"				pid=1",
				"pid=1",
				".pid=1",
				".t pid=1",
				".  t pid=1",
		};
		for (int i = 0; i < t.length; i++) {
			re.setExwhere(t[i]);
			System.out.println(re.getExwhere());
		}
		
	}
	
}
