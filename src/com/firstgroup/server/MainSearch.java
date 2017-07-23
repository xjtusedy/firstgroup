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

public class MainSearch extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		String value1=request.getParameter("search");
		value1 = new String(value1.getBytes("ISO-8859-1"),"utf-8");
		System.out.println("搜索商品名为:"+value1);
		boolean isClassify = true;
		GoodsDao sd=new GoodsDao();
		
		
		List<Goods> list=null;
		try {
			list=sd.searchGoods(value1);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		request.setAttribute("goods", list);
		request.setAttribute("isCl", isClassify);
	request.getRequestDispatcher("html/mainpage1.jsp").forward(request, response);
		/*response.sendRedirect("html/mainpage1.jsp");*/
	}

	
}