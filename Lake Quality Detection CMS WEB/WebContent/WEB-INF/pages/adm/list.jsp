<!--
 * 作者:tjp
 * QQ号：57454144
 * QQ群：168895774
 * 官网：http://www.tjpcms.com
 * 码云：https://git.oschina.net/tjpcms/tjpcms
 * 更新日期：2017-01-22
 * tjpcms - 最懂你的cms
 * -->

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%request.setAttribute("path", request.getContextPath());%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=EDGE,chrome=1"/>
	<link rel="stylesheet" href="${path }/css/ht_cmn.css" type="text/css"/>
    <script src="${path }/js/jquery.js" type="text/javascript"></script>
    <script src="${path }/js/cmn.js" type="text/javascript"></script>
    <script src="${path}/js/template.js"></script>
    <script type="text/javascript" src="${path}/My97DatePicker/WdatePicker.js"></script>
	<c:forEach items="${o.r.extjs}" var="t" varStatus="status">
		<script type="text/javascript" src="${path}/js/${t}"></script>
	</c:forEach>
	<c:forEach items="${o.r.extjsp}" var="t" varStatus="status">
		<jsp:include page="../extjsp/${t}"/>
	</c:forEach> 

	<style>
		body{background: #fff;}
		.content{padding: 10px;overflow: auto;}
		a,a:focus{text-decoration:none;color:#056dae;outline:none;-webkit-transition: all 0.5s; -moz-transition: all 0.5s; -o-transition: all 0.5s;}
		a:hover{color:#00a4ac;text-decoration:none;}
		.tdop a{margin-right: 1px;}
		.cxqu{background: #f5f5f5; float:left;border-radius: 4px;padding: 1px 0;}
		.cxqu li{float: left;margin:1px 5px 1px 0;line-height: 40px;vertical-align: middle;font-weight: bold; padding:0 6px; border: 2px solid transparent;}
		.cxqu li div{display:inline-block;text-align: center; }
		.Wdate{height: 28px !important;}
		.input-text{width: 186px;}
		.fanhui{font-size: 12px;color: rgb(48, 164, 240);border: 1px solid rgb(48,164,240);padding: 3px 8px 2px;border-radius: 2px;}
		.fanhui:hover{color: #fff;border-color: #3bd;background-color: #3bd;cursor: pointer;}
		.cxqu .sel_zdb{width: 188px;}
		#popsh input{margin-right: 10px;}
		.cls_sid_popsh_out{max-width:600px}
	</style>
	
</head>
<body>

	<c:if test="${!empty(o.bread)}">
		<div class="bread">${o.bread}</div>
	</c:if>

	<div class="content">
		<c:if test="${fn:length(o.r.cxs)>0}">
			<c:set var="haveCxq" value="1"/>
			<form action="${o.r.listloc}" id="id_frm_cxq" method="post">
				<input type="hidden" name="___pg" value=""/>
				<ul class="cxqu">
					<c:forEach items="${o.r.cxs}" var="t" varStatus="status">
						<li <c:if test="${!empty(t.hasDef) && !empty(t.val)}">class="clsZdHasDef"</c:if>>
							<div style="white-space:nowrap;width: ${cxqWzwidth}px;">${t.wz}：</div>
							<c:if test="${t.lx=='input'}">
								<div style="width:188px !important" class="clsselinpt">
								<c:choose>
									<c:when  test="${fn:length(t.ops)>1 || (fn:length(t.ops)==1 && t.ops[0].val!='like')}">
										<c:set var="haveselect" value="1"/>
										<div>
											<select name="${t.zdm}___op" class="select">
												<c:forEach items="${t.ops}" var="op" varStatus="status">
													<option value="${op.val}" <c:if test="${t.op==op.val}">selected</c:if>>${op.text}</option>
												</c:forEach>
											</select>
										</div>
									</c:when>
									<c:otherwise><c:set var="haveselect" value="0"/></c:otherwise>
								</c:choose>
								<input type="text" maxlength="30" class="input-text lh25" name="${t.zdm}" value="${t.val}" style="<c:if test='${haveselect==1}'>width:100px;</c:if>" />
								</div>
							</c:if>
							<c:if test="${t.lx=='sj'}">
								<input type="text" id="id_sj_${t.zdm}_${status.index}"  onclick="WdatePicker()" 
									class="Wdate ${t.cls} input-text lh25" name="${t.zdm}___${t.cls}" value="${t.val}"/>
							</c:if>
							<c:if test="${t.lx=='sel'}">
								<select name="${t.zdm}" class="select sel_zdb" <c:if test="${lx==2}">disabled readonly</c:if> 
									onchange="$('#id_frm_cxq>input[name=\'___pg\']').val('');$('#id_frm_cxq').submit()">
									<option value="___-1">全部</option>
									<c:forEach items="${t.selops}" var="itmsel">
										<option value="${itmsel.val}" <c:if test="${t.val==fn:trim(itmsel.val)}">selected</c:if> >${itmsel.txt}</option><!-- fn:trim是强转String -->
									</c:forEach>
								</select>
							</c:if>
						</li>
					</c:forEach>
					<li style="padding-left: 0;"><input type="button" class="btn btn82 btn_search" value="查询"/></li>
				</ul>
			</form>
		</c:if>

		<div style="clear:both"></div>
		<c:if test="${fn:length(o.r.ans)>0}">
			<div class="btns">
				<c:forEach items="${o.r.ans}" var="t" varStatus="status">
					<input type="button" id="${t.id}" class="btn btn82" style="${t.style}" value="${t.cztext}" onclick="${t.fn}"/>
				</c:forEach>
				<input type="button" name="button" style="width:0px;padding:0" class="btn btn82"/>
			</div>
		</c:if>
		
		<table border="0" cellpadding="0" cellspacing="0" class="list_table CRZ" <c:if test="${fn:length(o.r.ans)<=0}">style="margin-top:10px"</c:if>>
			<thead>
				<tr>
					<c:forEach items="${o.r.ths}" var="itm" varStatus="status">
						<th <c:if test="${!itm.notip}"> title = '${ itm.title}'</c:if> 
							  <c:if test="${!empty(itm.style)}">style='${itm.style}'</c:if>
							  <c:if test="${itm.notip}"> onselectstart="return false"</c:if>>
							${ itm.title}
						</th>
					</c:forEach>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${o.r.tbs}" var="itm" varStatus="status">
					<tr <c:if test="${status.index%2==1}">style='background:rgb(255, 252, 234)'</c:if>>
						<c:if test="${o.d.batdel}">
							<td style="padding: 10px 0;" onselectstart="return false"><input name="id[]" type="checkbox" value="" id='${itm.id}'/></td>
						</c:if>
						<td title="${status.index+1+(o.r.pg-1)*o.r.perPage }">${status.index+1+(o.r.pg-1)*o.r.perPage}</td>
						<c:forEach items="${o.r.zds}" var="zd">
							<c:choose>
								<c:when test="${!empty(zd.extc) && zd.extdbzd}"><c:set var="extwz" value="${zd.exts}${itm[zd.extc]}${zd.exte}"/></c:when>
								<c:when test="${!empty(zd.extc)}"><c:set var="extwz" value="${zd.exts}${zd.extc}${zd.exte}"/></c:when>
								<c:otherwise><c:set var="extwz" value=""/></c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${zd.zdType=='normal'}"><!-- 列表字段 -->
									<c:if test="${!empty(itm[zd.zdm])}"><c:set var="celltext" value="${itm[zd.zdm]}"/></c:if>
									<c:if test="${empty(itm[zd.zdm])}"><c:set var="celltext" value="${zd.empcoltip}"/></c:if>
									<c:if test="${!empty(extwz)}">
										<c:if test="${zd.exttail}"><c:set var="celltext" value="${celltext}${extwz}"/></c:if>
										<c:if test="${!zd.exttail}"><c:set var="celltext" value="${extwz}${celltext}"/></c:if>
									</c:if>
									<c:if test="${zd.zdm=='rq' || 'gx'==zd.zdm}"><c:set var="celltext" value="${fn:substring(celltext,0,10)}"/></c:if>
									<c:choose>
										<c:when test="${empty(zd.hrefmp)}"><td title="<c:out value='${celltext}'/>">${celltext}</td></c:when>
										<c:otherwise><!-- 字段是可以点击的 -->
											<c:set var="recHrefPara" value=""/>
											<c:forEach items="${zd.hrefmp}" var="thf">
												<c:choose>
													<c:when test="${!empty(thf.zdm) && empty(thf.tplzdm) && !empty(itm[thf.zdm])}">
														<c:set var="recHrefPara" value="${recHrefPara}&${thf.zdm}=${itm[thf.zdm]}"/>
													</c:when>
													<c:when test="${!empty(thf.zdm) && !empty(thf.tplzdm) && !empty(itm[thf.tplzdm])}">
														<c:set var="recHrefPara" value="${recHrefPara}&${thf.zdm}=${itm[thf.tplzdm]}"/>
													</c:when>
													<c:otherwise>
														<c:set var="recHrefPara" value="${recHrefPara}&${thf.zdm}=${thf.zdz}"/>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<td title="<c:out value='${celltext}'/>">
												<a href="${zd.href}?${fn:substring(recHrefPara,1,fn:length(recHrefPara))}" <c:if test="${ zd.tgblank}">target="_blank"</c:if> 
													style="  border-bottom: 1px solid blue;padding: 0 5px;">${celltext}</a>
												</td>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${zd.zdType=='pic'}"><!-- 图片字段 -->
									<c:if test="${!empty(itm[zd.zdm])}">
										<td style="padding:0;">
											<c:if test="${!empty(extwz)}">
												<c:if test="${!zd.exttail}">
													${zd.exts}${extwz}${zd.exte}
													<div style="margin:0px;overflow: hidden"><img style="max-height:50px;" src="${itm[zd.zdm]}" /></div>
												</c:if>
												<c:if test="${zd.exttail}">
													<div style="margin:0px;overflow: hidden"><img style="max-height:50px;" src="${itm[zd.zdm]}" /></div>
													${zd.exts}${extwz}${zd.exte}
												</c:if>
											</c:if>
											<c:if test="${empty(extwz)}"><div style="margin:0px;overflow: hidden"><img style="max-height:50px;" src="${itm[zd.zdm]}" /></div></c:if>
										</td>
									</c:if>
									<c:if test="${empty(itm[zd.zdm])}">
										<c:set var="celltext" value="${zd.empcoltip}"/>
										<c:if test="${!empty(extwz)}">
											<c:if test="${zd.exttail}"><c:set var="celltext" value="${celltext}${extwz}"/></c:if>
											<c:if test="${!zd.exttail}"><c:set var="celltext" value="${extwz}${celltext}"/></c:if>
										</c:if>
										<td title="${celltext}">${celltext}</td>
									</c:if>
								</c:when>
								<c:when test="${zd.zdType=='text'}"><!-- text字段 -->
									<c:choose>
										<c:when test="${!empty(zd.textval)}">
											<c:set var="celltext" value="${zd.textval}"/>
											<c:if test="${!empty(extwz)}">
												<c:if test="${zd.exttail}"><c:set var="celltext" value="${celltext}${extwz}"/></c:if>
												<c:if test="${!zd.exttail}"><c:set var="celltext" value="${extwz}${celltext}"/></c:if>
											</c:if>
											<td title="${celltext}">${celltext}</td>
										</c:when>
										<c:when test="${!empty(zd.textmap) && !empty(zd.textmpzd)}">
											<c:choose>
												<c:when test="${!empty(zd.textmap[fn:trim(itm[zd.textmpzd])])}">
													<c:set var="celltext" value="${zd.textmap[fn:trim(itm[zd.textmpzd])]}"/>
												</c:when>
												<c:when test="${!empty(zd.textmap[itm[zd.textmpzd]+0])}">
													<c:set var="celltext" value="${zd.textmap[itm[zd.textmpzd]+0]}"/>
												</c:when>
												<c:otherwise>
													<c:set var="celltext" value="${zd.empcoltip}"/>
												</c:otherwise>
											</c:choose>
											<c:if test="${!empty(extwz)}">
												<c:if test="${zd.exttail}"><c:set var="celltext" value="${celltext}${extwz}"/></c:if>
												<c:if test="${!zd.exttail}"><c:set var="celltext" value="${extwz}${celltext}"/></c:if>
											</c:if>
											<td title="${celltext}">${celltext}</td>
										</c:when>
										<c:otherwise>
											<td></td>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<td></td>
								</c:otherwise>
							</c:choose>
						</c:forEach>					

						<c:if test="${fn:length(itm.lstczq)>0}">
							<c:set var="haveCzq" value="1"/>
							<td class="tdop" style="white-space:normal">
								<c:forEach items="${itm.lstczq}" var="t">
									${t.czx}
								</c:forEach>
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="pagin">
			<span class="fymsg"></span>
			<div id="fenye"></div>
		</div>
		</div>

	<script src="${path}/layer/layer.js"></script>
	<script src="${path}/laypage/laypage.js"></script>
    <script type="text/javascript">
		$(function(){

			$(".fymsg").html('</i>共<i>'+${o.r.recTotal}+'</i>条记录，每页<i>'+${o.r.perPage}+'</i>条，共<i>'+${o.r.pgTotal}+'</i>页')
			laypage({
			    cont: 'fenye',
			    skip: true,
			    groups: 5,
			    pages: ${o.r.pgTotal},
				curr: function(){
			        //var page = location.search.match(/___pg=(\d+)/);
			        //return page ? page[1] : 1;
			          var page = $("input[name='___pg']").val() || '${o.r.pg}';
			       	return page;
			    }(),
			    jump: function(e, first){
			        if(!first){
			        	//console.log(e.curr)
			        	$("input[name='___pg']").val(e.curr);
			        	$("#id_frm_cxq").attr('action', location.href).submit();
			        }
			    }
			})
			
			//按左右键来切换分页
			$(".btns input:eq(0), .cxqu").focus().blur()//不用再点一下就能翻页
			$(document).keydown(function (e) {
				if (e.which==37) $("#fenye .laypage_curr").text()=="1"?layer.msg('已到第一页'):$("#fenye .laypage_prev")[0].click();//按左
				else if (e.which==39) $("#fenye .laypage_curr").next().hasClass('laypage_total')?layer.msg('已到最后一页'):$("#fenye .laypage_next")[0].click();//按右
			})

			<c:if test="${cxqHaveShijian}">
				$(".kssj").each(function(){
					var  id = $(this).parent().next().children(".jssj").attr("id");
					$(this).attr("onfocus", "WdatePicker({maxDate:'#F{$dp.$D(\\'"+id+"\\')}'})");
				})
				$(".jssj").each(function(){
					var id = $(this).parent().prev().children(".kssj").attr("id");
					$(this).attr("onfocus", "WdatePicker({minDate:'#F{$dp.$D(\\'"+id+"\\')}'})");
				})
			</c:if>

			<c:if test="${haveCxq==1}">
				$(".btn_search").click(function(){
					$("#id_frm_cxq>input[name='___pg']").val("");
					$("#id_frm_cxq").submit();
				})
			</c:if>

			<c:if test="${!empty(o.bread)}">
				$(".bread>div").fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500).fadeOut(500).fadeIn(500)
			</c:if>

			<c:if test="${haveselect==1}">
				window.setTimeout(//火狐下面得缓冲一下才能刷出select的宽度
					function() {
						$(".clsselinpt").each(function(){
							if ($(this).children("div").length>0){
								$(this).children("input").animate({width:182-$(this).children("div").width()},100);//查询区对齐的
							}
						})
					}, 100
				) 
			</c:if>

			//如果查询区有默认值，提醒一下
			$(".clsZdHasDef").each(function(){
				var tsob = $(this)
				tsob.css({"border-color": "#4b61dc", "border-width":"2px", "border-style":"solid","border-radius":"3px"});
				layer.ready(function(){
					layer.tips('请注意该查询项有默认值', tsob,{tips:[3, '#3595CC'], tipsMore:true, tjpcms_clscont:'touming88'});
				})
				setTimeout(function(){
					tsob.css({"border-color": "transparent"});
				},3000)
			})
		

			layout();
		})
		
		function layout(){
			if ($(window).height()>0){
				$(".content").height($(window).height()-($(".bread").length>0?45:20))
			}
		}
		window.onresize=function(){
			layout();layout()
		}

		<c:if test="${o.d.batdel}">
			$(function(){
				//表体部分点击checkbox外围的td也视为响应checkbox
				$("input[name='id[]']").parent().click( function(e){
					$(this).children("input").trigger('click')
					e.stopPropagation()
				})
				$("input[name='id[]']").click( function(e){
					e.stopPropagation()
				})
				
				$(".list_table th:eq(0)").click( function(e){
					$(this).children("input").trigger('click')
					e.stopPropagation()
				})
				$(".list_table th:eq(0)").children("input").click( function(e){
					if ($("input[name='id[]']:checked").size()==0 && !$(this).prop("checked")){
						$(this).prop("checked",false)//这个是针对表体checkbox全未选，表头checkbox勾选，此时点击表头checkbox的情况
					}else{
						$("input[name='id[]']").each(function(){
							$(this).prop("checked",!$(this).prop("checked"))
						})
					}
					e.stopPropagation()
				})
			})

			function ___fn_batdel(){
				var ids="";
				var cnt = 0, egray=null;
				$("input[name='id[]']").each(function(){
					if ($(this).prop("checked")){
						ids += (this.id+",");
						cnt++;
						if ($(this).parent().siblings(".tdop").children(".czxgray").length>0 && egray==null){
							egray = $(this).parent().siblings(".tdop").children(".czxgray");
						}
					}
				})
				if (cnt == 0){
					layer.alert("请先选择要删除的记录！", { icon:2, title:'错误'});
				}else if (egray!=null){
					egray.trigger('click')
				}else{
					layer.confirm('确定要删除勾选的'+cnt+'条记录吗？', {icon: 3, title:'提示'}, function(index){
						___del(ids)
					});
				}
			}
		</c:if>

		<c:if test="${o.d.batdel || o.d.need}">
			function ___del(id){
				$.ajax({
					type:"POST",
					url:"delete.dhtml",
					data:{ids:id,u:'${o.u}'},
					beforeSend:function(){layer.msg('删除中，请稍后......', {time:-1,icon: 16,shade: 0.3, scrollbar:false});},  
					datatype: "text",
					success:function(ret){
						layer.closeAll();
						if ("0" ==ret){
							sxcur();
						}else if ("-1"==ret){
							layer.alert('删除失败，请联系管理员！', { icon:2, title:'错误'});
						}else{
							layer.alert(ret, { icon:2, title:'错误'});
						}
					},
					error: function(){
						layer.alert('删除失败，请刷新后重试！', { icon:2, title:'错误'});
					}
				});
			}
		</c:if>

		<c:if test="${o.d.need}">
			function ___fn_del(tag,id){
				var eqidx = "${o.d.batdel}"=="true"?1:0;
 				var xh = $(tag).parents("tr").children(":eq("+eqidx+")").text();
				layer.confirm('确定要删除序号为 <strong>'+xh+' </strong>的记录吗？', {icon: 3, title:'提示'}, function(index){
					___del(id)					
				});
			}
		</c:if>

		<c:if test="${!empty(haveCzq)}">
			function sxcur(){
				$("input[name='___pg']").val('${o.r.pg}');
		        $("#id_frm_cxq").attr('action', location.href).submit();
			}
			function getxhidx(){
				return "${o.d.batdel}"=="true"?1:0;
			}
			function getu(){
				return "${o.u}";
			}
		</c:if>

		$(function(){
			layer.ready(function(){//http://fly.layui.com/jie/1724.html
				if ('${ses_ht_tip}' !=''){
					layer.msg('${ses_ht_tip}')
				}
			})
		})

	</script>
	<script id="sid_popsh" type="text/html">
		<div id="popsh" style='padding:10px 30px 10px 10px; ;'>
			<textarea id="popshyj" style="width:100%;padding:10px;margin-bottom:10px;color:#999" rows="3" maxlength="100" value=""
			onfocus="if(this.value=='审核意见（100字以内）'){this.value='';this.style.color='#000'}" 
			onblur="if(!this.value){this.value='审核意见（100字以内）';this.style.color='#999'}" style="color:#999999">审核意见（100字以内）</textarea>
			<div style="text-align:center">
				{{if shzt=='待审核'}}
					<input type="button" value="审核通过" class="ext_btn ext_btn_submit" onclick="fn_op_wzsh(this,{{id}}, {{xh}},'{{u}}','{{shzt}}')"/>
					<input type="button" value="审核不通过" class="ext_btn ext_btn_submit" onclick="fn_op_wzsh(this,{{id}}, {{xh}},'{{u}}','{{shzt}}')"/>
					<input type="button" value="退回修改" class="ext_btn ext_btn_submit" onclick="fn_op_wzsh(this,{{id}}, {{xh}},'{{u}}','{{shzt}}')"/>
				{{else if shzt=='审核通过'}}
					<input type="button" value="审核不通过" class="ext_btn ext_btn_submit" onclick="fn_op_wzsh(this,{{id}}, {{xh}},'{{u}}','{{shzt}}')"/>
					<input type="button" value="退回修改" class="ext_btn ext_btn_submit" onclick="fn_op_wzsh(this,{{id}}, {{xh}},'{{u}}','{{shzt}}')"/>
				{{else if shzt=='审核不通过'}}
					<input type="button" value="审核通过" class="ext_btn ext_btn_submit" onclick="fn_op_wzsh(this,{{id}}, {{xh}},'{{u}}','{{shzt}}')"/>
					<input type="button" value="退回修改" class="ext_btn ext_btn_submit" onclick="fn_op_wzsh(this,{{id}}, {{xh}},'{{u}}','{{shzt}}')"/>
				{{else if shzt=='退回修改'}}
					<input type="button" value="审核通过" class="ext_btn ext_btn_submit" onclick="fn_op_wzsh(this,{{id}}, {{xh}},'{{u}}','{{shzt}}')"/>
					<input type="button" value="审核不通过" class="ext_btn ext_btn_submit" onclick="fn_op_wzsh(this,{{id}}, {{xh}},'{{u}}','{{shzt}}')"/>
				{{/if}}
			</div>
		</div>
	</script>
</body>
</html>
       