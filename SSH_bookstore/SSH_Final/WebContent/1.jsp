    <%@ page import="com.java1234.entity.*"%>
<%--     <%@ taglib uri="/struts-tags" prefix="s" %> --%>
    <% String path=request.getContextPath()+"/"; %>
    <%@ page import="java.util.ArrayList" %>
    <%User user=(User)session.getAttribute("currentUser"); %>
    <%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
         <%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE>
<html>
<head>
    <meta charset="UTF-8">
    <script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
    <script type="text/javascript" src="test.js"></script>
    <title>购物车</title>
    <link rel="stylesheet" type="text/css" href="./css/style.css">


</head>
<body>
<!-- start header -->
<!--end header -->

<!-- start banner_x -->
<div class="banner_x center">
    <div class="logo fl"></div>

    <div class="wdgwc fl ml40">我的购物车</div>
    <div class="wxts fl ml20">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</div>
    <div class="dlzc fr">

<!--       		<div class="fr"> -->
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
            <li>|</li>
            <li><a href="./dingdanzhongxin.jsp" target="_blank">我的订单</a></li>

            <li>|</li>
            <li><a href="./update.jsp" target="_blank">修改资料</a></li>
            <li>|</li>
            <li><i class="cart"></i><a href="#"></a></li>


        </ul>
    </div>
    <div class="clear"></div>
</div>
<form method="post" action="shoppingcart.action" name="form1">

    <div class="xiantiao"></div>
    <div class="gwcxqbj">
        <div class="gwcxd center">
            <div class="top2 center">
                <div class="sub_top fl">
                    <input type="checkbox" value="quanxuan" class="quanxuan"/>全选
                </div>
                <div class="sub_top fl">商品</div>
                <div class="sub_top fl"></div>
                <div class="sub_top fl">单价</div>
                <div class="sub_top fl">数量</div>
                <div class="sub_top fl">小计</div>
                <div class="sub_top fr">操作</div>
                <div class="clear"></div>
            </div>

            <script type="text/javascript">
                function jisuan(obj) {

                    var total = 0;

                    var books = document.getElementsByName("book");
                    var nums = document.getElementsByName("count");

                    for (var index = 0; index < books.length; index++) {

                        if (books[index].checked) {

                            total += parseFloat(books[index].value) * parseFloat(nums[index].value);

                        }

                    }

                    myspan.innerHTML = total + "元";
                }

                window.onload = function () {

                    var obox = document.getElementById("box");

                    var inputs = obox.getElementsByTagName("input");

                    for (var index = 0; index < inputs.length; index++) {

                        inputs[index].onclick = function () {

                            jisuan(this);

                        }
                    }
                }
            </script>
            <ul id="box">
                <%
                    ArrayList<Shoppingcart> list = (ArrayList) session.getAttribute("list");
                    ArrayList<Book> list1 = (ArrayList) session.getAttribute("list1");
                    for (int i = 0; i < list.size(); i++) {
                        Shoppingcart shoppingcart = list.get(i);
                        Book book = list1.get(i);%>


                <li id="ii" value="<%=i%>">
                    <i id="i" class="aaaaaaaaa"><%=i%></i>
                    <div class="content2 center">
                        <div class="sub_content fl ">
                            <div style="margin-top: 40px">
                                <input type="checkbox" name="book" value="<%=book.getPrice()%>"/>
                                <!--id="sss" class="quanxuan" />-->
                            </div>
                        </div>
                        <div class="sub_content fl">
                            <div style="width:100px;height:100px">${book.picture}</div>
                        </div>
                        <div class="sub_content fl ft20"><%=book.getBookName()%>
                        </div>
                        <div class="sub_content fl "><span name="price"><%=book.getPrice()%></span></div>
                        <div class="sub_content fl">
                            <div class="content" style="margin-top: 40px">


                                <input id="min" name="" type="button" value="-">
                                <input id="num" name="count" class="booknum" type="text" value="1" readonly="true">
                                <input id="add" name="<%=i%>" class="addnum" type="button" value="+">


                            </div>
                            <!--
                            <div style="margin-top: 40px">


                    <input class="shuliang" name="count" type="number" value="" step="1" min="1"/>
                            </div>
                            -->
                        </div>
                        <div class="sub_content fl">￥<span
                                id="sp"><%=book.getPrice() * shoppingcart.getCount()%></span></div>
                        <div class="sub_content fl"><a href="">×</a></div>
                        <div class="clear"></div>
                    </div>
                </li>
                <%}%>
            </ul>
        </div>

        <div class="jiesuandan mt20 center">
            <div class="tishi fl ml20">
                <ul>
                    <li><a href="./index.jsp ">继续购物</a></li>
                    <li>|</li>
                    <li>共<span>${book.count}</span>件商品，已选择<span>1</span>件</li>

                </ul>
            </div>
            <div class="jiesuan fr">
                <div class="jiesuanjiage fl">合计（不含运费）：$<span id="myspan">0.0元</span></div>
                <div class="jsanniu fr"><input class="jsan" type="submit" name="jiesuan" value="提交订单"/></div>
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
