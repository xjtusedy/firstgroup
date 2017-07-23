<%@ page language="java" import="java.sql.*,java.io.*,java.util.*,com.firstgroup.tools.JdbcUtils,com.firstgroup.bean.RecordBean,com.firstgroup.dao.ShoppingRecordDao" pageEncoding="utf-8"%>
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
    
    <title>我的购物记录</title>
	<link rel="shortcut icon"  type="image/x-icon" href="<%=basePath%>img/web_logo.ico" /> 
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/wj/shopping_record.css">
	<script src="<%=basePath%>js/wj/shopping_record.js"></script>
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
                        <li><a href="<%=basePath%>html/shopping_car.jsp">我的购物车</a> | </li>
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
	<div id="guide" class="row">
		<div class="col-md-3 col-md-offset-1"><a href="<%=basePath%>html/mainpage1.jsp"><img src="<%=basePath%>img/wj/logo.png" height="65px"></a></div>
		<div class="col-md-5 col-md-offset-3"><input type="text" name="" id="search_text" value=""><button id="search">搜索</button></div>
	</div>
    <h1 class="text-center">我的购物记录</h1><br/>
    <div class="container" id="record_body">
        <div>
            <div class="record">
            	<table class="table table-condensed" style="font-size:20px;">
                    <tr>
                        <th class="col-md-8 text-center">订单详情</th>
                        <th class="col-md-2 text-center">店铺</th>
                        <th class="col-md-2 text-center">金额</th>
                    </tr>
                </table>
            </div>
            <div id="mainDiv"></div>
            <div id="buttomguide" style="margin-bottom:50px;text-align:center;">
                <span id="pagenumber" style="line-height:40px;">第 1 页</span><br/>
                <span class="changepage" id="a1" class="page" onclick="changePage(1)" onmouseover="setLinkStyle(1)" onmouseout="resetLinkStyle(1)">首页</span>&nbsp;&nbsp;|&nbsp;&nbsp;<span class="changepage" id="a2" class="page" onclick="changePage(2)" onmouseover="setLinkStyle(2)" onmouseout="resetLinkStyle(2)">上一页</span>&nbsp;&nbsp;|&nbsp;&nbsp;<span class="changepage" id="a3" class="page" onclick="changePage(3)" onmouseover="setLinkStyle(3)" onmouseout="resetLinkStyle(3)">下一页</span>&nbsp;&nbsp;|&nbsp;&nbsp;<span class="changepage" id="a4" class="page" onclick="changePage(4)" onmouseover="setLinkStyle(4)" onmouseout="resetLinkStyle(4)">尾页</span>
            </div>
        </div>
    </div>
    <%--<div class="col-md-8 col-md-offset-2">
        <div class="row">
        	<div class="col-md-4"><img src="<%=basePath%>img/wj/water.jpg" width="100%"></div>
        	<div class="col-md-4"><img src="<%=basePath%>img/wj/water.jpg" width="100%"></div>
        	<div class="col-md-4"><img src="<%=basePath%>img/wj/water.jpg" width="100%"></div>
		</div>
		<div class="row">
        	<div class="col-md-4"><img src="<%=basePath%>img/wj/water.jpg" width="100%"></div>
        	<div class="col-md-4"><img src="<%=basePath%>img/wj/water.jpg" width="100%"></div>
        	<div class="col-md-4"><img src="<%=basePath%>img/wj/water.jpg" width="100%"></div>
		</div>
    </div>
    <div id="suspend"></div>--%>
    <div id="totop" onmouseover="totopColor(1)" onmouseout="totopColor(0)" onclick="gotoTop()"><span id="totop_font"><strong>^</strong></span></div>
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
  		out.println("<script>setUserName('"+userName+"')</script>");
  		ShoppingRecordDao shoppingRecordDao = new ShoppingRecordDao();
  		List<Map<String,Object>>list = shoppingRecordDao.selectUserRecord(userName);
	    int recordNumber = list.size();
	    if(recordNumber==0)out.println("<script>addZero()</script>");
	    System.out.println("购物记录中有"+recordNumber+"条记录");
	    RecordBean[] recordBean = new RecordBean[recordNumber];
	   	for(int i=0;i<recordNumber;i++){
	   		recordBean[i]= new RecordBean();
	   	}
	    String shopTime = "";
	    int shopTimes = 0;										//购物次数
	    int sameTimeRecord[] = new int[recordNumber];			//每次购物中包含的记录条数
	    for(int i=0;i<recordNumber;i++)sameTimeRecord[i]=0;
	    for(int i=0;i<recordNumber;i++) {
	    	//将查询得到的数据导入RecordBean实体类
	    	recordBean[i].setShopTime(list.get(i).get("shoptime").toString());
	    	recordBean[i].setGoodsPicture(list.get(i).get("goodspicture").toString());
	    	recordBean[i].setGoodsName(list.get(i).get("goodsname").toString());
	    	recordBean[i].setNumber(list.get(i).get("number").toString());
	    	recordBean[i].setProducerName(list.get(i).get("producername").toString());
	    	recordBean[i].setPrice(list.get(i).get("price").toString());
	    	//根据时间和商家名称对数据进行分类
	    	if(!recordBean[i].getShopTime().equals(shopTime)) {
	    		System.out.println(shopTime);
	    		shopTime = recordBean[i].getShopTime();
	    		sameTimeRecord[shopTimes]++;
	    		shopTimes++;
	    	} else sameTimeRecord[shopTimes-1]++;
	    }
	    int p = (int)((shopTimes-1)/5)+1;
	    out.println("<script>setTotalPage("+p+","+shopTimes+")</script>");
	    for(int i=0;i<recordNumber;i++)System.out.println(sameTimeRecord[i]);
	    int ordinal = 0;
	    //对同一时间的购物记录按商家名称进行排序
	    for(int i=0;i<shopTimes;i++) {
	    	if(i>0)ordinal+=sameTimeRecord[i-1];
	    	for(int j=0;j<sameTimeRecord[i];j++) {
	    		for(int k=0;k<j-1;k++) {
	    			if((recordBean[ordinal+k].getProducerName()==recordBean[ordinal+j].getProducerName())&&(recordBean[ordinal+k+1].getProducerName()!=recordBean[ordinal+j].getProducerName()))
	    				for(int t=k+1;t<j;t++)recordBean[t].changeRow(recordBean[j]);
	    		}
	    	}
	    }
	    for(int i=0;i<recordNumber;i++) {
	    	System.out.println(recordBean[i].getGoodsName()+recordBean[i].getShopTime()+recordBean[i].getGoodsPicture()+recordBean[i].getNumber()+recordBean[i].getProducerName()+recordBean[i].getPrice());
	    }
	    for(int i=0;i<shopTimes;i++) {
	    	System.out.println(sameTimeRecord[i]);
	    }
	    ordinal = 0;
	    //往网页中添加标签
	    String producerName = "";
	    shopTime = "";
	    int point = 0;
	    int row = 0;
	    int tr = 0;
	    float price = 0;
	    for(int table=0;table<shopTimes;table++) {
	    	if(table>0)ordinal+=sameTimeRecord[table-1];
	    	out.println("<script>addRecord("+(table+1)+")</script>");
	    	out.println("<script>addTimeDiv('"+recordBean[ordinal].getShopTime()+"',"+(table+1)+")</script>");
	    	out.println("<script>addOuterTable("+(table+1)+")</script>");
	    	producerName=recordBean[ordinal].getProducerName();
	    	shopTime=recordBean[ordinal].getShopTime();
	    	point=ordinal;
	    	row=1;
	    	while(point<ordinal+sameTimeRecord[table]) {
	    		out.println("<script>addOuterTr("+(table+1)+","+row+")</script>");
	    		out.println("<script>addOuterTd("+(table+1)+","+row+")</script>");
	    		out.println("<script>addInnerTable("+(table+1)+","+row+")</script>");
	    		tr=1;
	    		price=0;
	    		while((producerName.equals(recordBean[point].getProducerName()))&&(shopTime.equals(recordBean[point].getShopTime()))) {
	    			out.println("<script>addInnerTr("+(table+1)+","+row+","+tr+")</script>");
	    			out.println("<script>addInnerTd("+(table+1)+","+row+","+tr+")</script>");
	    			out.println("<script>addPicture('"+recordBean[point].getGoodsPicture()+"',"+(table+1)+","+row+","+tr+")</script>");
	    			out.println("<script>addGoodsName('"+recordBean[point].getGoodsName()+"',"+(table+1)+","+row+","+tr+")</script>");
	    			out.println("<script>addNumber('"+recordBean[point].getNumber()+"',"+(table+1)+","+row+","+tr+")</script>");
	    			//out.println("<script>addTdEnd()</script>");
	    			//out.println("<script>addTrEnd()</script>");
	    			price+=Integer.parseInt(recordBean[point].getNumber())*Float.parseFloat(recordBean[point].getPrice());
	    			tr++;
	    			point++;
	    			if(point==recordNumber)break;
	    		}
	    		price=(float)(Math.round(price*100))/100;
	    		out.println("<script>addProducerName('"+producerName+"',"+(table+1)+","+row+")</script>");
	    		out.println("<script>addPrice("+price+","+(table+1)+","+row+")</script>");
	    		row++;
	    		if(point==recordNumber)break;
	    		producerName=recordBean[point].getProducerName();
	    		//out.println("<script>addTrEnd()</script>");
	    	}
	    	//out.println("<script>addTableEnd()</script>");
	    	//out.println("<script>addDivEnd()</script>");
	    }
	    
	    
  	 %>
  </body>
</html>
