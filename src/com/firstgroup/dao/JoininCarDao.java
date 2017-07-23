package com.firstgroup.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.firstgroup.tools.Db;

import java.sql.Connection;


public class JoininCarDao {


	public int updateShoppingCar(String sql) throws SQLException {
		
		Connection conn=Db.getConn();

		Statement st=(Statement)conn.createStatement();
		int row=st.executeUpdate(sql);
		st.close();
		conn.close();
		return row;
		
	}
	public int getNumberInShoppingCar(String userName, String goodsName) throws SQLException{
		String sql="select number from tb_shoppingcar where username='"+userName+"' and goodsname='"+goodsName+"'";
		Connection conn=Db.getConn();
		Statement st=conn.createStatement();
		int shoppingcarNumber=0;
		ResultSet rs=st.executeQuery(sql);
		while(rs.next()){
			shoppingcarNumber+=rs.getInt("number");
		}
		return shoppingcarNumber;
	}
	public boolean canJoinIn(String userName, String goodsName, int buyNumber,int lastGoodsNumber) throws SQLException{
		String sql="select number from tb_shoppingcar where username='"+userName+"' and goodsname='"+goodsName+"'";
		Connection conn=Db.getConn();
		Statement st=conn.createStatement();
		int shoppingcarNumber=0;
		ResultSet rs=st.executeQuery(sql);
		while(rs.next()){
			shoppingcarNumber+=rs.getInt("number");
		}
		if((shoppingcarNumber+buyNumber)>lastGoodsNumber)return false;
		else return true;
	} 
}
