<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<title>HOME</title>
	<link rel="stylesheet" type="text/css" href="css/style.css"/>
	
</head>

<body>
<div class="con">
  <div class="head">
    <div class="logo">
      <h1>HOME</h1>
    </div>
    <div class="fr p10"><a href="#"><img src="images/logo.jpg" width="80" /></a></div>
    <div class="clear"></div>
    <div class="nav">
      <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="Research.jsp">Research</a></li>
        <li><a href="Project.jsp">Project</a></li>
        <li><a href="Introduce.jsp">Introduce</a></li>
      </ul>
    </div>
    <div class="clear"></div>
  </div>

  <div class="main">
    <div class="Project">
      <h2>Release </h2>
      
      <div >
        <ul>
        	<li><strong class="p10">&#8250;</strong>You can release your item here  </li>
        	<hr>
        	
        <form action = "servlet/InsertPro" method="get">
				项目名称：<input type="text" value="" name="title"><br>       
				项目简介：<br><textarea name="pinfo" cols="80" rows="5" placeholder="请在此处输入正文"></textarea><br>
				人数：<input type="text" value=""  placeholder="请输入人数" name="pnum"><br>
				qq：<input type="text" value=""  placeholder="请输入qq" name="pqq"><br>
				标签：  <input type="checkbox" name="c语言" value="1">C语言/C++
               <input type="checkbox" name="PHP" value="1">PHP
               <input type="checkbox" name="数据库开发" value="1">数据库开发
               <input type="checkbox" name="python" value="1">Python
               <input type="checkbox" name="硬件" value="1">Java
               <input type="checkbox" name="大数据" value="1">大数据
               <input type="checkbox" name="人工智能能" value="1">人工智能
               <input type="checkbox" name="UI" value="1">UI <br>
				<input type="submit" value="发布" >
		</form></li>
        </ul>
   
 
      <div class="clear"></div>
      <p></p>
    </div>
    <div class="clear"></div>
  </div>
  <div class="clear"></div>
  <div class="foot">
    <p>HOME</p>
    <p>All Rights Reserved</p>
  </div>
  <div class="clear"></div>
</div>


  
</body>
</html>
