<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	request.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=EDGE,chrome=1"/>
	<link rel="stylesheet" href="${path }/css/ht_cmn.css" type="text/css"/>
	<link rel="stylesheet" href="${path }/css/zTreeStyle/zTreeStyle.css" type="text/css"/>
    <script src="${path }/js/jquery.js" type="text/javascript"></script>
    <script type="text/javascript" src="${path }/js/jquery.ztree.core.min.js"></script>
    <script src="${path}/js/template.js"></script>
    <script src="${path}/js/cmn.js"></script>
	<style>
		.l-layout-header-inner{text-align: center;}
		.left{
			width: 210px;text-align: center;border-right:1px dotted #ccc;position: absolute;top:25px;
		}
		.layui-layer-content{height: auto !important;}
		.right{position: absolute;right:1px;top:25px;padding: 0px;overflow: auto !important;}
		.rinner{padding:10px;overflow: hidden;}
		.bread{height: 24px;background:rgb(238,245,253);font-size: 12px;line-height: 23px;
			text-indent: 2em;border-bottom:1px solid rgb(215,228,234);text-shadow: silver 1px 1px 2px !important;}
		.right .rinner{
			padding:10px;
		}
		.left .title{
			 text-align: center;
			 color: #183152;
			 height: 25px;
			 line-height: 25px;
			 background: url('${path}/img/lanmushu.png') repeat-x;
			 overflow: hidden;
			 font-size: 12px;position: relative;
		}
		.list_table td input[type='text']{width: 100% !important;}
		.list_table td:first {text-align: center;}
		.ztree{width:100%;padding: 0;}
		.lecont{overflow: auto !important;width: 198px;margin-top: 5px;}
		.tishi{font-size: 12px;margin-top: 5px;background: #FFFFE0;color: #f60;padding: 5px;border:1px solid #ccc;}
		.title span{position: absolute;right:0px;margin-right: 10px;cursor:pointer;padding:0 5px;}
		.icon-bold:before{font-size: 14px;}
		.icon-bold1:before{font-size: 14px;}
		.title span:hover{background: #ccc;}
		
		.lmlxsx{border:solid 1px transparent;	     padding: 5px 7px 5px 2px;-webkit-border-radius: 2px;
		-moz-border-radius: 2px;margin-left: 1px;
		border-radius: 2px;}
		.lmlxsx span{background: url(${path}/images/ht/refreshBig.png) no-repeat;margin-left: 5px;padding-left: 17px;}
		.lmlxsx:hover{
			background:#e2f2fe url(${path}/images/ht/hover.gif) repeat-x 0px 50%;
			border:solid 1px #80a4d0;	 
		}
	</style>
</head>
<body>
	<div class="bread">当前位置：栏目列表</div>
	<div class="content">
		<div class="left">
			<div class="title" onselectstart="return false">栏目树
				<span class="icon-u clkunder" title="栏目内容是动态显示的"></span>
				<span class="icon-bold clkbold" title="栏目是动态显示的" style="right:22px"></span>
			</div>
			<div class="lecont">
					<ul id="tree1" class="ztree"></ul>
			</div>
			<div class="beizhu">注：名称后括号内数字为节点的id</div>
		</div>
		<div class="right">
			<div class="rinner">
				<div id="rgcon"></div>
				<div id="pagin">
					<span class="fymsg"></span>
					<div id="fenye"></div>
				</div>
			</div>
		</div>
	</div>


<script id="sid_addedit" type="text/html">
	<form id="id_fm_lanmu">
		<input type="hidden" name="id" value="{{id}}"/>
		<input type="hidden" name="pId" value="{{pId}}"/>
		<input type="hidden" name="url" value=""/>
		<input type="hidden" name="url_s" value=""/>
		<table class="list_table" border="0" cellpadding="0" cellspacing="0">
			<thead>
				<tr>
					<th class="first">{{title}}</th><th style="border-left-width:0"></th>
				</tr>
			</thead>
			<tbody>
				<tr>
				 	<td style="width:20%"><b>上级栏目：</b></td>
				 	<td>{{root}}</td>
				 </tr>
				<tr>
				 	<td style="width:20%"><b>栏目名称：</b></td>
				 	<td><input type="text" name="name" class="input-text lh25" size="10" value='{{lmmc}}' maxlength="20"/></td>
				 </tr>
				<tr>
				 	<td ><b>导航条显示：</b></td>
				 	<td>
						<input type="radio" name="nav" value="显示" {{if innav=='显示' || innav==null}}checked{{/if}}/> 显示&nbsp;&nbsp;&nbsp;
						<input type="radio" value="不显示" name="nav" {{if innav=='不显示'}}checked{{/if}}/> 不显示
				 	</td>
				 </tr>
				<tr>
				 	<td><b>栏目类型：</b></td>
					<td>
						<select  class="select" onchange="fn_lmlxcg(this)" id="id_sel_lmlx">
							<option value="1" {{if issys==1}}selected{{/if}}>系统预置</option>
							<option value="0" {{if issys==0}}selected{{/if}}>自定义</option>
						</select>
						<select name="lx" class="select">
							{{if issys==1 || issys==null}}
 								{{each sel1 as v idx}}
									<option value="{{v.val}}" {{if v.val==lx}}selected{{/if}}>{{v.txt}}</option>
								{{/each}}
							{{/if}}
							{{if issys==0 || issys==null}}
 								{{each sel0 as v idx}}
									<option value="{{v.val}}" {{if v.val==lx}}selected{{/if}}>{{v.txt}}</option>
								{{/each}}
							{{/if}}
	                	</select>
						<a class="lmlxsx" href="javascript:" title="如果栏目有变动，可点击按钮刷新" onclick="fn_lmlxsx()">
							<span >刷新</span>
						</a>
				 	</td>
				 </tr>
				<tr>
				 	<td><b>前台url：</b></td>
					<td>
						<input type="text" name="url_d" id="id_qturl" class="input-text lh25" size="10" value='{{exobj.url_d}}' maxlength="50"/>
						<div class="tishi">设置该栏目在前台访问时的url，不需要加后缀.dhtml</div>
					</td>
				</tr>
				<tr>
				 	<td><b>栏目内容url：</b></td>
					<td>
						<input type="text" name="url3" class="input-text lh25" size="10" value='{{exobj.url3}}' onfocus="fn_url3(this)" maxlength="50"/>
						<div class="tishi">设置该栏目下的内容在前台访问时的url，默认为前台url_detail</div>
					</td>
				</tr>
				<tr>
				 	<td><b>栏目只动态显示：</b></td>
					<td>
						<select name="donly2" class="select">
							<option  {{if exobj.donly2=='是'}}selected{{/if}}>是</option>
							<option  {{if exobj.donly2==undefined || exobj.donly2=='否'}}selected{{/if}}>否</option>
						</select>
						<div class="tishi">设置为是后，该栏目将不受静态化的影响</div>
					</td>
				</tr>
				<tr>
				 	<td><b>栏目内容只动态显示：</b></td>
					<td>
						<select name="donly3" class="select">
							<option  {{if exobj.donly3=='是'}}selected{{/if}}>是</option>
							<option  {{if exobj.donly3==undefined || exobj.donly3=='否'}}selected{{/if}}>否</option>
						</select>
						<div class="tishi">设置为是后，该栏目下的内容将不受静态化的影响</div>
					</td>
				</tr>
				<tr>
				 	<td><b>内容存储在哪个表中：</b></td>
					<td>
						<input type="text" name="nrtbl" class="input-text lh25" size="10" value='{{exobj.nrtbl}}' maxlength="30"/>
					</td>
				</tr>
				<tr>
				 	<td><b>排序：</b></td>
				 	<td><input type="text" name="px" class="input-text lh25" value="{{px}}" size="10" maxlength="4"/></td>
				 </tr>
				<tr>
				 	<td colspan="2">
						<input type="button" value="保存" class="ext_btn ext_btn_submit" onclick="fn_bc()">&nbsp;
						<input type="button" value="返回" onclick="fn_fh()" class="ext_btn">
					</td>
				 </tr>
			</tbody>
		</table>
	</form>
</script>


<script id="sid_list" type="text/html">
	<div class="btns">
		<i></i><input type="button" name="button" class="btn btn82 btn_add" value="新增" onclick="fn_add()"/>
	</div>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table CRZ" id="CRZ0">
		<thead>
			<tr>
				<th style="width:4em">序号</th>
				<th style="width:4em">id</th>
				<th style="width:4em">pid</th>
				<th title = '栏目名称'>栏目名称</th>
				<th style="width:8em" title = '导航栏显示'>导航栏显示</th>
				<th title = '栏目类型'>栏目类型</th>
				<th style="width:4em" title = '排序'>排序</th>
				<th   style="width:8em" title = '直接子栏目数'>直接子栏目数</th>
				<th title = '前台url'>前台url</th>
				<th title = '动态显示'>动态显示</th>
				<th title = '内容表'>内容表</th>
				<th title='操作' style="width: 8em;">操作</th>
			</tr>
		</thead>
		<tbody>
			{{each dyc as v idx}}
				<tr {{if idx%2!=0}}style='background:rgb(255, 252, 234)'{{/if}}>
					<td>{{(pg-1)*perPage+idx+1}}</td>
					<td>{{v.id}}</td>
					<td>{{v.pId}}</td>
					<td title="{{v.name}}">{{v.name}}</td>
					<td title="{{v.nav}}">{{v.nav}}</td>
					<td title="{{v.zdxmc}}({{v.lxpy}})">{{v.zdxmc}}({{v.lxpy}})</td>
					<td title="{{v.px}}">{{v.px}}</td>
					<td title="{{v.cnt}}">{{v.cnt}}</td>
					<td title="{{v.url_d}}一{{v.url3}}">{{v.url_d}}一{{v.url3}}</td>
					<td title="{{v.donly2}} {{v.donly3}}">{{v.donly2}}&nbsp;&nbsp;{{v.donly3}}</td>
					<td title="{{v.nrtbl}}">{{v.nrtbl}}</td>
					<td>
						<a href="javascript:" onclick="fn_edit(this,'{{v.lxpy}}', '{{v.sys}}')">编辑</a>|
						<a href="javascript:" onclick="fn_del(this,'{{v.name}}')"{{if v.cnt>0}}class='czxgray'{{/if}}>删除</a>
					</td>
				</tr>
			{{/each}}
		</tbody>
	</table>
	<div class="beizhu" style="padding:5px;letter-spacing:1px;font-size:13px">
		注：需要删光子节点后才能删除对应的父节点。如需修改栏目树中选中节点的名称，请先选中其父节点。
	</div>
</script>


	<script src="${path}/layer/layer.js"></script>
	<script src="${path}/laypage/laypage.js"></script>
    <script type="text/javascript">
		g_sel0 = eval('(' + '${sel_sys0}' + ')');
		g_sel1 = eval('(' + '${sel_sys1}' + ')');

    	function lmlistpg(pg, pid,pname){
			pid = pid || getSelNode().id
			pname = pname ||  $.fn.zTree.getZTreeObj("tree1").getNodeByParam("id", pid).name
			  $.getJSON('getlmlistpg.dhtml', {
			      pg: pg || 1,pid:pid
			  }, function(data){
					var html = template('sid_list', data);
					document.getElementById('rgcon').innerHTML =html;
					$(".fymsg").html('<i>'+pname+'</i>共<i>'+data.recTotal+'</i>个直接子栏目，每页<i>'+data.perPage+'</i>个，共<i>'+data.pgTotal+'</i>页')
				        laypage({
			            cont: 'fenye',
			            pages: data.pgTotal,
			            curr: pg||1,
			            skip: true,
			            jump: function(obj, first){
			                if(!first){
			                    lmlistpg(obj.curr, pid, pname);
			                }
			            }
			        }); 
			 });
    	}

		function zTreeOnClick(event, treeId, treeNode){
			lmlistpg(1, treeNode.id, treeNode.name);
		}

   		function layout(){
   			$(".content,.left,.right").height($(window).height()-25)
   			$(".right").width($(window).width()-213)
   			var maxh = $(window).height()-86
   			$(".lecont").css('max-height',maxh)//一个bread25,栏目树25，提示25，提示间距3,顶部间距5，底部间距3
   			if (!$.support.leadingWhitespace)$(".lecont").height(maxh)//IE6-8，max-height有点问题
   		}
   		
		window.onresize=function(){
			layout();layout()
		}

	    function isEmptyStr(str) {
	    	return !str || str.replace(/(^\s+)|(\s+$)/g, "").length == 0;
	    }

		//切换栏目类型
		function fn_lmlxcg(tag){
			var gs = $(tag).val()=="0"?g_sel0:g_sel1;
			var esel = $("select[name='lx']");
			esel.empty();
			for(var i=0;i<g_sel0.length;i++){
				esel.append('<option value="'+gs[i].val+'">'+gs[i].txt+'</option>')
			}
		}
		
		//点击栏目刷新的按钮
		function fn_lmlxsx(){
			fn_ntp_json('aj_lmlxsx.dhtml', {},function(data){
				g_sel0 = data.sel_sys0;
				g_sel1 = data.sel_sys1;
				fn_lmlxcg($("#id_sel_lmlx"))
			})
		}

		$(function(){

			$(".clkbold").click(function(){//栏目动态化的，bold=细，bold1=粗
				var isunder = ($(".clkunder").attr('class').indexOf("icon-xiahuaxian")!=-1)?1:null;
				if ($(this).attr('class').indexOf("bold1")!=-1){//是粗的
					$(this).removeClass("icon-bold1");
					$(this).addClass("icon-bold");//变成细的
					refreshTree(getSelNode().id, null,null,isunder);
				}else{
					$(this).removeClass("icon-bold");
					$(this).addClass("icon-bold1");
					refreshTree(getSelNode().id, null,1,isunder);
				}
			})
			$(".clkunder").click(function(){//栏目内容动态化的
				var isbold = ($(".clkbold").attr('class').indexOf("bold1")!=-1)?1:null;
				if ($(this).attr('class').indexOf("icon-xiahuaxian")!=-1){//有下划线
					$(this).removeClass("icon-xiahuaxian");
					$(this).addClass("icon-u");
					refreshTree(getSelNode().id, null,isbold,null);
				}else{
					$(this).removeClass("icon-u");
					$(this).addClass("icon-xiahuaxian");
					refreshTree(getSelNode().id, null,isbold,1);
				}
			})

			refreshTree();
			
			layout();
		});

		function fn_add(){
			var treeObj = $.fn.zTree.getZTreeObj("tree1")
			if (treeObj !=null){
				var nodes = treeObj.getSelectedNodes();
				if (nodes.length <=0){
					layer.msg("请先选择左侧栏目树中的节点！")
				}else{
					var px=''
					$.ajax({//同步的
				    	type:"POST",async: false,
				        url:"getlmmaxpx.dhtml",
				        datatype: "text",
				        beforeSend:function(){layer.msg('请稍后......', {time:-1,icon: 16,shade: 0.3, scrollbar:false});},  
				        success:function(text){
				          	layer.closeAll();
				        	px = text
				        },
				        error: function(){
							layer.alert('网络阻塞，请重试！', { icon:2, title:'错误'});
						}
					})
					$(".fymsg,#fenye").empty()
        
					var data={root:nodes[0].name,pId:nodes[0].id, px:px,title:'新增栏目',sel1:g_sel1,exobj:{}}
					var html = template('sid_addedit', data);
					document.getElementById('rgcon').innerHTML =html;
				}
			}
		}

		//保存
		function fn_bc(){
			var name = $("#id_fm_lanmu input[name='name']").val()
			var px = $("#id_fm_lanmu input[name='px']").val()
 			if (isEmptyStr(name)){
				$("#id_fm_lanmu input[name='name']").focus();
				layer.msg("请填写栏目名称！");
				return;
			}
			if (isEmptyStr(px)){
				$("#id_fm_lanmu input[name='px']").focus();
				layer.msg("请填写排序！");
				return;
			}
			
			//其他一些校验

			//url,url_s的值
			var lmjthval=null;
			$.ajax({//同步的
		          type:"POST",async: false,
		          url:"getlmjthval.dhtml",
		          datatype: "text",
		          beforeSend:function(){layer.msg('请稍后......', {time:-1,icon: 16,shade: 0.3, scrollbar:false});},
		          success:function(text){
		          		layer.closeAll();
		          		lmjthval = text;
		          },
		          error: function(){
		            	layer.alert('网络阻塞，请重试！', { icon:2, title:'错误'});
				  }
			})
			if (lmjthval==null)return;
			if (lmjthval!='静态化' && lmjthval!='动态化'){
				layer.alert('系统错误，请联系管理员！', { icon:2, title:'错误'});
				return;
			};
			var qturl = $("input[name='url_d'").val();
			var bcurl_s = '${path}'+"/static/lanmu/"+qturl+".html";
			if (!isEmptyStr(qturl)) $("input[name='url']").val(bcurl_s);//默认url填静态的
			//var donl2v = $("select[name='donly2']").val();
			if (!isEmptyStr(qturl)) $("input[name='url_s']").val(bcurl_s);
			if (lmjthval=='动态化' && !isEmptyStr(qturl)) $("input[name='url']").val('${path}/'+qturl+".dhtml");//如果是栏目动态，再修改一下url

			//这边暂时针对栏目类型做个额外处理，以后再改掉
			var valmlx = $("select[name='lx']").val()
			if (valmlx=='富文本'){
				if (!isEmptyStr(qturl)){
					$("input[name='url3']").val(qturl);
					$("select[name='donly3']").val("否");
					$("input[name='nrtbl']").val("tjpcms_fwb");
				}else{
					layer.msg('请输入前台url！')//
					return;
				}
			}else if (valmlx=='通用文章'){
				$("input[name='nrtbl']").val("tjpcms_tywz");
			}else if (valmlx=='外部链接'){
				if ( !/(http|https):\/\/([\w.]+\/?)\S*/.test(qturl)){
					layer.msg('前台url必须以http://或https://开头！',{time:5000})
					return;
				}
				$("input[name='url']").val(qturl);
				$("input[name='url_s']").val(qturl);
			}

			$.ajax({
		          type:"POST",
		          url:"lmaddedit.dhtml",
		          data:$("#id_fm_lanmu").serialize(),
		          datatype: "text",
		          beforeSend:function(){layer.msg('正在保存......', {time:-1,icon: 16,shade: 0.3, scrollbar:false});},  
		          success:function(ret){
						if (ret=="0"){
							var n = getSelNode();
							refreshTree(n.id, '保存成功！');
						}else{
							layer.alert('保存失败，请联系管理员！', { icon:2, title:'错误'});
						}
		          },
		          error: function(){
					layer.alert('保存失败，请刷新重试！', { icon:2, title:'错误'});
		          }         
			});
		}

		function getFont(treeId, node) {
/* 			if (node.name.indexOf('')!=-1){
				node.name = node.name.replace("<br/>","")
			} */
			return node.font ? node.font : {};
		}

   		function refreshTree(selid,msg,donly2,donly3){
			$.ajax({
		          type:"POST",
		          url:"getlmtree.dhtml",
		          data:{selid:selid,showid:1},
		          datatype: "json",
		          beforeSend:function(){layer.msg('请稍后......', {time:-1,icon: 16,shade: 0.3, scrollbar:false});},  
		          success:function(json){
		          		layer.closeAll();
						var setting = {
							data: {simpleData: {enable: true}},
							callback: {onClick: zTreeOnClick},
							view: {fontCss: getFont,nameIsHTML: true}
						};
						var data = eval("("+json+")")
						var tp='';
						if (donly2 !=null || donly3 !=null){
							var cnt1=0,cnt2=0;
							for(var idx in data.all){
								var fob={};
								if (donly2 !=null && data.all[idx].donly2=='是'){
									fob['font-weight'] ='bold';
									cnt1++;
								}
								if (donly3 !=null && data.all[idx].donly3=='是'){
									fob['text-decoration'] ='underline';
									cnt2++;
								}
								if (!$.isEmptyObject(fob)){
									data.all[idx].font = fob;
								}
							}
							if (donly2 !=null ) tp+="栏目动态<b> "+cnt1+" 个</b>，";
							if (donly3 !=null ) tp+="内容动态<b> "+cnt2+" 个</b>，";
						}
						if (tp!='')layer.msg(tp.substring(0,tp.length-1));
		          		var treeObj = $.fn.zTree.init($("#tree1"), setting, data.all);
		          		treeObj.expandAll(true);
		          		var selNode=null;
		          		if (selid) {
		          			selNode = treeObj.getNodeByParam("id", selid)
		          		}else{
		          			selNode = treeObj.getNodes()[0]
		          			selid = selNode.id
		          		}
	          			treeObj.selectNode(selNode);
						//右侧列表项
						var html = template('sid_list', data);
						document.getElementById('rgcon').innerHTML =html;
						$(".fymsg").html('<i>'+selNode.name+'</i>共<i>'+data.recTotal+'</i>个直接子栏目，每页<i>'+data.perPage+'</i>个，共<i>'+data.pgTotal+'</i>页')
						parent.loadLmTree();
				        laypage({//显示分页
				            cont: 'fenye',
				            pages: data.pgTotal,
				            curr: 1,
				            skip: true,
				            jump: function(obj, first){
				                if(!first){
				                    lmlistpg(obj.curr, selid, selNode.name);
				                }
				            }
				        });
				        layout();
				        if (msg)layer.msg(msg);
		          },
		          error: function(){
					layer.alert('栏目获取失败，请刷新重试！', { icon:2, title:'错误'});
		          }         
			});
   		}

		function getSelNode(){
			var treeObj = $.fn.zTree.getZTreeObj("tree1");
			if (treeObj !=null){
				var nodes = treeObj.getSelectedNodes();
				if (nodes.length >0){
					return nodes[0]
				}
			}
			
			return null;
		}

		//返回
		function fn_fh(){
			 lmlistpg(1);
		}

		//删除栏目
		function fn_del(tag, lmnm){
 			if ($(tag).hasClass('czxgray')){
				lmnm = "【"+lmnm+"】";
				layer.msg('请先删除'+lmnm+'的所有下属子栏目！')
				return;
			}

			var xh= $(tag).parent().parent().children("td:eq(0)").text()
			var nm= $(tag).parent().parent().children("td:eq(3)").text()
			layer.confirm('确定要删除序号为 '+xh+' 的栏目 '+nm+' 吗？', {
					icon : 3,
					title : '提示'
				}, function(index) {
					$.ajax({
				          type:"POST",
				          url:"delLanmu.dhtml",
				          data:{id:$(tag).parent().parent().children("td:eq(1)").text()},
				          datatype: "text",
				          beforeSend:function(){layer.msg('正在删除......', {time:-1,icon: 16,shade: 0.3, scrollbar:false});},  
				          success:function(text){
				          		if ("0"==text){
									refreshTree(null,'删除成功！');
				          		}else{
				          			layer.alert('删除失败，请联系管理员！', { icon:2, title:'错误'});
				          		}
				          },
				          error: function(){
							layer.alert('删除失败，请刷新重试！', { icon:2, title:'错误'});
				          }         
					});
			});
		}

		//编辑栏目
		function fn_edit(tag,pzdxval,issys){
			var id= $(tag).parent().parent().children("td:eq(1)").text()
			$(".fymsg,#fenye").empty()
			var selnode = getSelNode()
			if (selnode != null) {
				var innav = $(tag).parent().parent().children("td:eq(4)").text()
				var exobj=null;
				$.ajax({//同步的
			          type:"POST",async: false,
			          url:"getLmById.dhtml",
			          datatype: "json",
			          data:{id:id},
			          beforeSend:function(){layer.msg('请稍后......', {time:-1,icon: 16,shade: 0.3, scrollbar:false});},  
			          success:function(json){
			          		layer.closeAll();
			          		exobj = eval("("+json+")")
			          },
			          error: function(){
			            	layer.alert('网络阻塞，请重试！', { icon:2, title:'错误'});
					  }
				})
				var data={root:selnode.name,pId:selnode.id, lmmc:$(tag).parent().parent().children("td:eq(3)").text(), innav:innav,
					px:$(tag).parent().parent().children("td:eq(6)").text(),lx:pzdxval, id:id,title:'编辑栏目', sel0:g_sel0, sel1:g_sel1,exobj:exobj,issys:issys}
				var html = template('sid_addedit', data);
				document.getElementById('rgcon').innerHTML =html;
			}
		}

		function fn_url3(tag){
			var postfix=".dhtml";
			var uv = $("input[name='url_d']").val();
			if (uv.indexOf(postfix)!=-1 && uv.substring(uv.length-postfix.length,uv.length)==postfix){//.dhtml结尾的
				uv = uv.substring(0, uv.indexOf(postfix))
			}
			var u3v = $(tag).val()
			if (isEmptyStr(u3v) && !isEmptyStr(uv) ){
				$(tag).val(uv+"_detail")
			}
		}

		/*function fn_urlblur(tag){
			var v = $(tag).val();
			var postfix=".dhtml";
			if (v==postfix){
				layer.msg("url不能为.dhtml")
				return;
			}
			if (v.length<=postfix.length){
				$(tag).val(v+postfix);
			}else if (v.indexOf(postfix)==-1 || v.substring(v.length-postfix.length,v.length)!=postfix){
				$(tag).val(v+postfix);
			}
		}*/
		
	</script>
</body>
</html>
       