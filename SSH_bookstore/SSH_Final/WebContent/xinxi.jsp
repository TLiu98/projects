<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <%@ page import="com.java1234.entity.User"%>
    <%@ taglib uri="/struts-tags" prefix="s" %>
    <% String path=request.getContextPath()+"/"; %>
    <%User user=(User)session.getAttribute("currentUser"); %>
<!DOCTYPE>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="author" content="order by dede58.com"/>
		<title>网络书城</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
		 <style type="text/css">

    /*为了使菜单居中*
    
    
    /* -------------菜单css代码----------begin---------- */
    .menuDiv { 
        border: 3px solid #FF0000; 
        overflow: hidden; 
        display:inline-block;
        
    }
    
    /* 去掉a标签的下划线 */
    .menuDiv a {
        text-decoration: none;
    }
    
    /* 设置ul和li的样式 */
    .menuDiv ul , .menuDiv li {
        list-style: none;
      
        padding: 0;
        float: center;
    } 
    
    /* 设置二级菜单绝对定位，并隐藏 */
    .menuDiv > ul > li > ul {
        position: absolute;
        z-index:999;
        display: none;
         }

    /* 设置二级菜单的li的样式 */
    .menuDiv > ul > li > ul > li {
        float: none;
    }
  
    /* 鼠标放在一级菜单上，显示二级菜单 */
    .menuDiv > ul > li:hover ul {
        display: block;
    }

    /* 一级菜单 */
    .menuDiv > ul > li > a {
        width: 230px;
      line-height: 35px;
        color: #FFFFFF;
        background-color: #FF0000;
       
        display: block;
    }
    .menuDiv > ul > li > img {
       
       margin:10px;
     
    }
    /* 在一级菜单中，第一个不设置左边框 */
    .menuDiv > ul > li:first-child > a {
        border-left: none;
    }

    /* 在一级菜单中，鼠标放上去的样式 */
    .menuDiv > ul > li > a:hover {
        color:#FFFFFF;
        background-color: #FF0000;
    }

    /* 二级菜单 */
    .menuDiv > ul > li > ul > li > a {
    border:2px;
      position:relative;
    display: block;
   width: 176px;
   height: 46px;
   line-height:46px;
   font-size: 14px;
    padding: 10px 30px;
     background-color: #FF3300;
     color:#000;
     text-align:center;
    }
    
    /* 在二级菜单中，第一个设置顶边框 */
    .menuDiv > ul > li > ul > li:first-child > a {
        border-top: 1px solid #FF3300;
        
    }
    
    /* 在二级菜单中，鼠标放上去的样式 */
    .menuDiv > ul > li > ul > li > a:hover {
        color: #FFF;
        background-color: #FF0000;
    }
    /* -------------菜单css代码----------end---------- */
     

    </style>	
	<script type="text/javascript" src="Store/js/shop.js"></script>
		<script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
	
		
		<script type="text/javascript">
			var x = 1;
			function show(state){
				if(state=="sub"){
					if(x<=0){
						document.getElementById('num').innerHTML="0";
					}else{
						x--;
						document.getElementById('num').innerHTML=x;
					}
				}else if(state=="sum"){
					x++;
					document.getElementById('num').innerHTML=x;
				}
			}
			var bookId=document.getElementById("bookId").value;
			function InsertoShoppingcart(){
				 window.location.href="InsertoShoppingcart.action?num="+x+"&bookId="+${bookId};
		}
			function BooktoShoppingcart(){
				 window.location.href="BooktoShoppingcart.action?num="+x+"&bookId="+${bookId};
		}
		
			
		
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

</head>
<body>

	<!-- start header -->
		<header>
			<div class="top center">
				
				<div class="right fr">
					<div class="gouwuche fr">
					
					

					
					
		<a href="Shoppingcart.action" onclick="return sp()">购物车</a>
	

					</div>
					<div class="fr">
						<ul>
							<%if(user!=null){ %>
							<li>你好,<font style="color:red;"><%out.print(user.getUser_name()); %></font></li>
							<li><a href="Logout.action">【退出】</a></li>
						<%}else{ %>
					
							<li><a href="./login.jsp" target="_blank">登录</a></li>
							<li>|</li>
							<li><a href="./register.jsp" target="_blank" >注册</a></li>
							<li>|</li>
								<%} %>
							<li><a href="findallorder.action" onclick="return sp()">我的订单</a></li>
							<li>|</li>
							<li><a href="./update.jsp" onclick="return sp()" >修改资料</a></li>
							<li>|</li>
							<li><i class="cart"></i><a href="#"></a></li>

							
		
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</header>
		</header>
	<!--end header -->

<!-- start banner_x -->
	
		<div class="banner_x center">
			<a href="./index.jsp" target="_blank"><div class="logo fl"></div></a>
         
			<div class="nav fl">
				<ul>
					<li><font size="10px"color="00CCFF">网  络 书  城</font></a></li>
					<li><a href=""><font size="10px"color="33FFFF">Bookstore</font></a></li>
           </ul>

			</div>

		
	
			<div class="search fr">
				<form action="findbylike.action" method="post" name="select">
					<div class="text fl">
						<input type="text" name="information" required="required" class="shuru"  >
					</div>

					<div class="submit fl">

						<input type="submit" class="sousuo" value="搜索" />
					</div>	
					<p>小说/传记/文学/其他</p>
					</form>
				
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
			
			
			
<form method="post" name="book" action="book.action">
	<div class="jieshao mt20 w">
		<div class="left fl" style="madding-top:20px;position: absolute;
    top: 50%;
    left: 27%;
    transform: translate(-50%, -50%);" >
		
		
		<img  src="./bkimg/${book.picture}" alt="" style="width:400px;height:400px" />
		
    
    
 
 
		
		
		</div>
		<div class="right fr">
			<div class="h3 ml20 mt20">
			<img  src="image/grid_view.png">${bookName}</div>
    
			<div class="jiage ml20 mt10">类型:其他分类</div>
					<div style="margin-left:20px;margin-top:20px;font-size:20px">${book.discription}</div>
			<div class="goumai">
					<p>购买数量:</p>
				</div>
			<div class="content">
								
				
			<a id="sub" href="javascript:void(0)" onclick="show('sub')">-</a>
			<div id="num">1</div>
			<a id="sum" href="javascript:void(0)" onclick="show('sum')">+</a>
		</div>
	
			<div class="xqxq mt20 ml20">
				<div class="top1 mt10">
					<div class="left1 fl"></div>
					<div class="right1 fr"></div>
					<div class="clear"></div>
				</div>
				<div class="bot mt20 ft20 ftbc">价格:￥${book.price}</div>
				<div class="bot mt10 ft20 ftbc">特价:￥${book.special_price}</div>
<%-- 				${bookId} --%>
<%-- 				<span id="bookId"  value="${bookId}"></span> --%>
			</div>
			<div  class="xiadan ml20 mt10">
					<input class="jrgwc"  type="button" name="jrgwc" onclick="BooktoShoppingcart()" value="立即购买"/>
			
					<input class="jrgwc" type="button" id="butn" onclick="InsertoShoppingcart()" value="加入购物车"/>
				
			</div>
			<div style="font-size:15px;margin-top:30px;margin-left:20px">
			<font style="color:red"><s:property value="msg"/></font>
			</div>
			</div>
		</div>
</form>

	<!-- footer -->
	<div align="center" style="margin-top:50px"> 
		<img src="image/footer.jpg" alt="" style="margin-top:80px"/>
		</div>
	
	</body>
</html>
 