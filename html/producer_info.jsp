<%@ page language="java" import="java.util.*,com.firstgroup.tools.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE >
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="css/dy/bootstrap.min.css"> 
	<link rel="stylesheet" type="text/css" href="css/dy/bootstrap.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
   <title>卖家信息</title>
	<link rel="shortcut icon"  type="image/x-icon" href="<%=basePath%>img/web_logo.ico" /> 
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">

.bootmark { margin-right: 10px; }

.bootmark:hover i { -moz-transform: rotate(720deg); -ms-transform: rotate(720deg); -o-transform: rotate(720deg); -webkit-transform: rotate(720deg); transform: rotate(720deg); }

.bar-link { list-style: none; margin: 0; }
.bar-link li { float: left; }
.bar-link a { display: inline-block; padding: 0 8px; text-decoration: none; }

.bar-link a:hover { background: #666; color: #fff; }

.bar-link .tel-num { font: 700 16px 微软雅黑; color: #ce000d; font-style: italic; line-height: 30px; }
/*图片定位*/
.icon-main { background-image: url(img/dy/style-icon-all.png); background-repeat: no-repeat; display: inline-block; vertical-align: middle; }
.icon-collect { background-position: 0 0; width: 15px; height: 15px; -moz-transition: transform .4s ease-in 0s; -ms-transition: transform .4s ease-in 0s; -o-transition: transform .4s ease-in 0s; -webkit-transition: -webkit-transform .2s ease-in 0s; transition: transform .4s ease-in 0s; float: left; }
.icon-tel { background-position: -23px 0; width: 15px; height: 15px; float: left; }

		a:hover{
			color: #e4393c;
		}
		a{
			color: #999;
		}


		
		#menu dd dl{
			    color: #666;
    			line-height: 80px;
    			display: block;
		}
		dt{
			display: block;
			line-height: 50px;
		}
		dd{
			display: block;
			line-height: 30px;
		}
		#menu{
			float: left;
		}
		#main{
			float: right;
		}

		div.full{
			display: flex;
			flex-direction: column;
			padding-left: 8%;
		}
		/*footer*/
footer{
    font-size: 12px;
    text-align: center;
    border-top: solid 1px #e6e6e6;
    color: #999;
    padding-bottom: 30px;
}
footer p a{
    font-size: 12px;
    text-align: center;
    color: #999;


}
footer p:nth-child(1){

    padding-top: 30px;
    padding-bottom: 15px;
}
footer p span{

    padding-left: 1px;
    margin: 0 10px;
    font-size: 10px;
    background-color: #999;
}
a.logo{
    float: left;
    width: 100px;
    height: 30px;
    margin-top: -8px;
    margin-right: 5px;
    background: url("img/dy/logo.png") no-repeat;
}

.adimage{
	display: block;
    width: 100%;
    height: 80px;
    background: url(img/dy/ad1.jpg) no-repeat 50% 0;
    background-color: #2f3fb7;
}
.form-group{
	padding-top: 5%;
}

.file {
    position: relative;
    display: inline-block;
    background: #e22;
    border: 1px solid #99D3F5;
    border-radius: 4px;
    padding: 8px 20px;
    overflow: hidden;
    color: #fff;
    text-decoration: none;
    text-indent: 0;
    line-height: 20px;
    margin-left: 1%;
    margin-top: 5%;
}
.file input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
}
.file:hover {
    background: #AADFFD;
    border-color: #78C3F3;
    color: #004974;
    text-decoration: none;
}
</style>
  </head>
  <body style="background-color: #f5f5f5">
<div>
<div id="sidebar container-full" style="background-color:#e3e4e5;">
	<div class="container" style="background-color: #e3e4e5;">
		<div class="row">
                <div class="col-lg-6" style="padding-top:10px;">
                	<a href="<%=basePath%>html/mainpage1.jsp" class="logo"></a>
                    <a href="javascript:;" class="bootmark" rel="nofollow"><i class="icon-main icon-collect mt8 mr5"></i>收藏</a>
                    <span>您好，欢迎您光临！请</span>
                    <span class="bar-link">
                        <a href="#">登录</a>
                        <a href="#">免费注册</a>
                    </span>
                </div>
                <div class="col-lg-6" style="padding-top:10px;">
                    <ul class="pull-right bar-link">
                    	<li><a href="<%=basePath%>html/mainpage1.jsp">返回首页</a> | </li>
                        <li><a href="#">我的订单</a> | </li>
                        <li><a href="<%=basePath%>html/home_producer.jsp">卖家中心</a> | </li>
                        <li><a href="#">收藏夹</a> |&nbsp;&nbsp;&nbsp;&nbsp;</li>
                        <li class="tel-num"><i class="icon-main icon-tel mt8 mr5"></i>8888-888-888</li>
                    </ul>
                </div>
            </div>
		
	</div>
</div>
<div class="container-full adimage">
</div>
<div class="container-full">
	<div class="container">
		<div class="row"></div>
	</div>
</div>


	<div class="full">
	<div class="container-full">
	<div class="container col-md-offset-1 col-md-9">
	<div id="menu" class="col-md-2">
	<dl class="fore1">
		<dt  id="_MYJD_setting">设置</dt>
		<dd class="fore1_1" id="_MYJD_info">
			<a clstag="homepage|keycount|home2013|Homeyser" href="#" target="_self">商店信息</a>
		</dd>
		<dd class="fore1_2" id="_MYJD_safe">
			<a clstag="homepage|keycount|home2013|Homesafe" href="#" target="_self">账户安全</a>
		</dd>
		<dd class="fore1_3" id="_MYJD_accbinde">
			<a clstag="homepage|keycount|home2013|Homezhbd" href="#" target="_self">账号绑定</a>
		</dd>
		<dd class="fore1_4" id="_MYJD_grade">
			<a clstag="homepage|keycount|home2013|Homegrade" href="#">我的级别</a>
		</dd>
		<dd class="fore1_5" id="_MYJD_comments">
			<a clstag="" href="#" target="_self">收货地址</a>
		</dd>
		<dd class="fore1_6" id="_MYJD_yyrxx">
			<a clstag="homepage|keycount|home2013|homeyyrxx" href="#" target="_self">用药人信息</a>
		</dd>
		<dd class="fore1_7" id="_MYJD_share">
			<a clstag="homepage|keycount|home2013|Homeshare" href="#" target="_self">分享绑定</a>
		</dd>
		<dd class="fore1_8" id="_MYJD_rss">
			<a clstag="homepage|keycount|home2013|Homeedm" href="#" target="_self">邮件订阅</a>
		</dd>
		<dd class="fore1_9" id="_MYJD_recor">
			<a clstag="homepage|keycount|home2013|Homeedm" href="#" target="_self">消费记录</a>
		</dd>
		<dd class="fore1_10" id="_MYJD_app">
			<a clstag="homepage|keycount|home2013|Homeedm" href="#" target="_blank">应用授权</a>
		</dd>
		<dd class="fore1_11" id="_MYJD_pay">
			<a clstag="homepage|keycount|home2013|Homequick" href="#" target="_blank">快捷支付</a>
		</dd>
		<dd class="fore1_12" id="_MYJD_zpzz">
			<a clstag="homepage|keycount|home2013|Homezpzz" href="#" target="_self">增票资质</a>
		</dd>
		<dd class="fore1_13" id="_MYJD_qyfp">
			<a clstag="homepage|keycount|home2013|Homeqyfp" href="#" target="_self">企业发票</a>
		</dd>
		<dd class="fore1_14" id="_MYJD_cgxqd">
			<a clstag="homepage|keycount|home2013|Homecgxqd" href="#" target="_self">采购需求单</a>
		</dd>
	</dl>
</div>
<div id="main" class="main col-md-10" style="background-color: white">
	<div style="margin:20px;"><h3 style="text-align:center">基本信息</h3></div>
	<div class="" style="width: 200px;height:100px;float:right; background-color: #fff; margin-left: 90%; margin-top:-5%;">
		<div style="margin-left: 1%;margin-top: 50%;"><img style="border:1px solid #e4393c;" class="img-circle" src="img/dy/user_po.jpg"></div>
		<a href="javascript:;" class="file">上传头像
		<input type="file" name="" class="" ></a>
	</div>
	<form action="ProducerInfoServlet" method="POST">
	<div class="form-horizontal" style="padding-top:2%">
		<div class="form-group ">
			<label class="control-label col-md-2">商店名:</label>
			<div class="col-md-5">
				<label class="control-label col-md-5">${producer}</label>
			</div>
		</div>
		<div class="form-group ">
			<label class="control-label col-md-2">商家分类:</label>
			<div class="col-md-5 ">
				<input type="text" class="form-control" placeholder="请输入商品分类" name="classify" id="classify">
			</div>
		</div>
		

		<div class="form-group ">
			<label class="control-label col-md-2">商家地址:</label>
			<div class="col-md-5">
				<input type="text" class="form-control" placeholder="请输入商家地址" name="address" id="address">
			</div>
		</div>
		<div class="form-group ">
			<label class="control-label col-md-2">商家邮箱:</label>
			<div class="col-md-5">
				<input type="email" class="form-control" placeholder="请输入常用邮箱"  name="email" id="email">
			</div>
		</div>
		<div class="form-group ">
			<label class="control-label col-md-2">商家电话:</label>
			<div class="col-md-5">
				<input id="telephone" type="text" class="form-control" placeholder="请输入常用联系方式"  name="telephone" onblur="judgeTelephone()">
				<div id="telephoneTip"></div>
			</div>
		</div>
		<div class="form-group ">
			<label class="control-label col-md-2">联系人:</label>
			<div class="col-md-5">
				<input type="text" class="form-control" placeholder="请输入店主姓名"  name="connectionperson" id="connectionperson">
			</div>
		</div>
		<div class="form-group ">
			<label class="control-label col-md-2">商家描述:</label>
			<div class="col-md-5">
				<textarea class="form-control" rows="3" name="prodec" id="prodec"></textarea>
			</div>
		</div>

		<div class="form-group ">
			<label class="control-label col-md-2"></label>
			<div class="col-md-5">
				<input type="submit" class="form-control" style="background-color:#e22; color:#fff;">
			</div>
		</div>



	</div>
	</form>
</div>


</div>

<div class="col-md-2"  style="float:top;height:100%"></div>
</div>
<!--<div  class=" col-md-offset-3 col-md-6" style="margin-top:15%;" >
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
</div> -->
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
<script type="text/javascript" src="js/dy/producer_info.js"></script>

</body>
<% 
	String producer = (String)session.getAttribute("producer");
	System.out.println(producer);
	String sql = "select * from tb_producer where producername = '"+producer+"'";
	JdbcUtils jdbcUtils = new JdbcUtils();
	jdbcUtils.getConnection();
	Map<String, Object> map = new HashMap<String, Object>();
	map = jdbcUtils.findSimpleResult(sql, null);
	System.out.println(map);
	out.println(map);
//	String username = map.get("username").toString();
	String classify = map.get("classify").toString();
	String email = map.get("email").toString();
	String address = map.get("address").toString();
	String prodec = map.get("prodec").toString();
	String telephone = map.get("telephone").toString();
	String connectionperson = map.get("connectionperson").toString();
	//out.print(username);
	//out.print(sex1);
	//out.print(email);out.print(address);out.print(postcode);out.print(telephone);
	//out.println("<script>showProducername('"+user+"')</script>");
	out.println("<script>showClassify('"+classify+"')</script>");
	out.println("<script>showTelephone('"+telephone+"')</script>");
	out.println("<script>showEmail('"+email+"')</script>");
	out.println("<script>showProdec('"+prodec+"')</script>");
	out.println("<script>showAddress('"+address+"')</script>");
	out.println("<script>showConn('"+connectionperson+"')</script>");
	
	
	 
%>
</html>
