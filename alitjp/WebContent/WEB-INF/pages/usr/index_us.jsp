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
<%
	request.setAttribute("path", request.getContextPath());
%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=EDGE,chrome=1"/>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>
    <title>${WZMC} - 个人中心</title>
    <link rel="stylesheet" href="${path }/css/zTreeStyle/zTreeStyle.css" type="text/css"/>  
    <link rel="stylesheet" href="${path }/css/index_ad.css" type="text/css"/>  
    <link rel="stylesheet" href="${path }/css/smartMenu.css" type="text/css"/>  
    <script src="${path }/js/jquery.js" type="text/javascript"></script>    
    <script type="text/javascript" src="${path }/js/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript" src="${path }/js/jquery.ztree.core.min.js"></script>
    <script type="text/javascript" src="${path }/js/jquery-smartMenu.js"></script>
    <script type="text/javascript" src="${path }/js/jquery.tjpdrag.js"></script>
	<style type="text/css"> 
		.tright .icon-cguanliyuan:before{padding-right: 0;}
 	</style>
</head>
<body onselectstart="return false;" >
    <div class="top">
    	<div class='tleft ring-hover'>
    		<div class="slogan" >
	    		<ul>
					<li ><a target="_blank" href="http://${YUMING}">${GGY}</a></li>
					<li ><a target="_blank" href="http://${YUMING}">${GGY2}</a></li>
		   			<li style="font-size:13px"><a target="_blank" href="http://${YUMING}">官网: ${YUMING }</a></li>
	    		</ul>
    		</div>
    	</div>
    	<div class='tright'>
    		<a class="icon-qian1" title="捐赠作者" href="${path}/jz.dhtml" target="_blank">捐赠作者</a>
    		<a class="icon-shouye" href="${path}/" target="_blank">前台首页</a>
    		<span class="icon-cguanliyuan" title="${ses_ssousr.nc}" style="margin-right:0px"></span>
    		<span class=" nicheng" <c:if test="${wdxxs>0}">style="margin-right:0"</c:if> title="${ses_ssousr.nc}">${ses_ssousr.nc}</span>
   			<c:if test="${wdxxs>0 }"><span class="nav-counter" title="${wdxxs}条未读消息" >${wdxxs}</span></c:if>
    		<a href="javascript:" onclick="fn_adtc()" class="icon-tuichu " style="float:right" target="_blank">退出</a> 
    	</div>
    </div>
	
	<div class="center">
		<div class="left" onselectstart="return false" >
			<div class="lhdr">功能菜单</div>
			<div class="lmnu">
				<ul>
					<li>
						<div class="biaoti">个人资料<span></span></div>
						<div class="caidan" style="" id="">
							<div class="cdinner">
								<ul id="treeDemo" class="ztree" ></ul>
							</div>
						</div>
					</li>
					<li>
						<div class="biaoti">栏目内容<span></span></div>
						<div class="caidan" style="" id="">
							<div class="cdinner">
								<ul id="lanmutree" class="ztree" ></ul>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<div class="right" >
				<div class="tab" onselectstart="return false">
					<ul style="position: relative;">
						<li class="tab_sel" id="tab_li_0">
							<a>我的主页</a>
							<div class="l-tab-links-item-right"></div>
							<div class="l-tab-links-item-left"></div>
							<div class="l-tab-links-item-close rotate-hover hide"></div>
						</li>
					</ul>
				</div>
				<div class="content">
					<div class='bigload'></div>
				</div>
		</div>
	</div>
    
    <div class='btm'>
    	©<%= 2016==Calendar.getInstance().get(Calendar.YEAR)?"2016":"2016-"+Calendar.getInstance().get(Calendar.YEAR)%> <a target="_blank" href='http://${YUMING }' class="wzmcbtm">${YUMING }</a> All Rights Reserved.
    </div>
    
    <script src="${path}/layer/layer.js"></script>
    <script type="text/javascript">
    	//TAB项上的右键菜单
		var imageMenuData = [
	   	 	[
		   	 	{
		        	text: "关闭当前",
		        	func:function(){if ($(this).attr("id")!='tab_li_0') $(this).children(".l-tab-links-item-close").trigger('click')},
		        	gray:function(){return $(this).attr("id")=='tab_li_0';}
			    },{
		        	text: "关闭左侧",
		        	func: function(){closeTablis($(this), $(this).prevUntil("#tab_li_0", "li"), true)},
		        	gray:function(){return $(this).index()<2}
			    }, {
			        text: "关闭右侧",
			        func: function(){	closeTablis($(this), $(this).nextUntil(".content", "li"), $(this).attr("id")=='tab_li_0')},
			        gray:function(){return $(this).index()>= $(this).siblings().size();}
			    }, {
			        text: "关闭其他",
			        func: function(){closeTablis($(this), $(this).siblings(), true)},
			        gray:function(){return ($(this).attr("id")=='tab_li_0' && $(this).siblings().size()==0) || ($(this).attr("id")!='tab_li_0' && $(this).siblings().size()==1)}
			    }
		    ],
		    [
			    {
			        text: "刷新",
			        func: function() {
			        	if ($(this).attr("id")!='tab_li_0'){
				        	//$("#"+$(this).data("ltselid")).trigger('click') 不是所有的都有ltselid
				        		var eifm = $("."+$(this).attr("id"));
				        	eifm.attr("src", eifm.attr("src"));
			        	}else{//是我的主页标签
			        		$(".tab_li_0").attr("src", encodeURI(encodeURI('welcome.dhtml')))
			        		$("#tab_li_0").trigger('click') 
			        	}
			        }
			    }
		    ]
		];

		//右键关闭TAB项
		function closeTablis(tag, jihe, showcur){
        	//其他兄弟节点都删掉
            jihe.each(function(){
				var id = $(this).attr("id")
				if (id=='tab_li_0') return true;
				$(this).animate({width:0},500,function(){$(this).remove()});
				$("."+id).remove()
            })
            //显示当前的
			if (showcur){
				tag.addClass('tab_sel')
				$("."+tag.attr("id")).show();
				leftlmtreesel(tag.attr("id"), tag.data("ltselid"))
			}
		}

		//重新调整布局
    		function layout(){
    		var w = $(window).width()
			var ch = $(window).height()-59-4//top31，btm28，center的上边距4
			$(".center").height(ch);
			$(".left,.right").height(ch-2);//上下边框2像素
			$(".right").width(w*0.994-218);//left宽度是212,左和右的间隔是4像素，右边框2像素
			$(".content").height(ch-2-26);//减去上下边框和tab的高度
			var maxh = ch-2-26-26-$(".lmnu>ul>li:not(:last)").height()-6;//26是功能菜单的高度,26是自己那个区的标题高度，6是margin
			$("#lanmutree").parent().css('max-height',maxh);
			if (!$.support.leadingWhitespace)$("#lanmutree").parent().height(maxh);//IE6-8，max-height有点问题
    	}

    	//点击树的节点
    		function zTreeOnClick(event, treeId, treeNode){
    		if (treeNode.lmlj=='' || treeNode.lmlj==null){
    			return;
    		}
    		
    		//如果已经有了直接打开
    			var found= false;
    		var w=0;
    		$(".tab>ul>li").each(function(d){
    			$(this).removeClass("tab_sel")
    			w += $(this)[0].offsetWidth+2;
    			if (!found && $(this).attr("id")=="tab_li_"+treeNode.id){//如果已经有了，要重新刷新一下，因为这边点的是菜单
    				found = true;
    				$(this).data("ltselid", $(".curSelectedNode").attr("id")).addClass("tab_sel")
    				$("."+$(this).attr("id")).remove();
    				loadiFrame(treeNode.lmlj, treeNode.id,treeNode.para);
    			}
    		})
    		if (!found){//还没打开过
				$(".tab>ul>li:eq(0)").after($(".tab>ul>li:first").clone(true))
	    		$(".tab>ul>li:eq(1)").data("ltselid", $(".curSelectedNode").attr("id")).addClass("tab_sel").attr("id", "tab_li_"+treeNode.id)
	    			.children().first().text(treeNode.name).parent().children(".l-tab-links-item-close").removeClass("hide").show()
	    		$(".tab>ul>li:eq(1)").smartMenu(imageMenuData);
	    		w += $(".tab>ul>li:eq(1)")[0].offsetWidth+2;
	    		loadiFrame(treeNode.lmlj, treeNode.id,treeNode.para);

	    		 //如果所有tab页的总长度超过了tab条的长度，则把最后的删掉
				var wtab = $(".tab").width()
				while (w > wtab){
					e = $(".tab>ul>li:last")
					w -= e[0].offsetWidth-2
					$("."+e.attr("id")).remove();//对应的iframe也删掉
					e.remove()
				}
    		}
    	}

		//根据栏目src直接加载iframe
		function loadiFrame(lanmu, id, para){
			if (!lanmu){
				
			}else{
				$(".content>iframe").hide();
				$(".bigload").show();
				var iframe = $("<iframe>");
			    iframe.load(function(){
			        //$(window.frames["nm_frm_"+lanmu+id].document.body).find(".content").height(iframe.height()-25)//25是bread的高度
			        $(window.frames["nm_frm_"+lanmu+id].document).click(function(){$.smartMenu.remove()})//隐藏右键菜单
			        $(window.frames["nm_frm_"+lanmu+id].document).mousemove(function(){$.tjpDrag.cureReturn()})
			        var doURL = $(this)[0].contentWindow.document.URL;
 			        $(window.frames["nm_frm_"+lanmu+id].document.body).append("<script>if ('"+doURL+"'.substr(-8,8)=='/alitjp/'"
 			        	+"&& window.top!=null){window.top.location= '/alitjp/'}<\/script>");
			        $(".bigload").hide();
			        iframe.show();
			    })
				iframe.addClass("riframe tab_li_"+id)
				iframe.attr("frameborder", 0)
				iframe.attr("src", encodeURI(encodeURI(lanmu+'.dhtml'+(para?"?"+para:''))))//中文乱码
				iframe.attr("name", "nm_frm_"+lanmu+id)
				$(".content").append(iframe);
			}
		}

		//写两次的原因，其实我也不明白，反正两次调整的效果就对了，一次不行哦
		window.onresize=function(){
			layout();layout();
		}

		function leftlmtreesel(id,ltselid){
			if (!ltselid) return;

  			$(".lmnu .ztree .node_name").parent().removeClass("curSelectedNode")
   			if (id!="tab_li_0"){//点击TAB后左侧菜单选中和定位
   				$("#"+ltselid).addClass("curSelectedNode")
   				var gt = $("#"+ltselid).position().top
   				var cdinner = $("#"+ltselid).parents(".cdinner")
   				cdinner.scrollTop(gt-2)
   			}
		}

		//子窗口调用来刷新未读消息数
		function refreshWdxx(c){
			var wdcnt = parseInt($(".nav-counter").text())
			if (!isNaN(wdcnt)){
				wdcnt-=c;
				$(".nav-counter").text(wdcnt)
				if (wdcnt<=0) {
					$(".nav-counter").remove();
					$(".icon-cguanliyuan").css("margin-right", "10px")
				}
			}
		}

		$(function (){
			//点击未读消息徽章
			$(".nav-counter").click(function(){
				zTreeOnClick(null,null,{id:10000, name:"未读消息", lmlj:"wdxx"})
			})

			//TAB项的右键菜单
			$(".tab>ul>li").smartMenu(imageMenuData);
			$(".tab>ul>li").tjpDrag({ fixids:['tab_li_0'] });
				
			//滚动广告
			jQuery(".top").slide({mainCell:".tleft ul",autoPlay:true,effect:"leftMarquee",vis:1,interTime:50,trigger:"click"});

			//左侧菜单折叠和hover
			$(".lmnu>ul>li>.biaoti").click(function(index){
				$(this).children("span").css("background","url('${path}/img/liger/togglebar.gif') no-repeat 0 "+($(this).next().is(":visible")?" 0": "-40px"))
				$(this).next("div").slideToggle("normal", function(){
					//$(this).prev().children("span").css("background","url('${path}/img/liger/togglebar.gif') no-repeat 0 "+($(this).is(":visible")?" -40px": "0"))
				});
				layout();
			})
			$(".lmnu>ul>li>.biaoti>span").hover(
				function(index){
					$(this).css("background","url('${path}/img/liger/togglebar.gif') no-repeat 0 "+($(this).parent().next().is(":visible")?"-60px": "-20px"))
				},
				function(index){
					$(this).css("background","url('${path}/img/liger/togglebar.gif') no-repeat 0 "+($(this).parent().next().is(":visible")?" -40px": "0px"))
				}
			)

			//点击TAB项
    		$(".tab>ul>li").click(function(e){
    			$.smartMenu.remove();
    			var id = $(this).attr("id")
    			leftlmtreesel(id,$(this).data("ltselid"))
    			$(this).siblings().removeClass("tab_sel");
    			$(this).addClass("tab_sel");
    			$(".content>iframe").hide();
    			$("."+id).show();
    			e.stopPropagation()
    		})

    		//关闭TAB
    		$(".l-tab-links-item-close").click(function(e){
    			var par = $(this).parent()
    			var id = par.attr("id")
    			if (id=='tab_li_0') {
    				$(this).hide()
    				return;
    			}
    			
    			if (par.attr('class').indexOf('tab_sel') != -1){//该项是选中的，需要切换到下一个选中页面，左侧菜单的选中也要变
 		    		par.remove()
	    			$("."+id).remove();
    				var fst = ($(".tab>ul>li").size()==1) ? $(".tab>ul>li:first"):$(".tab>ul>li:eq(1)")
    				fst.addClass('tab_sel')
    				$("."+fst.attr("id")).show();
    				leftlmtreesel(fst.attr("id"), fst.data("ltselid"))
    			}else{//不是选中的直接删除掉就可以了
		    		par.remove()
	    			$("."+id).remove();
    			}
				e.stopPropagation()
    		})

    		//部分元素的布局调整
    		loadiFrame('welcome', 0);//加载右侧iframe
			$('.lmnu>ul').children('li:last-child').children(".caidan").addClass('cd_btn_bdr');//最后一个菜单底部加个边框

			//左侧菜单数据
			var setting = {
				callback: {
					onClick: zTreeOnClick,
					beforeClick:changeLeftSel,
					onExpand: leftTreeExColl, 
					onCollapse: leftTreeExColl,
					beforeCollapse: zTreeBeforeCollapse,
					beforeExpand: zTreeBeforeCollapse
				}
			};
			var zNodes =[
				{lmlj:'xgmm', id:-1,name:"修改密码"},
				{lmlj:'xgtx',id:-2, name:"修改头像"},
				{lmlj:'xgnc',id:-3, name:"修改昵称"},
			];
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);

    		loadLmTree();
    		layout();layout();
		});

		function zTreeBeforeCollapse(treeId, treeNode){
			//console.log(1)
		}

		function leftTreeExColl(e, treeId, treeNode){
			layout();layout();
		}

		//加载左侧栏目内容的树
		function loadLmTree(){
			$.ajax({
		          type:"POST",
		          url:"getlmtree.dhtml",
		          data:{selid:1},
		          datatype: "json",
		          success:function(json){
						var setting = {
							data: {simpleData: {enable: true}},
							callback: {
								onClick: zTreeOnClklm,
								beforeClick:changeLeftSel
							}
						};
						var data = eval("("+json+")")
		          		treeObj = $.fn.zTree.init($("#lanmutree"), setting, data.all);
		          },
		          error: function(){
					layer.alert('栏目获取失败，请刷新重试！', { icon:2, title:'错误'});
		          }         
			});
		}

		function changeLeftSel(treeId,treeNode){
			var treeObj = $.fn.zTree.getZTreeObj(treeId);
			if (treeNode.lmlj=='' || treeNode.lmlj==null) {
				//treeObj.expandNode(treeNode);
				return;
			}

			//alert($(".ztree>li a[class*='level']").length)这样写也行
			$(".lmnu .ztree .node_name").parent().removeClass("curSelectedNode")
	        treeObj.selectNode(treeNode);
		}

		//获取某个节点下的所有子节点
		function getAllYeziNodes(treeNode, yeziarr) {
			if (treeNode.isParent) {
				var childrenNodes = treeNode.children;//加var代表是局部变量
				if (childrenNodes) {
					for (var x = 0; x < childrenNodes.length; x++) {//加var代表是局部变量
						if (childrenNodes[x].isParent) {
							getAllYeziNodes(childrenNodes[x], yeziarr);
						} else {
							yeziarr.push(childrenNodes[x])
						}
					}
				}
			}
			
			return;
		}

		//点击栏目内容的树节点
		function zTreeOnClklm(event, treeId, treeNode) {
		
			if ("zhixianshi" == treeNode.lxpy){
				window.open(treeNode.lj,"_blank")
				return;
			}

			var treeObj = $.fn.zTree.getZTreeObj(treeId);
			treeNode.para = "___lmmc=" + treeNode.name+ "&___lxpy=" + treeNode.lxpy
			var yeziarr = []
			
			treeNode.lmlj = treeNode.lxpy;
			if ("fulanmu_zi" == treeNode.lxpy){
				var childrenNodes = treeNode.children;//直接子节点
				if (childrenNodes) {
					for (var x = 0; x < childrenNodes.length; x++) {
						treeNode.para += "&___cid="+ childrenNodes[x].id
					}
				}
			}else if ("fulanmu_nr" == treeNode.lxpy){//如果点击节点的类型fulanmu_nr，则显示该父栏目下所有子栏目的内容
				getAllYeziNodes(treeNode,yeziarr)//所有子节点
				if (yeziarr.length>0) {
					for (var i = 0; i < yeziarr.length; i++) {
						treeNode.para += "&___cid="+ yeziarr[i].id
					}
				} else {//没有子节点
					treeNode.para += "&___cid=" + treeNode.id
				}
				if (yeziarr.length>0) treeNode.lmlj = yeziarr[0].lxpy
			}else{
				treeNode.para += "&___cid=" + treeNode.id
			}
			zTreeOnClick(event, treeId, treeNode);
		}

		//退出登录
		function fn_adtc(tag){
			$.ajax({
				type:"POST",
				url:"aj_qt_tuichu.dhtml",
				datatype: "text",
				beforeSend:function(){layer.msg('退出中，请稍后......', {time:-1,icon: 16,shade: 0.3, scrollbar:false});},  
				success:function(data){
					//畅言同步退出
					var img = new Image();
					img.src='http://changyan.sohu.com/api/2/logout?client_id=cysHEHjOS';
					layer.closeAll();
					location.href = "${path}/";
				},
				error: function(){
					layer.alert('网络阻塞，请重试！', { icon:2, title:'错误'});
				}         
			});
		}
		
		//刷新昵称
		function sxnc(nc,tx){
			$(".nicheng").text(nc).attr("title", nc)
		}
	</script> 
</body>
</html>

