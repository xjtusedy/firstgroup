package com.firstgroup.server;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.firstgroup.dao.ProducerDao;
import com.firstgroup.dao.UserDao;

public class ProducerInfoServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public ProducerInfoServlet() {
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
//		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");  
        response.setContentType("text/html;charset=utf-8"); 
        HttpSession session = request.getSession();
        String producername = (String) session.getAttribute("producer");
//        String username1 = request.getParameter("_username");
//        System.out.println(username1);
       
        String classify = request.getParameter("classify"); 
        System.out.println(classify);
        String telephone = request.getParameter("telephone");
        System.out.println(telephone);
        String email = request.getParameter("email");
        System.out.println(email);
        String address = request.getParameter("address");
        System.out.println(address);
        String prodec = request.getParameter("prodec");
        String connectionperson = request.getParameter("connectionperson");
        System.out.println(connectionperson);
        ProducerDao pro = new ProducerDao(); 
        pro.addProInfo(producername, connectionperson, prodec, telephone, address, email, classify, "producer.jpg");
        response.sendRedirect("html/producer_info.jsp");
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
