<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% request.setAttribute("path", request.getContextPath());%>

<!doctype html>
<html>
<head>

<%@ include file="inc/meta.jsp"%>
<title>天津滨海工业云水质监测预警系统 - ${title}</title>
<link rel="stylesheet" href="${path }/css/cssfwb.css" type="text/css"/>

<style>
#cyReward .cy-reward-btn {
    width: 134px;
    height: 49px;
    display: inline-block;
    background: url(${path}/images/tjpcms/juanz.png) no-repeat;
    border: 0;
    cursor: pointer;
}

#cyReward .cy-reward-btn:hover{
	background: url(${path}/images/tjpcms/juanz.png) no-repeat -134px 0;
}

#cyReward #cy-reward-pop .cy-close-btn {
            width: 11px;
            height: 10px;
            position: absolute;
            top: 17px;
            right: 14px;
            background: url('${path}/images/tjpcms/jz_close.jpg');
            cursor: pointer;
}

#cyReward #cy-reward-pop .cy-reward-title {
            width: 100%;
            height: 75px;
            text-align: center;
            line-height: 66px;
            color: #a3a3a3;
            font-size: 16px;
            background: url('${path}/images/tjpcms/jz_rewbg.jpg');
            font-family: 'Microsoft YaHei';
            margin-top: 7px;
}

#cyReward #cy-reward-pop .cy-reward-code {
            width: 130px;
            height: 130px;
            background: url('${path}/images/tjpcms/jz_cdbg.jpg');
            margin: 22px auto 0;
            padding: 17.5px;
            position: relative;
            box-sizing: content-box;
}

#cyReward #cy-reward-pop .platform-choice .platform-item .platform-radio-box {
            width: 16px;
            height: 16px;
            background: url('${path}/images/tjpcms/jz_rdo2.jpg');
            display: block;
            float: left;
            margin-top: 5px;
            margin-right: 14px;
}

#cyReward #cy-reward-pop .platform-choice .platform-item .platform-checked {
            background: url('${path}/images/tjpcms/jz_rdo1.jpg');
}

#cyReward #cy-reward-pop .platform-choice .alipay {
            background-image: url('${path}/images/tjpcms/jz_lx1.jpg');
}

#cyReward #cy-reward-pop .platform-choice .weichat {
            background-image: url('${path}/images/tjpcms/jz_lx2.jpg');
}

</style>

</head>

<body>
	<%@ include file="inc/head.jsp"%>
	<c:if test="${empty(needcy) }">
		<c:set var="needcy" value="1"/>
	</c:if>
	
	<div class="sycontent">
		<%@ include file="inc/bread.jsp"%>
		<div style="margin-bottom: 8px;">
			<div class="title">${jj.title}</div>
			<div class="subxx">
				<span style="margin-right: 15px;" class="yuedu icon-dazhongicon02"> 0次</span><c:if test="${needcy==1}"><a href="javascript:" class="cypara icon-partake" onclick="fn_pinglun()">
					<span id = "changyan_parti_unit" class="cy_cmt_participate" >0</span>人次
				</a>
				<a href="javascript:" class="cypara icon-pinglun" onclick="fn_pinglun()">
					<span id = "changyan_count_unit" class="cy_cmt_count">0</span>人
				</a></c:if>
				<span class="riqi icon-liulanjilu" title="更新日期${fn:substring(jj.gx,0,10) }"> ${fn:substring(jj.gx,0,10) }</span></div>
				<div class="jjnr" style="width: 70%;MARGIN-RIGHT: auto; MARGIN-LEFT: auto;">
					${jj.nr}
				</div>
		</div>
		
		
	</div>
	
	<!--  <%@ include file="inc/btm.jsp"%>-->
	
	
	<script type="text/javascript" src="http://assets.changyan.sohu.com/upload/plugins/plugins.count.js"></script>
</body>
</html>

