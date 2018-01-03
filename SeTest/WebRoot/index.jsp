<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String log = (String)session.getAttribute("login");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>HOME</title>
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
      <h1>Project Platform</h1>
    </div>
    <div class="fr p10"><a href="#"><img src="./images/1.jpg" width="80" /></a></div>
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
    <div class="main_top">
      <div class="main_topl">
        <h2><a href="Login.jsp">Login</a></h2>
        <h2><a href="Register.jsp">Register</a></h2>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <h2><a href="#">Contact us</a></h2>
        <p>Tel: 000 0000000</p>
        <p>E-mail: xxxxxxxxxxxx@gmail.com</p>
        <p>Jimei District, Xiamen, Fujian, Jimei University</p>
      </div>
      <div class="main_topr">
        <h2><a href="#">Welcome to our Website! </a></h2>
				<p>Software project trading network is a well-known website which is independently operated by Beijing Yi Rui Tian Di Internet Information Service Co., Ltd.. After more than ten years' development, it has become the largest outsourcing and crowdsourcing platform of software and IT projects in China.</p><br>
				<p>We are committed to provide software outsourcing industry, Crowdsourcing, undertake the project and job recruitment information, for IT related needs of enterprises, software companies and software development personnel to provide a convenient online information exchange project, trading platform, focus on the development of a group of skilled and self management strong ability to communicate effectively independent community of programmers.</p><br>
				<p>Recent revision</p><br>
				<p>We expect to build a new field of independent programmers in China with more developers, designers and designers with dreams and intentions together under the wave of crowdsourcing.</p><br>
				<div class="p10"><a href="#"><img src="./images/1.png" width="550" /></a></div>
        <p></p>
        <p></p>
      </div>
      <div class="clear"></div>
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

