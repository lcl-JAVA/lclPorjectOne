function getLx_1(){
	//显示多种颜色的行政区划
	getMap_1();
	//显示聚合点
	shouGj();
	
}







//显示多种颜色的行政区划
function getMap_1(){
	var qu = $("#qu").val();
	var lx = $("#lx").val();
	if(lx!="ATM"){
		return;
	}
	if(qu!="诸城"){
		return;
	}
	var polygons = [];
	var areas = [];
	var areasNames = [];
	var jsonCode = ["370782001000","370782002000","370782003000","370782101000","370782102000","370782105000","370782108000","370782110000","370782111000","370782112000","370782114000","370782117000","370782118000"];
	var areasCodes = [];
	for(var i=0;i<jsonCode.length;i++){
		var jsonPath = "json/370782/"+jsonCode[i]+".json";
    	$.getJSON(jsonPath, function (data){
    		/* console.log(data);
    		console.log(data.features);
    		console.log(data.features[0].properties.name);
    		console.log(data.features[0].geometry.coordinates[0]); */
    		
    		var z1 = data.features[0].geometry.coordinates[0];
    		
    		var areasName = data.features[0].properties.name;
    		
    		var areasCode = data.features[0].properties.code;
    		
	    	var bbb = "";
	    	for(var j = 0;j<z1.length;j++){
	    		bbb+=z1[j]+";";
	    	}
	    	bbb=bbb.substring(0,bbb.length-1);
    	
	    	areas.push(bbb);
	    	areasNames.push(areasName);
	    	areasCodes.push(areasCode);
	    	
    	});
	}
	 setTimeout(function(){
	      	console.log(areas);
	      	var colors = ["#fff492", "#ffc11d", "#98d057", "#e19ee6", "#1ad3da", "#ffc11d", "#98e800", "#b95817", "#03a9f4", "#39d0a4", "#8bbb53","#fff492", "#98d057"];
	      	var pointArray = [];
	      	map.clearOverlays();
	      	for (var i = 0; i < areas.length; i++) {
	      		var ply = new BMap.Polygon(areas[i], { strokeWeight: 2, strokeColor: "#ff0000" }); //建立多边形覆盖物
	      		ply.setFillColor(colors[i])   //设置多边形的填充颜色
	      		ply.setFillOpacity(0.35);
	      		var name = areasNames[i];
	      		var streetCode = areasCodes[i];
	      		addClickHandler(name,streetCode,ply);
				function addClickHandler(name,streetCode,ply){
					ply.addEventListener("click",function(e){
						
						selectMapLx(name,streetCode);
						
						$("#tab").css("display", "none");
						$("#tab2").css("display", "block");
						$("#wg_count").text("");
						$("#atm_count").text("");
						$("#wg_count").text();
						$("#atm_count").text(name);
					});
				}
	      		polygons.push(ply);  //加入多边形数组，以之后获取多边形边界点集
	      		map.addOverlay(ply);  //添加覆盖物
	      		pointArray = pointArray.concat(ply.getPath());
	      	}
	      	map.setViewport(pointArray);    //调整视野
	      //显示聚合点
	      	showPoint();
	}, 2000);
	 
}
//图表
function selectMapLx(name,streetCode){
	$("#wg_count").text("");
	$("#atm_count").text("");
	$("#qy_name").text("");

	$.ajax({
		type:"post",
		url:"selectMapLx",
		data:{"street_code":streetCode},
		dataType:"json",
		success:function(data){
			console.log(data);
			showXqAtm();
			
			if(data.length==0){
				$("#qy_name").text(name);
				$("#wg_count").text("0");
				$("#atm_count").text("0");
			}else if(data.length==1){
				if(data[0].LX=="ATM"){
					$("#qy_name").text(name);
					$("#wg_count").text("0");
					$("#atm_count").text(data[0].zs);
				}else{
					$("#qy_name").text(name);
					$("#atm_count").text("0");
					$("#wg_count").text(data[0].zs);
				}
			}else if(data.length==2){
				$("#qy_name").text(name);
				$("#wg_count").text(data[0].zs);
				$("#atm_count").text(data[1].zs);
			}
			
			var a = parseFloat($("#atm_count").text());
			var b = parseFloat($("#wg_count").text());
			$('#container').highcharts({
		        chart: {
		            type: 'column'
		        },
		        title: {
		            text: name+'网格ATM数量统计'
		        },
		       /* subtitle: {
		            text: name+'下的网格或网点'
		        },*/
		        xAxis: {
		            categories: [
		                '统计类型'
		            ],
		            crosshair: true
		        },
		        yAxis: {
		            min: 0,
		            title: {
		                text: '数量 (个)'
		            }
		        },
		        tooltip: {
		            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
		            '<td style="padding:0"><b>{point.y:.1f} 个</b></td></tr>',
		            footerFormat: '</table>',
		            shared: true,
		            useHTML: true
		        },
		        plotOptions: {
		            column: {
		                pointPadding: 0.2,
		                borderWidth: 0
		            }
		        },
		        series: [{
		            name: '网格',
		            data: [b]
		        }, {
		            name: 'ATM',
		            data: [a]
		        }]
		    });
			
			
		}
	});
	
	
	
	
}

function showXqAtm(){
	$("#tab").css("display", "none");
	$("#tab2").css("display", "block");
}
function closeXqAtm(){
	$("#tab").css("display", "block");
	$("#tab2").css("display", "none");
}
//显示聚合点
function  showPoint(){  
	var sheng = $("#sheng").val();
	var shi = $("#shi").val();
	var qu = $("#qu").val();
	var jd = $("#jd").val();
	var name = $("#wg").val();
	var lx = $("#lx").val();
	if(lx!="ATM"){
		return;
	}
	var pt = null;
	
	 $.ajax({
        type: "POST",
        url: "selectMapPoint",
        data: {"name":name,"sheng":sheng,"shi":shi,"qu":qu,"jd":jd,"lx":lx},
        dataType: "json",
        success: function(data){
        	console.log(data);
        	for(var i = 0;i<data.length;i++){
        		var point = [];
        		point = data[i].ZB.split(",");
        		
        		pt =  new BMap.Point(parseFloat(point[0]),parseFloat(point[1]));
        		var marker =new BMap.Marker(pt);
        		//map.addOverlay(marker);
        		var content = data[i].C_NAME;
				var id1 = data[i].NAME;
        		
				addClickHandler(id1,content,marker);
				function addClickHandler(id1,content,marker){
					marker.addEventListener("click",function(e){
						//显示详情
						openInfo1(id1,content,e)
					});
				}
        		
        		
        		markers.push(marker);
        	}
        	
        	//点集合最简单的用法，生成一个marker数组，然后调用markerClusterer类即可。
        	//添加聚合点
			markerClusterer.addMarkers(markers)
        	
        	
        }
    });
 } 
//单机网格或点显示详情
function openInfo1(id1,content,e){
	console.log(content);
	console.log(e);
	console.log(id1);
	var opts = {
		  width : 200,     // 信息窗口宽度
		  height: 100,     // 信息窗口高度
		  title : "ATM信息:" , // 信息窗口标题
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
