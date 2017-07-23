package com.firstgroup.server;

import java.io.IOException;

import com.firstgroup.tools.*;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ProducerLoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public ProducerLoginServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8"); 
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		JdbcUtils jdbcUtils = new JdbcUtils();
        Map<String, Object> map = new HashMap<String, Object>();
       String result = "";  
     
       String producername = request.getParameter("producername");
       producername = new String(producername.getBytes("ISO-8859-1"),"utf-8");
       System.out.println(producername);
       String psw = request.getParameter("password");  
         
       if(producername == "" || producername == null || producername.length()>20){  
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
       String sql = "select * from tb_producer where producername='"+producername+"' and propasswd= '"+psw+"'"; 
       try {
			 map = jdbcUtils.findSimpleResult(sql, null);
			 System.out.println(map);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
       HttpSession session = request.getSession();  
       session.setAttribute("producer", producername);  
       
       try{
       	if(map == null || map.size()<1){
       		session.setAttribute("message", "用户名或密码不正确");  
       		out.print("<script language='JavaScript'>alert('用户名或密码错误!!');window.location.href='html/producer_login.jsp';</script>");
//               response.sendRedirect("login.jsp") ;  
               return;  
       	}else{
       		
       		request.getRequestDispatcher("html/mainpage1.jsp").forward(request, response);
       	}
       }catch (Exception e) {  
           e.printStackTrace();  
       }  
		
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
