package com.firstgroup.server;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.firstgroup.bean.GoodsBean;
import com.firstgroup.dao.GoodsDao;
import com.firstgroup.dao.JoininCarDao;

public class JoinInCar extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public JoinInCar() {
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

		this.doPost(request, response);
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

//		response.setContentType("text/html");
//		String goodsname=(String)request.getParameter("goodsname");	
//		System.out.println(goodsname);
//		request.setAttribute("goodsname", goodsname);
//		request.getRequestDispatcher("html/commodity.jsp").forward(request, response);
		response.setContentType("text/html");
		String goodsname=(String)request.getParameter("goodsname");
		int goodsnumber=Integer.parseInt(request.getParameter("buynumber"));
		int lastGoodsNumber=Integer.parseInt(request.getParameter("goodsnumber"));
			
		String username =request.getParameter("user");
		System.out.println(username);
		System.out.println(goodsname);
		System.out.println(lastGoodsNumber);
		
		Date now = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String getintime = dateFormat.format( now ); 
		
		JoininCarDao jcd=new JoininCarDao();
		
		
		boolean b=true;
		try {
			b=jcd.canJoinIn(username, goodsname, goodsnumber, lastGoodsNumber);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println(b);
		if(b){
			String sql="insert into tb_shoppingcar values('"+username+"','"+goodsname+"','"+getintime+"',"+goodsnumber+");";
			try {
				int row=jcd.updateShoppingCar(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("goodsName", goodsname);
			request.getRequestDispatcher("html/commodity.jsp").forward(request, response);
		}
		else{
			request.setAttribute("goodsName", goodsname);
			request.getRequestDispatcher("html/commodity.jsp").forward(request, response);
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
