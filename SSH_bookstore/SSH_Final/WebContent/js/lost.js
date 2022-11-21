
		    function checkForm(){
        	 if(checkTelephone())
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
        	 function checkTelephone()
        	 {
        		 var reg = /^[0-9]{11}$/g;   //只允许字母数字 1到11位
//         		  var reg = /^[1]{0,10}$/g; 
        		  return check("user.telephone",reg,"telephonetip","✔","格式错误");	
        	 } 
        		  
        	 
        	 //校验密码
        	        	 
 