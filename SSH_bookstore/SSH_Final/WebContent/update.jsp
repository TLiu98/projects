<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import="com.java1234.entity.User"%>
 <%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<% String path=request.getContextPath()+"/";%>

	<head>
		<meta charset="UTF-8"> 
		<title>用户修改</title>
		<link rel="stylesheet" type="text/css" href="css/login.css">
		<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/register.js"></script>
 
	</head>
	<body background="image/h2.png" style="background-size:cover;">
	<%if((User)session.getAttribute("currentUser")==null)  
 	{out.print("<script>alert('无权访问,请先登录'); </script>");
      response.sendRedirect("login.jsp");}%>
	<% User user =(User)session.getAttribute("currentUser");
	%>
	<s:fielderror cssStyle="color:red"></s:fielderror>
	<font color="red"><s:property value="msg"/></font><br>
	<form action="Update.action" method="post" class="form center" style="position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);">
		<div class="regist" style="background:rgba(255, 255, 255, 0.25) none repeat scroll 0 0 !important;/*实现FF背景透明，文字不透明*/
filter:Alpha(opacity=25); /*实现IE背景透明*/">
			<div class="regist_center">
				<div class="regist_top">
					<div class="left fl">修改资料</div>
					<div class="right fr"><a href="index.jsp" target="_self">返回首页</a></div>
					<div class="clear"></div>
					<div class="xian center"></div>
				</div>
				<div class="regist_main center">
					<div class="username">用&nbsp;&nbsp;户&nbsp;&nbsp;名:&nbsp;&nbsp;<input class="shurukuang" type="text" name="user.user_name" value="<%out.print(user.getUser_name());%> "placeholder="请输入你的用户名" required="required"  onblur="checkUser()"/><span><font style="color:blue">(*必填)</font>只允许字母数字汉字,1到8位</span><span id="nametip" ></span></div>
					<div class="username">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;<input class="shurukuang" type="text	" name="user.password" value="<%out.print(user.getPassword());%>" placeholder="请输入你的密码" required="required" onblur="checkPassword()"/><span><font style="color:blue">(*必填)</font>只允许字母数字,1到11位</span><span id="passwordtip" ></span></div>
					
					<div class="username">确认密码:&nbsp;&nbsp;<input class="shurukuang" type="password" name="repassword" placeholder="请确认你的密码" required="required" onblur="checkRepassword()" value="<%out.print(user.getPassword());%>"/><span><font style="color:blue">(*必填)</font>两次密码要输入一致哦</span><span id="repasswordtip" ></span></div>
					<div class="username">手&nbsp;&nbsp;机&nbsp;&nbsp;号:&nbsp;&nbsp;<input class="shurukuang" type="text" name="user.telephone" placeholder="请填写正确的手机号"  onblur="checkTelephone()" value="<%out.print(user.getTelephone());%>"/><span>只允许数字，0到11位</span><span id="telephonetip" ></span></div>

					<div class="username">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:&nbsp;&nbsp;<input class="shurukuang" type="text" name="user.adress" placeholder="请填写正确的地址" value="<%out.print(user.getAdress());%>" onblur="checkAddress()"/><span>只允许字母数字汉字,0到15位</span><span id="addresstip" ></span></div>
					<div class="username">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:&nbsp;&nbsp;<input class="shurukuang" type="email" name="user.email" placeholder="请填写正确的email" value="<%out.print(user.getEmail());%>"/><span>请输入邮箱正确格式</span></div>
					<div class="username">
<!-- 						<div class="left fl">验&nbsp;&nbsp;证&nbsp;&nbsp;码:&nbsp;&nbsp;<input class="yanzhengma" type="text" name="username" placeholder="请输入验证码"/></div> -->
<!-- 						<div class="right fl"><img src="./image/yanzhengma.jpg"></div> -->
						<div class="clear"></div>
					</div>
				</div>
				<div class="regist_submit">
					<input  class="submit"  type="submit" name="submit" value="立即修改" >
				</div>
				
			</div>  
		</div>
		</form>
	</body>
</html>