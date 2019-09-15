

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% request.setAttribute("path", request.getContextPath());%>

<!doctype html>
<html>
<head>
<title>天津滨海工业云水质监测预警系统</title>


<script type="text/javascript" src="http://api.map.baidu.com/getscript?v=3.0&ak=puoGGFRBK3jwtwo6BD3bZfDv4uXg3Gyj"></script>

<script src="http://img.hcharts.cn/jquery/jquery-1.8.3.min.js"></script>
<script src="http://img.hcharts.cn/highcharts/highcharts.js"></script>
<script src="http://img.hcharts.cn/highcharts/modules/exporting.js"></script>
<script src="http://img.hcharts.cn/highcharts/modules/oldie.js"></script>
<script src="http://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>


<!-- Custom Theme files -->


<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Custom Theme files -->
<link href="${path}/moban1490/css/bootstrap.css" type="text/css" rel="stylesheet" media="all">
<link href="${path}/moban1490/css/style.css" type="text/css" rel="stylesheet" media="all"> 
<!-- js -->
<script src="${path}/moban1490/js/jquery-2.2.3.min.js"></script> 
<!-- //js -->	
<!-- web-fonts -->
<link href='http://fonts.useso.com/css?family=Niconne' rel='stylesheet' type='text/css'>
<link href='http://fonts.useso.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<!-- //web-fonts -->  
<!-- font-awesome icons -->
<link href="${path}/moban1490/css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons --> 
<!-- start-smooth-scrolling -->
<script type="text/javascript" src="${path}/moban1490/js/move-top.js"></script>
<script type="text/javascript" src="${path}/moban1490/js/easing.js"></script>	
<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
		
		$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
			});
		});
</script>


<!-- //end-smooth-scrolling -->	


</head>
<body>
	<%@ include file="inc/head.jsp"%>
	
	<!-- top-nav 
	<div class="top-nav">
		<nav class="navbar navbar-default">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						Menu
					</button>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling 
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-center cl-effect-15">
						<li><a href="index.html" class="active">Home</a></li>
						<li><a href="about.html" data-hover="About"> About</a></li>					
						<li><a href="news.html" data-hover="News">News</a></li>
						<li><a href="portfolio.html" data-hover="Portfolio">Portfolio</a></li>
						<li><a href="codes.html"  data-hover="Codes">Codes</a></li>			
						<li><a href="contact.html" data-hover="Contact">Contact</a></li>
					</ul>	
					<div class="clearfix"> </div>
				</div>
			</div>	
		</nav>		
	</div>	
	 top-nav -->
	<!-- banner -->
	<div class="banner">
	<!--  <div class="map">
		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d343829.1271629402!2d-122.61489066225299!3d47.681214398164556!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x54906aba3648f20b%3A0xc5c4dedaafcead17!2sSeattle%2C+WA+98104!5e0!3m2!1sen!2sin!4v1461914461629"></iframe>
	</div>-->
		 <div class="banner-info">
			<div class="container">	 
				<div class="banner-text">
					<h1><a href="index.html"> 天津滨海工业云水质监测预警系统</a></h1>
					
					
				</div>
			</div>			
		</div> 		
	</div>			
	<!-- //banner -->
	<!-- welcome -->
	<div class="welcome"> 
		<div class="container">	 
			<h3 class="agileits-title">时事新闻</h3>
			<div class="welcome-row">
				
				<c:forEach items="${news}" var="t" varStatus="sta">
							
				<div class="col-md-3 welcome-grids welcome-grids2">
					
					<h6>${t.title}</h6>
					<p>${t.zy}</p>
				</div>
				
				</c:forEach>
				
				
				<div class="clearfix"> </div>
			</div>	 			
		</div>	 			
	</div>			
	<!-- //welcome -->
	
	
	<!-- services -->
	
	
	<div class="services"> 
		
		<div class="container">	 
			<h3 class="agileits-title">地图观测</h3>
			
			
				<div id="allmap" style="height:535px">
				</div>
			<div class="services-w3ls-row">
				  
				
			</div>	 			
		</div>	 			
	</div>			
	<!-- //services -->
	<!-- features -->
	<div class="features">
		<div class="container">
			<h3 class="agileits-title">历史数据</h3> 
			<p class="pagile-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt lorem sed velit fermentum lobortis. Fusce eu semper lacus, eget placerat mauris. Sed lectus tellus feugiat porttitor nulla. Sed porta magna vitae nisl vulputate lacinia. </p>
			<div class="features-row">
			<div class="col-md-12 col-xs-12 col-sm-12 col-lg-12" style="margin-top: 10px;">
					选择设备：
					<select id="stationSelect" name="stationSelect" style="width:155px">
						<!-- <option value=""></option> -->
						<c:forEach items="${lst}" var="t" varStatus="sta">
							<option value="${t.Node_ID}">${t.Node_ID}</option>
							
						</c:forEach>
					</select>
					
						
					<button id="searchStationDataButton" name="searchStationDataButton" class="btn btn-success btn-sm" onclick="fn_data()">
						<span class="glyphicon glyphicon-search"></span>
						查看数据
					</button>
				</div>
				<div id="tubiao" style="min-width:400px;height:400px"></div>
			</div>
		</div>
	</div>
	<!-- //features -->
	<!-- address 
	<div class="address">
		<div class="container">
			<ul>
				<li><i class="fa fa-map-marker" aria-hidden="true"></i></li>
				<li><i class="fa fa-phone" aria-hidden="true"></i>  </li>
				<li><i class="fa fa-envelope" aria-hidden="true"></i><a href="mailto:info@example.com"> mail@example.com</a></li>
			</ul>
		</div>
	</div> -->
	<!-- //address -->
	<!-- footer-icons -->
	
	<!-- //footer-icons -->
	<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="footer-left">
				<p>Copyright &copy; 2016.Company name All rights reserved.<a target="_blank" href=""></a></p>
			</div>
			<div class="footer-right"> 
				<h2><a href="index.html">天津滨海工业云水质监测预警系统</a></h2> 
			</div>
			<div class="clearfix"> </div>
		</div>
	</div>
	<!-- //footer -->
	<!-- smooth-scrolling-of-move-up -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
			var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
			};
			*/
			
			$().UItoTop({ easingType: 'easeOutQuart' });
			
		});
	</script>
	<!-- //smooth-scrolling-of-move-up -->  
	<!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${path}/moban1490/js/bootstrap.js"></script>
	
	
<script type="text/javascript">

 var map = new BMap.Map("allmap");
var point = new BMap.Point(117.532907,39.131421);
map.centerAndZoom(point, 15);
map.addControl(new BMap.NavigationControl());
//map.enableScrollWheelZoom(true);

<c:forEach items="${lst}" var="c" varStatus="st">
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
<script>

var chart = null;
//$.getJSON('fordata.dhtml?stationSelect='+$("#stationSelect  option:selected").val(), function (data) {
function fn_data(){
	$.ajax({
				type:"POST",
				url:'fordata.dhtml?stationSelect='+$("#stationSelect  option:selected").val(),
				
				//beforeSend:function(){layer.msg('登录中，请稍后......', {time:-1,icon: 16,shade: 0.3, scrollbar:false});},  
				success:function(data){
					//alert(data["test"]);
					chart = Highcharts.chart('tubiao', {
				        chart: {
				            zoomType: 'x'
				        },
				        title: {
				            text: '含氧量曲线'
				        },
				        subtitle: {
				            text: document.ontouchstart === undefined ?
				            '鼠标拖动可以进行缩放' : '手势操作进行缩放'
				        },
				        xAxis: {
				            type: 'datetime',
				            dateTimeLabelFormats: {
				                millisecond: '%H:%M:%S.%L',
				                second: '%H:%M:%S',
				                minute: '%H:%M',
				                hour: '%H:%M',
				                day: '%m-%d',
				                week: '%m-%d',
				                month: '%Y-%m',
				                year: '%Y'
				            }
				        },
				        tooltip: {
				            dateTimeLabelFormats: {
				                millisecond: '%H:%M:%S.%L',
				                second: '%H:%M:%S',
				                minute: '%H:%M',
				                hour: '%H:%M',
				                day: '%Y-%m-%d',
				                week: '%m-%d',
				                month: '%Y-%m',
				                year: '%Y'
				            }
				        },
				        yAxis: {
				            title: {
				                text: '含氧量'
				            }
				        },
				        legend: {
				            enabled: false
				        },
				        plotOptions: {
				            area: {
				                fillColor: {
				                    linearGradient: {
				                        x1: 0,
				                        y1: 0,
				                        x2: 0,
				                        y2: 1
				                    },
				                    stops: [
				                        [0, Highcharts.getOptions().colors[0]],
				                        [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
				                    ]
				                },
				                marker: {
				                    radius: 2
				                },
				                lineWidth: 1,
				                states: {
				                    hover: {
				                        lineWidth: 1
				                    }
				                },
				                threshold: null
				            }
				        },
				        series: [{
				            type: 'area',
				            name: '含氧量',
				            data: data["test"]
				        }]
				    });
				}
				       
			});
}


    
//});

</script>
	
</body>
</html>

