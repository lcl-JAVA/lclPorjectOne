<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/indexAll/index.css">
	
	<script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>
  </head>
  
  <body>
	<div class="wrap">
		<div class="logo">
		 <h1><a href="#"><img src="images/code.png"></a></h1>
		</div>
		<p>鼠标移入侧边栏，二级菜单3D展开</br>鼠标hover背景变色</br>鼠标移入二维码背景变色</p>
		<div style="text-align:center;margin:50px 0; font-size:20px; color:#ffffff;" >
			适用浏览器：360、FireFox、Chrome、Opera、傲游、搜狗、世界之窗. 不支持Safari、IE8及以下浏览器。<br><br>
			来源：<a href="http://sc.chinaz.com/" target="_blank">站长素材</a>
		</div>
	
	</div>
	<div class="nav-main">
	<div class="nav-box">
	<div class="nav">
	  <ul class="nav-ul">
	  	<li><a href="#" class="home"><span>首页</span></a></li>
	  	<li><a href="#" class="develop"><span>H5开发</span></a></li>
	  	<li><a href="#" class="wechat"><span>微信推广</span></a></li>
	  	<li><a href="#" class="case"><span>项目案例</span></a></li>
	  	<li><a href="#" class="news"><span>信息资讯</span></a></li>
	  	<li><a href="#" class="contact"><span>关于我们</span></a></li>
	  </ul>
	</div>
	<div class="nav-slide">
	    <div class="nav-slide-o"></div>
	    <div class="nav-slide-o">
	    	<ul>
	    		<li><a href="#"><span>微信开发</span></a></li>
	    		<li><a href="#"><span>微信开发</span></a></li>
	    		<li><a href="#"><span>微信开发</span></a></li>
	    		<li><a href="#"><span>微信开发</span></a></li>
	    		<li><a href="#"><span>微信开发</span></a></li>
	    		<li><a href="#"><span>微信开发</span></a></li>
	    		<li><a href="#"><span>微信开发</span></a></li>
	    		<li><a href="#"><span>微信开发</span></a></li>
	    		<li><a href="#"><span>微信开发</span></a></li>
	    		<li><a href="#"><span>微信开发</span></a></li>
	    	</ul>
	    </div>
	    <div class="nav-slide-o">
	    	<ul>
	    		<li><a href="#"><span>微信关注</span></a></li>
	    		<li><a href="#"><span>微信关注</span></a></li>
	    		<li><a href="#"><span>微信关注</span></a></li>
	    		<li><a href="#"><span>微信关注</span></a></li>
	    		<li><a href="#"><span>微信关注</span></a></li>
	    		<li><a href="#"><span>微信关注</span></a></li>
	    		<li><a href="#"><span>微信关注</span></a></li>
	    		<li><a href="#"><span>微信关注</span></a></li>
	    	</ul>
	    </div>
	    <div class="nav-slide-o">
	    	<ul>
	    		<li><a href="#"><span>网站设计</span></a></li>
	    		<li><a href="#"><span>网站设计</span></a></li>
	    		<li><a href="#"><span>网站设计</span></a></li>
	    		<li><a href="#"><span>网站设计</span></a></li>
	    		<li><a href="#"><span>网站设计</span></a></li>
	    		<li><a href="#"><span>网站设计</span></a></li>
	    		<li><a href="#"><span>网站设计</span></a></li>
	    		<li><a href="#"><span>网站设计</span></a></li>
	    		<li><a href="#"><span>网站设计</span></a></li>
	    	</ul>
	    </div>
	    <div class="nav-slide-o">
	    	<ul>
	    		<li><a href="#"><span>企业建站</span></a></li>
	    		<li><a href="#"><span>企业建站</span></a></li>
	    		<li><a href="#"><span>企业建站</span></a></li>
	    		<li><a href="#"><span>企业建站</span></a></li>
	    		<li><a href="#"><span>企业建站</span></a></li>
	    		<li><a href="#"><span>企业建站</span></a></li>
	    		<li><a href="#"><span>企业建站</span></a></li>
	    		<li><a href="#"><span>企业建站</span></a></li>
	    		<li><a href="#"><span>企业建站</span></a></li>
	    	</ul>
	    </div>
	</div>
	</div>
	</div>
	
	<script type="text/javascript">
		$(function(){
			var thisTime;
			$('.nav-ul li').mouseleave(function(even){
					thisTime	=	setTimeout(thisMouseOut,1000);
			})
		
			$('.nav-ul li').mouseenter(function(){
				clearTimeout(thisTime);
				var thisUB	=	$('.nav-ul li').index($(this));
				if($.trim($('.nav-slide-o').eq(thisUB).html()) != "")
				{
					$('.nav-slide').addClass('hover');
					$('.nav-slide-o').hide();
					$('.nav-slide-o').eq(thisUB).show();
				}
				else{
					$('.nav-slide').removeClass('hover');
				}
				
			})
			
			function thisMouseOut(){
				$('.nav-slide').removeClass('hover');
			}
			 
			$('.nav-slide').mouseenter(function(){
				clearTimeout(thisTime);
				$('.nav-slide').addClass('hover');
			})
			$('.nav-slide').mouseleave(function(){
				$('.nav-slide').removeClass('hover');
			})
		
		})
	</script>

  </body>
</html>
