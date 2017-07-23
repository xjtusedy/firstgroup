package com.firstgroup.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.firstgroup.bean.Goods;
import com.firstgroup.tools.Db;
import com.firstgroup.tools.JdbcUtils;

public class GoodsDao {
	public List<Goods> queryGoods() throws SQLException{
		Connection conn=Db.getConn();
		String sql="select goodsname,produceplace,productcode,description,price,goodspicture,goodsnumber,pid from tb_goods";
		Statement st=conn.createStatement();
		ResultSet rs=st.executeQuery(sql);//
		List<Goods> list=new ArrayList<Goods>(); 
		while(rs.next()){
		String goodsName = rs.getString(1);
		String producePlace = rs.getString(2);
		String productCode = rs.getString(3);
		String description = rs.getString(4);
		float price = rs.getFloat("price");
		String goodsPicture = rs.getString(6);
		int goodsNumber =rs.getInt("goodsnumber");
		String pid = rs.getString(8);
			
			
			Goods g=new Goods(goodsName, producePlace, productCode, description, price, goodsPicture, goodsNumber, pid);
			list.add(g);
		}
		
		rs.close();
		st.close();
		conn.close();
		return list;
	}
	public List<Goods> classifyGoods(String j) throws SQLException{
		Connection conn=Db.getConn();
		String sql="select goodsname,produceplace,productcode,description,price,goodspicture,goodsnumber,pid from tb_goods";
		Statement st=conn.createStatement();
		ResultSet rs=st.executeQuery(sql);//
		List<Goods> list=new ArrayList<Goods>(); 
		while(rs.next()){
		String goodsName = rs.getString(1);
		String producePlace = rs.getString(2);
		String productCode = rs.getString(3);
		String description = rs.getString(4);
		float price = rs.getFloat("price");
		String goodsPicture = rs.getString(6);
		int goodsNumber =rs.getInt("goodsnumber");
		String pid = rs.getString(8);
			if(pid.equals(j)){
				Goods g=new Goods(goodsName, producePlace, productCode, description, price, goodsPicture, goodsNumber, pid);
				list.add(g);
			}else if(j.equals("14")&&(pid.equals("1")||pid.equals("4"))){
				Goods g=new Goods(goodsName, producePlace, productCode, description, price, goodsPicture, goodsNumber, pid);
				list.add(g);
			}
		}
		
		rs.close();
		st.close();
		conn.close();
		return list;
	}
	public List<Goods> searchGoods(String i) throws SQLException{
		Connection conn=Db.getConn();
		String sql="select goodsname,produceplace,productcode,description,price,goodspicture,goodsnumber,pid from tb_goods";
		Statement st=conn.createStatement();
		ResultSet rs=st.executeQuery(sql);//
		List<Goods> list=new ArrayList<Goods>();
		while(rs.next()){
		String goodsName = rs.getString(1);
		String producePlace = rs.getString(2);
		String productCode = rs.getString(3);
		String description = rs.getString(4);
		float price = rs.getFloat("price");
		String goodsPicture = rs.getString(6);
		int goodsNumber =rs.getInt("goodsnumber");
		String pid = rs.getString(8);
		if(i==null){
			Goods g=new Goods(goodsName, producePlace, productCode, description, price, goodsPicture, goodsNumber, pid);
			list.add(g);
		}
		else if(goodsName.contains(i)){
				Goods g=new Goods(goodsName, producePlace, productCode, description, price, goodsPicture, goodsNumber, pid);
				list.add(g);
		}
		}
		
		rs.close();
		st.close();
		conn.close();
		return list;
	}

	
	public void updateGoods(String goodsname,String produceplace,String price,String goodscount,String description,int pid){
		try{
			JdbcUtils jdbcUtils = new JdbcUtils();
			jdbcUtils.getConnection();
			String sql = "UPDATE tb_goods SET goodsname='"+goodsname+"',produceplace='"+produceplace+"',price='"+price+"',goodsnumber='"+goodscount+"',description='"+description+"',pid='"+pid+"' where goodsname='"+goodsname+"'";
			boolean flag = false;
			flag =jdbcUtils.updateByPreparedStatement(sql, null);
			if(flag){
				System.out.println("成功");
			}else{
				System.out.println("失败");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

//		public boolean loginStudent(String user,int pass) throws SQLException{
//			Connection conn=Db.getConn();
//			String sql="select sid,sname from student where sid="+pass+" and sname='"+user+"'";
//			Statement st=conn.createStatement();
//			ResultSet rs=null;
//			try {
//				rs=st.executeQuery(sql);
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			if(rs.next()){
//				rs.close();
//				st.close();
//				conn.close();
//				return true;
//			}else{
//				rs.close();
//				st.close();
//				conn.close();
//				return false;
//				}
//		}
		
//		public int delStudent(int sid) throws SQLException{
//			Connection conn=Db.getConn();
//			String sql="delete from student where sid="+sid;
//			Statement st=conn.createStatement();
//			int row=st.executeUpdate(sql);
//			st.close();
//			conn.close();
//			return row;
//		}	
//		
}
