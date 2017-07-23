package com.firstgroup.server;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.firstgroup.bean.Goods;
import com.firstgroup.dao.GoodsDao;

public class GoodsClassify extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		String id1=request.getParameter("id");
		List<Goods> list =null;
		boolean isClassify = true;
		if(id1.equals("1")){
			GoodsDao gd = new GoodsDao();
			try {
				list=gd.classifyGoods("1");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			request.setAttribute("goods", list);
			request.setAttribute("isCl", isClassify);
			request.getRequestDispatcher("html/mainpage1.jsp").forward(request, response);
			
		}else if(id1.equals("3")){
			GoodsDao gd = new GoodsDao();
			try {
				list=gd.classifyGoods("3");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			request.setAttribute("goods", list);
			request.setAttribute("isCl", isClassify);
			request.getRequestDispatcher("html/mainpage1.jsp").forward(request, response);
			
		}else if(id1.equals("4")){
			GoodsDao gd = new GoodsDao();
			try {
				list=gd.classifyGoods("4");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			request.setAttribute("goods", list);
			request.setAttribute("isCl", isClassify);
			request.getRequestDispatcher("html/mainpage1.jsp").forward(request, response);
			
		}else if(id1.equals("14")){
			GoodsDao gd = new GoodsDao();
			try {
				list=gd.classifyGoods("14");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			request.setAttribute("goods", list);
			request.setAttribute("isCl", isClassify);
			request.getRequestDispatcher("html/mainpage1.jsp").forward(request, response);
			
		}else if(id1.equals("2")){
			GoodsDao gd = new GoodsDao();
			try {
				list=gd.classifyGoods("2");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
			request.setAttribute("goods", list);
			request.setAttribute("isCl", isClassify);
			request.getRequestDispatcher("html/mainpage1.jsp").forward(request, response);
			
		}else{
		}
		
	}

}

