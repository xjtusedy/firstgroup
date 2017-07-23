/**
 * 
 */
  
        //用户名：  
        var  usernameRegex = /^\w{5,10}$/;  
        //密码：  
        var passwordRegex = /^[A-Za-z0-9]{8,16}/;  
        //邮箱：  
        var emailRegex = /^\w+@\w+(\.\w+)+$/;  
        //真实姓名：  
        var realNameRegex = /^[\u4e00-\u9fa5]{2,5}$/;  
        var xmlHttp;  
        var telphoneRegex = /^[0-9]{11}/
        //alert("222");  
        function validateForm(){ //定义validateForm方法用于客户端校验  
            var flag = true;  
            //校验用户名  
            var usernameNode = byId("username"); //获得ID值为username的节点对象  
            var username = usernameNode.value;   //获得usernameNode节点的值，即用户在username文本框内填写的值  
            if(!usernameRegex.test(username)){    //验证获得到的值是否符合正则表达式  
                byId("username_span").style.color = "red"; //如果不符合，则将ID值为username_span的节点对象内容变为红色  
                flag = false;        //返回false，不提交  
            }  
              
            //校验密码  
            var passwordNode = byId("password");  //获得ID值为password的节点对象  
            var password = passwordNode.value;  
            if(!passwordRegex.test(password)){  
                byId("password_span").style.color = "red";  
                flag = false;  
            }  
              
            //确认密码  
            var rePasswordNode = byId("repassword");  //获得ID值为rePassword的节点对象  
            var rePassword = rePasswordNode.value;  
            if(!password==rePassword){  
                byId("repassword_span").style.color = "red";  
                flag = false;  
            }else if(!passwordRegex.test(rePassword)){  
                byId("repassword_span").style.color = "red";  
                flag = false;  
            }else{  
                byId("repassword_span").style.color = "green";  
            }  
              
            //校验邮箱  
            var emailNode = byId("Email");  //获得ID值为Email的节点对象  
            var email = emailNode.value;  
            if(!emailRegex.test(email)){  
                byId("Email_span").style.color = "red";  
                flag = false;  
            }  
              
            //校验姓名  
            var realNameNode = byId("realName");  //获得ID值为realName的节点对象  
            var realName = realNameNode.value;  
            if(!realNameRegex.test(realName)){  
                byId("realName_span").style.color = "red";  
                flag = false;  
            }  
              
            //校验省份  
            var provinceNode = byId("province");  //获得ID值为province的节点对象  
            var province = provinceNode.value;  
            if("--请选择--" == province){  
                byId("province_span").style.color = "red";  
                flag = false;  
            }  
  
            return flag;  
        }  
              
        function byId(id){  //自定义方法，用于获取传递过来的ID值对应的节点对象  
            return document.getElementById(id);  
        }   
        function checkUsername(node){ //当鼠标离开节点时调用此方法，验证节点内容是否符合注册规范  
            //校验用户名  
            var username = node.value;  //得到传递过来的节点对象的值
            if(!usernameRegex.test(username)){  //验证是否符合节点对应的正则表达式  
            	
            	byId("username_span").style.color = "red"; //不符合，相应内容变成红色  
            	byId("form-validate").style.opacity = "1";
            }else{  
            	byId("username_span").style.color = "green";  //符合，相应内容变成绿色  
            	byId("form-validate").style.opacity = "0";
            }  
           $.ajax({  
            	                 type: "GET",      
            	                  url: "RegisterServlet",   
            	                  dataType: "json",
            	                  async:true,
            	          		  cache:false,
            	                  data: "username="+username , 
           	                 success: function(result){
           	                	 //alert(result);
            	                 if(result){     
            	                 alert("抱歉！用户名已存在！");    
            	                  
          	                }else{     
            	                 //alert("恭喜您！用户名没有被使用");     
                            } 
            	             
                             }            
                      });  
        }         
          
        function checkPassword(node){  //当鼠标离开节点时调用此方法，验证节点内容是否符合注册规范  
            //校验密码  
            var password = node.value;  
            //alert("111");  
            if (!passwordRegex.test(password)) {  
            	
            	byId("password_span").style.color = "red"; 
            	byId("form-validate1").style.opacity = "1";
            }  
            else { 
            	
                byId("password_span").style.color = "green";  
                byId("form-validate1").style.opacity = "0";
            }  
        }     
              
        function checkRePassword(node){  //当鼠标离开节点时调用此方法，验证节点内容是否符合注册规范  
            //确认密码                
            var rePassword = node.value;  
            var password = byId("password").value;  
            //alert(repassword+"***"+password);           
            if(password!=rePassword){
            	
                byId("repassword_span").style.color = "red"; 
                byId("form-validate2").style.opacity = "1";
            }else if(!passwordRegex.test(rePassword)){ 
            	
                byId("repassword_span").style.color = "red"; 
                byId("form-validate2").style.opacity = "1";
            }else{  
            	
            	byId("repassword_span").style.color = "green";
            	byId("form-validate2").style.opacity = "0";
            
            }  
        } 
        function checkTelephone(node){
        	var telphone = node.value;
        	if(!telphoneRegex.test(telphone)){
        		byId("telphone_span").style.color = "red";
        		byId("form-validate3").style.opacity = "1";
        	}else{
        		byId("telphone_span").style.color = "green";
        		byId("form-validate3").style.opacity = "0";
        	}
        }
  
        /*function checkEmail(node){  //当鼠标离开节点时调用此方法，验证节点内容是否符合注册规范  
            //校验邮箱  
            var email = node.value;  
            if(!emailRegex.test(email)){  
                byId("Email_span").style.color = "red";  
            }else{  
                byId("Email_span").style.color = "green";  
            }  
        }  */
              
       /* function checkName(node){  //当鼠标离开节点时调用此方法，验证节点内容是否符合注册规范  
            var realName = node.value;  
            if(!realNameRegex.test(realName)){  
                byId("realName_span").style.color = "red";  
            }else{  
                byId("realName_span").style.color = "green";  
            }  
        }  
          
        function checkProvince(node){  //当鼠标离开节点时调用此方法，验证节点内容是否符合注册规范  
            var province = node.value;  
            if("--请选择--" == province){  
                byId("province_span").style.color = "red";  
            }else{  
                byId("province_span").style.color = "green";  
            }  
        }  
  */
        function buttonDisabled(){
        	var check = byId("checkbox").checked ;
        	var button = byId("submit");
        	if(check){
        		
        		button.disabled = false;
        		button.style.backgroundColor = "#e22";
        	}else{
        		button.disabled = true;
        		button.style.backgroundColor = "#5d5a5a";
        	}
        }
