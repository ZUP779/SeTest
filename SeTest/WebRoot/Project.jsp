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
      <h2> Project </h2>
      <ul>
        <li><strong class="p10">&#8250;</strong>Let's enjoy projects</li>
        <li><hr></li>
        <% 
        try{
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=Soft_item","sa", "yepeng");
			String email=(String)session.getAttribute("email");
			String login = (String)session.getAttribute("login");
			int pid;
			java.sql.Date pdate;
			String tel;
			String qq;
			String nick;
			int sco;
			int pnum;
			String pinfo;
			Statement stmt = conn.createStatement();
			Statement stmt2 = conn.createStatement();
//			4、执行查询或更新
			String sql = "select * from dbo.Projecting_NotClose";
			/*
				create proc select_U_R_Project_NotClose
					@U_R_Email varchar(50)
				as
					begin
					select User_Release.U_R_Tel,User_Release.U_R_QQ,User_Release.U_R_Nick,
							User_Release.U_R_Sco,Projecting_NotClose.*  from User_Release,Projecting_NotClose
						where User_Release.U_R_Email = Projecting_NotClose.U_R_Email 
						and User_Release.U_R_Email = @U_R_Email
					end
			*/
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
			//System.out.println(123);
			pid = rs.getInt(1);
			email = rs.getString(2);
			pnum = rs.getInt(3);
			pinfo = rs.getString(4);
			pdate = rs.getDate(5);
			
			
        %>
        <li>
        <form action = "servlet/InsertPU?pid=<%=pid %>" style="#ffffff">
        	<tr><td><h2>项目编号：<%=pid %></h2></td></tr>
        	<tr><td><h4>发布人：<%=email %></td><td>发布时间：<%=pdate %></h4></td></tr>
        	<tr><td><h3>正文内容:<%=pinfo %><br><br><br></h3></td></tr>
        	<tr><td>截至日期：2018-01-01   </td><td>需求人数：<%=pnum %>人<br></td></tr>
        	<tr><td>标签：Java</td></tr>
        	<!--  <tr><td><a href="index.html">了解详情</a></td></tr>-->
        	
        	<%
        	if( login != null && login.equalsIgnoreCase("up")){
	        	boolean f = false;
	        	String sql2 = "select * from dbo.Projecting_NotClose where U_R_Email ='"+email+"'";
	        	ResultSet rs2 = stmt2.executeQuery(sql2);
	        	while(rs2.next()){
		        	if(rs2.getInt(2) == pid){
		        		f = true;
		        	}
	        	}
	        	if( f == false){
        	%> 
        	<tr><td><input type="submit" value="参加"></td></tr>
        	<%
        		}
        	}
        	%>
		</form>
		<li><hr>
		</li>
		<%
			
			}
			conn.close();
			stmt.close();
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		
		%>
<!-- <li>
	<form style="#ffffff">
        	<tr><td><h2>学习行为分析</h2></td></tr>
        	<tr><td><h4>发布人：xxx</td><td>发布时间：2017-12-24</h4></td></tr>
        	<tr><td><h3>正文内容<br><br><br></h3></td></tr>
        	<tr><td>截至日期：2018-02-03   </td><td>总人数：10 人（已参与 1人）<br></td></tr>
        	<tr><td>标签：数据库    python  </td></tr>
        	<tr><td><a href="index.html">了解详情</a></td></tr>
</form>
	
</li>-->

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
