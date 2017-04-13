<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/bootstrap.min.css">
	<script src="<%=request.getContextPath() %>/resources/js/echarts.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-3.2.0.min.js" ></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/bootstrap.min.js" ></script>
</head>
<body>
	<div class="container">
		<div id="main" style="width:480px; height:400px"></div>
		<script type="text/javascript">
			var myChart= echarts.init(document.getElementById("main"));
			option = {
			tooltip : {
			    formatter: "{a} <br/>{b} : {c}%"
			},
			toolbox: {
			    feature: {
			        restore: {},
			        saveAsImage: {}
			    }
			},
			series: [
			    {
			        name: 'xxx应用',
					type: 'gauge',
					min : 0,
					max : 10000,
					detail: {formatter:'{value}'},
					data: [{value: 500, name: '当前人数'}]
			        }
			    ]
			};
			
			setInterval(function () {
			    option.series[0].data[0].value = (Math.random() * 10000).toFixed(0) - 0;
			    myChart.setOption(option, true);
			},2000);
		</script>
		
	</div>
</body>
</html>