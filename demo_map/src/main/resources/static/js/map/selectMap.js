//显示客户
function showKh(){
	showKhMarker();
}

function showKhMarker(){
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
                var p=[];
                p = data[i].C_POINT.split(",");
         		var pt =  new BMap.Point(parseFloat(p[0]),parseFloat(p[1]));
         		
         		var dj = data[i].DJ;
         		if(dj=='1'){
         			var tb = new BMap.Icon("images/vip.png", new BMap.Size(35, 45));
         		}else if(dj=='2'){
         			var tb = new BMap.Icon("images/pt.png", new BMap.Size(35, 45));
         		}else if(dj=='3'){
         			var tb = new BMap.Icon("images/qz.png", new BMap.Size(35, 45));
         		}else if(dj=='4'){
         			var tb = new BMap.Icon("images/kh_a.png", new BMap.Size(15,15));
         		}else if(dj=='5'){
         			var tb = new BMap.Icon("images/kh_b.png", new BMap.Size(15,15));
         		}else if(dj=='6'){
         			var tb = new BMap.Icon("images/kh_c.png", new BMap.Size(15,15));
         		}else if(dj=='7'){
         			var tb = new BMap.Icon("images/kh_d.png", new BMap.Size(15,15));
         		}
         		
         		
         		
			 	var marker = new BMap.Marker(pt,{icon:tb});  // 创建标注
			     
			     
         		
         		var content = data[i].C_NAME;
 				var id1 = data[i].NAME;
         		
 				addClickHandler(id1,content,marker);
 				function addClickHandler(id1,content,marker){
 					marker.addEventListener("click",function(e){
 						//显示详情
 						openInfo2(id1,content,e)
 					});
 				}
                 
 				map.addOverlay(marker);
             }

         }
     });
}

//单机网格或点显示详情
function openInfo2(id1,content,e){
	console.log(content);
	console.log(e);
	console.log(id1);
	var opts = {
		  width : 200,     // 信息窗口宽度
		  height: 100,     // 信息窗口高度
		  title : "客户信息:" , // 信息窗口标题
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

function selectMapPoint(){
			//map.clearOverlays();
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
	            	//getBoundary1();
	                //console.log(data);
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
    setTimeout(function(){
        showPolygon(this);
	}, 3000);
}
		
		function selectMapPoint1(){
			map.clearOverlays();
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
	            	if(jd==""){
	            		getBoundary1();
	            	}else{
	            		getZJ();
	            	}
	            	
	               // console.log(data);
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
		}
		
		function selectMapPoint2(){
			//map.clearOverlays();
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
	            	//getBoundary1();
	                //console.log(data);
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
	        setTimeout(function(){
		        showPolygon(this);
			}, 1000);
		}
		function selectMapPoint3(){
			//map.clearOverlays();
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
	            	//getBoundary1();
	                //console.log(data);
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
		}
		function delectMapPoint(obj){
			var a =$(obj).parent().parent().children("td").eq(0).text();
			 $.ajax({
	            type: "POST",
	            url: "delectMapPoint",
	            data: {"id":a},
	            dataType: "json",
	            success: function(data){
	                //console.log(data);
	                if(data.result=='SUCCESS'){
	                	alert("删除成功！");
	                	if($("#jd").val()!=""){
		                	getZJ();
	                	}else{
	                		selectMapPoint1();
	                	}
	                	selectXQ1();
	                }
	                
	            }
	        });
		}
		
	function closeWindow(){
	    clearAll();
	    $('#w').window('close');
	}
	function openWindow(){
		$('#w').window('open');
	}