	  <%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
             <%@ page import="com.java1234.entity.User"%>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <%@ taglib uri="/struts-tags" prefix="s" %>
<%--     <%@ page import="java.net.*" /> --%>
     <%@ page import="java.net.*"%>
        <%@ page import="java.util.*" %>
<!--         <globalization fileEncoding="utf-8" requestEncoding="utf-8" responseEncoding="utf-8" culture="zh-CN"/> -->


    <%User user=(User)session.getAttribute("currentUser"); %>
  <%  
      String book_type_name=request.getParameter("book_type_name");
     %>
    
<!DOCTYPE>

<html>
<head>
<%-- 	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script> --%>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>网络书城</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
<script type="text/javascript">	
$(document).ready(function(){
    $(".butn").click(function(){
//  	 alert("点击事件");    
		var minPrice=document.getElementById("minPrice").value;
 	    var maxPrice=document.getElementById("maxPrice").value;
    	var type = <%=request.getParameter("book.type")%>;
    	var typename="<%=request.getParameter("book_type_name")%>"; 
 	 window.location.href="findbytype.action?book.type="+type+"&book_type_name="+typename+"&minPrice="+minPrice+"&maxPrice="+maxPrice;
        }); 
})
</script>
            <script type="text/javascript">	
  function sp(){
        var user=<%=user%>;
        if(user==null)
        { alert("请先登陆");
        return false;}
        else return true;
  }
</script>
        <link rel="stylesheet" type="text/css" href="css/index.css">
         <link rel="stylesheet" type="text/css" href="css/menu.css">
          <style type="text/css">
   

 .top1{width: 1226px;height: 40px;background: rgb(240,240,240);margin-top:-10px;margin-left:18%;}
.top1 ul li{float: left;font-size: 15px;color:#383838;}
.top1 ul li a{display:block;padding:0 8px;font-size: 15px;font-family: Times New Roman;color:#383838;}
.top1 ul li a:hover{color:#FF0000;}

   </style>
    <style type="text/css">

    /*为了使菜单居中*/
   
    
    
    /* -------------菜单css代码----------begin---------- */
    .xyz{ 
        overflow: hidden; 
        display:inline-block;
        margin-top:0px;
    }
    
    /* 去掉a标签的下划线 */
    .xyz a {
        text-decoration: none;
    }
    
    /* 设置ul和li的样式 */
    .xyz ul , .xyz li {
        list-style: none;
      
        padding: 0;
        float: center;
    } 
    
    /* 设置二级菜单绝对定位，并隐藏 */
    .xyz > ul > li > ul {
        position: absolute;
           z-index:999;
        display: none;
         }

    /* 设置二级菜单的li的样式 */
    .xyz > ul > li > ul > li {
        float: none;
    }
  
    /* 鼠标放在一级菜单上，显示二级菜单 */
    .xyz > ul > li:hover ul {
        display: block;
    }

    /* 一级菜单 */
    .xyz > ul > li > a {
        width: 50px;
      line-height: 20px;
        color: #383838;
        background-color: #F0F0F0;

    }
    .xyz > ul > li > img {
       
       margin:10px;
     
    }
    /* 在一级菜单中，第一个不设置左边框 */
    .xyz > ul > li:first-child > a {
        border-left: none;
    }

    /* 在一级菜单中，鼠标放上去的样式 */
    .xyz > ul > li > a:hover {
        color:#FFF;
        background-color: #fff;
    }

    /* 二级菜单 */
    .xyz > ul > li > ul > li > a {
    border:1px;
      position:relative;
    display: block;
   width: 60px;
   height: 20px;
   line-height:20px;
   font-size: 14px;
    padding: 10px 30px;
     background-color: #FFF;
     color:#383838;
     text-align:center;
    }
    
    /* 在二级菜单中，第一个设置顶边框 */
    .xyz > ul > li > ul > li:first-child > a {
        border-top: 1px solid #F0F0F0;
        
    }
    
    /* 在二级菜单中，鼠标放上去的样式 */
    .xyz > ul > li > ul > li > a:hover {
        color: #FF0000;
        background-color: #FF3300;
    }
    /* -------------菜单css代码----------end---------- */
     .xiadan1{height: 40px;line-height: 30px;}
.xiadan1 .jrgwc1{height: 20px;width: 40px;border:none;background:#FF3300;color:#FFF;font-size: 15px;font-weight: bold;cursor:pointer;}
.xiadan1 .jrgwc1:hover{border:1px solid #FF3300;  background-color: #FF0000;}
.xiadan1 .jrgwc{height: 20px;width: 40px;border:none;background:#F0F0F0;color:#000;font-size: 15px;font-weight: bold;cursor:pointer;margin-left:20px;}
.xiadan1 .jrgwc:hover{border:1px solid #F0F0F0;  background-color: #C8C8C8;}
    </style>

   
</head>
<body>
	<!-- start header -->
		<header> 
			<div class="top center">
				
				<div class="right fr">
					<div class="gouwuche fr">
					
				
					
	<a href="Shoppingcart.action" onclick="return sp()" >购物车</a>
	

					</div>
					<div class="fr">
						<ul>
					<%if(user!=null){ %>
							<li>你好,<font style="color:red;"><%out.print(user.getUser_name()); %></font></li>
							<li><a href="Logout.action">【退出】</a></li>
						<%}else{ %>
					
						
							<li><a href="login.jsp">登录</a></li>
							<li>|</li>
							<li><a href="register.jsp" >注册</a></li>
							<li>|</li>
							<%} %>
							<li><a href="findallorder.actionp" onclick="return sp()">我的订单</a></li>
							
							<li>|</li>
							<li><a href="update.jsp" onclick="return sp()">修改资料</a></li>
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
			<a href="./index.jsp" target="_blank"><div class="logo fl"></div></a>
         
			<div class="nav fl">
				<ul>
					<li><a href="./liebiao.html" target="_blank"><font size="10px"color="00CCFF">网  络 书  城</font></a></li>
					<li><a href=""><font size="10px"color="33FFFF">Bookstore</font></a></li>
           </ul>

			</div>

			<div class="search fr">
				<form action="findbylike.action" method="post" name="select">
					<div class="text fl">
						<input type="text" required="required" name="information" class="shuru"  >
					</div>

					<div class="submit fl">

						<input type="submit"  class="sousuo" value="搜索" />
					</div>	
					<p>小说/传记/文学/其他</p>
					</form>
					<div class="clear"></div>
				
			
					<div class="clear"></div>
				</div>
		</div>
			
	
	<form>
	<table width="100%" border="0px" bgcolor="#FF3300">
	<tr><th width="10%">
	<th>	
	<div class="menuDiv">
			
      
          
             <ul>
             <li><a href="#">商品分类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="./image/list_view.png"></a>

          
        
             <ul>
							<li>
								<a href="findbytype.action?book.type=1&book_type_name=商业/财经/营销">商业/财经/营销</a>
								
								
							</li>
							<li>
								<a href="findbytype.action?book.type=2&book_type_name=教育/育儿/外语">教育/育儿/外语</a>
								
								
							</li>
							<li>
								<a href="findbytype.action?book.type=3&book_type_name=时尚/娱乐/服饰">时尚/娱乐/服饰</a>
								
								
							</li>
							
								
							<li>
								<a href="findbytype.action?book.type=4&book_type_name=科技/会展/网络">科技/会展/网络</a>
								
								
							</li>
							<li>
								<a href="findbytype.action?book.type=5&book_type_name=汽车/百科/生活">汽车/百科/生活</a>
								
								
							</li>
							
								
								
			
							<li>
								<a href="findbytype.action?book.type=6&book_type_name=小说/文学/传记">小说/文学/传记</a>
								
								
							</li>
							
							<li>
								<a href="findbytype.action?book.type=7&book_type_name=其他分类">其他分类</a>
								
								
							</li>
						</ul>
         
            </li> 

        </ul>
</div>		
</th>
<th width="15%"><a href="./index.jsp"><font color="white">首页</font></a></th>
			<th width="15%"><a href="./hot.jsp"><font color="white">特价书籍</font></a></th>
			<th width="15%"><a href="./new.jsp"><font color="white">新品图书</font></a></th>
			<th width="15%"><a href="./about.jsp"><font color="white">关于我们</font></a></th>
		   <th width="15%"></th>
</tr>
</table>
	</form>		
	
	
	
	
	

<div class="danpin center">
    <div class="biaoti center">
        <table>
            <tr><th><img src="./image/logo.png" alt=""></th>
                <th><font size="5px"><% out.print(request.getParameter("book_type_name"));%></font></th></tr>
        </table>
    </div>
     <div class="top1 center">

        <div class="left fl">

            <div class="fl">
                <ul>
 
                        <li style="margin-top:13px" title="点击后恢复综合排序"><a href="findbytype.action?book.type=<%=request.getParameter("book.type")%>&book_type_name=<%=book_type_name %>">综合排序</a></li>
                        <li style="margin-top:13px">|</li>
                              <li style="margin-top:13px" title="点击后按价格升序"><a href="findbytype.action?book.type=<%=request.getParameter("book.type")%>&book_type_name=<%=book_type_name %>&asc=1"  >按价格升序</a></li>

                    <li style="margin-top:13px">|</li>
                    <li style="margin-top:13px" title="点击后按价格降序"><a href="findbytype.action?book.type=<%=request.getParameter("book.type")%>&book_type_name=<%=book_type_name %>&desc=1">按价格降序</a></li>

                    <li style="margin-top:13px">|</li>
                    <li style="margin-top:13px" title="点击后按价格区间查找">价格区间
                    </li>
       
        
    <li style="margin-top:13px">

<%-- <a href="findbytype.action?book.type=<%=request.getParameter("book.type")%>&book_type_name=<%=book_type_name %>&minPrice=1&maxPrice=30">区间查询</a> --%>
    <div class="xyz">
    <ul>
    <li>
      <input type="text" id="minPrice" placeholder="最低价" required="required" style="width:50px;height:20px">
      
                  	<span>-</span>
                  	<input type="text" id="maxPrice"  name="maxPrice" placeholder="最高价" style="width:50px;height:20px">
                  	<input type="button" class="butn" value="确认" style="width:50px;height:20px">
<!--                   	<input type="button" value="确认3" onclick="f1()" style="width:50px;height:20px"> -->
          <ul>
          <li>
<!-- 							<div  class="xiadan1"> -->
<!-- 					<input class="jrgwc1"  type="button" name="jrgwc" value="确认"/> -->
			
<!-- 					<input class="jrgwc" type="button" name="jrgwc"  value="取消"/> -->
				
<!-- 			</div> -->
								
								
							</li>
						</ul>
         
            </li> 

        </ul>
</div>

                  </li>
                    
<!--                     <li style="margin-top:13px">&nbsp;&nbsp;|</li> -->
                   
<!--      <li style="margin-top:13px">&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</li> -->
<!-- <li> -->
<!-- <input type="checkbox" value="quanxuan"  style="width:15px;height:15px;margin-top:13px"/> -->
<!-- </li> -->
<!--    <li style="margin-top:13px"><a href="./dingdanzhongxin.jsp" target="_blank" >促销</a></li> -->
                </ul>
            </div>
          </div>
    </div>
    <div class="main center">
        <font color="red" size="4"><s:property value="msg"/></font>
        <s:if test="msg != ''">
            <br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp">返回主页</a>
        </s:if>

       <s:iterator value="bookList" var="book">
        <div class="mingxing fl">
            <div class="sub_mingxing"><a href="findinformation.action?book.bookId=<s:property value="bookId"/>&book_type_name=<%=request.getParameter("book_type_name")%>">	<img  src="./bkimg/${picture}" alt="" /></a></div>
            <div class="pinpai"><a href="findinformation.action?book.bookId=<s:property value="bookId"/>&book_type_name=<%=request.getParameter("book_type_name")%>"><s:property value="bookName"/> </a></div>
            <div class="youhui">售价：<s:property value="price"/> </div>

        </div>
        </s:iterator>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>
