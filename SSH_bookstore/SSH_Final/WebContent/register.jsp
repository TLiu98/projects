<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>

<title>注册账号</title>
	<link rel="stylesheet" type="text/css" href="css/login.css">
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
<script type="text/javascript"
	src="js/register.js"></script>
	
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
            	 $("#error_msg").html("<font color='#339933'>✔ 已发送,请查收</font>");
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
document.getElementById("btnSendCode").value="请在" + curCount + "后再次获取";//更改按钮文字
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
document.getElementById("btnSendCode").value="请在" + curCount + "秒后再次获取";
}
}


</script>
</head>
<body class="main">
	<body background="image/g3.jpg"  style="background-size:cover;">
			<form action="Register.action" method="post" onsubmit="return checkForm();" style="position:center;" >
		<div class="regist" style=" position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%); // 自身宽度和高度的一半">">
			<div class="regist_center" >
				<div class="regist_top">
					<div class="left fl">会员注册</div>
					<div class="right fr"><a href="index.jsp" target="_self">返回首页</a></div>
					<div class="clear"></div> 
					<div class="xian center"></div>
				</div>
				<div class="regist_main center">
								<font style="color:red"><s:property value="error"/></font>
				
					<div class="username">用&nbsp;&nbsp;户&nbsp;&nbsp;名:&nbsp;&nbsp;<input class="shurukuang" type="text" name="user.user_name" placeholder="请输入你的用户名" required="required" autofocus onblur="checkUser()"/><span><font style="color:blue">(*必填)</font>只允许字母数字汉字,1到8位</span><span id="nametip" ></span></div>
					<div class="username">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;<input class="shurukuang" type="password" name="user.password" placeholder="请输入你的密码" required="required" onblur="checkPassword()"/><span><font style="color:blue">(*必填)</font>只允许字母数字,1到11位</span><span id="passwordtip" ></span></div>
					
					<div class="username">确认密码:&nbsp;&nbsp;<input class="shurukuang" type="password" name="repassword" placeholder="请确认你的密码" required="required" onblur="checkRepassword()"/><span><font style="color:blue">(*必填)</font>两次密码要输入一致哦</span><span id="repasswordtip" ></span></div>
					
					<div class="username">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:&nbsp;&nbsp;<input class="shurukuang" type="text" name="user.adress" placeholder="请填写正确的地址"  onblur="checkAddress()"/><span>只允许字母数字汉字,0到15位</span><span id="addresstip" ></span></div>
					<div class="username">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:&nbsp;&nbsp;<input class="shurukuang" type="email" name="user.email" placeholder="请填写正确的email" /><span>请输入邮箱正确格式</span></div>
					<div class="username">手&nbsp;&nbsp;机&nbsp;&nbsp;号:&nbsp;&nbsp;<input class="shurukuang" type="text" name="user.telephone" id="user.telephone"  class="user.telephone"  required="required" placeholder="请填写正确的手机号"  onblur="checkTelephone()"/><span>只允许数字，0到11位</span><span id="telephonetip" ></span></div>
					<div class="username">
						<div class="left fl">验&nbsp;&nbsp;证&nbsp;&nbsp;码:&nbsp;&nbsp;<input class="yanzhengma" type="text" name="code"  id="code" placeholder="请输短信验证码"/></div>
						<div class="right fl"><input type="button" id="btnSendCode" class="butn" name="btnSendCode" value="免费获取验证码" onclick="sendMessage();" required="required"><span id ="error_msg">${msg}</span></div>
						<div>
				
				
							
							</div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="regist_submit" style="madding-top:-20px">
					<input class="submit" type="submit" name="submit" value="立即注册"  >
				</div>
				
			</div>
		</div>
		</form>
		
	</body>
</html>