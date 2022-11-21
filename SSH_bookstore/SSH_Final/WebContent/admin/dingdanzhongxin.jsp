<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="author" content="order by dede58.com"/>
		<title>个人中心</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
	</head>
	<body>
	<!-- start header -->
		<header>
			<div class="top center">
				
				<div class="right fr">
					<div class="gouwuche fr"><a href="">我的订单</a></div>
					<div class="fr">
						<ul>
							<s:if test="#session.status!=null">
								<li>你好,<font style="color:red;"><s:property value="#session.userName"></s:property> </font></li>
								<li><a href="Logout">【退出】</a></li>
							</s:if>
							<s:else>
								<li><a href="./login.jsp" target="_blank">登录</a></li>
								<li>|</li>
								<li><a href="./register.jsp" target="_blank" >注册</a></li>
							</s:else>
							<li>|</li>
							<li><a href="./dingdanzhongxin.jsp" target="_blank" >我的订单</a></li>

							<li>|</li>
							<li><a href="./update.jsp" target="_blank" >修改资料</a></li>
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
					<li><a href="./self.jsp">我的个人中心</a></li>
					<li><a href="">消息通知</a></li>
					<li><a href="">收货地址</a></li>
				</ul>
			</div>
		</div>
		<div class="rtcont fr">
			<div class="ddzxbt">交易订单</div>


			<font color="red" size="4"><s:property value="msg"/></font>
			<s:iterator value="orderlist" var="order">

			<div class="ddxq">
				<div class="ddspt fl">
				<div style="width:80px;height:80px">	
					<img src="image/w2.png" alt=""></div></div>
				<div class="ddbh fl">订单号:<s:property value="orderId"/> </div>
				<div class="ztxx fr">
					<ul>
						<li><s:if test="#status == 1">已发货</s:if> <s:else>未发货</s:else></li>
						<li><s:property value="price"/> </li>
						<li><s:property value="timee"/> </li>
						<li><s:property value="adress"/> </a></li>
						<div class="clear"></div>
					</ul>
				</div>
				<div class="clear"></div>
			</div>


			</s:iterator>

		</div>
		<div class="clear"></div>
		</div>
	</div>
<!-- self_info -->
		
		<hr size="5px" color="orangered">
		<div align="center"> 
			<img src="./image/header.jpg" alt=""/>
			</div>
	</body>

</html>