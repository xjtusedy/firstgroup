<%@ page language="java" import="java.sql.*,java.io.*,java.util.*,com.firstgroup.tools.JdbcUtils,com.firstgroup.bean.ShoppingcarBean,com.firstgroup.dao.ShoppingCarDao" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的购物车</title>
	<link rel="shortcut icon"  type="image/x-icon" href="<%=basePath%>img/web_logo.ico" /> 
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/wj/shopping_car.css">
	<script src="<%=basePath%>js/wj/shopping_car.js"></script>
	<link rel="stylesheet" href="<%=basePath%>css/wj/bootstrap.min.css">
	<script src="<%=basePath%>js/wj/vendor/modernizr-2.8.3.min.js"></script>
	<script>window.jQuery || document.write('<script src="<%=basePath%>js/wj/vendor/jquery-1.12.0.min.js"><\/script>')</script>
    <script src="<%=basePath%>js/wj/plugins.js"></script>
    <script src="<%=basePath%>js/wj/main.js"></script>
	<script>
            (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
            function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
            e=o.createElement(i);r=o.getElementsByTagName(i)[0];
            e.src='https://www.google-analytics.com/analytics.js';
            r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
            ga('create','UA-XXXXX-X','auto');ga('send','pageview');
    </script>
  </head>
  
  <body>
    <div id="sidebar" style="background-color:#e3e4e5;">
			<div class="container" style="background-color: #e3e4e5;">
				<div class="row" style="">
	                <div class="col-lg-6" style="padding-top:10px;" >
	                	<a href="<%=basePath%>html/mainpage1.jsp" class="logo"><img src="<%=basePath%>img/wj/logo2.png" width="100%" height="100%"></a>
	                    <a href="javascript:;" class="bootmark" rel="nofollow"><i class="icon-main icon-collect mt8 mr5"></i>收藏</a>
	                    
	                    <span>您好！欢迎您光临！</span>
	                    <span class="bar-link">
	                        <a id="username" href="<%=basePath%>html/member.jsp"></a><a href="<%=basePath%>LogoutServlet">注销</a>
	                    </span>
	                </div>
	                <div class="col-lg-6" style="padding-top:10px;">
	                    <ul class="pull-right bar-link">
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
	                    </ul>
	                </div>
	            </div>
			</div>
		</div>
		<div class="row">
			<div class="row" id="guide">
				<div class="col-md-3 col-md-offset-1"><a href="<%=basePath%>html/mainpage1.jsp"><img src="<%=basePath%>img/wj/logo.png" height="65px"></a></div>
				<div class="col-md-5 col-md-offset-3"><input type="text" name="" id="search_text" value=""><button id="search">搜索</button></div><br/>
			</div>
	        <div class="container" id="car_body">
	            <div style="background-color:white;">
	            	<div class="record">
	            		<table class="text-center" style="border:0;margin-bottom:20px;width:100%;">
	                        <tr style="font-size:20px;">
	                            <th class="col-md-1 text-left"><input id="check0" type="checkbox" onclick="check(0)"></th>
	                            <th class="col-md-5 text-center" style="margin-right:20%">商品</th>
	                            <th class="col-md-1 text-center">单价</th>
	                            <th class="col-md-3 text-center">数量</th>
	                            <th class="col-md-1 text-center">小计</th>
	                            <th class="col-md-1 text-center">操作</th>
	                        </tr>
	                    </table>
	                    <div id="mainDiv"></div>
	                    <div></div>
	                    <div class="total">
	                    	<div class="total_money">总计：&nbsp;&nbsp;&nbsp;<span id="total"></span></div>
	                    	<div class="balance"><button type="button" class="balance_button" onclick="totalbalance()">去结算</button></div>
	                    </div>
	            	</div>
	            </div>
	        </div>
        <div id="totop" onmouseover="totop_color(1)" onmouseout="totop_color(0)" onclick="gototop()" onselectstart="return false"><span id="totop_font"><strong>^</strong></span></div>
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
        <p style="text-align:center;">Copyright©2004-2017  版权所有 </p>
	</footer>
    <%
  		String userName = "";
  		userName = (String)session.getAttribute("user");
  		ShoppingCarDao shoppingCarDao = new ShoppingCarDao();
  		List<Map<String,Object>>list = shoppingCarDao.selectUserShoppingCar(userName);
	    int recordNumber = list.size();
	    if(recordNumber==0)out.println("<script>addZero()</script>");
	    System.out.println("购物车中有"+recordNumber+"条记录");
	    //out.println("<script>setGoodsNumber("+recordNumber+")</script>");
	    out.println("<script>setUserName('"+userName+"')</script>");
	    ShoppingcarBean[] shoppingCarBean = new ShoppingcarBean[recordNumber];
	    for(int i=0;i<recordNumber;i++){
	   		shoppingCarBean[i]= new ShoppingcarBean();
	   	}
	   	int[] goodsRestNumber = new int[recordNumber];
	   	out.println("<script>setArray()</script>");
	   	for(int i=0;i<recordNumber;i++) {
	    	//将查询得到的数据导入ShoppingcarBean实体类
	    	shoppingCarBean[i].setGetInTime(list.get(i).get("getintime").toString());
	    	shoppingCarBean[i].setGoodsPicture(list.get(i).get("goodspicture").toString());
	    	shoppingCarBean[i].setGoodsName(list.get(i).get("goodsname").toString());
	    	shoppingCarBean[i].setNumber(list.get(i).get("number").toString());
	    	shoppingCarBean[i].setPrice(list.get(i).get("price").toString());
	    	goodsRestNumber[i]=shoppingCarDao.selectRestGoodsNumber(shoppingCarBean[i].getGoodsName());
	    	out.println("<script>setNumber("+goodsRestNumber[i]+")</script>");
	    }
	    //向网页中添加标签
	    out.println("<script>addTable()</script>");
	    for(int i=0;i<recordNumber;i++) {
	    	out.println("<script>addTr("+(i+1)+")</script>");
	    	out.println("<script>addTd("+(i+1)+")</script>");
	    	out.println("<script>addTimeDiv("+(i+1)+",'"+shoppingCarBean[i].getGetInTime()+"')</script>");
	    	out.println("<script>addCheckBox("+(i+1)+")</script>");
	    	out.println("<script>addGoodsPicture("+(i+1)+",'"+shoppingCarBean[i].getGoodsPicture()+"')</script>");
	    	out.println("<script>addGoodsName("+(i+1)+",'"+shoppingCarBean[i].getGoodsName()+"')</script>");
	    	out.println("<script>addPrice("+(i+1)+",'"+shoppingCarBean[i].getPrice()+"')</script>");
	    	out.println("<script>addNumber("+(i+1)+",'"+shoppingCarBean[i].getNumber()+"')</script>");
	    	out.println("<script>addSubtotal("+(i+1)+")</script>");
	    	out.println("<script>addDelete("+(i+1)+")</script>");
	    }
  	 %>
  </body>
</html>
