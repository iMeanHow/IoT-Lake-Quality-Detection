<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% request.setAttribute("path", request.getContextPath());%>

<!doctype html>
<html>
<head>

<%@ include file="inc/meta.jsp"%>
<title>天津滨海工业云水质监测预警系统 - ${title}</title>

<script type="text/javascript" src="http://api.map.baidu.com/getscript?v=3.0&ak=puoGGFRBK3jwtwo6BD3bZfDv4uXg3Gyj"></script>

<style>
	.sycontent{padding-top:0 !important;
	}
	.list{width: 100%;max-width: 100%;border-collapse: collapse;border-spacing: 0;}
	.list th {
	    vertical-align: bottom;text-align: center;
	    padding: 10px;font-size: 15px;
	    background-color: #5F9EDF; color: #fff;
	}
	.list td {
	    padding: 8px;text-align: center;
	    vertical-align: top;border-right: 1px solid #ccc;font-size: 13px;
	}
	.list a{color: #428bca !important;text-decoration: none;}
	.list a:hover{color:#2a6496 !important}
	.outtbl{-webkit-border-radius: 6px;overflow: hidden;
	-moz-border-radius: 6px;width: 90%;margin: 0 auto;
	border-radius: 6px;;border: 1px solid #ccc;margin-bottom: 10px;margin-top: 20px;}
	.shua{margin-bottom: 15px;    
		background-image: -moz-linear-gradient(#fff 0%, #f8f8f8 100%);
		background-image: -o-linear-gradient(#fff 0%, #f8f8f8 100%);
		background-image: -webkit-linear-gradient(#fff 0%, #f8f8f8 100%);
		background-image: linear-gradient(#fff 0%, #f8f8f8 100%);
	    background-repeat: repeat-x;    background-color: #f8f8f8;
    	color: #5e5e5e;    border: 1px solid #e7e7e7;
	    border-radius: 4px;width: 90%;margin: 0 auto;
	    -webkit-box-shadow: inset 0 1px 0 rgba(255,255,255,.15),0 1px 5px rgba(0,0,0,.075);
	    box-shadow: inset 0 1px 0 rgba(255,255,255,.15),0 1px 5px rgba(0,0,0,.075);margin-top: 40px !important;
	}
	.huac{padding: 15px;text-align: justify;font-size: 14px;text-indent: 2em;line-height: 1.5;}
</style>

</head>
<body>
	<%@ include file="inc/head.jsp"%>
	
	<div class="sycontent">
		<%@ include file="inc/bread.jsp"%>
		
			<div id="container" style="margin-top:-20px;height:535px"></div>  
		
		
		<div class="outtbl">
			<table class="list" >
				<thead>
					<tr>

						<th>设备编号</th>
						<th>PH值</th>
						<th>含氧量</th>
						<th>Rate</th>
						<th style="width:20%;">时间</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${lst}" var="t" varStatus="sta">
						<tr style="background-color: #fefefe;">
							<td><a target="_blank" onclick="fn_cs(this)" >${t.Node_ID}</a></td>
							<td>${t.PH}</td>
							<td>${t.Oxy}</td>
							<td>${t.Rate}</td>
							<td>${t.Time}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
			<div class="pagin">
				<span class="fymsg">共<i>${recTotal}</i>条记录，每页<i>${perPage}</i>条，共<i>${pgTotal }</i>页</span>
				<div id="fenye"></div>
			</div>
	</div>
	
	
	
	<script src="${path}/layer/layer.js"></script>
	<script src="${path}/laypage/laypage.js"></script>
	<script>
		laypage({
			cont : 'fenye',
			skip : true,
			groups : 5,
			pages :${pgTotal},
			curr: function(){ //通过url获取当前页，也可以同上（pages）方式获取
			  var page = location.search.match(/pg=(\d+)/);
			  return page ? page[1] : 1;
			}(), 
			jump : function(e, first) {
			    if(!first){
			      location.href = '?pg='+e.curr;
			    }
			}
		})

		function fn_cs(tag){
			var ecs = $(tag).parent().next();
			ecs.text(parseInt(ecs.text())+1)
		}

		$(function() {
			$(".list>tbody>tr:odd").css("background", "#eaf3f5")
		})
	</script>

<script type="text/javascript"> 
 var map = new BMap.Map("container");
var point = new BMap.Point(117.532907,39.131421);
map.centerAndZoom(point, 15);
map.addControl(new BMap.NavigationControl());


 <c:forEach items="${lstequip}" var="c" varStatus="st">
		var point_tmp = new BMap.Point(${c.Location_X},${c.Location_Y});
		var marker = new BMap.Marker(point_tmp); 
		var point_x;
		var point_y;
		/*marker.addEventListener("click",function(){
			var markerpoint=this.getPosition();
		point_x=markerpoint.lng;point_y=markerpoint.lat;
		 <c:forEach items="${lst}" var="c" varStatus="st">
		 if(point_x==${c.Location_X}&&point_y==${c.Location_Y})
	   		 window.location.href="Equip_Inf?Node=${c.Node_ID}";
		</c:forEach>
		});	*/
		map.addOverlay(marker);
</c:forEach>

</script>
</body>
</html>

