package com.firstgroup.server;
import com.firstgroup.dao.*;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public MemberServlet() {
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

		doPost(request,response);
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
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");  
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession();  
         
        String username1 = (String)session.getAttribute("user");
        System.out.println(username1);
        String sex = request.getParameter("sex").trim(); 
        System.out.println(sex);
        String telephone = request.getParameter("telephone");
        System.out.println(telephone);
        String email = request.getParameter("email");
        System.out.println(email);
        String address = request.getParameter("address");
        System.out.println(address);
        String userpicture = request.getParameter("userpicture");
        String postcode = request.getParameter("postcode");
        System.out.println(postcode);
        UserDao u = new UserDao();  
        u.addUserInfo(username1, sex, telephone, address, email, postcode, "2.jpg");
        response.sendRedirect("html/member.jsp");
		
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
