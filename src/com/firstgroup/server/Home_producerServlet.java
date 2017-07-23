package com.firstgroup.server;
import com.firstgroup.tools.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.firstgroup.dao.ProducerDao;
import com.firstgroup.dao.GoodsDao;
import com.firstgroup.tools.JdbcUtils;

public class Home_producerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * Constructor of the object.
	 */
	public Home_producerServlet() {
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
/*	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");  
		Pattern p = null;
        Matcher m = null;
        boolean flg = true;
        JdbcUtils jdbcUtils = new JdbcUtils();
        Map<String, Object> map = new HashMap<String, Object>();
       String result = "";  
       String goodsname=request.getParameter("goodsname");
       String produceplace = request.getParameter("produceplace");  
       String productcode = request.getParameter("productcode");
       String description =request.getParameter("description");
       String price = request.getParameter("price");
	   String goodscount=request.getParameter("goodscount");
       String pid = request.getParameter("pid");
	   //price 限制
	   p = Pattern.compile("^[0-9].*$");
       m = p.matcher(price);
       flg = m.matches();
       //goodscount 限制
       p = Pattern.compile("^[0-9]*[1-9][0-9]*$");
       m = p.matcher(goodscount);
       flg = m.matches();
       if(price==null||price.trim().isEmpty()){  
           request.setAttribute("msg", "价格不能为空");  
           request.getRequestDispatcher("/home_producer.jsp").forward(request, response);  
           return;  
       }  
       if(goodscount==null||goodscount.trim().isEmpty()){  
           request.setAttribute("msg", "数量不能为空");  
           request.getRequestDispatcher("/home_producer.jsp").forward(request, response);  
           return;  
       }
       GoodsDao u= new GoodsDao();
       if(flg){
    	   u.updateGoods(goodsname,produceplace,productcode,description,price,goodscount,pid);
    	   response.sendRedirect("home_producer.jsp");
       }
	}*/
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8"); 
		Pattern p = null;
        Matcher m = null;
        boolean flg = true;
       /* JdbcUtils jdbcUtils = new JdbcUtils();
        Map<String, Object> map = new HashMap<String, Object>();*/
       String result = "";  
       String goodsname = request.getParameter("goodsname");
       System.out.println(goodsname);
       String produceplace = request.getParameter("produceplace"); 
       System.out.println(produceplace);
       /*String productcode = request.getParameter("productcode");
       System.out.println(productcode);*/
       String price = request.getParameter("price");
       System.out.println(price);
       String goodscount = request.getParameter("goodscount");
       System.out.println(goodscount);
       String description = request.getParameter("description");
       System.out.println(description);
	   //price 限制
	   p = Pattern.compile("^[0-9].*$");
       m = p.matcher(price);
       flg = m.matches();
       //goodscount 限制
       p = Pattern.compile("^[0-9]*[1-9][0-9]*$");
       m = p.matcher(goodscount);
       flg = m.matches();
       /*//pid 限制
       p = Pattern.compile("^[0-9]*[1-9][0-9]*$");
       m = p.matcher(pid);
       flg = m.matches();*/
       if(price==null||price.trim().isEmpty()){  
           request.setAttribute("msg", "价格不能为空");  
           request.getRequestDispatcher("html/home_producer.jsp").forward(request, response);  
           return;  
       }  
       if(goodscount==null||goodscount.trim().isEmpty()){  
           request.setAttribute("msg", "数量不能为空");  
           request.getRequestDispatcher("html/home_producer.jsp").forward(request, response);  
           return;  
       }
       if(goodsname==null||goodsname.trim().isEmpty()){  
           request.setAttribute("msg", "商品名不能为空");  
           request.getRequestDispatcher("html/home_producer.jsp").forward(request, response);  
           return;  
       }
       GoodsDao goods = new GoodsDao();
       JdbcUtils jdbcUtils = new JdbcUtils();
       jdbcUtils.getConnection();
       HttpSession session1 = request.getSession();  
       String string = (String)session1.getAttribute("producer");
       Map<String, Object> map = new HashMap<String, Object>();
       String sql = "select pid from tb_producer where producername like '%"+string+"%' ";
       if(flg){
    	   try {
			map = jdbcUtils.findSimpleResult(sql, null);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	   System.out.println(map);
    	   int pid = (int) map.get("pid");
    	   System.out.println(pid);
    	   goods.updateGoods(goodsname,produceplace,price,goodscount,description,pid);
    	   response.sendRedirect("html/home_producer.jsp");
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
