<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>sign in</title>
    
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
    background:#888484;
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
<script language="javascript" type="text/javascript">
		var code ;
		function createCode(){ 
			code = new Array();
			var codeLength = 4;
			var checkCode = document.getElementById("checkCode");
			checkCode.value = "";
			var selectChar = new Array(2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z');
			for(var i=0;i<codeLength;i++) {
			   var charIndex = Math.floor(Math.random()*32);
			   code +=selectChar[charIndex];
			}
			checkCode.value = code;
		}
		
		function chk() {
			//alert("1");
			var inputCode = document.getElementById("yzm").value.toUpperCase();
			
			if(inputCode != code ){
			   alert("验证码错误！");
			   return false;
			}
			else {
			   //alert("验证码正确！");
			   return true;
			}
		}
	</script>
</head>
<body bgcolor="#2D2D3F" onload="createCode()">
<form onsubmit="return chk()" action="servlet/CheckLogin" method="get" >
<div >项目对接平台       登录</div>
<table>	
    <tr><td><span>用户名</span></td><td><input type="text" name="user_name" /></td></tr>
    <tr><td><span>密码</span></td><td><input type="password" name="user_password" /></td></tr>
    <tr><td><span>验证码</span></td><td><input type="text" id="yzm"/></td><td><input type="button" id="checkCode" onClick="createCode()" title="刷新验证码" style="width:50px;color:#F00;border:0;letter-spacing:1px;font-family:Arial;" /></td></tr>
    <tr><td colspan="2"><input type="submit" value="立即登录" /></td>
    </form>
    <form action="Register.jsp" >
    <td><input type="submit" value="我要注册" /></td></tr>
    </form>
</table>
</form>
</body>
</html>