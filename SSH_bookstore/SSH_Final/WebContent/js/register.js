
		    function checkForm(){
        	 if(checkUser()&&checkPassword()&&checkRepassword()&&checkTelephone()&&checkAddress())
//        	  	alert(checkUser()+"--"+checkPassword());
        	 {
        		 if(checkRand())
        			 
        		 return true;
        	 else { alert("验证码错误");return false;}
        	 }
        	
//        	 alert("yzm"+randnum+"code:"+code);
alert("格式不正确，检查后重新输入");
        	 return false;
        	 }

        	 function check(name,reg,tipId,trueInfo,falseInfo){
        	     var flag;
        	     var val = document.getElementsByName(name)[0].value;
        	     var tipNode = document.getElementById(tipId);
        	     if(reg.test(val)){
        	     	
        	     	tipNode.innerHTML = trueInfo.fontcolor("green");
        	     	return true;
        	         
        	     }else{
        	     	
        	     	tipNode.innerHTML = falseInfo.fontcolor("red");
        	     	return false;
        	         
        	     }
        	 }

        	 function checkRand()
        	 {
        	 	 var code=document.getElementById("code").value;
        	 	 if(code==randnum) return true;
        	 	 else return false;
        	 }
        	 //校验用户名
        	 function checkUser()
        	 {
        	     var reg = /^[A-Za-z0-9\u4e00-\u9fa5]{1,8}$/gi;      //只允许字母数字汉字,1到8位 gi全局匹配忽略大小写 
        	     return check("user.user_name",reg,"nametip","✔","格式错误");

        	 }
        	 function checkTelephone()
        	 {
        		 var reg = /^[0-9]{11}$/g;   //只允许字母数字 1到11位
//         		  var reg = /^[1]{0,10}$/g; 
        		  return check("user.telephone",reg,"telephonetip","✔","格式错误");	
        	 } 
        		  
        	 
        	 //校验密码
        	 function checkPassword()
        	 {
        	      var reg = /^[0-9a-zA-Z]{1,11}$/g;   //只允许字母数字 1到11位
        	      return check("user.password",reg,"passwordtip","✔","格式错误");
        	 }
       
        	 function checkRepassword(){
        		    
        		    //获取确认密码框里内容
        		    var rspassword = document.getElementsByName("repassword")[0].value;
        		    //获取密码框里内容
        		    var password = document.getElementsByName("user.password")[0].value;
        		    var reptip = document.getElementById("repasswordtip");
        		    if (rspassword == password) {
        		        reptip.innerHTML = "✔".fontcolor("green");
        		        return true;
        		    }
        		    else {
        		        reptip.innerHTML = "两次密码不一致".fontcolor("red");
        		        return false;
        		    }
        		   
        	}
        	 function checkAddress()
        	 {
        		  var reg = /^[A-Za-z0-9\u4e00-\u9fa5]{0,15}$/g;      //只允许字母数字汉字,1到15位 g全局匹配 
        		 return check("user.address",reg,"addresstip","✔","格式错误")
        	 }
        	 
 