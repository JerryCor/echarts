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
	<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/china.js" ></script>
</head>
<body>
	<div class="container">
		<div id="main" style="width:480px; height:400px"></div>
		<script type="text/javascript">
			var myChart= echarts.init(document.getElementById("main"));
			function randomData() {
			    return Math.round(Math.random()*1000);
			}
			option = {
			    title: {
			        text: 'iphone销量',
			        subtext: '纯属虚构',
			        left: 'center'
			    },
			    tooltip: {
			        trigger: 'item'
			    },
			    legend: {
			        orient: 'vertical',
			        left: 'left',
			        data:['iphone3','iphone4','iphone5']
			    },
			    visualMap: {
			        min: 0,
			        max: 2500,
			        left: 'left',
			        top: 'bottom',
			        text: ['高','低'],           // 文本，默认为数值文本
			        calculable: true
			    },
			    toolbox: {
			        show: true,
			        orient: 'vertical',
			        left: 'right',
			        top: 'center',
			        feature: {
			            dataView: {readOnly: false},
			            restore: {},
			            saveAsImage: {}
			        }
			    },
			    series: [
			        {
			            name: 'iphone3',
			            type: 'map',
			            mapType: 'china',
			            roam: false,
			            label: {
			                normal: {
			                    show: true
			                },
			                emphasis: {
			                    show: true
			                }
			            },
			            data:[
			                {name: '北京',value: randomData() },
			                {name: '天津',value: randomData() },
			                {name: '上海',value: randomData() },
			                {name: '重庆',value: randomData() },
			                {name: '河北',value: randomData() },
			                {name: '河南',value: randomData() },
			                {name: '云南',value: randomData() },
			                {name: '辽宁',value: randomData() },
			                {name: '黑龙江',value: randomData() },
			                {name: '湖南',value: randomData() },
			                {name: '安徽',value: randomData() },
			                {name: '山东',value: randomData() },
			                {name: '新疆',value: randomData() },
			                {name: '江苏',value: randomData() },
			                {name: '浙江',value: randomData() },
			                {name: '江西',value: randomData() },
			                {name: '湖北',value: randomData() },
			                {name: '广西',value: randomData() },
			                {name: '甘肃',value: randomData() },
			                {name: '山西',value: randomData() },
			                {name: '内蒙古',value: randomData() },
			                {name: '陕西',value: randomData() },
			                {name: '吉林',value: randomData() },
			                {name: '福建',value: randomData() },
			                {name: '贵州',value: randomData() },
			                {name: '广东',value: randomData() },
			                {name: '青海',value: randomData() },
			                {name: '西藏',value: randomData() },
			                {name: '四川',value: randomData() },
			                {name: '宁夏',value: randomData() },
			                {name: '海南',value: randomData() },
			                {name: '台湾',value: randomData() },
			                {name: '香港',value: randomData() },
			                {name: '澳门',value: randomData() }
			            ]
			        }]
			};
			myChart.setOption(option);  
		</script>
		
	</div>
</body>
</html>