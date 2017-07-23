<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE>
<html>
  <head>
    <base href="<%=basePath%>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>卖家登录</title>
	<link rel="shortcut icon"  type="image/x-icon" href="<%=basePath%>img/web_logo.ico" /> 
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <link rel="stylesheet" type="text/css" href="<%=basePath%>css/dy/bootstrap.min.css"> 
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/dy/htmleaf-demo.css">

	<style type="text/css">
		.form-bg{
		    background: url(<%=basePath%>img/dy/3.jpg) no-repeat 200px 0px;
		    background-color: #197ccf;
		}
		.form-horizontal{
		    background: #fff;
		    padding-bottom: 40px;
		    border-radius: 15px;
		    text-align: center;
		}
		.form-horizontal .heading{
		    display: block;
		    font-size: 35px;
		    font-weight: 700;
		    padding: 35px 0;
		    border-bottom: 1px solid #f0f0f0;
		    margin-bottom: 30px;
		}
		.form-horizontal .form-group{
		    padding: 0 40px;
		    margin: 0 0 25px 0;
		    position: relative;
		}
		.form-horizontal .form-control{
		    background: #f0f0f0;
		    border: none;
		    border-radius: 20px;
		    box-shadow: none;
		    padding: 0 20px 0 45px;
		    height: 40px;
		    transition: all 0.3s ease 0s;
		}
		.form-horizontal .form-control:focus{
		    background: #e0e0e0;
		    box-shadow: none;
		    outline: 0 none;
		}
		.form-horizontal .form-group i{
		    position: absolute;
		    top: 12px;
		    left: 60px;
		    font-size: 17px;
		    color: #c8c8c8;
		    transition : all 0.5s ease 0s;
		}
		.form-horizontal .form-control:focus + i{
		    color: #00b4ef;
		}
		.form-horizontal .fa-question-circle{
		    display: inline-block;
		    position: absolute;
		    top: 12px;
		    right: 60px;
		    font-size: 20px;
		    color: #808080;
		    transition: all 0.5s ease 0s;
		}
		.form-horizontal .fa-question-circle:hover{
		    color: #000;
		}
		.form-horizontal .main-checkbox{
		    float: left;
		    width: 20px;
		    height: 20px;
		    background: #11a3fc;
		    border-radius: 50%;
		    position: relative;
		    margin: 5px 0 0 5px;
		    border: 1px solid #11a3fc;
		}
		.form-horizontal .main-checkbox label{
		    width: 20px;
		    height: 20px;
		    position: absolute;
		    top: 0;
		    left: 0;
		    cursor: pointer;
		}
		.form-horizontal .main-checkbox label:after{
		    content: "";
		    width: 10px;
		    height: 5px;
		    position: absolute;
		    top: 5px;
		    left: 4px;
		    border: 3px solid #fff;
		    border-top: none;
		    border-right: none;
		    background: transparent;
		    opacity: 0;
		    -webkit-transform: rotate(-45deg);
		    transform: rotate(-45deg);
		}
		.form-horizontal .main-checkbox input[type=checkbox]{
		    visibility: hidden;
		}
		.form-horizontal .main-checkbox input[type=checkbox]:checked + label:after{
		    opacity: 1;
		}
		.form-horizontal .text{
		    float: left;
		    margin-left: 7px;
		    line-height: 15px;
		    padding-top: 5px;
		    text-transform: capitalize;
		}
		.form-horizontal .btn{
		    float: right;
		    font-size: 14px;
		    color: #fff;
		    background: #00b4ef;
		    border-radius: 30px;
		    padding: 10px 25px;
		    border: none;
		    text-transform: capitalize;
		    transition: all 0.5s ease 0s;
		}
		.login-content-bottom{
		    width:90%;
		    position: absolute;
		    bottom:25px;
		    background-color: #fff;
		}

 .login-content-bottom a{
    font-size: 12px;

}
.login-content-bottom span{
    padding-left: 1px;
    margin: 0 5px;
    font-size: 10px;
    background-color: #999;
}
.login-content-bottom a i{
    width: 19px;
    height: 18px;
    display: inline-block;
    position: relative;
    top: 5px;

}
.login-content-bottom a:nth-child(1) i{
    margin-right: 10px;
    background: url("<%=basePath%>img/dy/QQ-weixin.png") no-repeat;
}
 .login-content-bottom a:nth-child(3) i{
     margin-right: 10px;
     background: url("<%=basePath%>img/dy/QQ-weixin.png") no-repeat -20px 0;
 }
 .login-content-bottom a:nth-child(6){
    float: right;
}
 .login-content-bottom a:nth-child(6) i{
    margin-right: 10px;
    background: url("<%=basePath%>img/dy/pwd-icons.png")-104px -75px no-repeat;;
}
 .login-content-bottom a:hover {
    color: #e4393c;
    text-decoration: underline;
}
		@media only screen and (max-width: 479px){
		    .form-horizontal .form-group{
		        padding: 0 25px;
		    }
		    .form-horizontal .form-group i{
		        left: 45px;
		    }
		    .form-horizontal .btn{
		        padding: 10px 20px;
		    }
		}

header .htmlleaf-header .logo{
    float: left;
    width: 160px;
    height: 50px;
    margin-top: 24px;
    background: url("<%=basePath%>img/dy/logo.png") no-repeat;
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
	</style>
	<!--[if IE]>
		<script src="http://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
	<![endif]-->
	
</head>
<body style=" background-color:#fff;">
	<div class="htmleaf-container">
		<header class="htmleaf-header">
			<a href="index.html" class="logo"></a>
			<h1>欢迎登录DailyShop商城 <span>Welcome</span></h1>
			<!--<<div class="htmleaf-links">
				<a class="htmleaf-icon icon-htmleaf-home-outline" href="#" title="商城" target="_blank"><span>注册</span></a>
				<a class="htmleaf-icon icon-htmleaf-arrow-forward-outline" href="#" title="" target="_blank"><span> 返回主页</span></a>
			</div> -->
		</header>
		<div class="demo form-bg" style="padding: 20px 0;">
		        <div class="container">
		            <div class="row">
		                <div class="col-md-offset-8 col-md-4">
		                    <form class="form-horizontal" method="POST" action="ProducerLoginServlet" name="frmLogin">
		                        <span class="heading">商家登录</span>
		                        <div class="form-group">
		                            <input type="text" class="form-control" id="producername"  name="producername" placeholder="用户名或电子邮件">
		                            <i class="fa fa-user"></i>
		                        </div>
		                        <div class="form-group help">
		                            <input type="password" class="form-control" id="password" name="password" placeholder="密　码">
		                            <i class="fa fa-lock"></i>
		                            <abbr title="忘记密码"><a href="#" class="fa fa-question-circle"></a></abbr>
		                        </div>
		                        <div class="form-group">
		                            <div class="main-checkbox">
		                                <input type="checkbox" value="None" id="checkbox1" name="check"/>
		                                <label for="checkbox1"></label>
		                            </div>
		                            <span class="text">Remember me</span>
		                            <button type="submit" class="btn btn-default" onclick="validateLogin()">登录</button>
		                        </div>
		                        <div class="login-content-bottom">
			                    <a href="#"><i></i>QQ</a><span></span>
			                    <a href="#"><i></i>微信</a><span></span>
			                    <a href="#">京东钱包</a>
			                    <a href="<%=basePath%>html/producer_register.jsp"><i></i>立即注册</a>
			                </div>
		                    </form>
					           
		                </div>
		            </div>
		        </div>
		    </div>
		<div class="related">
		    <h3>如果你喜欢这个商品，那么你可能也喜欢:</h3>
		    <a href="#">
			  <img src="<%=basePath%>img/dy/1.jpg" width="300" alt="小米"/>
			  <h3>小米手机</h3>
			</a>
			<a href="#">
			  <img src="<%=basePath%>img/dy/2.jpg" width="300" alt="华为"/>
			  <h3>华为手机</h3>
			</a>
		</div>

</div>
<!--
<div  class=" col-md-offset-3 col-md-6" style="background-color: #fff; " >
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
        </p>
        <p style="padding-left:30%;">Copyright©2004-2017  版权所有 </p>
</footer>
</div>
-->
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
    <script type="text/javascript">  
               function validateLogin(){  
                 
                var sUserName = document.getElementById("producername").value;  
                var sPassword = document.getElementById("password").value;   
                if (sUserName ==""){  
                 alert("请输入用户名!");  
                 return false ;  
                }  
                  
                if (sPassword ==""){  
                 alert("请输入密码!");  
                 return false ;  
                }  
        } 
    </script>  	
</body>
</html>