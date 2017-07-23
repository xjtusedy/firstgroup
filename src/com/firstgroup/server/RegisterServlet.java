package com.firstgroup.server;

import com.firstgroup.dao.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public RegisterServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		 this.doGet(request, response);
		 PrintWriter out=response.getWriter();     //初始化out对象
		response.setContentType("text/html");
		//PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");  
        response.setContentType("text/html;charset=utf-8");  
        Pattern p = null;
        Matcher m = null;
        boolean flg = true;
        String username = request.getParameter("username");
        String password = request.getParameter("password"); 
        String telphone = request.getParameter("telphone");
        String rpsw = request.getParameter("repassword");//得到表单输入的内容  
        //username 限制
        p = Pattern.compile("[a-zA-Z0-9_]{5,10}");
        m = p.matcher(username);
        flg = m.matches();
        //password 限制
        p = Pattern.compile("[a-zA-Z0-9_]{8,16}");
        m = p.matcher(password);
        flg = m.matches();
        //telphone 限制
        p = Pattern.compile("[0-9]{11}");
        m = p.matcher(telphone);
        flg = m.matches();
        if(username==null||username.trim().isEmpty()){  
            request.setAttribute("msg", "帐号不能为空");  
//            request.getRequestDispatcher("html/register.jsp").forward(request, response);
            System.out.println("fail");
            out.print("<script language='JavaScript'>alert('Sorry!Registed failed!!');window.location.href='html/register.jsp';</script>");
//            response.sendRedirect("html/register.jsp");
            return;  
        }  
        if(password==null||password.trim().isEmpty()){  
            request.setAttribute("msg", "密码不能为空");  
//            request.getRequestDispatcher("html/register.jsp").forward(request, response);  
            out.print("<script language='JavaScript'>alert('Sorry!Registed failed!!');window.location.href='html/register.jsp';</script>");
            response.sendRedirect("html/register.jsp");
            return;  
        }  
        if(!password.equals(rpsw)){  
            flg = false;
        	request.setAttribute("msg", "两次输入的密码不同");  
//            request.getRequestDispatcher("html/register.jsp").forward(request, response);  
        	out.print("<script language='JavaScript'>alert('Sorry!Registed failed!!');window.location.href='html/register.jsp';</script>");
//        	response.sendRedirect("html/register.jsp");
            return;
       
        } 
        System.out.println(flg);
        UserDao u = new UserDao(); 
       
        String passwd = u.findUsername(username);
        if(passwd.equals("none") && flg){
        u.addUser(username,password,telphone);//调用addUser（）方法  
        request.setAttribute("msg", "恭喜："+username+"，注册成功");  
//        request.getRequestDispatcher("html/login.jsp").forward(request, response);
        response.sendRedirect("html/login.jsp");
        }else{
        	request.setAttribute("msg", "用户名已存在");
        	out.print("<script language='JavaScript'>alert('Sorry!Registed failed!!');window.location.href='html/register.jsp';</script>");
        	//response.getWriter().write("true");
//        	request.getRequestDispatcher("html/register.jsp").forward(request, response); 
//       	response.sendRedirect("html/register.jsp");
        	request.setCharacterEncoding("UTF-8");
        }
        
       
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			
			request.setCharacterEncoding("UTF-8");
			UserDao u =new UserDao();
			PrintWriter out = response.getWriter();
			String username = request.getParameter("username");
			System.out.println(username);
			String passwd = u.findUsername(username);
			System.out.println(passwd);
			if(!passwd.equals("none")){
				System.out.print("true");
				out.print(true);
			}else{
				System.out.print("false");
				out.print(false);
			}
			
//			PrintWriter out = response.getWriter();
            //doPost(request, response);
//			out.flush();
//			out.close();
			}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
