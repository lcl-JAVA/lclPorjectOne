/*function shouGj(){
	var beijingPosition=new BMap.Point(119.323574,35.977277),
	 hangzhouPosition=new BMap.Point(119.34473,35.967061),
	 taiwanPosition=new BMap.Point(119.309517,35.950204);
	var points = [beijingPosition,hangzhouPosition, taiwanPosition];

	var curve = new BMapLib.CurveLine(points, {strokeColor:"blue", strokeWeight:3, strokeOpacity:0.5}); //创建弧线对象
	map.addOverlay(curve); //添加到地图中
	//curve.enableEditing(); //开启编辑功能
	
}*/
//显示聚合点
function  shouGj(){  
	var sheng = $("#sheng").val();
	var shi = $("#shi").val();
	var qu = $("#qu").val();
	var jd = $("#jd").val();
	var name = $("#wg").val();
	var lx = $("#lx").val();
	if(lx!="轨迹"){
		return;
	}
	$("#openCj").css("display","block");
	$("#closeCj").css("display","block");
	var points = [];
	setTimeout(function(){
		
		$.ajax({
			type: "POST",
			url: "selectMapPoint",
			data: {"name":name,"sheng":sheng,"shi":shi,"qu":qu,"jd":jd,"lx":lx},
			dataType: "json",
			success: function(data){
				for(var i = 0;i<data.length;i++){
					var point = [];
					point = data[i].ZB.split(",");
					
					var pt =  new BMap.Point(parseFloat(point[0]),parseFloat(point[1]));
					points.push(pt);
				}
				
				var curve = new BMapLib.CurveLine(points, {strokeColor:"blue", strokeWeight:3, strokeOpacity:0.5}); //创建弧线对象
				map.addOverlay(curve); //添加到地图中
			}
		});
		
	}, 1000);
} 


function openCj(){
	var myDis = new BMapLib.DistanceTool(map);
	myDis.open();  //开启鼠标测距
	//myDis.close();  //关闭鼠标测距大
}
function closeCj(){
	var myDis = new BMapLib.DistanceTool(map);
	//myDis.open();  //开启鼠标测距
	myDis.close();  //关闭鼠标测距大
}