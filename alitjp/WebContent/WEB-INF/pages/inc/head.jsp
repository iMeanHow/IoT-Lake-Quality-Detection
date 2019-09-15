<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<link rel="stylesheet" href="${path}/css/index.css">
<script type="text/javascript" src="${path}/js/jquery.js"></script>
<script type="text/javascript" src="${path}/js/cmn.js"></script>
<script type="text/javascript" src="${path}/js/template.js"></script>


<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Custom Theme files -->


<style>




.icon-peach:before{font-size: 60px;}
.ring-hover {-webkit-animation: 1s ease;-moz-animation: 1s ease;-ms-animation: 1s ease;animation: 1s ease;}
.ring-hover:hover {-webkit-animation-name: a-ring;-moz-animation-name: a-ring;-ms-animation-name: a-ring;animation-name: a-ring;}
@-webkit-keyframes a-ring {0% {-webkit-transform: scale(1);}10%,20% {-webkit-transform: scale(0.9) rotate(-3deg);}30%,50%,70%,90% 
{-webkit-transform: scale(1.1) rotate(3deg);}40%,60%,80% {-webkit-transform: scale(1.1) rotate(-3deg);}100% {-webkit-transform: scale(1) rotate(0);}}
@-moz-keyframes a-ring {0% {-moz-transform: scale(1);}10%,20% {-moz-transform: scale(0.9) rotate(-3deg);}30%,50%,70%,90% {-moz-transform: scale(1.1) 
rotate(3deg);}40%,60%,80% {-moz-transform: scale(1.1) rotate(-3deg);}100% {-moz-transform: scale(1) rotate(0);}}
@-ms-keyframes a-ring {0% {-ms-transform: scale(1);}10%,20% {-ms-transform: scale(0.9) rotate(-3deg);}30%,50%,70%,90% {
-ms-transform: scale(1.1) rotate(3deg);}40%,60%,80% {-ms-transform: scale(1.1) rotate(-3deg);}100% {-ms-transform: scale(1) rotate(0);}}
@keyframes a-ring {0% {transform: scale(1);}10%,20% {transform: scale(0.9) rotate(-3deg);}30%,50%,70%,90% {transform: scale(1.1) rotate(3deg);}
40%,60%,80% {transform: scale(1.1) rotate(-3deg);}100% {transform: scale(1) rotate(0);}}
.slogan{font-size: 34px;vertical-align: top;position: absolute;left:360px;color:rgb(21,123,195);
text-shadow :  rgba(200,200,200,1) 3px 3px 20px;font-family: '幼圆','Microsoft YaHei';
}
.nav{height: 45px;line-height: 45px;background: rgb(21,123,195);border-radius:2px;
   -webkit-box-shadow: 0 4px 8px rgba(0, 0, 0, .175);width: 100%;
    box-shadow: 0 4px 8px rgba(0, 0, 0, .175);z-index: 100;position: relative;
    margin-left: auto;
	margin-right: auto;
}
.nav>li{position: relative;float: left;width: 300px; text-align: center;background: url() no-repeat right top;}
.nav>li>a{text-decoration: none;color:white;width: 100%;display: block;font-size: 17px;font-weight: bold;}
.nav>li>a:hover,.nav>ul >li>a.cur{color: #fff !important;background:url() no-repeat;}

.nav>ul >li{position: relative;float: left;width: 111px;text-align: center;background: url("data:image/jpg;base64,/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAABkAAD/4QPiaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjMtYzAxMSA2Ni4xNDU2NjEsIDIwMTIvMDIvMDYtMTQ6NTY6MjcgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcFJpZ2h0cz0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3JpZ2h0cy8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bXBSaWdodHM6TWFya2VkPSJGYWxzZSIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJhZG9iZTpkb2NpZDpwaG90b3Nob3A6N2FiY2EzMTQtYWQ5OS0xMWUzLWIxNDUtODE4MzNlYWQ1ZTlkIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkYzNEZFNzZEMTM0QTExRTRBMjY4Q0JDODVCN0Y4QTI2IiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkYzNEZFNzZDMTM0QTExRTRBMjY4Q0JDODVCN0Y4QTI2IiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDUzYgKFdpbmRvd3MpIj4gPHhtcE1NOkRlcml2ZWRGcm9tIHN0UmVmOmluc3RhbmNlSUQ9InhtcC5paWQ6QzJDOUFBRTIzODEzRTQxMUI0MThBMTQwRkMwMEM3QTAiIHN0UmVmOmRvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDo3YWJjYTMxNC1hZDk5LTExZTMtYjE0NS04MTgzM2VhZDVlOWQiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7/7gAOQWRvYmUAZMAAAAAB/9sAhAABAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAgICAgICAgICAgIDAwMDAwMDAwMDAQEBAQEBAQIBAQICAgECAgMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwP/wAARCAAsAAMDAREAAhEBAxEB/8QAeAAAAgMAAAAAAAAAAAAAAAAAAAQDBQgBAAEFAAAAAAAAAAAAAAAAAAQBAgMFCRAAAAIHBAgHAAAAAAAAAAAAERMAITFBEhQVkQIislFhcTKCkiQ1VWUWJkY3hxEAAgICAgMAAAAAAAAAAAAAABEBEqGkIaITo7P/2gAMAwEAAhEDEQA/AMWl3giBUBnDGWPMpNqnBhqi2Lu0uZ8nMF0Xq+laBaprbEFvHuRJSerJA9omPoYi/wC7pbIrYlfad1BdY12Hxol9CZ+sT+XEkvhnbsNv8EJn9EWrtxAL8fmrXpZ0jLBHPUQxQvCHXum2BGjxOcH/2Q==") no-repeat right top;}
.nav>ul >li>a{text-decoration: none;color:white;width: 100%;display: block;font-size: 17px;font-weight: bold;}
.nav>ul >li>a:hover,.nav>ul >li>a.cur{color: #fff !important;background:url(${path}/images/nav_19.jpg) no-repeat;}
.downward{
    display: inline-block;
    width: 0;position: absolute;top:22px;
    height: 0;
    vertical-align: middle;
    border-top: 4px solid;
    border-right: 4px solid transparent;
    border-left: 4px solid transparent;margin-left: 2px;
}
.rightward {
    display: inline-block;
    width: 0;
    height: 0;
    margin-left: 2px;
    vertical-align: middle;
    border-left: 4px solid;
    border-top: 4px solid transparent;
    border-bottom: 4px solid transparent;
}
.sub1,.sub2{
	position: absolute;z-index:2;
	border-radius:0 0 4px 4px;
   -webkit-box-shadow: 0 5px 12px rgba(0, 0, 0, .3);    border: 1px solid #a9a9a9;
    box-shadow: 0 5px 12px rgba(0, 0, 0, .3);
    display:none;background:rgb(255,250,250) /* rgb(52,140,204); */
}
.sub1 li{   position: relative;}
.sub1 li,.sub2 li{     border-bottom: 1px solid #e4e4e4;width: 109px;}
.sub2{position: absolute;left:100%;top:-1px}
.sub1 a,.sub2 a{
	color:#247eab;display: block;height: 37px;line-height: 37px;text-decoration: none;
}
.sub1 a:hover{
	background:#ffaa31;color:white
}
.ring-hover{position: absolute;}
.nvfix{position: fixed;width: 100%;}
.top0{top:0 !important}
.icsycls{color:#A52A2A;letter-spacing:0px;margin-right: 5px;float: left;}
#id_span_zcdl{float: left;margin-left: 3px;}
.icsycls:before, .icon-cguanliyuan:before,.icon-tuichu:before{color: rgb(21,123,195);    margin-right: 2px;font-size: 18px;}
.icon-cguanliyuan:before{font-size: 15px;margin-left: 12px;}
.bread{
    padding: 8px 15px;
    margin-bottom: 20px !important;
    list-style: none;
    background-color: #f5f5f5;
    border-radius: 4px;border-bottom: 1px solid #eee;
}
.bread a{color: #428bca;text-decoration: none;}
.bread li{display:inline-block;}
.bread>ul>li+li:before {    padding: 0 5px; color: #ccc;content: "/\00a0";}
.brdsy:before {position: relative;top: -1px;}
.pagin{position: relative;width: 90%;margin: 0 auto 30px;}
.fymsg{display: inline-block;padding: 1px;font-size: 12px;}
#fenye{position: absolute;right:0;display: inline-block;padding-top: 4px;}
.laypage_btn{font-family: 'Microsoft YaHei';}
.fymsg i {
    color: #056dae;
    font-style: normal;
    font-weight: bold;
    padding: 0 2px;
}
.nav1k{display: none;}
#usrshenfen{font-size: 13px;}

.icon-zhuce1:before { content: "\e660"; color: rgb(21,123,195);    margin-right: 2px;margin-left: 12px;font-size: 19px;}
.icon-mimadenglu:before { content: "\e6ab"; color: rgb(21,123,195);   font-size: 20px;}
.icon-cguanliyuan:before{margin-right: 0 !important; margin-left: 8px !important;}

.ulhead {float:right;

}
.liheadhome{float:left;}


</style>
<div class="head">


<!-- top-nav -->
	
	<!-- //top-nav -->
	<div class="">
		
	</div>
	<div class="nav" onselectstart="return false">
		<a href="javascript:" class="nav1k leftarr"></a>
		<a href="javascript:" class="nav1k rightarr"></a>
		 	
			 	<li class="liheadhome">
					<a href="${path}/" title="网站首页" >天津滨海工业云水质监测预警系统</a>
				</li> 
			
		<ul class="ulhead">
			
			
			<c:forEach items="${lms}" var="itm" varStatus="status">
				<li <c:if test="${status.index==fn:length(lms)-1}">style="background:none"</c:if>>
					<a href="${!empty(itm.url)?(itm.url):'javascript:'}" <c:if test="${itm.issel==1}">class="cur"</c:if>>
						${itm.name}
						<c:if test="${fn:length(itm.zlm)>0}"><span class="downward"></span></c:if>
					</a>
					<c:if test="${fn:length(itm.zlm)>0}">
						<ul class="sub1"  >
							<c:forEach items="${itm.zlm}" var="itm1" varStatus="status1">
								<li <c:if test="${status1.index==fn:length(itm.zlm)-1}">style="border:0"</c:if>>
									<a href="${!empty(itm1.url)?(itm1.url):'javascript:'}">
										${itm1.name}
										<c:if test="${fn:length(itm1.zlm)>0}"><span class="rightward"></span></c:if>
									</a>
									<c:if test="${fn:length(itm1.zlm)>0}">
										<ul class="sub2"  >
											<c:forEach items="${itm1.zlm}" var="itm2" varStatus="status2">
												<li >
													<a href="${itm2.url }">${itm2.name}</a>
												</li>
											</c:forEach>
										</ul>
									</c:if>
								</li>
							</c:forEach>
							
						</ul>
					</c:if>
				</li>
			</c:forEach>
			<li>
				<a href="http://47.104.201.250:8080/alitjp/htlgn/login.dhtml">系统后台</a>
			</li>
		</ul>
	</div> 
	
</div>




<script>
	//个人中心
	function fn_grzx(){
		location.href='${path}/g2grzx.dhtml'
	}
	
	//用户在个人网站退出时，畅言端也同步退出
	function fn_ssotc(){
		fn_ntp_aj('${path}/ssousr_tc.dhtml',null,function(){
			var img = new Image();
			img.src='http://changyan.sohu.com/api/2/logout?client_id=cysHEHjOS';
			location.reload();
		})
	}

	function fixNav(){
		if( $(document).scrollTop() >0 ){
			if ($('.nav').is(":animated")){//动画中
				
			}else{
				$('.nav').addClass('nvfix').animate({top:0},function(){
					//console.log("动画结束$(document).scrollTop()"+$(document).scrollTop())
					if ($(document).scrollTop()>0) $('.nav').addClass('top0')
					else $('.nav').removeClass('nvfix top0')
					$('.nav').removeAttr('style')
				})
			}
		}else{
			$('.nav').removeClass('nvfix').removeClass('top0').removeAttr('style')
		}
	}
	
	
	var mu_tmrid = null;
	function hideMenu(tt){
		if (tt){
			tt.siblings().find("ul").stop(false, true).hide();
			tt.find("ul").slideUp()
		}
	}

	$(function(){
		//获取登录状态
		$.ajax({
			type:"POST",
			url:"${path}/aj_getdls.dhtml",
			datatype: "JSON",
			success:function(json){
				var obj = eval("("+json+")");
				if (obj.nc){
					var html = template('sid_dl_yes', obj);
					$("#id_span_zcdl").empty().html(html);
					if (location.pathname=="/alitjp/" || location.pathname=="/alitjp/index.dhtml" ||  location.pathname=="/alitjp/static/index.html"){
						layer.tips('点击可进入【个人中心】', $(".shownc"), {tips : [ 1, '#3595CC' ], tjpcms_clscont:'touming50'});
					}
				}else{
					var html = template('sid_dl_no', {});
					$("#id_span_zcdl").empty().html(html)
					var zctipid=null;
					$("#id_top_zc").on("mouseover mouseout", function(event) {
						if (event.type == "mouseover") {
							zctipid = layer.tips('注册后可投稿、享受专属服务', $("#id_top_zc"), {tips : [ 1, '#3595CC' ]});
						} else if (event.type == "mouseout") {
							layer.close(zctipid)
						}
					})
				}

				if (obj.hds){
					$.each(obj.hds, function(idx,obj){
						if(obj.lx=='首页下载') $(".xzcnt").text(obj.cnt);
						else if (obj.lx=='首页点赞') $(".zancnt").text(obj.cnt).attr("title","累计赞"+obj.cnt+"次")
					})
				}
				
			},
			error: function(){
				layer.msg('获取登录状态失败，请刷新后重试！', { icon:2, title:'错误'});
			}
		});
		
	
		$("body").click(function(ev) {
			if ($(ev.target).parents(".nav").length <= 0) {
				$(".nav>ul li").children("ul").hide()
			}
		})

		if ($(window).width() > 1000) {
			//1. 动画未结束，直接消失
			//2. 动画已结束，默认速度上拉
			//3. 有其他下拉同时存在，200速度上拉
			//4. 左右反复移动，离开动画就消失，不动时正常拉出
			//5. 鼠标移出一秒内再移入不消失
			//等等
			$(".nav>ul li").hover(function() {
				clearInterval(mu_tmrid);
				mu_tmrid = null;
				var sbuls = $(this).siblings().children("ul");
				sbuls.stop(true, true);
				if ($(this).children("ul").hasClass("sub1")) {
					sbuls.slideUp(200)
					$(this).children("ul").slideDown()
				} else if (!$(this).children("ul").is(":visible")) {
					sbuls.hide()
					$(this).children("ul").show().css({
						width : 0
					}).animate({
						width : "100%"
					})
				}
			}, function() {
				var tt = $(this)
				if (tt.children("ul").is(":animated")) {
					tt.children("ul").hide()
				} else if (tt.children("ul").is(":visible")) {//已经显示出来了
					if (mu_tmrid == null) {
						if ($(this).children("ul").hasClass("sub2"))
							tt = $(this).parent().parent()
						mu_tmrid = setTimeout(function() {
							hideMenu(tt)
						}, 1000)
					}
				} else {

				}
			});

			$(".ring-hover").animate({top : 10}).animate({top : -7}).animate({top : 0})
			$(".slogan").animate({left : 64}).animate({left : 92}).animate({left : 80})
			$(window).on('scroll', function() {
				fixNav();
			});
			fixNav();
		} else {
			var c = parseInt($(window).width() / 80);
			$(".nav>ul>li:lt(" + (c) + ")").show()

			$("a").removeAttr("target");//手机上显示时，就不打开新窗口了

			$(".nav>ul li").click(function() {
				$(".sub1").hide()
				$(this).children("ul").show()
			})

			$(".leftarr").click(function() {
				if ($(".nav>ul>li:last").is(":visible")) {
					layer.msg("已到最后一项！")
					return;
				}
				$(".nav>ul>li:visible:first").animate({
					width : 0
				}, function() {
					$(".nav>ul>li:visible:last").next().show();
					$(this).hide();
				})
			})
			$(".rightarr").click(function() {
				if ($(".nav>ul>li:visible:first").index() == "0") {
					layer.msg("已到第一项！")
					return;
				}
				$(".nav>ul>li:visible:last").hide()
				$(".nav>ul>li:visible:first").prev().css({
					width : 0
				}).show().animate({
					width : 80
				})
			})

		}

	})
</script>