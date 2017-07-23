<%@page import="com.firstgroup.bean.GoodsBean"%>
<%@page import="com.firstgroup.bean.ProducerBean"%>
<%@page import="com.mysql.jdbc.Connection" %>
<%@page import="com.firstgroup.tools.JdbcUtils" %>
<%@page import="com.mysql.jdbc.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<%String str=(String)session.getAttribute("producer");
System.out.println(str);
            JdbcUtils jdbcUtils = new JdbcUtils();
			Connection conn=(Connection)jdbcUtils.getConnection();
			ProducerBean g =new ProducerBean();
			String sql="select pid,producername,address,telephone,connectionperson,prodec,prologo,classify from tb_producer where producername like '%"+str+"%'";
			Statement st= (Statement)conn.createStatement();
  			ResultSet rs=st.executeQuery(sql);
			String pid;
			String producername;
  		    String address;
  		    String telephone;
  		    String connectionperson;
  		    String prodec;
  		    String prologo;
  		    String classify;
  		    ProducerBean producer =new ProducerBean();
  			if(rs.next()){
  			pid=rs.getString("pid");
  			producername=rs.getString("producername");
  			address=rs.getString("address");
  			telephone=rs.getString("telephone");
  			connectionperson=rs.getString("connectionperson");
  			prodec =rs.getString("prodec");
  			prologo=rs.getString("prologo");
  			classify=rs.getString("classify");
  			producer.setPid(pid);
  			producer.setProducerName(producername);
  			producer.setAddress(address);
  			producer.setTelephone(telephone);
  			producer.setConnectionPerson(connectionperson);
  			producer.setProdec(prodec);
  			producer.setPrologo(prologo);
  			producer.setClassify(classify);
  			}
  	  		rs.close();
  			st.close();
  			conn.close();
  			
  			JdbcUtils jdbcUtils1 = new JdbcUtils();
			Connection conn1=(Connection)jdbcUtils1.getConnection();
            String sql1="select goodspicture,goodsnumber,goodsname,produceplace,description,price,tb_goods.pid from tb_goods,tb_producer where tb_goods.pid=tb_producer.pid and tb_producer.producername like '%"+str+"%'";
  			/* from tb_goods,tb_producer where tb_goods.pid=tb_producer.pid and tb_producer.producername='%行店%' */
  			Statement st1= (Statement)conn1.createStatement();
  			ResultSet rs1=st1.executeQuery(sql1);
  		    String goodsName;
  		    String producePlace;
  		    String description;
  		    double price;
  		    int goodsNumber;
  		    String goodsPicture;
  			GoodsBean goods =null;
  			List<GoodsBean> l= new ArrayList<>();
  			
  		    while(rs1.next()){
  		    	goods = new GoodsBean();
	  		    pid=rs1.getString("pid");
	  			goodsPicture=rs1.getString("goodspicture");
	  			goodsNumber=rs1.getInt("goodsnumber");
	  			goodsName=rs1.getString("goodsname");
	  			producePlace=rs1.getString("produceplace");
	  			description =rs1.getString("description");
	  			price=rs1.getDouble("price");
	  			goods.setPid(pid);
	  			goods.setGoodsPicture(goodsPicture);
	  			goods.setGoodsNumber(goodsNumber);
	  			goods.setGoodsName(goodsName);
	  			goods.setProducePlace(producePlace);
	  			goods.setDescription(description);
	  			goods.setPrice(price);
	  			l.add(goods);
  			}
  	  		rs1.close();
  			st1.close();
  			conn1.close();%>
    <base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>卖家中心</title>
	<link rel="shortcut icon"  type="image/x-icon" href="<%=basePath%>img/web_logo.ico" /> 
	 <link rel="stylesheet" href="./css/xb/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="./css/xb/home_producer.css">
	<link rel="stylesheet" type="text/css" href="./css/xb/config_home_producer.css">
	<link rel="stylesheet" type="text/css" href="./css/xb/guide.css">
</head>

  	
<body>
	<div id="sidebar container-full" style="background-color:#e3e4e5;">
		<div class="container" style="background-color: #e3e4e5;">
			<div class="row" style="">
					
	                <div class="col-lg-6" style="padding-top:10px;" >
	                	<a href="<%=basePath%>html/mainpage1.jsp" class="logo"></a>
	                    <a href="javascript:;" class="bootmark" rel="nofollow"><i class="icon-main icon-collect mt8 mr5"></i>收藏</a>
	                    <c:if  test="${user==null}">
                        <span>您好，欢迎您光临！</span>
                    	<span class="bar-link">
                        <a href="<%=basePath%>html/login.jsp"></a>
                        <a href="<%=basePath%>html/register.jsp"></a>
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
                        <li><a href="<%=basePath%>html/login.jsp"></a></li>
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
                        <li><a href="<%=basePath%>html/shopping_record.jsp"></a></li>
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
			
		</div>
	</div>
	<div class="container-fluid main_box">
		<section id="banner" class="content-box banner margin-b-10">
                <div class="banner-inner">
               		<div class="banner-producer">
                		<img src="./img/xb/logo.png" class="banner-pic">
                		<!-- <div class="banner-name">卖家XXX，欢迎您</div> -->
                	</div>               
                	<div class="banner-producer-title"><%=producer.getProdec() %></div>           	
	                <!-- <div class="banner-title">卖家中心</div>                         -->
                </div> 
        </section>
		<div class="body">
	        <div class="sidebar">
                <ul class="main-ul">
                    <li class="nav-item">
                        <div class="nav-item-link button producer_name"> 卖家</div>     
                    </li>
                            </li>
                    <li class="nav-item">
                        <button class="nav-item-link button font"> 账户安全</button>           
                    </li>
                    <li class="nav-item">
                        <button class="nav-item-link button font"> 我的等级</button>           
                    </li>

                	<li class="nav-item">
                        <button class="nav-item-link button font"> 我账户绑定</button>           
                    </li>
                    <li class="nav-item">
                        <a href="<%=basePath%>html/producer_info.jsp"><button class="nav-item-link button font"> 我的信息</button></a>           
                    </li>
                    <li class="nav-item">
                        <button class="nav-item-link button"> 销售记录</button> 
                 
                    </li>
                    <li class="nav-item">
                        <button class="nav-item-link button" onclick="alert_dialog('新增商品')"> 新增商品</button> 

                </ul>
            </div>
            <div class="row">
            	<div class="content ">
            		<div class="producer_info">
            			<div class="producer_logo_box">
            				<img src="./img/producer/<%=producer.getProducerName()%>.jpg" class="producer_logo" height="50%" width="50%">
            				<!-- <button class="producer_logo_btn">进入店铺</button> -->
            			</div>	
            			<div class="producer_info_text">
            			<center><h1>店铺信息</h1></center>
							      				<h4 class="font">店铺名称：<%=producer.getProducerName() %></h4>
							      				<h4 class="font">店铺地址：<%=producer.getAddress() %></h4>
							      				<h4 class="font">联系电话：<%=producer.getTelephone() %></h4>
							      				<h4 class="font">联系人：<%=producer.getConnectionPerson() %></h4>
							      				<h4 class="font">联系邮箱：dianpu@163.com<%=producer.getEmail() %></h4>
							      				<h4 class="font">店铺介绍：<%=producer.getProdec() %></h4>
							      				<h4 class="font">店铺分类：<%=producer.getClassify() %></h4>
            					
            			</div>
            		</div>
            		<div style="width: 100%;height: 100px;background-color: whitesmoke;">
            			
            		</div>
	            	<div>
	            		<!-- <table> -->
							  <caption>我的店铺</caption>
							  <!-- <tbody> -->
							  <% for(GoodsBean b:l){%>
							   <!-- <tr>
							    	<td> -->
<div class="info_box" onclick="alert_dialog('<%=b.getGoodsName()%>','<%=b.getProducePlace()%>','<%=b.getGoodsNumber()%>','<%=b.getPrice()%>','<%=b.getDescription()%>','./img/goods/<%=b.getGoodsName() %>.jpg')">
							      			<div class="img_box">
							
							      				<img class="img img-thumbnail" src="./img/goods/<%=b.getGoodsName() %>.jpg" height:100% width:100%>							      				
							      			</div>
							      			<div class="text_box">
							      				<h1 class="font">商品名称：<%=b.getGoodsName() %></h1><br>
							      				<h4 class="font">生产地：<%=b.getProducePlace() %></h4>
							      				<h4 class="font">剩余数量：<%=b.getGoodsNumber() %></h4>
							      				<h4 class="font">单价：<%=b.getPrice() %></h4>
							      				<h4 class="font">描述：<%=b.getDescription() %></h4>
							      			</div>
							      		</div>
							    <!-- 	</td>
							 	</tr>  -->
<!-- 							  </tbody>
                          <% }%>
						</table> -->
	            	</div>	
				</div>
            </div>
		</div>

		<div class="go" onclick="goTop()">
			<img src="./img/go.png"/>
			<div class="gotop_txt" id="gotop_txt">
				<font color="#fff">返回<br/>顶部</font>
				
			</div>			
		</div>
		
		<div class="clear"></div>
		
		<div id="alert_dialog">
			<div class="row dialog_img_box">
				<div class="img_container">
					<img id="dialog_name6" class="dialog_img img-thumbnail" src="">
					<!-- <button  style="margin-top:70px;margin-left: 80px;">更换图片</button> -->
				</div>

			</div>
			<div class="dialog_info">
				<form action="Home_producerServlet" method="post">
					<h1 style="width: 100%;text-align:center;">
					修改信息</h1>
					<h4 id="dialog_name" class="font">商品名：</h2>
					<input id="input_goodsname" readonly="readonly" type="text" name="goodsname" placehoder="商品">
					
					<h4 id="dialog_name2" class="font">生产地：</h2>
					<input id="input_produceplace" type="text" name="produceplace" placeholder="生产地">
					<h4 id="dialog_name3" class="font">库存量：</h2>
					<input id="input_remain_num" type="number" name="goodscount" placeholder="库存量">
					<h4 id="dialog_name4" class="font">商品单价：</h2>
					<input id="input_price" type="number" name="price" placeholder="商品单价">
					<h4 id="dialog_name5" class="font">商品简介：描述</h2>
					<textarea id="input_desc" name="description" class="form-control" rows="3"></textarea>
					<div style="display: inline-block;">
						<input type="submit" Name="submit" Value="确定" style="margin-top:25px" onclick="dopost()"> 
						<button type="button" style="margin-top:25px;margin-left: 12.5px;" onclick="dialog_dismiss()">取消</button>
					</div>			
				</form>
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
            <a href="">关于我们</a>
        </p>
        <p>Copyright©2004-2017  版权所有 </p>
    </footer>
	
</body>
<script type="text/javascript" src="./js/xb/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="./js/xb/home_producer.js"></script>
</html>