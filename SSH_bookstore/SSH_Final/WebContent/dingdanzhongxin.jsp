    <%@ page import="com.java1234.entity.User"%>
    <%@ taglib uri="/struts-tags" prefix="s" %>
    <% String path=request.getContextPath()+"/"; %>
    <%User user=(User)session.getAttribute("currentUser"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
	<head>
		<meta charset="UTF-8">
		<title>个人中心</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
	</head>
	<body>
	<!-- start header -->
		<header>
			<div class="top center">
				
				<div class="right fr">
					<div class="gouwuche fr"><a href="Shoppingcart.action" onclick="return sp()" >购物车</a></div>
					<div class="fr">
						<ul>
					<%if(user!=null){ %>
							<li>你好,<font style="color:red;"><%out.print(user.getUser_name()); %></font></li>
							<li><a href="Logout.action">【退出】</a></li>
						<%}else{ %>
					
						
							<li><a href="login.jsp" target="_blank">登录</a></li>
							<li>|</li>
							<li><a href="register.jsp" target="_blank" >注册</a></li>
							<li>|</li>
							<%} %>
							<li><a href="findallorder.action" target="_blank" >我的订单</a></li>
							<li>|</li>
							<li><a href="index.jsp" target="_blank" >返回首页</a></li>
							<li>|</li>
							<li><i class="cart"></i><a href="#"></a></li>



						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</header>
	<!--end header -->
	<!-- start banner_x -->
		<div class="banner_x center">
			
			<div class="search fr">
				<form action="findbylike.action" method="post" name="select">
					<div class="text fl">
						<input type="text" name="information" class="shuru"  >
					</div>

					<div class="submit fl">

						<input type="submit" class="sousuo" value="搜索" />
					</div>

					<p>小说/传记/文学/其他</p>
				</form>
				<div class="clear"></div>
			</div>
		</div>
<!-- end banner_x -->
<!-- self_info -->
	<div class="grzxbj">
		<div class="selfinfo center">
		<div class="lfnav fl">
			<div class="ddzx">订单中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="" style="color:#ff6700;font-weight:bold;">我的订单</a></li>
					<li><a href="">评价晒单</a></li>
				</ul>
			</div>
			<div class="ddzx">个人中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="update.jsp">修改资料</a></li>
					<li><a href="">消息通知</a></li>
					<li><a href="">收货地址</a></li>
				</ul>
			</div>
		</div>
		<div class="rtcont fr">
			<div class="ddzxbt">交易订单  <font color="red" size="4"><s:property value="msg"/></font></div>


			
			<s:iterator value="orderlist" var="order">

			<div class="ddxq">
				<div class="ddspt fl" >
				<div style="width:80px;height:80px;">	
					<img src="image/w2.png" alt=""></div></div>
				<div class="ddbh fl" style="font-size:6px;margin-top:-20px">订单号:<s:property value="orderId"/> </div>
				<div class="ztxx fr" style="margin-top:-20px">
					<ul>
						<li><s:if test="#status == 1">已发货</s:if> <s:else>未发货</s:else></li>
						<li><s:property value="price"/> </li>
						<li><s:property  value="timee"/> </li>
						<li><s:property value="adress"/> </a></li>
						<div class="clear"></div>
					</ul>
				</div>
				
				<div class="clear"></div>
				
			</div>


			</s:iterator>
					<hr size="5px" color="orangered">
		<div align="center"> 
			<img src="./image/header.jpg" alt=""/>
			</div>

		</div>
		<div class="clear"></div>
		</div>
	</div>
<!-- self_info -->
		

	</body>

</html>