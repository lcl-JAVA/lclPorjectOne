<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>地图展示demo</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>
	<!-- easyui -->
	<link rel="stylesheet" type="text/css" href="util/easyui-1.6.1/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="util/easyui-1.6.1/themes/icon.css">
	<!-- <link rel="stylesheet" type="text/css" href="util/easyui-1.6.1/demo/demo.css"> -->
 	<script type="text/javascript" src="util/easyui-1.6.1/jquery.min.js"></script>
	<script type="text/javascript" src="util/easyui-1.6.1/jquery.easyui.min.js"></script>
	<!-- 页面样式css -->
	<link rel="stylesheet" type="text/css" href="css/index.css">
		
	<!-- 多颜色多边形js -->
	<script type="text/javascript" src="js/map/point.js"></script>
	<!-- 轨迹js -->
	<script type="text/javascript" src="js/map/guiji.js"></script>
	<!-- 网格小区js -->	
	<script type="text/javascript" src="js/map/wg_xiaoqu.js"></script>
	
	
	
	
	

	
	
	
	<!--加载Map-->
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=5E5EE28a7615536d1ffe2ce2a3667859"></script>
	<!--加载鼠标绘制工具-->
	<script type="text/javascript" src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>
	<link rel="stylesheet" href="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css" />
	<!-- 点聚合 -->
	<script type="text/javascript" src="http://api.map.baidu.com/library/TextIconOverlay/1.2/src/TextIconOverlay_min.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/MarkerClusterer/1.2/src/MarkerClusterer_min.js"></script>
	<!--点轨迹  -->
	<script type="text/javascript" src="http://api.map.baidu.com/library/CurveLine/1.5/src/CurveLine.min.js"></script>
	<!-- 点测距工具 -->
	<script type="text/javascript" src="http://api.map.baidu.com/library/DistanceTool/1.2/src/DistanceTool_min.js"></script>
	
	<!-- 加载查询地图数据 -->
	<script type="text/javascript" src="js/map/selectMap.js"></script>
	
	
	<!-- 图表heghcharts的js -->
	<script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>
	<script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
	<script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			selectMapPoint();
			selectXQ1();
		 });
	</script>
	<title>添加行政区划</title>
</head>
<body>

	<div class="easyui-layout" style="width:100%;height:100%;">
		<div id="p" data-options="region:'west'" title="我的网格" style="width:30%;padding:10px;" >
				<div class="tab3" id="tab3" style="display:block; width: 100%;height: 100%;">
					<div id="czWg">
						<a href="javascript:void(0)" onclick="$('#ff').form('clear');$('#w').window('open');" class="easyui-linkbutton" data-options="iconCls:'icon-add'">新建网格</a>
						<a href="javascript:void(0)" onclick="editorWgOrWd();" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">编辑网格</a>
					</div>
					<table id="wg_xiaoqu" style="height: 65%;"></table>
				</div>
		</div>
		<div data-options="region:'center'" title="地图">
				
			
			
			
			
			<div id="allmap"></div>
			<div id="control">
		        <!-- <span onclick="alert(overlays.length)">&nbsp&nbsp正在绘制的网格个数&nbsp&nbsp</span><br/><br/> -->
		        <span onclick="clearAll()">&nbsp&nbsp清除正在编辑的网格&nbsp&nbsp</span><br/><br/>
		        <span onclick="openWindow();getPoint();">&nbsp&nbsp保存网格&nbsp&nbsp</span><br/><br/>
		        <span onclick="Editing('enable')">&nbsp&nbsp进行网格编辑&nbsp&nbsp</span><br/><br/>
		        <span onclick="Editing('disable')">&nbsp&nbsp关闭网格编辑&nbsp&nbsp</span><br/><br/>
		        <span onclick="openCj()" style="display:none;" id="openCj">&nbsp&nbsp开启测距&nbsp&nbsp</span><br/><br/>
		        <span onclick="closeCj()" style="display:none;"id="closeCj">&nbsp&nbsp关闭测距&nbsp&nbsp</span>
		        <!-- <span onclick="showPolygon(this)">&nbsp&nbsp显示已有的网格&nbsp&nbsp</span> -->
			</div>
			<div class="tab" id="tab" style="display:block;">
				<br>
				<input id="wg" class="wg" type="text"   placeholder="在此输入需要查询的网格"/>
				
				<span class="wg_cx"  onclick="selectMapPoint1();">查询</span>
				<br>
				<br>
				<table id="tab_1">
					<tr id="tr_">
					</tr>
				</table>
			</div>
			<div class="tab" id="tab2" style="display:none;">
				<table id="tab_2" class="tab_2">
					<tr id="">
						<td>区域：</td>
						<td id="qy_name">1</td>
				   	</tr>
					<tr id="">
						<td>网格数量：</td>
						<td id="wg_count">1</td>
					</tr>
					<tr id="">
						<td>ATM数量：</td>
						<td id="atm_count">1</td>
					</tr>
				</table>
				<div id="container" style="width: 310px;height: 300px;"></div>
				<span class="wg_cx"  onclick="closeXqAtm();"style="margin-left: 60%">返回</span>
			
			</div>
	
	
	
	
	
			<div class="tab1">
				<select id="lx" onchange="selectChoose(this);">
					 <option value ="小区">小区</option>
					 <option value ="学校">学校</option>
					 <option value ="ATM">ATM</option>
					 <option value ="政府">政府</option>
					 <option value ="酒店">酒店</option>
					 <option value ="轨迹">轨迹</option>
					 <option value ="客户">客户</option>
				</select>
				<select id="sheng">
					 <option value ="山东省">山东省</option>
				</select>
				<select id="shi">
					 <option value ="潍坊市">潍坊市</option>
				</select>
				<select id="qu" onchange="selectChoose(this);">
					 <option value ="奎文区">奎文区</option>
					 <option value ="潍城区">潍城区</option>
					 <option value ="坊子区">坊子区</option>
					 <option value ="寒亭区">寒亭区</option>
					 <option value ="昌乐">昌乐</option>
					 <option value ="寿光">寿光</option>
					 <option value ="青州">青州</option>
					 <option value ="诸城">诸城</option>
					 <option value ="昌邑">昌邑</option>
				</select>
				<select id="jd"  onchange="removeFGW();getZJ();closeXqAtm();selectXQ1();" style="visibility: hidden;" >
					<option value="" selected="selected">请选择</option>
					<option value="370782002000">龙都街道</option>
					<option value="370782105000">石桥子镇</option>
					<option value="370782003000">舜王街道</option>
					<option value="370782001000">密州街道</option>
					<option value="370782101000">枳沟镇</option>
					<option value="370782102000">贾悦镇</option>
					<option value="370782108000">相州镇</option>
					<option value="370782110000">昌城镇</option>
					<option value="370782111000">百尺河镇</option>
					<option value="370782114000">林家村镇</option>
					<option value="370782117000">皇华镇</option>
					<option value="370782118000">桃林镇</option>
					<option value="370782112000">辛兴镇</option>
				</select>
			</div>
			<div id="xx" class="xx" >
				<div style="position: relative; width:40%;height:60%;background-color: white;margin: auto; margin-top:150px;    border-radius: 20px" >
						<img alt="" src="images/delete.png" style="    margin-left: 90%;" onclick="closeWindow();"><br/>
					<div class="xx_1">
						<span>&nbsp&nbsp网格名称：&nbsp&nbsp</span><br/>
						<input id="wg_name" type="text" placeholder="请在此输入网格名称"/><br/>
						<span>&nbsp&nbsp网格详情：&nbsp&nbsp</span><br/>
						<textarea id="wg_xx" rows="5" cols="22"placeholder="请在此输入网格详情"></textarea>
					</div>
					<div class="xx_2">
						<!-- <input class="xx_btn1" type="button" value="保存"  onclick="getPoint();"/>
						<input class="xx_btn1" type="button" value="关闭" onclick="closeWindow();"/>	 -->
						<span class="wg_cx"  onclick="getPoint();">保存</span>
						<span class="wg_cx"  onclick="closeWindow();"style="margin-left: 60%">关闭</span>	
					</div>
				</div>
			</div>
	
			<div id="xq" class="xx" >
				<div style="position: relative; width:40%;height:60%;background-color: white;margin: auto; margin-top:150px;    border-radius: 20px" >
						<img alt="" src="images/delete.png" style="    margin-left: 90%;" onclick="$('#xq').css('display','none');"><br/>
					<div class="xx_3">
						<table id="tab3">
							<tr>
								<td>网格编号：</td>
								<td id="xx_wg_bh">1</td>
							</tr>
							<tr>
								<td>网格名称：</td>
								<td id="xx_wg_mc">1</td>
							</tr>
							<tr>
								<td>网格区域：</td>
								<td id="xx_wg_qy">1</td>
							</tr>
							<tr>
								<td>网格类型：</td>
								<td id="xx_wg_lx">1</td>
							</tr>
							<tr>
								<td>网格详情：</td>
								<td id="xx_wg_xx">1</td>
							</tr>
						</table>
					</div>
					<div class="xx_2">
						<!-- <input class="xx_btn1" type="button" value="保存"  onclick="getPoint();"/>
						<input class="xx_btn1" type="button" value="关闭" onclick="closeWindow();"/>	 -->
						<!-- <span class="wg_cx"  onclick="getPoint();">保存</span> -->
						<span class="wg_cx"  onclick="$('#xq').css('display','none');"style="margin-left: 60%">关闭</span>	
					</div>
				</div>
			</div>
			
			
			
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- 新增修改页面window -->
	<div id="w" class="easyui-window" title="新建网格" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:600px;height:500px;padding:10px;">
		 <form id="ff" class="easyui-form" method="post" data-options="novalidate:true">
	    	<table>
	    		<tr style="display:none">
	    			<td style="width: 100px;">id:</td>
	    			<td><input id="wg_id" class="easyui-textbox" type="text" name="wg_id" data-options="required:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td style="width: 100px;">网格名称:</td>
	    			<td><input id="wg_name" class="easyui-textbox" type="text" name="name" data-options="required:true" ></input></td>
	    		</tr>
	    		<tr>
	    			<td>网格类型:</td>
	    			<td>
		    			<select id="wg_lx" class="easyui-combobox" name="lx" data-options="editable:false" panelHeight="auto" style="width: 35%;" >
		    				<option value ="">请选择</option>
		    				<option value ="小区">小区</option>
							 <option value ="学校">学校</option>
							 <option value ="ATM">ATM</option>
							 <option value ="政府">政府</option>
							 <option value ="酒店">酒店</option>
							 <option value ="轨迹">轨迹</option>
							 <option value ="客户">客户</option>
		    			</select>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>网格坐标:</td>
	    			<td>
	    				<a onclick="$('#w').window('close');drawMap();" class="easyui-linkbutton">地图划网格</a>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>行政区划:</td>
	    			<td>
	    				<select id="wg_sheng" class="easyui-combobox" name="sheng" data-options="readonly:true" style="width: 35%;" >
	    					<!-- <option value ="山东省">山东省</option> -->
	    				</select>
	    				<select id="wg_shi" class="easyui-combobox" name="shi" data-options="readonly:true" style="width: 35%;">
	    					<!-- <option value ="潍坊市">潍坊市</option> -->
	    				</select>
	    				<select id="wg_qu" class="easyui-combobox" name="qu" data-options="readonly:true" style="width: 35%;">
	    					<!-- <option value ="奎文区">奎文区</option>
							 <option value ="潍城区">潍城区</option>
							 <option value ="坊子区">坊子区</option>
							 <option value ="寒亭区">寒亭区</option>
							 <option value ="昌乐">昌乐</option>
							 <option value ="寿光">寿光</option>
							 <option value ="青州">青州</option>
							 <option value ="诸城">诸城</option>
							 <option value ="昌邑">昌邑</option> -->
	    				</select>
	    			
	    				<select id="wg_jd" class="easyui-combobox" name="jd" data-options="readonly:true" style="width: 35%;">
	    					<!-- <option value="" selected="selected">请选择</option>
							<option value="370782002000">龙都街道</option>
							<option value="370782105000">石桥子镇</option>
							<option value="370782003000">舜王街道</option>
							<option value="370782001000">密州街道</option>
							<option value="370782101000">枳沟镇</option>
							<option value="370782102000">贾悦镇</option>
							<option value="370782108000">相州镇</option>
							<option value="370782110000">昌城镇</option>
							<option value="370782111000">百尺河镇</option>
							<option value="370782114000">林家村镇</option>
							<option value="370782117000">皇华镇</option>
							<option value="370782118000">桃林镇</option>
							<option value="370782112000">辛兴镇</option> -->
	    				</select>
	    			</td>
	    		</tr>
	    		<tr style="display:none">
	    			<td>坐标:</td>
	    			<td><input id="wg_point" class="easyui-textbox" type="text" name="point" data-options="required:true" ></input></td>
	    			<td><input id="wg_C_point" class="easyui-textbox" type="text" name="c_point" data-options="required:true" ></input></td>
	    		</tr>
	    		
	    		<tr>
	    			<td>网格管理员:</td>
	    			<td>
	    				<input id="wg_wgy" class="easyui-textbox" type="text" name="wgy" data-options="required:true" ></input>
	    			</td>
	    		</tr>
	    		
	    		<tr>
	    			<td>网格详情:</td>
	    			<td>
	    				<input id="wg_message" name="c_name" class="easyui-textbox"  style="height:60px"></input>
	    			</td>
	    		</tr>
	    	</table>
	    	
	    	<a class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="czMarkerOrPolygon();">保存</a>
	    </form>

	</div>

	
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	map.centerAndZoom(new BMap.Point(116.403765, 39.914850), 6);
	map.enableScrollWheelZoom();
	var overlays = [];  
    var overlaycomplete = function(e){  
        overlays.push(e.overlay);   
    }; 
    var styleOptions={
        strokeColor:"blue",      //边线颜色。
        fillColor:"red",        //填充颜色。当参数为空时，圆形将没有填充效果。
        strokeWeight: 3,        //边线的宽度，以像素为单位。
        strokeOpacity: 0.8,     //边线透明度，取值范围0 - 1。
        fillOpacity: 0.3,       //填充的透明度，取值范围0 - 1。
        strokeStyle: 'solid'    //边线的样式，solid或dashed。
    }; 
    var markers = [];
	//点集合最简单的用法，生成一个marker数组，然后调用markerClusterer类即可。
	var markerClusterer = new BMapLib.MarkerClusterer(map, {markers:markers});
    
	setTimeout(function(){
		getBoundary();
	}, 2000);
	
  //下拉选
  function selectChoose(obj){
	  removeFGW();
	 
	  //如果是客户
	  if($(obj).val()=="客户"){
		  getBoundary1();
		  setTimeout(function(){
			  showKhMarker();
		  }, 1000);
		  
		//easyuidatagraid
		  selectXQ1();
	  }else{
		  getBoundary1();
		  //atm
		  getLx_1();
		  closeXqAtm();
		  
		  //easyuidatagraid
		  selectXQ1();
	  }
  }
    function setCenterPoint(obj){
    	var a =$(obj).parent().parent().children("td").eq(2).text();
    	b = a.split(",")
    	map.centerAndZoom(new BMap.Point(parseFloat(b[0]),parseFloat(b[1])),17); 
    }
  //删除覆盖物
    function removeFGW(){
	  	//删除覆盖物
    	map.clearOverlays();
    	//删除聚合点
    	markerClusterer.clearMarkers();
    }
  
  //获取镇级地图
    function getZJ(){
    	var lx = $("#lx").val();
    	
    	var jsonCode = $("#jd").val();
    	var jsonPath = "json/370782/"+jsonCode+".json";
    	var areas = [];
    	$.getJSON(jsonPath, function (data){
    		/* console.log(data);
    		console.log(data.features);
    		console.log(data.features[0].properties.name);
    		console.log(data.features[0].geometry.coordinates[0]); */
    		var z1 = data.features[0].geometry.coordinates[0];
    		map.clearOverlays();
    		
    		var pointArray = [];
	    	var bbb = "";
	    	for(var i = 0;i<z1.length;i++){
	    		bbb+=z1[i]+";";
	    	}
	    	bbb=bbb.substring(0,bbb.length-1);
	    	var colors = ["#fff492", "#fff492", "#98d057", "#e19ee6", "#1ad3da", "#ffc11d", "#98e800", "#b95817", "#03a9f4", "#39d0a4", "#8bbb53"];
	    	areas.push(bbb);
    		
    		//for循环都删除掉了，只剩下这个
	        //网上查了下，东西经南北纬的范围
	        var EN_JW = "180, 90;";         //东北角
	        var NW_JW = "-180,  90;";       //西北角
	        var WS_JW = "-180, -90;";       //西南角
	        var SE_JW = "180, -90;";        //东南角
	        //4.添加环形遮罩层
	        var ply1 = new BMap.Polygon(areas[0]+ SE_JW + SE_JW + WS_JW + NW_JW + EN_JW + SE_JW, { strokeColor: "none", fillColor: "rgb(0,0,0)", fillOpacity:0, strokeOpacity: 0.5 }); //建立多边形覆盖物
		 	map.addOverlay(ply1); 	
	    	
	    	
	    	 var ply = new BMap.Polygon(areas[0], { strokeWeight: 2, strokeColor: "none" }); //建立多边形覆盖物
	         //ply.setFillColor(colors[2]);   //设置多边形的填充颜色
	         ply.setFillColor("none");
	         ply.setFillOpacity(0.35);
	         
	         map.addOverlay(ply);  //添加覆盖物
	         pointArray = pointArray.concat(ply.getPath());
	         map.setViewport(pointArray);    //调整视野  
    	});
    	if(lx=='小区'||lx=='客户'){
	    	selectMapPoint2();
    	}
    }
    
   
    
	function getBoundary(){       
		var bdary = new BMap.Boundary();
		bdary.get("山东省潍坊市奎文区", function(rs){       //获取行政区域
			map.clearOverlays();        //清除地图覆盖物  
			
			
			
			//for循环都删除掉了，只剩下这个
        //网上查了下，东西经南北纬的范围
        var EN_JW = "180, 90;";         //东北角
        var NW_JW = "-180,  90;";       //西北角
        var WS_JW = "-180, -90;";       //西南角
        var SE_JW = "180, -90;";        //东南角
        //4.添加环形遮罩层
        var ply1 = new BMap.Polygon(rs.boundaries[0] + SE_JW + SE_JW + WS_JW + NW_JW + EN_JW + SE_JW, { strokeColor: "none", fillColor: "rgb(0,0,0)", fillOpacity:0, strokeOpacity: 0.5 }); //建立多边形覆盖物
		 map.addOverlay(ply1); 	
			
			
			
			     
			var count = rs.boundaries.length; //行政区域的点有多少个
			if (count === 0) {
				alert('未能获取当前输入行政区域');
				return ;
			}
          	var pointArray = [];
			for (var i = 0; i < count; i++) {
				var ply = new BMap.Polygon(rs.boundaries[i], {strokeWeight: 5, strokeColor: "none"}); //
				ply.setFillColor("none");
				map.addOverlay(ply);  //添加覆盖物
				pointArray = pointArray.concat(ply.getPath());
			}    
			map.setViewport(pointArray);    //调整视野  
			            
		});   
		
	}
	
	function drawMap(){
			
			
			 //实例化鼠标绘制工具
				var drawingManager = new BMapLib.DrawingManager(map, {
	           isOpen: false, //是否开启绘制模式
	           enableDrawingTool: true, //是否显示工具栏
	           drawingToolOptions: {
	               anchor: BMAP_ANCHOR_TOP_RIGHT, //位置
	               offset: new BMap.Size(5, 5), //偏离值
	               scale: 0.8, //工具栏缩放比例
		            drawingModes : [BMAP_DRAWING_MARKER, BMAP_DRAWING_POLYGON],
		            drawingTypes : [
		                 BMAP_DRAWING_MARKER,  
		                 BMAP_DRAWING_CIRCLE,//圆的样式
		//////           BMAP_DRAWING_POLYLINE,
		//////           BMAP_DRAWING_POLYGON,
		////             BMAP_DRAWING_RECTANGLE //矩形的样式
		                            ]
	           },
	           circleOptions: styleOptions, //圆的样式
	           polylineOptions: styleOptions, //线的样式
	           polygonOptions: styleOptions, //多边形的样式
	           rectangleOptions: styleOptions //矩形的样式
	       });
	      
				
	      //添加鼠标绘制工具监听事件，用于获取绘制结果  
	   	drawingManager.addEventListener('overlaycomplete', overlaycomplete);  
	     
	  		/* //右击获取经纬度
	       map.addEventListener("rightclick",function(e){
	           alert(e.point.lng + "," + e.point.lat);
	       }); */
		
	}
	
	
	function getBoundary1(){  
			var sheng = $("#sheng").val();
			var shi = $("#shi").val();
			var qu = $("#qu").val();
			var jd = $("#jd").val();
			var name = $("#wg").val();
			var lx = $("#lx").val();
			 $.ajax({
	            type: "POST",
	            url: "selectMapPoint",
	            data: {"name":name,"sheng":sheng,"shi":shi,"qu":qu,"jd":jd,"lx":lx},
	            dataType: "json",
	            success: function(data){
	                console.log(data);
	               $("#tab_1").html("");
	               for(var i=0;i<data.length;i++){
	               	$("#tab_1").append(
						"<tr>"+
							"<td style='display:none'>"+data[i].ID+"</td>"+
							"<td class='tab_1_td'>"+data[i].NAME+"</td>"+
							"<td style='display:none'>"+data[i].C_POINT+"</td>"+
							"<td><img src='images/find.png' style='width: 40px;' onclick='setCenterPoint(this);'></td>"+
							"<td><img src='images/delete.png' style='width: 40px;' onclick='delectMapPoint(this);'></td>"+
						"</tr>"
					);
	               } 
	            }
	        });  
		var province = "山东省潍坊市";
		if(qu=="诸城"){
			$("#jd").css("visibility","visible");
		}else{
			$("#jd").css("visibility","hidden");
			$("#jd").val("");
			selectMapPoint3();
		}
		province = province+qu;
		var bdary = new BMap.Boundary();
		bdary.get(province, function(rs){       //获取行政区域
			map.clearOverlays();        //清除地图覆盖物      
			
			
					//for循环都删除掉了，只剩下这个
        //网上查了下，东西经南北纬的范围
        var EN_JW = "180, 90;";         //东北角
        var NW_JW = "-180,  90;";       //西北角
        var WS_JW = "-180, -90;";       //西南角
        var SE_JW = "180, -90;";        //东南角
        //4.添加环形遮罩层
        var ply1 = new BMap.Polygon(rs.boundaries[0] + SE_JW + SE_JW + WS_JW + NW_JW + EN_JW + SE_JW, { strokeColor: "none", fillColor: "rgb(0,0,0)", fillOpacity:0, strokeOpacity: 0.5 }); //建立多边形覆盖物
		 map.addOverlay(ply1); 	
		 //ply1.disableMassClear();
			
			 
			var count = rs.boundaries.length; //行政区域的点有多少个
			if (count === 0) {
				alert('未能获取当前输入行政区域');
				return ;
			}
          	var pointArray = [];
			for (var i = 0; i < count; i++) {
				var ply = new BMap.Polygon(rs.boundaries[i], {strokeWeight: 5, strokeColor: "none"}); //
				ply.setFillColor("none");
				map.addOverlay(ply);  //添加覆盖物
				pointArray = pointArray.concat(ply.getPath());
				//ply.disableMassClear();
			}    
			map.setViewport(pointArray);    //调整视野  
			            
		});   
		
		setTimeout(function(){
			showPolygon(this);
		}, 1000);
		
	}
	
	
	
	
	 function draw(type){  
        drawingManager.open();   
        
        drawingManager.setDrawingMode(type);  
        
    }     
     //清除所有覆蓋物    
    function clearAll() {  
    	console.log(overlays);
        for(var i = 0; i < overlays.length; i++){  
            map.removeOverlay(overlays[i]);  
        }  
        overlays.length = 0     
    }  
    //获取多边形的顶点
    function getPoint(){ 
    	var lx = $("#lx").val();
    	if(overlays.length==0){
    		alert("没有正在绘制的网格或网点");
    		closeWindow();
    		return;
    	}
    	
    	if(overlays.length!=1){
    		alert("不能同时编辑多个网格");
    		closeWindow();
    		return;
    	}
    	var sheng = $("#sheng").val();
		var shi = $("#shi").val();
		var qu = $("#qu").val();
		var jd = $("#jd").val(); 
		var lx = $("#lx").val();
		//判断点或者多边形   
    	if(lx=="小区"||lx=="学校"||lx=="政府"){
	        for(var i = 0; i < overlays.length; i++){  
	            var overlay=overlays[i].getPath();  
	            var point = "";
	            for(var j = 0; j < overlay.length; j++){  
	                var grid =overlay[j];  
	                console.log((j+1)+"个点:("+grid.lng+","+grid.lat+")");
	                var str = grid.lng+","+grid.lat+"-";
	                
	                point+=str;
	            }  
	            point=point.substring(0,point.length-1);
		      	var c_p = point.split("-");
		      	var c_point = c_p[0];
		      	$('#wg_sheng').combobox('setValue', sheng);
		      	$('#wg_shi').combobox('setValue', shi);
		      	$('#wg_qu').combobox('setValue', qu);
		      	$('#wg_jd').combobox('setValue', jd);
		      	$('#wg_point').textbox('setValue', point);
		      	$('#wg_C_point').textbox('setValue', c_point);
	        }  
    	}else{
            var overlay=overlays[0].getPosition();  
            var point = "";
            point = overlay.lng+","+overlay.lat;
	      	var c_point = point;
	      	$('#wg_sheng').combobox('setValue', sheng);
	      	$('#wg_shi').combobox('setValue', shi);
	      	$('#wg_qu').combobox('setValue', qu);
	      	$('#wg_jd').combobox('setValue', jd);
	      	
	      	$('#wg_point').textbox('setValue', point);
	      	$('#wg_C_point').textbox('setValue', c_point);
    	}
    } 
    
    //新增网格
    function czMarkerOrPolygon(){
    	var id = $('#wg_id').textbox('getValue');
    	if(id==""||id==null){
    		alert(1);
    		saveMarkerOrPolygon();
    	}else{
    		alert(2);
    		editorWgOrWdForm();
    	}
    }
    //新增网格
    function saveMarkerOrPolygon(){
    	$('#ff').form('submit', {    
    	    url:"insertMapPoint",    
    	    onSubmit: function(){    
    	        // do some check    
    	        // return false to prevent submit;    
    	    },    
    	    success:function(data){    
    	    	$.messager.alert('提示信息','保存成功!');  
    	    	closeWindow();
    	    	selectXQ1();
            	if($("#jd").val()!=""){
                	getZJ();
            	}else{
            		selectMapPoint1();
            	}
    	    },
    	    onLoadSuccess:function(data){    
    	            
    	    },
    	    onLoadError:function(data){    
    	    	$.messager.alert('错误信息','数据插入失败!','error');    
    	    }
    	});  
    }
  //编辑网格
    function editorWgOrWd(){
    	
    	var row = $('#wg_xiaoqu').datagrid('getSelected');
    	if(row==null){
    		$.messager.alert('提示信息','请选择一行数据!','warning'); 
    		return;
    	}
    	openWindow();
    	
    	$('#ff').form('clear');
    	
    	$('#ff').form('load',{
    		wg_id:row.ID,
    		name:row.NAME,
    		lx:row.LX,
    		sheng:row.PROVINCE_CODE,
    		shi:row.CITY_CODE,
    		qu:row.AREA_CODE,
    		jd:row.STREET_CODE,
    		point:row.ZB,
    		c_point:row.C_POINT,
    		wgy:row.WGY_ID,
    		c_name:row.C_NAME
    	});
    	


    } 
  	function editorWgOrWdForm(){

    	$('#ff').form('submit', {    
    	    url:"editMapPoint",    
    	    onSubmit: function(){    
    	        // do some check    
    	        // return false to prevent submit;    
    	    },    
    	    success:function(data){    
    	    	$.messager.alert('提示信息','修改成功!');  
    	    	closeWindow();
    	    	selectXQ1();
            	if($("#jd").val()!=""){
                	getZJ();
            	}else{
            		selectMapPoint1();
            	}
    	    },
    	    onLoadSuccess:function(data){    
    	            
    	    },
    	    onLoadError:function(data){    
    	    	$.messager.alert('错误信息','数据修改失败!','error');    
    	    }
    	});  
  	}
    //开启线、面编辑功能 
    function Editing(state){  
        for(var i = 0; i < overlays.length; i++){  
            state=='enable'?overlays[i].enableEditing():overlays[i].disableEditing();  
        }  
    }  
    
    
    
    
     //显示原有多边形 
    function  showPolygon(){  
    	var sheng = $("#sheng").val();
		var shi = $("#shi").val();
		var qu = $("#qu").val();
		var jd = $("#jd").val();
		var name = $("#wg").val();
		 $.ajax({
            type: "POST",
            url: "selectMapPoint",
            data: {"name":name,"sheng":sheng,"shi":shi,"qu":qu,"jd":jd},
            dataType: "json",
            success: function(data){
            	//console.log(data);
                for(var i=0;i<data.length;i++){
                    // var point = data[i].ZB;
                    var p=[];
                    var point = data[i].ZB.split("-");
                    //console.log(point);

                    for(var j=0;j<point.length;j++){
                        var point1=point[j].split(",");
                        p.push(new BMap.Point(parseFloat(point1[0]),parseFloat(point1[1])));
                    }
                    var polygon = new BMap.Polygon(p, styleOptions);  //创建多边形
                   //创建右键菜单
                    var removeMarker = function(e,ee,polygon){
						map.removeOverlay(polygon);
					}
					var markerMenu=new BMap.ContextMenu();
					markerMenu.addItem(new BMap.MenuItem('删除'+i,removeMarker.bind(polygon)));
					//markerMenu.addItem(new BMap.MenuItem('查看详情'+i,clickP));
					polygon.addContextMenu(markerMenu);
					
					//polygon.addEventListener("click",clickP);
					
					var content = data[i].C_NAME+"<a id='"+data[i].ID+"' onclick='showXQ(this);' style='color:blue;'>[查看详情]</a>";
					var id1 = data[i].NAME;
					addClickHandler(id1,content,polygon);
					function addClickHandler(id1,content,polygon){
						polygon.addEventListener("click",function(e){
							//显示详情
							openInfo(id1,content,e)
						});
					}
                    map.addOverlay(polygon);
                    
                }

            }
        });
   
      
      
      // overlays.push(polygon); //是否把该图像加入到编辑和删除行列  
       //btn.setAttribute('disabled','ture');  
       //showText();  
     } 
     
     function showXQ(obj){
     	var id = $(obj).attr("id");
     	$("#xx_wg_bh").text("");
     	$("#xx_wg_mc").text("");
     	$("#xx_wg_qy").text("");
     	$("#xx_wg_lx").text("");
     	$("#xx_wg_xx").text("");
     	$("#xq").css("display","block");
     	
     	
     	$.ajax({
     		type: "POST",
            url: "selectXqById",
            data: {"id":id},
            dataType: "json",
            success: function(data){
            	$("#xx_wg_bh").text(id);
		     	$("#xx_wg_mc").text(data[0].NAME);
		     	$("#xx_wg_qy").text(data[0].PROVINCE_CODE+data[0].CITY_CODE+data[0].AREA_CODE);
		     	$("#xx_wg_lx").text(data[0].LX);
		     	$("#xx_wg_xx").text(data[0].C_NAME);
            }
     	});
     	
     	
     }
     
     //单机网格或点显示详情
     function openInfo(id1,content,e){
		console.log(content);
		console.log(e);
		console.log(id1);
		var opts = {
			  width : 200,     // 信息窗口宽度
			  height: 100,     // 信息窗口高度
			  title : "网格信息:" , // 信息窗口标题
			  enableMessage:true,//设置允许信息窗发送短息
			  message:""
		}
		$.ajax({
            type: "POST",
            url: "selectMapPointByName",
            data: {"name":id1},
            dataType: "json",
            success: function(data){
            	var str = data[0].C_POINT.split(",");
            	
				var point = new BMap.Point(parseFloat(str[0]), parseFloat(str[1]));		
                var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
				map.openInfoWindow(infoWindow,point); //开启信息窗口
            }
        });
	}
     
      
	 function showText(){  
        var opts = {  
        position : new BMap.Point(119.583672,35.969479),    // 指定文本标注所在的地理位置  
        offset   : new BMap.Size(30, 30)    //设置文本偏移量  
       	}  
	     var label = new BMap.Label("银行", opts);  // 创建文本标注对象  
	        label.setStyle({  
	        color : "black",  
	         fontSize : "16px",  
	        fillColor:"red",      //填充颜色。当参数为空时，圆形将没有填充效果。  
	        });  
	      map.addOverlay(label);    
     }  
	 
	 
</script>