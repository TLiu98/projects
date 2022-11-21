<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%session.setAttribute("currentUser",null); %>
        <%@ taglib uri="/struts-tags" prefix="s" %>
    <% String path=request.getContextPath()+"/"; %>
<!DOCTYPE>
<html>
	<head>
		<meta charset="UTF-8">
		<title>会员登录</title>
		<style type="text/css">a:hover{txt-decoration:underline;color:orange;}</style>
		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
		<link rel="stylesheet" type="text/css" href="css/login.css">
		<script type="text/javascript" src="js/lost.js"></script>
		
<script type="text/javascript">
	 var randnum=""; 
	 for(var i=0;i<6;i++) 
	 { 
	 randnum+=Math.floor(Math.random()*10); 
	 }
	
$(document).ready(function(){
    $(".butn").click(function(){
//         var phone = $("#user.telephone").val();
var phone = document.getElementById("user.telephone").value;
        $.ajax({
        	 asynch : "false",//并发访问时异步提交
             url: "Sms.action",  
             type: "POST",
             data:{phone:phone,rand:randnum},
             dataType: "html",
        
             success: function(data){
            	 var d = eval("("+data+")");
//             	 alert("返回结果集="+data);
//             	 if(d.flag=="true")
            	 $("#error_msg").html("<font color='#339933'>✔ 已发送</font>");
//             	 else $("#error_msg").html("<font color='red'>发送失败，请重新发送</font>");
             },
             error: function(data){  
            	 var d = eval("("+data+")");
            	 alert("返回结果集="+d.flag);
                	$("#error_msg").html("<font color='red'>系统繁忙，请稍后重试</font>");
                	
              }
        });
    })
})
//  var phone=document.getElementById("name");


var InterValObj; //timer变量，控制时间
var count = 30; //间隔函数，1秒执行
var curCount;//当前剩余秒数

function sendMessage() {

// 	 var code=document.getElementById("code").value;
// 	 alert("yzm"+randnum+"code:"+code);

curCount = count;
// 设置button效果，开始计时
// document.getElementById("user.telephone").setAttribute("disabled","true" );
document.getElementById("btnSendCode").setAttribute("disabled","true" );//设置按钮为禁用状态
document.getElementById("btnSendCode").value="在" + curCount + "后重发";//更改按钮文字
InterValObj = window.setInterval(SetRemainTime, 1000); // 启动计时器timer处理函数，1秒执行一次
}
//timer处理函数

function SetRemainTime() {
if (curCount == 0) {                
window.clearInterval(InterValObj);// 停止计时器
document.getElementById("btnSendCode").removeAttribute("disabled");//移除禁用状态改为可用
document.getElementById("btnSendCode").value="重新发送验证码";
}else {
curCount--;
document.getElementById("btnSendCode").value="在" + curCount + "秒后重发";
}
}


</script>
		
	</head>
	<body background="./image/background.jpg" style="background-size:cover;">
		<!-- login -->
	<!-- 		<div class="top center"> -->
	<!-- 		</div> 	 -->
		<form action="Login.action" method="post" class="form center" >
		
		<div class="login" style="background:rgba(255, 255, 255, 0.25) none repeat scroll 0 0 !important;/*实现FF背景透明，文字不透明*/
filter:Alpha(opacity=25); /*实现IE背景透明*/">
			<div class="login_center">
				<div class="login_top">
				<br>
					<div class="left fl" >会员登录</div>
					<div class="right fr"><a href="index.jsp" >返回首页</a>|<a href="./lost.jsp" >忘记密码</a>|<a href="./register.jsp" >立即注册</a></div>
					<div class="clear"></div>
					<div class="xian center"></div>
				</div>
				<div class="login_main center">
				<font style="color:red"><s:property value="msg"/></font>
					<div class="username">用&nbsp;&nbsp;户&nbsp;&nbsp;名:&nbsp;&nbsp;<input class="shurukuang" type="text" name="user.user_name" placeholder="请输入你的用户名" required="required" autofocus></div>
					<div class="username">手&nbsp;&nbsp;机&nbsp;&nbsp;号:&nbsp;&nbsp;<input class="shurukuang" type="text" name="user.telephone"  id="user.telephone" required="required" placeholder="请填写正确的手机号"  onblur="checkTelephone()"/><span id="telephonetip" ></span></div>
					<div class="username">
						<div class="left fl">验&nbsp;&nbsp;证&nbsp;&nbsp;码:&nbsp;&nbsp;<input class="yanzhengma" type="text" name="code"  id="code" placeholder="请输短信验证码"/></div>
						<div class="right fl"><input type="button" id="btnSendCode" class="butn" name="btnSendCode" value="免费获取验证码" onclick="sendMessage();" required="required" style="madding-top:-20px"><span id ="error_msg">${msg}</span></div>
						<div>
						<div class="clear"></div>
						</div>
						
					
				
						<div class="clear"></div>
					</div>
				</div>
				<div class="login_submit">
					<input class="submit" type="submit" name="submit" value="立即登录" >
				</div>
				
			</div>
		</div>
		</form>
	
	</body>
</html>
