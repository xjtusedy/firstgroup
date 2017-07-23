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
    <title>卖家注册</title>
	<link rel="shortcut icon"  type="image/x-icon" href="<%=basePath%>img/web_logo.ico" /> 
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/dy/reset.css">
    <link rel="stylesheet" href="css/dy/register.css">

	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <header>
        <div class="header-content">
            <a href="<%=basePath%>html/mainpage1.jsp" class="logo"></a>
            <span>欢迎注册</span>
            <div class="login">已有账号？<a href="<%=basePath%>html/producer_login.jsp"> 请登录</a> </div>
        </div>
    </header>
    <main>
        <a class="question"></a>
        <section>
            <div class="main-content-L">
                <form action="ProducerRigsterServlet" method="post">
                    <div class="form-list">
                        <label for="username">商 店 名</label>
                        <input type="text" id="producername"  name="producername" placeholder="您的账户名和登录名" onblur="checkUsername(this)">
                    </div>
                    <div class="form-validate" id="form-validate">
                        <span id="producer_span">请输入2-10位字符</span>
                    </div>

                    <div class="form-list">
                        <label for="password">设置密码</label>
                        <input type="password" id="password" name="password" placeholder="建议至少使用两种字符组合" onblur="checkPassword(this)">
                    </div>
                    <div class="form-validate" id="form-validate1">
                        <span id="password_span">请输入8-16位字母数字组合</span>
                    </div>

                    <div class="form-list">
                        <label for="Repassword">确认密码</label>
                        <input type="password" id="repassword" name="repassword" placeholder="请再次输入密码" onblur="checkRePassword(this)">
                    </div>
                    <div class="form-validate" id="form-validate2">
                        <span id="repassword_span">密码不一致</span>
                    </div>

                    <div class="form-list">
                        <label for="telphone" id="country">中国 +86 <a href=""></a></label>
                        <input type="tel" id="telphone" name="telphone" placeholder="建议使用常用手机" onblur="checkTelephone(this)">
                    </div>
                    <div class="form-validate" id="form-validate3">
                        <span id="telphone_span">请输入11位手机号</span>
                        <a href="#">邮箱验证</a>
                    </div>
                    <div class="form-list">
                        <label for="identifycode">验 证 码</label>
                        <input type="text" id="identifycode" placeholder="请输入验证码">
                        <img src="./img/dy/image2.jpg" alt="">
                    </div>
                    <div class="form-validate">
                        <span></span>
                    </div>

                    <div class="form-list">
                        <label for="telIdentify" id="telId">手机验证码</label>
                        <input type="text" id="telIdentify" placeholder="请输入手机验证码">
                       <div><button style="padding: 0px 0px;width: 110px;height: 46px;">获取验证码</button></div>
                    </div>
                    <div class="form-validate">
                        <span></span>
                    </div>
                    <div class="form-check">
                        <input type="checkbox" id="checkbox" onclick="buttonDisabled()">
                        我已阅读并同意 <a href="#">《用户注册协议》</a>
                    </div>
                    <div class="form-validate">
                        <span></span>
                    </div>
                     <input type="submit"  id="submit" class="form-submit" value="立即注册"  disabled="true"  style="background-color:#5d5a5a">

                </form>
            </div>
            <div class="main-content-R">
                <div class="companyReg">
                    <a href="<%=basePath%>html/register.jsp">
                        <i></i>
                        <span>个人用户注册</span>
                    </a>
                </div>
                <div class="globalReg">
                    <a href="#">
                        <i></i>
                        <span>INTERNATIONAL CUSTOMERS</span>
                    </a>
                </div>
                <div class="phoneReg"></div>

            </div>
            <div class="clearfix"></div>
        </section>
    </main>
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
    
  </body>
      <script type="text/javascript" src="<%=basePath%>js/dy/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/dy/producer_register.js"></script>
</html>