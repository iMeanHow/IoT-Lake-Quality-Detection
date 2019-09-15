<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% request.setAttribute("path", request.getContextPath());%>

<!doctype html>
<html>
<head>

<%@ include file="inc/meta.jsp"%>
<title>天津滨海工业云水质监测预警系统 - ${title}</title>

<script src="http://img.hcharts.cn/jquery/jquery-1.8.3.min.js"></script>
<script src="http://img.hcharts.cn/highcharts/highcharts.js"></script>
<script src="http://img.hcharts.cn/highcharts/modules/exporting.js"></script>
<script src="http://img.hcharts.cn/highcharts/modules/oldie.js"></script>
<script src="http://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>

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
		
					
			
		
		
		<div class="outtbl">
			
			<div class="col-md-12 col-xs-12 col-sm-12 col-lg-12" style="margin-top: 10px;">
							选择设备：
							<select id="stationSelect" name="stationSelect" style="width:155px">
								<!-- <option value=""></option> -->
								<c:forEach items="${lstequip}" var="t" varStatus="sta">
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
	

<script>

var chart = null;
//$.getJSON('fordata.dhtml?stationSelect='+$("#stationSelect  option:selected").val(), function (data) {
function fn_data(){
	$.ajax({
				type:"POST",
				url:'fordata6.dhtml?stationSelect='+$("#stationSelect  option:selected").val(),
				
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

