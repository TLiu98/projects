<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>

<title>Jquery</title>
	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
<script type="text/javascript">	
$(document).ready(function(){
    $(".butn").click(function(){
 	 alert("点击事件");    
        }); 
})
</script>
</head>
<body><input type="button" class="butn" value="点击" >
		
		
	</body>
</html>