<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<% String path=request.getContextPath()+"/";%>

	<head>
		<meta charset="UTF-8"> 
        <meta name="author" content="order by dede58.com"/>
		<title>用户修改</title>
		<link rel="stylesheet" type="text/css" href="./css/login.css">
 
	</head>
	<body>
	<s:fielderror cssStyle="color:red"></s:fielderror>
	<font color="red"><s:property value="msg"/></font><br>
		<form  method="post" name="update"action="update.action">
		<div class="regist">
			<div class="regist_center">
				<div class="regist_top">
					<div class="left fl">找回密码</div>
					<div class="right fr"><a href="./index.jsp" target="_self">网络书城</a></div>
					<div class="clear"></div>
					<div class="xian center"></div>
				</div>
				<div class="regist_main center">
				
					
				<div class="username">手&nbsp;&nbsp;机&nbsp;&nbsp;号:&nbsp;&nbsp;<input class="shurukuang" type="text" name="user.telephone" /><span>请填写正确的手机号</span></div>
					
					<div class="username">
					<div class="left fl">验&nbsp;&nbsp;证&nbsp;&nbsp;码:&nbsp;&nbsp;<input class="yanzhengma" type="text" name="username" /></div>
						<div class="right fl"><img src="./image/yanzhengma.jpg"></div>
						<div class="clear"></div>
			</div>
				</div>
				<div class="regist_submit">
					<input  class="submit"  type="submit" name="submit" value="确定" >
				</div>
				
			</div>  
		</div>
		</form>
	</body>
</html>