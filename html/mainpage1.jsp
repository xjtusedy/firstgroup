<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@page import="com.firstgroup.bean.Goods"%>
<%@page import="com.firstgroup.dao.GoodsDao"%>
<%@page import="com.firstgroup.bean.Goods"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<%GoodsDao gd = new GoodsDao(); %>
<%List<Goods> list= gd.queryGoods();%>
<%boolean cl =false; %>
<%if(request.getAttribute("isCl")!=null){
cl=(boolean)request.getAttribute("isCl");
} %>
<%if(cl){
list=(List<Goods>)request.getAttribute("goods");
}%>
	<meta charset="UTF-8">
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<title>DailyShop</title>
	<link rel="shortcut icon"  type="image/x-icon" href="<%=basePath%>img/web_logo.ico" /> 
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/lyb/base.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/lyb/index.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/lyb/main.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/lyb/extra.css"/>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/lyb/component.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/lyb/guide.css" />
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/lyb/style.css">
	<script src="<%=basePath%>js/lyb/index_js.js"></script>
	<script src="<%=basePath%>js/lyb/modernizr.js"></script>
	<script src="<%=basePath%>js/lyb/jquery-2.1.4.js"></script>
	<script src="<%=basePath%>js/lyb/modernizr.custom.js"></script>
	<script src="<%=basePath%>js/lyb/masonry.pkgd.min.js"></script>
	<script src="<%=basePath%>js/lyb/imagesloaded.js"></script>
	<script src="<%=basePath%>js/lyb/classie.js"></script>
	<script src="<%=basePath%>js/lyb/AnimOnScroll.js"></script>
	<script src="<%=basePath%>js/lyb/main.js"></script> 
	<script type="text/javascript" src="<%=basePath%>js/lyb/jquery.pack.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/lyb/jquery.bgpos.js"></script>
	<script type="text/javascript">
	$(function() {
		/* position of the <li> that is currently shown */
		var current = 0;
		var loaded  = 0;
		for(var i = 1; i <4; ++i)
			$('<img />').load(function(){
				++loaded;
				if(loaded == 3){
					$('#bg1,#bg2,#bg3').mouseover(function(e){
						var $this = $(this);
						/* if we hover the current one, then don't do anything */
						if($this.parent().index() == current)
							return;
						/* item is bg1 or bg2 or bg3, depending where we are hovering */
						var item = e.target.id;

						/*
						this is the sub menu overlay. Let's hide the current one
						if we hover the first <li> or if we come from the last one,
						then the overlay should move left -> right,
						otherwise right->left
						 */
						if(item == 'bg1' || current == 2)
							$('#menu .sub'+parseInt(current+1)).stop().animate({backgroundPosition:"(-319px 0)"},300,function(){
								$(this).find('li').hide();
							});
						else
							$('#menu .sub'+parseInt(current+1)).stop().animate({backgroundPosition:"(319px 0)"},300,function(){
								$(this).find('li').hide();
							});

						if(item == 'bg1' || current == 2){
							/* if we hover the first <li> or if we come from the last one, then the image should move left -> right */
							$('#menu > li').animate({backgroundPosition:"(-800px 0)"},0).removeClass('bg1 bg2 bg3').addClass(item);
							move(1,item);
						}
						else{
							/* if we hover the first <li> or if we come from the last one, then the image should move right -> left */
							$('#menu > li').animate({backgroundPosition:"(800px 0)"},0).removeClass('bg1 bg2 bg3').addClass(item);
							move(0,item);
						}

						/*
						We want that if we go from the first one to the last one (without hovering the middle one),
						or from the last one to the first one, the middle menu's overlay should also slide, either
						from left to right or right to left.
						 */
						if(current == 2 && item == 'bg1'){
							$('#menu .sub'+parseInt(current)).stop().animate({backgroundPosition:"(-319px 0)"},300);
						}
						if(current == 0 && item == 'bg3'){
							$('#menu .sub'+parseInt(current+2)).stop().animate({backgroundPosition:"(319px 0)"},300);
						}

						
						/* change the current element */
						current = $this.parent().index();
						
						/* let's make the overlay of the current one appear */
					   
						$('#menu .sub'+parseInt(current+1)).stop().animate({backgroundPosition:"(0 0)"},300,function(){
							$(this).find('li').fadeIn();
						});
					});
				}	
			}).attr('src', '<%=basePath%>img/lyb/'+i+'.jpg');
		
					
		/*
		dir:1 - move left->right
		dir:0 - move right->left
		 */
		function move(dir,item){
			if(dir){
				$('#bg1').parent().stop().animate({backgroundPosition:"(0 0)"},200);
				$('#bg2').parent().stop().animate({backgroundPosition:"(-319px 0)"},300);
				$('#bg3').parent().stop().animate({backgroundPosition:"(-638px 0)"},400,function(){
					$('#menuWrapper').removeClass('bg1 bg2 bg3').addClass(item);
				});
			}
			else{
				$('#bg1').parent().stop().animate({backgroundPosition:"(0 0)"},400,function(){
					$('#menuWrapper').removeClass('bg1 bg2 bg3').addClass(item);
				});
				$('#bg2').parent().stop().animate({backgroundPosition:"(-319px 0)"},300);
				$('#bg3').parent().stop().animate({backgroundPosition:"(-638px 0)"},200);
			}
		}
	});


	$(function(){
				var aLi = $('#brand .bd-box li');
				var aImg =  $('#brand .bd-box li img');
				var aSpan = $('#brand .bd-box li span');
				aLi.each(function(index){
					$(this).mouseover(function(){
						aSpan.eq(index).stop();
						aImg.eq(index).stop();
						aImg.eq(index).css({zIndex:1}).animate({
							top:37,
							height:0
						},80,'',function(){
							$(this).hide();
							aSpan.eq(index).show().css({zIndex:2}).animate({
								top:0,
								height:75
							},80)
						})
					})
					$(this).mouseout(function(){
						aSpan.eq(index).stop();
						aImg.eq(index).stop();
						aSpan.eq(index).css({zIndex:1}).animate({
							top:37,
							height:0
						},80,'',function(){
							$(this).hide();
							aImg.eq(index).show().css({zIndex:2}).animate({
								top:0,
								height:75
							},80)
						})
					})
				})
			})
</script>
</head>
<body>
	<nav class="cd-vertical-nav">
	<ul>
		<li><a href="#section1" class="active"><span class="label">顶部</span></a></li>
		<li><a href="#section2"><span class="label">搜索</span></a></li>
		<li><a href="#section3"><span class="label">商品</span></a></li>
		<li><a href="#section4"><span class="label">底部</span></a></li>
	</ul>
</nav>
<section id="section1" class="cd-section">
			<div class="row" style="">
                <div class="col-lg-6" style="padding-top:10px;" >
                	<a href="<%=basePath%>html/mainpage1.jsp" class="logo"></a>
                    
                  <a href="javascript:;" class="bootmark" rel="nofollow"><i class="icon-main icon-collect mt8 mr5"></i>收藏</a>
                    <c:if  test="${user==null}">
                        <span>您好，欢迎您光临！请</span>
                    	<span class="bar-link">
                        <a href="<%=basePath%>html/login.jsp">登录</a>
                        <a href="<%=basePath%>html/register.jsp">免费注册</a>
                    </span>
                    </c:if>
                    <c:if test="${user!= null}">
                    	 <span>您好，欢迎您光临！</span>
                    	<span class="bar-link">
                        <a href="<%=basePath%>html/member.jsp">${user}</a>
                        <a href="<%=basePath%>LogoutServlet">注销</a>
                        </span>
                    </c:if>
                </div>
                <div class="col-lg-6" style="padding-top:10px;">
                    <ul class="pull-right bar-link">
            <c:if  test="${user==null}">
                       <li><a href="<%=basePath%>html/mainpage1.jsp">返回首页</a> | </li>
                        <li><a href="<%=basePath%>html/login.jsp">我的订单</a> | </li>
                         <c:if  test="${producer==null}">
                         	<li><a href="<%=basePath%>html/producer_login.jsp">卖家中心</a> | </li>
                    	</c:if>
                    <c:if test="${producer!= null}">
                    	 <li><a href="<%=basePath%>html/home_producer.jsp">卖家中心</a> | </li>
                    	 <li><a href="<%=basePath%>LogoutServlet">注销</a> |&nbsp;&nbsp;&nbsp;&nbsp;</li>
                    </c:if>  
                     <!--    <li><a href="">收藏夹</a> |&nbsp;&nbsp;&nbsp;&nbsp;</li> -->
                        <li class="tel-num"><i class="icon-main icon-tel mt8 mr5"></i>8888-888-888</li>
               </c:if>
                    <c:if test="${user!= null}">
                    	 <li><a href="<%=basePath%>html/mainpage1.jsp">返回首页</a> | </li>
                        <li><a href="<%=basePath%>html/shopping_record.jsp">我的订单</a> | </li>
                        <c:if  test="${producer==null}">
                         	<li><a href="<%=basePath%>html/producer_login.jsp">卖家中心</a> | </li>
                    	</c:if>
                    <c:if test="${producer!= null}">
                    	 <li><a href="<%=basePath%>html/home_producer.jsp">卖家中心</a> | </li>
                    	 <li><a href="<%=basePath%>LogoutServlet">注销</a> |&nbsp;&nbsp;&nbsp;&nbsp;</li>           
                    </c:if>
                      <!--   <li><a href="">收藏夹</a> |&nbsp;&nbsp;&nbsp;&nbsp;</li> -->
                        <li class="tel-num"><i class="icon-main icon-tel mt8 mr5"></i>8888-888-888</li>
                    </c:if>   
                    </ul>
                </div>
            </div>
			</section>
	<div class="container">
	<section id="section2" class="cd-section">
        <div class="logo-search">
            
            <div class="logo-bar">
                <a href="<%=basePath%>html/mainpage1.jsp"><img src="<%=basePath%>img/lyb/logo1.png" alt=""></a>
            </div>
            <form action="<%=basePath%>MainSearch" method="post">
            <div class="search-bar">
           
                <input type="text" name="search" class="search"  id="search" onfocus="clearContent()">
				<input type="submit" name="submit" class="submit" value="搜索">   
				
				<div class="shoppingcart">
				 	<c:if  test="${user==null}">
                      <a href="<%=basePath%>html/login.jsp"><img src="<%=basePath%>img/lyb/shoppingcart.png" alt=""></a>
                    </c:if>
                    <c:if test="${user!= null}">
                    	<a href="<%=basePath%>/html/shopping_car.jsp"><img src="<%=basePath%>img/lyb/shoppingcart.png" alt=""></a>
                    </c:if>
				</div>
				
            </div>
            </form>
        </div>
	</section>

        <div class="content">
            <div class="left-content">
                 <ul>
                    <li>商品分类</li>
                    <li><a href="<%=basePath%>GoodsClassify?id=4">服装</a></li>
                    <li><a href="<%=basePath%>GoodsClassify?id=2">旅行户外</a></li>
                    <li><a href="<%=basePath%>GoodsClassify?id=3">电子设备</a></li>
                    <li><a href="<%=basePath%>GoodsClassify?id=1">美食零食</a></li>
                    <li><a href="<%=basePath%>GoodsClassify?id=14">百货</a></li>
                    
                </ul>
            </div>
            <div class="right-content">
                <div class="topright-content">
                     <div id="menuWrapper" class="menuWrapper bg1">
                        <ul class="menu" id="menu">
                             <li class="bg1" style="background-position:0 0;">
                                <a id="bg1" href="#"></a>
                                <ul class="sub sub1" style="background-position:0 0;">
                                </ul>
                            </li>
                            <li class="bg1" style="background-position:-319px 0px;">
                                <a id="bg2" href="#"></a>
                                <ul class="sub sub2" style="background-position:-319px 0;">  
                                </ul>
                             </li>
                            <li class="last bg1" style="background-position:-638px 0px;">
                                <a id="bg3" href="#"></a>
                                <ul class="sub sub3" style="background-position:-319px 0;">   
                                </ul>
                            </li>
                    	</ul>
                    </div>
                </div>
				
				<section id="section3" class="cd-section">
				<div class="bottomright-content">	
				<ul class="grid effect-1" id="grid">
				
				
				<% if(list.isEmpty()){%>
				<p style="magin:auto;">抱歉，宝贝没有了</p>
				<%}else {for(Goods g:list){%>
				<li class="gooods">
						<div>
							<a href="<%=basePath%>GotoDescription?goodsname=<%=g.getGoodsName() %>" id=1><img src="<%=basePath%>img/goods/<%=g.getGoodsPicture()%>"></a>
						</div>
						<div class="price">
								<p class="p-price">¥<%=g.getPrice()%></p> 
								<p class="p-descripe"><%=g.getGoodsName()%></p>
						</div>
					</li>
  	<%}} %>
					
				</ul>
				
		</div>
		</section>
		</div>
         </div>
		<section id="section4" class="cd-section">
			
		
        <!--<div class="bottom">
<footer>
	<p>
            <a href="">关于我们</a><span></span>
            <a href="">联系我们</a><span></span>
            <a href="">人才招聘</a><span></span>
            <a href="">商家入驻</a><span></span>
            <a href="">广告服务</a><span></span>
            <a href="">手机APP</a><span></span>
            <a href="">友情链接</a><span></span>
            <a href="">销售联盟</a><span></span>
            <a href="">社区</a><span></span>
            <a href="">English Site</a><span></span>
            <a href="">关于我们</a><span></span>
            <a href="">关于我们</a>
        </p>
        <p>Copyright©2004-2017  版权所有 </p>
</footer>
        </div>-->
		</section>
    </div>
	       <div class="bottom">
<footer>
	<p>
            <a href="">关于我们</a><span></span>
            <a href="">联系我们</a><span></span>
            <a href="">人才招聘</a><span></span>
            <a href="">商家入驻</a><span></span>
            <a href="">广告服务</a><span></span>
            <a href="">手机APP</a><span></span>
            <a href="">友情链接</a><span></span>
            <a href="">销售联盟</a><span></span>
            <a href="">社区</a><span></span>
            <a href="">English Site</a><span></span>
            <a href="">关于我们</a><span></span>
            <a href="">关于我们</a>
        </p>
        <p>Copyright©2004-2017  版权所有 </p>
</footer>
        </div>
		<script>
			new AnimOnScroll( document.getElementById( 'grid' ), {
				minDuration : 0.4,
				maxDuration : 0.7,
				viewportFactor : 0.2
			} );
		</script>
</body>
</html>