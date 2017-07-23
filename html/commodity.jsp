<%@page import="com.firstgroup.bean.GoodsBean"%>
<%-- <%@page import="com.mysql.jdbc.Connection" %> --%>
<%@page import="java.sql.Connection" %>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.firstgroup.dao.JoininCarDao" %>  
<%@page import="com.firstgroup.dao.CommodityDao" %>          
<%@page import="com.firstgroup.tools.Db" %>
<%@page import="com.mysql.jdbc.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
 <title>商品详情</title>
	<link rel="shortcut icon"  type="image/x-icon" href="<%=basePath%>img/web_logo.ico" /> 
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">


	
	<link rel="stylesheet" type="text/css" href="./css/lxb/guide.css">
	<link rel="stylesheet" type="text/css" href="./css/lxb/bootstrap.min.css"> 
	<link rel="stylesheet" type="text/css" href="./css/lxb/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="./css/lxb/commodity.css">
	<link rel="stylesheet" type="text/css" href="./css/lxb/config_lxb.css">
	<script type="text/javascript" src="./js/lxb/commodity.js"></script>
	
  </head>
  	<%
  		String str = (String) request.getAttribute("goodsName");
		GoodsBean goods = new GoodsBean();
		CommodityDao cD=new CommodityDao();
		goods=cD.searchCommodityByName(str);
		String userName=(String)session.getAttribute("user");
		boolean flag = cD.isEmpty();
  		/* String str=(String)request.getAttribute("goodsName");
  		GoodsBean g=new GoodsBean(); 
  	  		Connection conn=Db.getConn();
  			String sql="select  goodspicture,goodsnumber,goodsname,produceplace,description,price,pid from tb_goods where goodsname like'%"+str+"%'";
  			Statement st= (Statement)conn.createStatement();
  			ResultSet rs=st.executeQuery(sql);
  		String goodsName;
  		String producePlace;
  		String description;
  		double price;
  		String pid;
  		int goodsNumber;
  		String goodsPicture;
  		GoodsBean goods =new GoodsBean();
  			if(rs.next()){
  			goodsPicture=rs.getString("goodspicture");
  			goodsNumber=rs.getInt("goodsnumber");
  			goodsName=rs.getString("goodsname");
  			producePlace=rs.getString("produceplace");
  			description =rs.getString("description");
  			price=rs.getDouble("price");
  			pid=rs.getString("pid");
  			goods.setGoodsPicture(goodsPicture);
  			goods.setGoodsNumber(goodsNumber);
  			goods.setGoodsName(goodsName);
  			goods.setProducePlace(producePlace);
  			goods.setDescription(description);
  			goods.setPrice(price);
  			goods.setPid(pid);
  			}
  	  		rs.close();
  			st.close();
  			conn.close(); */
  	%>
  <body   >
  		
		<div id="sidebar" style="height:40px;">
			<div id="sidebarborder" >
				<div id="sidebarcontent" >
					<a href="<%=basePath%>html/mainpage1.jsp" class="logo"></a>
					<a href="javascript:;" class="bootmark"  rel="nofollow">
					<i class="icon-main icon-collect mt8 mr5" ></i>收藏</a>
					<c:if  test="${user==null}">
                       <span1>您好，欢迎您光临！请</span1>
					<span1 class="bar-link">
                        <a href="<%=basePath%>html/login.jsp">登录</a>
                        <a href="<%=basePath%>html/register.jsp">免费注册</a>
                    </span1>
                    </span1>
                    </c:if>
                    <c:if test="${user!= null}">
                    	 <span1>您好，欢迎您光临！</span>
                    	<span1 class="bar-link">
                        <a href="<%=basePath%>html/member.jsp">${user}</a>
                        <a href="<%=basePath%>LogoutServlet">注销</a>
                        </span1>
                    </c:if>
				</div>
				<div id="sidebarcontent"  style="float:right;">
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
                        <li class="tel-num"><i class="icon-main icon-tel mt8 mr5"></i>8888-888-888</li>
                    </c:if>   
                    </ul>
				</div>
			</div>
		</div>
	
	<div id="all" class="container-full"  >
			<div id="logoandsearch">
				<div id="logo"><a href="<%=basePath%>html/mainpage1.jsp"><img src="./img/lxb/commodity/logo.png" height="100%" width="100%"></a></div>
				<div id="search">
					<div>
						<form action="Commodity" method="post">
  							<div><input type="text" id="searchcontent" name="searchcontent" ></div>
  							<input type="submit" id="searchbutton" value="搜索"><br>
  						</form>			
						<div id="m_shoppingcart">
						<c:if  test="${user==null}">
                      <a href="<%=basePath%>html/login.jsp"><img src="<%=basePath%>img/lyb/shoppingcart.png" alt=""></a>
                    </c:if>
                    <c:if test="${user!= null}">
                    	<a href="<%=basePath%>html/shopping_car.jsp"><img src="<%=basePath%>img/lyb/shoppingcart.png" alt=""></a>
                    </c:if>
						</div>
					</div>
				</div>
			</div>
			
			
			<%
			if (str.equals("") || !flag) {
			%>
			<div id="notfound">
				<img src="./img/lxb/commodity/notfound.png"height:100% width:100%>
				</div>
				<div
				style="border:1px solid black; margin-left:auto; margin-right:auto; width:70%; height:1px;"></div>
			<%
				} else {
			%>
			
			<div id="center">
				<div id="bigpicture" ><img id="big_picture" src="./img/goods/<%=goods.getGoodsPicture() %>"></div>
				<div id="centerleft" onmouseout="hidepicture()" onmousemove="showpicture()" >
					<div id="smallpicture"> </div>
					<img src="./img/goods/<%=goods.getGoodsPicture() %>" id="aa" height="100%" width="100%">
				</div>
				<div id="centerright">
					
					
					<form action="JoinInCar?goodsname=<%=goods.getGoodsName()%>&&goodsnumber=<%=goods.getGoodsNumber() %>&&user=${user}" method="post">
						<div id="comname" style="font-size:30px;">
						<%=goods.getGoodsName()%>
						</div>
						<br>
						<div style="width:100%;border :1px solid black;" ></div>
						<br>
						<div id="description" style="font-size:14px;">
						<%=goods.getDescription() %>
						</div>
						<br>
						<div id="celler" style="font-size:20px;">店家：
						<span2 id="mceller"><%=goods.getPid() %></span2>
						</div>
						<br>
						<div id="place" style="font-size:20px;">产地：
							<span2 id="mplace"><%=goods.getProducePlace() %></span2>
						</div>
						<br>
						<div id="price" style="font-size:20px;">商品单价：<span2 id="comprice"><%=goods.getPrice() %>元</span2>
						</div>
						<br>
						<div id="buynumber" style="font-size:20px;">数量:  </span><input id="buy_number" type="number" name="buynumber" value="1" min="1" max="<%=goods.getGoodsNumber() %>"   onkeyup="keyup()"  >
						</div>
						<div id="inventory">库存:<span id="goodsnumber" name="goodsnumber"><%=goods.getGoodsNumber() %></span>件</div>
						<br>
						
						<c:if  test="${user==null}">
                     	<a href="<%=basePath%>html/login.jsp"><input type="button"  id="shoppingcart"  value="加入购物车"><br></a>
                    </c:if>
                    <c:if test="${user!= null}">
                    <a href="<%=basePath%>html/shopping_record.jsp"><input type="submit"  id="shoppingcart" onclick="joinin()" value="加入购物车"><br></a>
                    </c:if>
					</form>
					<%JoininCarDao jcd=new JoininCarDao(); 
					%>
					
					<input type="text" id="shoppingcarnumber" style="position:absolute;top:-200px;" value="<%=jcd.getNumberInShoppingCar(userName, goods.getGoodsName()) %>"></div>
					<!-- <form action="TEST2" method="post">
						<div><input type="text" id="searchcontent" name="tt"  ></div>
  						<input type="submit" value="搜索"><br>
					</form> -->
					
				</div>
			</div>
			<div style="border:1px solid black; margin-left:auto; margin-right:auto; width:70%; height:1px;"></div>
			<%
			}
			%>
			<div id="bottom">
				<div id="recommend">商品推荐</div>
				<div id="row1">
					<div class="com-1" style="float: left; margin-left:5%;">
						<div class="compicture1">
							<a href="<%=basePath%>GotoDescription?goodsname=GTX970M8GB显存"><img src="./img/goods/GTX970M8GB显存.jpg"  height="100%" width="100%"></a>
							
							
						</div>
						<div style="border:1px solid black; margin-left:1%;	height:100%; width:1px;float:left;">
						</div>
						<div class="description1">
							<div class="comname"  style="margin-top:30%;margin-left:10%;">GTX970M8GB显存</div>
							<div class="comprice"  style="margin-top:20%;margin-left:10%;"><span id="comprice">1399.00</span>元</div>
						</div>
					</div>
					<div class="com-1" style="float: right; margin-right:5%;">
						<div class="compicture1">
							<a href="<%=basePath%>GotoDescription?goodsname=GTX980M8GB显存"><img src="./img/goods/GTX980M8GB显存.jpg"  height="100%" width="100%"></a>
							
						</div>
						<div style="border:1px solid black; margin-left:1%;	height:100%; width:1px;float:left;">
						</div>
						<div class="description1">
							<div class="comname" style="margin-top:30%;margin-left:10%;">GTX980M8GB显存</div>
							<div class="comprice" style="margin-top:20%;margin-left:10%;"><span id="comprice">2499.00</span>元</div>
						</div>
					</div>
				</div>
				<div id="row2">
					<div class="com-2">
						<div class="compicture2">
							<a href="<%=basePath%>GotoDescription?goodsname=I7四核游戏本"><img src="./img/goods/I7四核游戏本.jpg"  height="100%" width="100%"></a>
							
						</div>
						<div style="border:1px solid black; margin-top:1%;	height:1px; width:100%;">
						</div>
						<div class="description2">
							<div class="comname" style="margin-top:10%; margin-left:10%;float:left;">I7四核游戏本</div>
							<div class="comprice" style="margin-top:10%; margin-right:10%;float:right;"><span id="comprice">5600.00</span>元</div>
						</div>
					</div>
					<div class="com-2">
						<div class="compicture2">
							<a href="<%=basePath%>GotoDescription?goodsname=宝贝蛋"><img src="./img/goods/宝贝蛋.jpg"  height="100%" width="100%"></a>
							
						</div>
						<div style="border:1px solid black; margin-top:1%;	height:1px; width:100%; ">
						</div>
						<div class="description2">
							<div class="comname" style="margin-top:10%; margin-left:10%;float:left;">宝贝蛋</div>
							<div class="comprice" style="margin-top:10%; margin-right:10%;float:right;"><span id="comprice">17.90</span>元</div>
						</div>
					</div>
					<div class="com-2">
						<div class="compicture2">
							<a href="<%=basePath%>GotoDescription?goodsname=风干牛肉"><img src="./img/goods/风干牛肉.jpg"  height="100%" width="100%"></a>
							
						</div>
						<div style="border:1px solid black; margin-top:1%;	height:1px; width:100%;">
						</div>

						<div class="description2">
							<div class="comname" style="margin-top:10%; margin-left:10%;float:left;">风干牛肉</div>
							<div class="comprice" style="margin-top:10%; margin-right:10%;float:right;"><span id="comprice">39.50</span>元</div>
						</div>
					</div>
				</div>
				<div id="row3">
					<div class="com-3">
						<div class="compicture3">
							<a href="<%=basePath%>GotoDescription?goodsname=风味鸭脖"><img src="./img/goods/风味鸭脖.jpg"  height="100%" width="100%"></a>
							
						</div>
						<div style="border:1px solid black; margin-top:1%;	height:1px; width:100%; ">
						</div>
						<div class="description3">
							<div class="comname" style="width: 100%; margin-left:10%; float:left;">风味鸭脖</div>
							<div class="comprice" style="margin-top:10%; margin-left:10%;  "><span id="comprice">15.80</span>元</div>
						</div>
					</div>
					<div class="com-3">
						<div class="compicture3">
							<a href="<%=basePath%>GotoDescription?goodsname=个性刺绣半袖衫"><img src="./img/goods/个性刺绣半袖衫.jpg"  height="100%" width="100%"></a>
							
						</div>
						<div style="border:1px solid black; margin-top:1%;	height:1px; width:100%; ">
						</div>
						<div class="description3">
							<div class="comname" style="width: 100%; margin-left:10%; float:left;">个性刺绣半袖衫</div>
							<div class="comprice" style="margin-top:10%; margin-left:10%;"><span id="comprice">138.00</span>元</div>
						</div>
					</div>
					<div class="com-3">
						<div class="compicture3">
							<a href="<%=basePath%>GotoDescription?goodsname=个性鲸鱼印花T恤"><img src="./img/goods/个性鲸鱼印花T恤.jpg"  height="100%" width="100%"></a>
							
						</div>
						<div style="border:1px solid black; margin-top:1%;	height:1px; width:100%; ">
						</div>
						<div class="description3">
							<div class="comname" style="width: 100%; margin-left:10%; float:left;">个性鲸鱼印花T恤</div>
							<div class="comprice" style="margin-top:10%; margin-left:10%;"><span id="comprice">128.00</span>元</div>
						</div>
					</div>
					<div class="com-3">
						<div class="compicture3">
							<a href="<%=basePath%>GotoDescription?goodsname=韩版青年黑色衫"><img src="./img/goods/韩版青年黑色衫.jpg"  height="100%" width="100%"></a>
							
						</div>
						<div style="border:1px solid black; margin-top:1%;	height:1px; width:100%; ">
						</div>
						<div class="description3">
							<div class="comname" style="width: 100%; margin-left:10%; float:left;">韩版青年黑色衫</div>
							<div class="comprice" style="margin-top:10%; margin-left:10%;"><span id="comprice">138.00</span>元</div>
						</div>
					</div>
				</div>
			</div>
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

  </body>
</html>
