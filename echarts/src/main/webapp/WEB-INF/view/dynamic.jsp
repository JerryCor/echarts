<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css' /> ">
	<script src="<c:url value='/resources/js/echarts.min.js' /> " ></script>
	<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.2.0.min.js' /> "></script>
	<script type="text/javascript" src="<c:url value='/resources/js/bootstrap.min.js' />" ></script>
</head>
<style>
	#dynamic{
		float:left;
		margin-left: 100px;
	}
	#gague{
		float:right;
		margin-right: 100px;
	}
</style>
<body>
	<div id="dynamic">
	<div id="main" style="width: 600px;height: 400px;"> </div>
	<script type="text/javascript">
		var myChart = echarts.init(document.getElementById("main"));
		var userNubs = ${userNubs};
		function randomData(userCount) {
		    now = new Date(+now + 60000);
		    value = userCount;
		    var hour = Math.round(Math.random() * 24);
		    var year=[now.getFullYear(), now.getMonth()+1, now.getDate()].join('/');
		    var mill = [now.getHours(),now.getMinutes()].join(':');
		    console.log(now.getMinutes());
		    console.log(now.getMinutes()<10);
		    if(now.getMinutes()<10){
		    	var mill = [now.getHours(),"0".concat(now.getMinutes())].join(':');
		    }else{
		    	var mill = [now.getHours(),now.getMinutes()].join(':');
		    	
		    }
		    var t = year.concat(" "+mill);
		    console.log(t);
		    return {
		        name: now.toString(),
		        value: [
		            t,
		            Math.round(value)
		        ]
		    }
		}
		// 初始化
		var data = [];
		var now = +new Date();
		var oneDay = 24 * 3600 * 1000; //一日的毫秒数
		var value = Math.random() * 1000;
		for (var i = 0; i < 5; i++) { 
		    data.push(randomData(userNubs));
		}

		var uCounts;
		var flag= false;
		setInterval(function () {
			var url ="http://localhost:8080/echarts/test/getdynamic";
			$.ajax({
				url:url,
				success:function(data){
					var dd = eval("("+data+")");
					console.log("success:" +dd.userCount);
					uCounts =dd.userCount;
					flag =true;
				},
				error:function(){
					console.log("error");
				}
			});
			if(flag == true){
			    for (var i = 0; i < 1; i++) { 
			    	data.shift();
			    	console.log("counts"+ uCounts)
			        data.push(randomData(uCounts));
			    }
			}
		    /* console.log(data[4].name);
			console.log(data[4].value); */
		    myChart.setOption({
		       title: {
		        text: '当前在线人数统计',
		        subtext: 'test',
		        x: 'center'
		    },
		    legend: {
		        data:['当前人数'],
		        x: 'left'
		    },
		    tooltip: {
		        trigger: 'axis',
		        formatter: function (params) {
		            params = params[0];
		            var date = new Date(params.name);
		            if(date.getMinutes()<10){
		    		var mills = [date.getHours(),"0".concat(date.getMinutes())].join(':');
		    		}else{
		    		var mills = [date.getHours(),date.getMinutes()].join(':');
		    	
				    }
		            return "当前人数: "+params.value[1]+"<br />当前时间: "+mills+"<br />当前年份: "+date.getFullYear() + '/' + (date.getMonth()) + '/' + date.getDate();
		        },
		        axisPointer: {
		            animation: false
		        }
		    },
		    xAxis: {
		    	name: "当前时间（时分秒）",
		    	nameLocation: 'middle',
		    	nameGap: 35,
		        type: 'time',
		        splitLine: {
		            show: true
		        }
		    },
		    yAxis: {
		    	name: '当前人数（人）',
		        type: 'value',
		        boundaryGap: [0, '100%'],
		        data:data[0],
		        splitLine: {
		            show: true
		        }
		    },
		    series: [{
		        name: '当前人数',
		        type: 'line',
		        showSymbol: true,
		        symbolSize: 20,
		        hoverAnimation: false,
		        data: data
		    }]
		    });
			console.log("asd");
		}, 1000); 
	</script>
	</div>
	<div id="gague">
	<iframe width=500px height=400px src="gauge" frameborder=0 ></iframe>
	</div>
	<div class="container">
	<div id="map">
	<iframe width=500px height=400px src="map" frameborder=0 ></iframe>
	</div>
	</div>
	<hr>
</body>
</html>