<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script>
$(function(){
	var cnt = parseInt('${fn:length(o.r.tbs)}')
	if (isNaN(cnt) || cnt<=0){
		$("#id_byyd").css({
			filter:"alpha(opacity='20')",
			opacity:'0.2',
			"-moz-opacity":'0.2',
			"-khtml-opacity":'0.2',
		})
	}else{
		$("#id_byyd").css({
			filter:"alpha(opacity='')",
			opacity:'',
			"-moz-opacity":'',
			"-khtml-opacity":'',
		})
	}
})

//本页已读
function fn_byyd(){
	var cnt = parseInt('${fn:length(o.r.tbs)}')
	if (isNaN(cnt) || cnt<=0){
		layer.msg('本页已无未读消息！')
	}else{
		fn_ntp_aj("aj_byyd.dhtml", {u:'${o.u}'}, 
			function(){
				parent.refreshWdxx('${fn:length(o.r.tbs)}');
				location.href='wdxx.dhtml';
			})
	}
}
</script>		
