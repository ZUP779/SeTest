<%@ page language="java" import="java.util.*;import java.sql.*;" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Home</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
  <div class="clear"></div>
  <div class="main">
    <div class="Project">
      <h2> Introduce </h2>
      <hr/> 
      <ul>
        <li><strong class="p10">&#8250;</strong>My information is as follows   </li>
        <li>
        <form action="servlet/UpdateMes" method="get">
			用户名：<input type="text" value="<%=session.getAttribute("nick") %>"  placeholder="这是我的用户名"  name="user"><br><br>
				 联系邮箱：<input type="text" value="<%=session.getAttribute("email") %>"  placeholder="这是我的邮箱"  name="email"><br><br>
				qq：<input type="text" value="<%=session.getAttribute("qq") %>"       placeholder="请输入qq号"  name="qq"><br><br>
				联系方式:<input type="text" value="<%=session.getAttribute("pho") %>"       placeholder="请输入手机号"  name="pho"><br><br>
				 擅长领域：<br><input type="checkbox" name="java" value="1">Java
               <input type="checkbox" name="c语言" value="1">C语言/C++
               <input type="checkbox" name="PHP" value="1">PHP
               <input type="checkbox" name="数据库开发" value="1">数据库开发
               <input type="checkbox" name="python" value="1">Python
               <input type="checkbox" name="硬件" value="1">硬件
               <input type="checkbox" name="大数据" value="1">大数据
               <input type="checkbox" name="人工智能能" value="1">人工智能
                <input type="checkbox" name="UI" value="1">UI <br><br>
  				<tr><td> 学校：
              <input type="text" value="<%=session.getAttribute("school") %>" placeholder="请输入学校"  name="school"><br><br>
             </td></tr><br><br>
   				个人简介：<br><textarea name="info" cols="30" rows="10" ><%=session.getAttribute("info") %></textarea><br><br>
   <input type="submit" value="修改">
</form>
      
      
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
