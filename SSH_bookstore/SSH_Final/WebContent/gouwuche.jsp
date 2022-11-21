    <%@ page import="com.java1234.entity.*"%>
     <%@ page import="com.java1234.entity.User"%>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
   <%User user=(User)session.getAttribute("currentUser"); %>
<!DOCTYPE>
<html>
<head>
    <meta charset="UTF-8">
    <script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
    <script type="text/javascript">
    function insertorder() {
        var books = document.getElementsByName("book");
        //var bookids = document.getElementsByName("bookid");
        var choice = "";
        for (var i = 0; i < books.length; i++){
            if (books[i].checked == true){
                choice += i;
            }
        }
        console.log(choice);
        document.form111.action = "Inserttoorder.action?choice='"+choice+"'";
        document.form111.submit();
    }
</script>
    <script type="text/javascript" src="test.js"></script>
    <title>购物车</title>
    <link rel="stylesheet" type="text/css" href="./css/style.css">

    <!--数量改变css-->
    <style>
        .button1{
            width:25px;height:25px;margin-top:46px;margin-left:0px;background:#D0D0D0;border:0;cursor: pointer;

            float:left;

        }
        .button1:hover{
            background: #FF3300;
        }
        .button2{
            width:25px;height:25px;margin-top:46px;margin-left:0px;background:#D0D0D0;border:0;cursor: pointer;
            float:right;

        }
        .button2:hover{
            background: #FF3300;
        }
    </style>

</head>
<body>
<!-- start header -->
<!--end header -->

<!-- start banner_x -->
<div class="banner_x center">
    <div class="logo fl"></div>

    <div class="wdgwc fl ml40">我的购物车</div>
    <div class="wxts fl ml20">温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算<font style="color:red"><s:property value="msg"/></font></div>
    <div class="dlzc fr">

        <ul>
          	<%if(user!=null){ %>
							<li>你好,<font style="color:red;"><%out.print(user.getUser_name()); %></font></li>
							<li><a href="Logout.action">【退出】</a></li>
						<%}else{ %>
					
						
							<li><a href="login.jsp">登录</a></li>
							<li>|</li>
							<li><a href="register.jsp">注册</a></li>
							<li>|</li>
							<%} %>
            <li><a href="findallorder.action" >我的订单</a></li>

            <li>|</li>
            <li><a href="index.jsp" >返回首页</a></li>
            <li>|</li>
            <li><i class="cart"></i><a href="#"></a></li>


        </ul>
    </div>
    <div class="clear"></div>
</div>
<form method="post" name="form111">

    <div class="xiantiao"></div>
    <div class="gwcxqbj">
        <div class="gwcxd center">
            <div class="top2 center">
                <div class="sub_top fl">
                    <input type="checkbox" id="btu"  name="quanxuan" class="quanxuan"/>全选
                </div>
                <div class="sub_top fl">商品</div>
<!--                 <div class="sub_top fl"></div> -->
                <div class="sub_top fl">单价</div>
                <div class="sub_top fl">数量</div>
                <div class="sub_top fr">操作</div>
                <div class="clear"></div>
            </div>



            <!--下面为循环遍历得到两个list的信息，并进行传值操作。-->



            <ul id="box">
                <%
                    ArrayList<Shoppingcart> list = (ArrayList) session.getAttribute("list");
                    ArrayList<Book> list1 = (ArrayList) session.getAttribute("list1");
                    for (int i = 0; i < list.size(); i++) {
                        Shoppingcart shoppingcart = list.get(i);
                        Book book = list1.get(i);%>


                <li id="ii" value="<%=i%>">
                    <div class="content2 center">
                        <div class="sub_content fl ">
                            <div style="margin-top: 40px">
                                <input type="checkbox" name="book" value="<%=book.getPrice()%>"/>
                                <!--id="sss" class="quanxuan" />-->
                            </div>
                        </div>
                        <div class="sub_content fl">
<%--                             <div style="width:100px;height:100px">${book.picture}</div> --%>
                        </div>
                        <div class="sub_content fl ft20" style="margin-left:70px;"><%=book.getBookName()%>
                        </div>
                        <div class="sub_content fl ft20" style="margin-left:0px;"><span name="price"><%=book.getPrice()%></span></div>
                        <div class="sub_content fl" style="margin-left:-20px;">
                            <div class="content" style="margin-top: 40px;width:80px">


                                <!--修改数量-->

                                <input style="cursor: pointer;width:25px;height:30px;float:left" id="min" name="<%=i%>" class="minnum"  type="button" value="-"> 
                                <input style="border:0;width:15px;height:25px;text-align: center" id="num" name="count" class="booknum" type="text" value="<%=shoppingcart.getCount()%>" readonly="true">
                                <input id="add"  style="cursor: pointer;width:25px;height:30px;float:right" name="<%=i%>" class="addnum"  type="button" value="+">

                            </div>

                        </div>
                        <!--提交信息，删除记录-->
                        <!--通过userid和bookid在shoppingcartaction中搜索到该订单信息，并进行delete操作。同时需list(即shoppingcart的集合).remove(该记录)中的数据，直接返回到该界面,详情见action-->
                        <div class="sub_content fl" style="margin-left:300px"><a href="deletebook.action?&bookId=<%=book.getBookId()%>">×</a>
                        <div class="clear"></div>
                    </div>
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
                <div class="jsanniu fr"><input class="jsan" type="submit" name="jiesuan" onclick="insertorder()" value="提交订单"/></div>
                <div class="clear"></div>
            </div>
<!--             <hr size="5px" color="orangered"> -->
<div align="center">
    <img src="./image/header.jpg" alt=""/>
            <div class="clear"></div>
        </div>

    </div>
</form>
<div>
</div>
</body>
</html>