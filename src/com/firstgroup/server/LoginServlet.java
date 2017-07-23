/*
 * @author dingyi
 * 实现登录功能
 * 
 * */
package com.firstgroup.server;

import com.firstgroup.tools.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginSeverlet
 */
@WebServlet("/LoginSeverlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");  
        request.setCharacterEncoding("utf-8");  
        PrintWriter out=response.getWriter();     //初始化out对象
         JdbcUtils jdbcUtils = new JdbcUtils();
         Map<String, Object> map = new HashMap<String, Object>();
        String result = "";  
      
        String username = request.getParameter("username");  
        String psw = request.getParameter("password");  
          
        if(username == "" || username == null || username.length()>20){  
            try {  
                result = "请输入用户名（不能超过10个字符）";  
                request.setAttribute("message", result);  
                response.sendRedirect("html/login.jsp");  
                return;  
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
        }  
          
        if(psw == "" || psw == null || psw.length() > 20){  
            try {  
                result = "请输入密码（不能超过16个字符）";  
                request.setAttribute("message", result);  
                response.sendRedirect("html/login.jsp");  
                return;  
            } catch (Exception e) {  
                e.printStackTrace();  
            }  
        }
        jdbcUtils.getConnection();
        String sql = "select * from tb_user where username='"+username+"' and passwd= '"+psw+"'"; 
        try {
			 map = jdbcUtils.findSimpleResult(sql, null);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        HttpSession session = request.getSession();  
        session.setAttribute("user", username);  
        
        try{
        	if(map == null || map.size()<1){
        		session.setAttribute("message", "用户名或密码不正确");  
        		out.print("<script language='JavaScript'>alert('用户名或密码错误!!');window.location.href='html/login.jsp';</script>");
//                response.sendRedirect("login.jsp") ;  
                return;  
        	}else{
        		
        		request.getRequestDispatcher("html/mainpage1.jsp").forward(request, response);
        	}
        }catch (Exception e) {  
            e.printStackTrace();  
        }  
		
	}
	
	
}