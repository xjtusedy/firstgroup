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

public class GotoDescription extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		String id1=request.getParameter("goodsname");

		System.out.println("点击的商品名为:"+id1);
		request.setAttribute("goodsName", id1);
		request.getRequestDispatcher("html/commodity.jsp").forward(request, response);
}}

