<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@ taglib uri="/struts-tags" prefix="s" %>
   
<!DOCTYPE>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="author" content="order by dede58.com"/>
		<title>购物车</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
	

	</head>
	<body>
	<!-- start header -->
	<!--end header -->

<!-- start banner_x -->
		<div class="banner_x center">
			<div class="logo fl"></div>
			
			<div class="wdgwc fl ml40">订单详情</div>
			<div class="wxts fl ml20">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</div>
			<div class="dlzc fr">
				<ul>
					<li><a href="./login.jsp" target="_blank">登录</a></li>
					<li>|</li>
					<li><a href="./register.jsp" target="_blank">注册</a></li>	
				</ul>
				
			</div>
			<div class="clear"></div>
		</div>
		<form method="post" action="shoppingcart.action" name="shoppingcart">
		<div class="xiantiao"></div>
		<div class="gwcxqbj">
			<div class="gwcxd center">
				<div class="top2 center">
					<div class="sub_top fl">
						<input type="checkbox" value="quanxuan" class="quanxuan"/>全选
					</div>
					<div class="sub_top fl">订单编号</div>
					<div class="sub_top fl">商品名称</div>
					<div class="sub_top fl">单价</div>
					<div class="sub_top fl">数量</div>
					<div class="sub_top fl">小计</div>
					<div class="sub_top fr">操作</div>
					<div class="clear"></div>
				</div>
				<div class="content2 center">
					<div class="sub_content fl ">
						<div style="margin-top: 40px">
						<input type="checkbox" value="quanxuan" class="quanxuan" />
						</div>
					</div>
					<div class="sub_content fl"><div style="width:100px;height:100px">${book.picture}</div></div>
					<div class="sub_content fl ft20">${book.book_name }</div>
					<div class="sub_content fl ">￥${book.price}</div>
					<div class="sub_content fl">
						<div style="margin-top: 40px">

						<input class="shuliang" type="number" value="${book.count}" />
						</div>
					</div>
					<div class="sub_content fl">￥${book.price*book.count}</div>
					<div class="sub_content fl"><a href="">×</a></div>
					<div class="clear"></div>
				</div>
				</div>
				<div style="width: 220px;height: 30px;border:1px solid #ccc;padding:5px 10px; ">
		地址:&nbsp;<input class="shurukuang" type="text" name="user.user_name" value="${user.user_name}"/></div>
					<div style="width: 220px;height: 30px;border:1px solid #ccc;padding:5px 10px; ">
				电话:&nbsp;<input class="shurukuang" type="text" name="order.telephone" /></div>
				
			
			<div class="jiesuandan mt20 center">
				
				<div class="jiesuan fr">
					<div class="jiesuanjiage fl">合计（不含运费）：<span>￥${book.price*book.count}</span></div>
					<div class="jsanniu fr"><input class="jsan" type="submit" name="jiesuan"  value="确认订单"/></div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
			
		</div>
</form>
  <hr size="5px" color="orangered">
  <div align="center"> 
  	<img src="./image/header.jpg" alt=""/>
  	</div>

	

	

	</body>
</html>
