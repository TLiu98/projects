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
       
		<title>网络书城</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
		<link rel="stylesheet" type="text/css" href="./css/menu.css">

 <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
  <script type="text/javascript" src="js/huadong.js"></script>
<style type="text/css">
  *{ padding:0px; margin:0px;list-style:none;}
  .banner { width:1200px; height:460px; margin:0px auto; border:1px solid #808080; position:relative; overflow:hidden;}
  .banner .img{width:50000px; position:absolute; left:0px;top:0px;}
  .banner .img img{width:1200px; height:460px;}
  .banner .img li{float:left;}
  .banner .num { position:absolute; width:100%; bottom:10px; left:0px; text-align:center; font-size:0px;}
  .banner .num li { width:10px; height:10px; background-color:#888; border-radius:50%;display:inline-block; margin:0px 3px; cursor:pointer;}
  .banner .num li.on {background-color: #ff6a00;}
  .banner .btn {width: 30px;height: 50px;background-color: #808080;opacity: 0.5; filter:alpha(opacity:0.5); position:absolute;top:50%; margin-top:-25px;
          cursor:pointer;
          text-align:center;
          line-height:50px;
          font-size:40px;
          color:#fff;
          font-family:"宋体";
          display:none;
      }
      .banner .btn_l { left:0px;}
      .banner .btn_r { right:0px;}
      .banner:hover .btn { display:block;}
            </style>
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
					
						
							<li><a href="login.jsp" target="_blank">登录</a></li>
							<li>|</li>
							<li><a href="register.jsp" target="_blank" >注册</a></li>
							<li>|</li>
							<%} %>
							<li><a href="findallorder.action" onclick="return sp()" >我的订单</a></li>
							
							<li>|</li>
							<li><a href="update.jsp" onclick="return sp()">修改资料</a></li>
							<li>|</li>
							<li><i class="cart"></i></li>

							
		
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
						<input type="text" name="information" required="required" class="shuru"  >
					</div>

					<div class="submit fl">

						<input type="submit" class="sousuo" value="搜索" />
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
			
			
<!-- end banner_x -->

	<!-- start banner_y -->

  

		
	<!-- end banner -->
	

	<!-- start danpin -->

	
		<!-- start danpin -->

		
		<div class="danpin center">
			<div class="biaoti center">
				<table>
					<tr><th><img src="./image/logo.png" alt=""></th>
				<th ><font size="5px">新品图书<font></th></tr></table>
				</div>

				<div class="main center">

				<div class="mingxing fl">
					<div class="sub_mingxing"><a href="findinformation.action?book.bookId=13"><img src="./bkimg/13.png" alt=""></a></div>
					<div class="pinpai"><a href="">编程开发三剑客</a></div>
	<div class="youhui">新品</div>
					<div class="jiage">￥66</div>
				</div>
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href="findinformation.action?book.bookId=14"><img src="./bkimg/14.jpg" alt=""></a></div>
					<div class="pinpai"><a href="">python编程</a></div>
					<div class="youhui">新品</div>
					<div class="jiage">￥55</div>
				</div>
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href="findinformation.action?book.bookId=15"><img src="./bkimg/15.jpg" alt=""></a></div>
					<div class="pinpai"><a href="">windows黑客技术编程</a></div>
					<div class="youhui">新品</div>
					<div class="jiage">￥66</div>
				</div>
				<div class="mingxing fl"> 	
					<div class="sub_mingxing"><a href="findinformation.action?book.bookId=16"><img src="./bkimg/16.jpg" alt=""></a></div>
					<div class="pinpai"><a href="">财经杂志</a></div>
					<div class="youhui">新品</div>
					<div class="jiage">￥99</div>
				</div>
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href="findinformation.action?book.bookId=17"><img src="./bkimg/17.jpg" alt=""></a></div>
					<div class="pinpai"><a href="">智能商业</a></div>
					<div class="youhui">新品</div>
					<div class="jiage">￥100</div>
				</div>
						</div>
				<div class="main center">
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href="findinformation.action?book.bookId=18"><img src="./bkimg/18.jpg" alt=""></a></div>
					<div class="pinpai"><a href="">商业归根</a></div>
					<div class="youhui">新品</div>
					<div class="jiage">￥99</div>
				</div>
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href="findinformation.action?book.bookId=19"><img src="./bkimg/19.jpg" alt=""></a></div>
					<div class="pinpai"><a href="">商业生态学</a></div>
					<div class="youhui">新品</div>
					<div class="jiage">￥143</div>
				</div>
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href="findinformation.action?book.bookId=20"><img src="./bkimg/20.jpg" alt=""></a></div>
					<div class="pinpai"><a href="">营销的16个关键词</a></div>
					<div class="youhui">新品</div>
					<div class="jiage">￥58</div>
				</div>
				<div class="mingxing fl"> 	
					<div class="sub_mingxing"><a href="findinformation.action?book.bookId=3"><img src="./bkimg/3.jpg" alt=""></a></div>
					<div class="pinpai"><a href="">计算机网络</a></div>
					<div class="youhui">新品</div>
					<div class="jiage">￥45</div>
				</div>
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href="findinformation.action?book.bookId=31"><img src="./bkimg/31.png" alt=""></a></div>
					<div class="pinpai"><a href="">时尚经典</a></div>
					<div class="youhui">新品</div>
					<div class="jiage">￥69</div>
				</div>
				
				<div class="clear"></div>
			</div>
		</div>
       <hr size="5px" color="orangered">
		<div align="center"> 
			<img src="./image/header.jpg" alt=""/>
			</div>
	</body>
</html>
