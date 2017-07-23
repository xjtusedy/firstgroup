package com.firstgroup.server;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.firstgroup.dao.*;
public class ProducerRigsterServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public ProducerRigsterServlet() {
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
			response.setContentType("text/html");
			//PrintWriter out = response.getWriter();
			request.setCharacterEncoding("utf-8");  
	        response.setContentType("text/html;charset=utf-8");  
	        Pattern p = null;
	        Matcher m = null;
	        boolean flg = true;
	        String producername = request.getParameter("producername");
	        String password = request.getParameter("password"); 
	        String telphone = request.getParameter("telphone");
	        String rpsw = request.getParameter("repassword");//得到表单输入的内容  
	        //username 限制
	        if(producername.length()<2||producername.length()>10){
	        	flg = false;
	        }
	        //p = Pattern.compile("^w{2,10}");
	        //m = p.matcher(producername);
	        //flg = m.matches();
	        //password 限制
	        p = Pattern.compile("[a-zA-Z0-9_]{8,16}");
	        m = p.matcher(password);
	        flg = m.matches();
	        //telphone 限制
	        p = Pattern.compile("[0-9]{11}");
	        m = p.matcher(telphone);
	        flg = m.matches();
	        if(producername==null||producername.trim().isEmpty()){  
	            request.setAttribute("msg", "帐号不能为空");  
//	            request.getRequestDispatcher("/register.jsp").forward(request, response); 
	            response.sendRedirect("producer_register.jsp");
	            return;  
	        }  
	        if(password==null||password.trim().isEmpty()){  
	            request.setAttribute("msg", "密码不能为空");  
//	            request.getRequestDispatcher("/register.jsp").forward(request, response);  
	            response.sendRedirect("prodeucer_register.jsp");
	            return;  
	        }  
	        if(!password.equals(rpsw)){  
	            flg = false;
	        	request.setAttribute("msg", "两次输入的密码不同");  
//	            request.getRequestDispatcher("/register.jsp").forward(request, response);  
	        	response.sendRedirect("producer_register.jsp");
	            return;
	       
	        }  
	        ProducerDao pro = new ProducerDao();  
	        if(flg){
	        pro.addProducer(producername,password,telphone);//调用addUser（）方法  
	        request.setAttribute("msg", "恭喜："+producername+"，注册成功");  
	        request.getRequestDispatcher("html/producer_login.jsp").forward(request, response);
	        }else{
	        	request.setAttribute("msg", "用户名已存在");
	        	//response.getWriter().write("true");
//	        	request.getRequestDispatcher("/register.jsp").forward(request, response);
	        	response.sendRedirect("producer_register.jsp");
	        	request.setCharacterEncoding("UTF-8");
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
