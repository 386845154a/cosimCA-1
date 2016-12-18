<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/commons/include/html_doctype.html" %>
<html>
<head>
<title>维修工作单管理</title>
<%@include file="/commons/include/get.jsp" %>
<link href="${ctx}/js/fusionChartsV3.3.1/Gallery/assets/ui/css/style.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/js/fusionChartsV3.3.1/Gallery/assets/prettify/prettify.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/js/fusionChartsV3.3.1/Charts/FusionCharts.js"></script>
<script type="text/javascript" src="${ctx}/js/fusionChartsV3.3.1/Gallery/assets/prettify/prettify.js"></script>
<script type="text/javascript" src="${ctx}/js/fusionChartsV3.3.1/Gallery/assets/ui/js/json2.js"></script>
<script type="text/javascript" src="${ctx}/js/fusionChartsV3.3.1/Gallery/assets/ui/js/lib.js" ></script>
<!--[if IE 6]>
    <script type="text/javascript" src="${ctx}/js/fusionChartsV3.3.1/Gallery/assets/ui/js/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>
      /* select the element name, css selector, background etc */
      DD_belatedPNG.fix('img');

      /* string argument can be any CSS selector */
    </script>
<p>&nbsp;</p>
<P align="center"></P>
<![endif]-->

<script>
//判断是否柱状图显示还是曲线显示
function rendarChart(type,faultType,startDate,endDate){
	type = type || "Column3D6";
	var swf = "Column3D.swf";
	if(type=='Line2')
		swf = "Line.swf";
	
	if (GALLERY_RENDERER && GALLERY_RENDERER.search(/javascript|flash/i)==0)  FusionCharts.setCurrentRenderer(GALLERY_RENDERER);
	var random = Math.random();
	var chart = new FusionCharts("${ctx}/js/fusionChartsV3.3.1/Charts/" + swf, random, "560", "400", "0", "0");
	//chart.setXMLData( dataString );
	var url="reportCostByMonthWithJson.ht?year="+$("#year").val()+"&type="+faultType+"&startDate="+startDate+"&endDate="+endDate;
	chart.setJSONUrl(url);
	//chart.setJSONData(jsonString);
	chart.render("chartdiv");
}

$(function(){
	rendarChart();
	//点击统计
	$('#btnSearch').click(function(){	
		rendarChart($(":input[name=showType]:checked").val(),$("#type").val(),$(":input[name='startDate']").val(),$(":input[name='endDate']").val());
	});
	$("#type").change(function(){
		rendarChart($(":input[name=showType]:checked").val(),$("#type").val(),$(":input[name='startDate']").val(),$(":input[name='endDate']").val());
	});
});
</script>
</head>
<body>
	<div class="panel">
		<div class="panel-top">
			<div class="tbar-title">
				<span class="tbar-label">维修工作单管理列表</span>
			</div>
			<div class="panel-toolbar">
				<div class="toolBar" style="font-size:12px;">
					<div class="group"><a class="link back" id="btnSearch">统计</a></div>
					<input type="radio" value="Column3D6" checked name="showType">柱状图</input>
					<input type="radio" value="Line2" name="showType">线状图</input>
				</div>	
			</div>
			<div class="panel-search">
				<form id="searchForm" method="post">
					<div class="row" style="font-size:12px;">						
						<span class="label">年份：</span>
						<select id="year"><option>2013<option><option>2014<option><option>2015<option><option>2016<option></select>
						<span class="label">故障分类:</span>
						<select id="type" name="type">
						    <option value='0'>请选择</option>
							<option value='gy'>工艺</option>
							<option value='sc'>生产</option>
							<option value='qc'>器材</option>
							<option value='rj'>软件</option>
							<option value='gl'>管理</option>
							<option value='cz'>操作</option>
							<option value='cs'>测试</option>
							<option value='wg'>外购</option>
							<option value='qt'>其他</option>
						</select>
					</div>
				</form>
			</div>
		</div>
		<div class="panel-body">
        	<div id="chartdiv" align="center">月度成本统计</div>
		</div>	
	</div> <!-- end of panel -->
</body>
</html>


