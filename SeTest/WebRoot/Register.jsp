<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<style>
div{
    background:#EFD9AC;
    font-size:24px;
    padding:5px;
    color:white;
}
form{
    background: #F8F8FF ;
    border:#357FC4 solid 1px;
    color:#575454;  
    width:400px;
    margin:20px auto;
    font-size:15px;
}
table{
    margin:10px auto;
}
a{
    text-decoration:none;
}
input[type="button"]{
    background:#228B22;
    color:white;
    font-size:15px;
    font-weight:bold;
    width:120px;
    height:40px;
}
td:first-child{
    text-align:right;
    padding:0 5px;
}
td:only-child{
    text-align:center;
    font-size:12px;
}
span:before{
    content:"* ";
    color:red;
}
input[type="text"]:read-only{
    border:#888484 solid 2px;
    background:#888484;
    font-weight:bold;   
}
input[type="text"]:hover{
    background:#EFD9AC;
}
</style>
</head>
<body bgcolor="#2D2D3F">
<form action="servlet/CheckReg" method="get">
<div >注册账号</div>
<table>
    <tr><td><span>用户名</span></td><td><input type="text" name="user_name" /></td></tr>
    <tr><td><span>email</span></td><td><input type="text" name="user_email" /></td></tr>
    <tr><td><span>密码</span></td><td><input type="password" name="user_password" /></td></tr>
    <tr><td><span>确认密码</span></td><td><input type="password" name="user_confirm_password" /></td></tr>
    <tr><td><span>手机号码</span></td><td><input type="text" name="user_phone1" /></td></tr>
    <tr><td>性别</td><td><input type="radio" name="user_male" checked />男<input type="radio" name="user_female" />女</td></tr>
    <tr><td>类型</td><td><input type="radio" name="user_p" checked />学生<input type="radio" name="user_r" />老师</td></tr>
    <tr><td colspan="2"><input type="checkbox" checked/>我已看过并接受<a href="#">《用户协议》</a></td></tr>
    <tr><td colspan="2"><input type="submit" value="立即注册" /></td></tr>
</table>
</form>
</body>
</html>