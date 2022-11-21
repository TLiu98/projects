<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/struts-tags" prefix="s" %>
    <% String path=request.getContextPath()+"/"; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="author" content="order by dede58.com"/>
		<title>网络书城</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">


		 <style type="text/css">

    /*为了使菜单居中*/
   
    
    
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
        display: none;
		z-index: 999;
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

		<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
		<script type="text/javascript">

			$(document).ready(function () {

				var i = 0;

				var clone = $(".banner .img li").first().clone();//克隆第一张图片
				$(".banner .img").append(clone);//复制到列表最后
				var size = $(".banner .img li").size();


				for (var j = 0; j < size-1; j++) {
					$(".banner .num").append("<li></li>");
				}

				$(".banner .num li").first().addClass("on");

				/*自动轮播*/

				var t = setInterval(function () { i++; move();},3000);

				/*鼠标悬停事件*/

				$(".banner").hover(function () {
					clearInterval(t);//鼠标悬停时清除定时器
				}, function () {
					t = setInterval(function () { i++; move(); }, 3000); //鼠标移出时清除定时器
				});




				/*鼠标滑入原点事件*/

				$(".banner .num li").hover(function () {

					var index = $(this).index();//获取当前索引值
					i = index;
					$(".banner .img").stop().animate({ left: -index * 1200 }, 1200);
					$(this).addClass("on").siblings().removeClass("on");
				});



				/*向左按钮*/
				$(".banner .btn_l").click(function () {
					i--;
					move();
				})


				/*向右按钮*/
				$(".banner .btn_r").click(function () {
					i++;
					move();
				})

				/*移动事件*/
				function move() {
					if (i == size) {
						$(".banner .img").css({ left: 0 });
						i = 1;
					}
					if (i == -1) {
						$(".banner .img").css({ left: -(size - 1) * 1200 });
						i = size - 2;
					}
					$(".banner .img").stop().animate({ left: -i * 1200},1200);

					if (i == size - 1) {
						$(".banner .num li").eq(0).addClass("on").siblings().removeClass("on");
					} else {
						$(".banner .num li").eq(i).addClass("on").siblings().removeClass("on");
					}
				}
			});


		</script>
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
	</head>
<body>
	<!-- start header -->
		<header> 
			<div class="top center">
				
				<div class="right fr">
					<div class="gouwuche fr">
	<a href="findshoppingcart.action?shoppingcartEntity.userId=<%=session.getAttribute("userId")%>&shoppingcartEntity.bookId=0">购物车</a>
	

					</div>
					<div class="fr">
						<ul>
							<s:if test="#session.status!=null">
								<li>你好,<font style="color:red;"><s:property value="#session.user.userName"></s:property> </font></li>
								<li><a href="Logout">【退出】</a></li>
							</s:if>
							<s:else>
								<li><a href="./login.jsp" target="_blank">登录</a></li>
								<li>|</li>
								<li><a href="./register.jsp" target="_blank" >注册</a></li>
							</s:else>
							<li>|</li>
							<li><a href="findallorder.action" target="_blank" >我的订单</a></li>

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
			<a href="./index.jsp" target="_blank"><div class="logo fl"></div></a>
         
			<div class="nav fl">
				<ul>
					<li><a href="./liebiao.html" target="_blank"><font size="10px"color="FF0000">网  络 书  城</font></a></li>
					<li><a href=""><font size="10px"color="FF3300">Bookstore</font></a></li>
           </ul>

			</div>

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
								<a href="findbytype.action?bookEntity.type=1&book_type_name=商业/财经/营销">商业/财经/营销</a>
								
								
							</li>
							<li>
								<a href="findbytype.action?bookEntity.type=2&book_type_name=教育/育儿/外语">教育/育儿/外语</a>
								
								
							</li>
							<li>
								<a href="findbytype.action?bookEntity.type=3&book_type_name=时尚/娱乐/服饰">时尚/娱乐/服饰</a>
								
								
							</li>
							
								
							<li>
								<a href="findbytype.action?bookEntity.type=4&book_type_name=科技/会展/网络">科技/会展/网络</a>
								
								
							</li>
							<li>
								<a href="findbytype.action?bookEntity.type=5&book_type_name=汽车/百科/生活">汽车/百科/生活</a>
								
								
							</li>
							
								
								
			
							<li>
								<a href="findbytype.action?bookEntity.type=6&book_type_name=小说/文学/传记">小说/文学/传记</a>
								
								
							</li>
							
							<li>
								<a href="findbytype.action?bookEntity.type=7&book_type_name=其他分类">其他分类</a>
								
								
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

	<div class="banner">
		<ul class="img">
			<li><img src="image/c10.jpg" alt=""/></li>
			<li><img src="image/g2.jpg" alt="" /></li>
			<li><img src="image/c9.jpg" alt="" /></li>
			<li><img src="image/timg.jpg" alt="" /></li>
		</ul>
		<ul class="num">

		</ul>
		<div class="btn btn_l">&lt;</div>
		<div class="btn btn_r">&gt;</div>
	</div>


  

		
	<!-- end banner -->
	

	<!-- start danpin -->
	
		<div class="danpin center">
					<div class="biaoti center">
						<table>
							<tr><th><img src="./image/logo.png" alt=""></th>
						<th><font size="5px">特价图书<font></th></tr></table>
						</div>
					<div class="main center">
		
						
				<div class="mingxing fl">
				
					<div class="sub_mingxing">
<a href="./xinxi.jsp"><img src="./image/w11.png" alt=" "></a>


</div>
					<div class="pinpai"><a href="">鬼吹灯系列</a></div>
					<div class="youhui">盗墓笔记开山之作</div>
					<div class="jiage">￥99</div>
					
				</div>
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href="./xinxi.jsp"><img src="./image/w5.png" alt=""></a></div>
					<div class="pinpai"><a href="">OKR工作</a></div>
					<div class="youhui"></div>
					<div class="jiage">￥99</div>
				</div>
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href="./xinxi.jsp"><img src="./image/w9.png" alt=""></a></div>
					<div class="pinpai"><a href="">安邸AD杂志</a></div>
					<div class="youhui"></div>
					<div class="jiage">￥19</div>
				</div>
				<div class="mingxing fl"> 	
					<div class="sub_mingxing"><a href="./xinxi.jsp"><img src="./image/w4.png" alt=""></a></div>
					<div class="pinpai"><a href="">让管理发挥绩效的8个基本概念</a></div>
					<div class="youhui"></div>
					<div class="jiage">￥39</div>
				</div>
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href="./xinxi.jsp"><img src="./image/w10.png" alt=""></a></div>
					<div class="pinpai"><a href="">Noblesse望至品生活杂志</a></div>
					<div class="youhui">新品图书</div>
					<div class="jiage">￥99</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		
	
		<!-- start danpin -->

		
		<div class="danpin center">
			<div class="biaoti center">
				<table>
					<tr><th><img src="./image/logo.png" alt=""></th>
				<th ><font size="5px">新品图书<font></th></tr></table>
				</div>

				<div class="main center">

				<div class="mingxing fl">
					<div class="sub_mingxing"><a href="./xinxi.jsp"><img src="./image/w1.png" alt=""></a></div>
					<div class="pinpai"><a href="">原则principles</a></div>
	<div class="youhui">新品</div>
					<div class="jiage">￥99</div>
				</div>
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href="./xinxi.jsp"><img src="./image/w2.png" alt=""></a></div>
					<div class="pinpai"><a href="">尘埃落定</a></div>
					<div class="youhui">新品</div>
					<div class="jiage">￥99</div>
				</div>
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href="./xinxi.jsp"><img src="./image/w3.png" alt=""></a></div>
					<div class="pinpai"><a href="">稻盛和夫阿米巴经营实践</a></div>
					<div class="youhui">新品</div>
					<div class="jiage">￥19</div>
				</div>
				<div class="mingxing fl"> 	
					<div class="sub_mingxing"><a href="./xinxi.jsp"><img src="./image/w6.png" alt=""></a></div>
					<div class="pinpai"><a href="">麦肯锡问题分析与解决技巧</a></div>
					<div class="youhui">新品</div>
					<div class="jiage">￥39</div>
				</div>
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href="./xinxi.jsp"><img src="./image/w7.png" alt=""></a></div>
					<div class="pinpai"><a href="">沟通力就是执行力</a></div>
					<div class="youhui">新品</div>
					<div class="jiage">￥99</div>
				</div>
						</div>
				<div class="main center">
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href="./xinxi.jsp"><img src="./image/w8.png" alt=""></a></div>
					<div class="pinpai"><a href="">卓有成效管理者的实践</a></div>
					<div class="youhui">新品</div>
					<div class="jiage">￥99</div>
				</div>
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href="./xinxi.jsp"><img src="./image/w5.png" alt=""></a></div>
					<div class="pinpai"><a href="">OKR工作</a></div>
					<div class="youhui">新品</div>
					<div class="jiage">￥56</div>
				</div>
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href="./xinxi.jsp"><img src="./image/w4.png" alt=""></a></div>
					<div class="pinpai"><a href="">让管理发挥绩效的8个基本概念</a></div>
					<div class="youhui">新品</div>
					<div class="jiage">￥67</div>
				</div>
				<div class="mingxing fl"> 	
					<div class="sub_mingxing"><a href="./xinxi.jsp"><img src="./image/w9.png" alt=""></a></div>
					<div class="pinpai"><a href="">安邸AD杂志</a></div>
					<div class="youhui">新品</div>
					<div class="jiage">￥39</div>
				</div>
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href="./xinxi.jsp"><img src="./image/w10.png" alt=""></a></div>
					<div class="pinpai"><a href="">Noblesse望至品生活杂志</a></div>
					<div class="youhui">新品</div>
					<div class="jiage">￥99</div>
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