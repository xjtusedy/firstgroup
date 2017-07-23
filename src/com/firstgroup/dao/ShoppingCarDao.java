package com.firstgroup.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.firstgroup.tools.JdbcUtils;

public class ShoppingCarDao {
	public List<Map<String, Object>> selectUserShoppingCar(String userName) throws SQLException {
		JdbcUtils jdbc=new JdbcUtils();
  		jdbc.getConnection();
  		String sql = "SELECT goodspicture,tbs.goodsname,price,number,getintime FROM tb_shoppingcar tbs INNER JOIN tb_goods tbg ON tbs.goodsname=tbg.goodsname WHERE username='"+userName+"' ORDER BY getintime desc";  
	    List<Map<String, Object>> list = jdbc.findModeResult(sql, null);
	    return list;
	}
	
	public int selectRestGoodsNumber(String goodsName) throws SQLException {
		JdbcUtils jdbc=new JdbcUtils();
  		jdbc.getConnection();
  		String sql = "SELECT goodsnumber FROM tb_goods WHERE goodsname='"+goodsName+"'";
  		List<Map<String, Object>> list = jdbc.findModeResult(sql, null);
  		return Integer.parseInt(list.get(0).get("goodsnumber").toString());
	}
	
	public boolean updateShoppingCar(String userName,String goodsName,String getInTime,String number) throws SQLException {
		JdbcUtils jdbc=new JdbcUtils();
  		jdbc.getConnection();
  		String sql = "UPDATE tb_shoppingcar SET number='"+number+"' WHERE username='"+userName+"' AND goodsname='"+goodsName+"' AND getintime='"+getInTime+"'";
  		boolean flag = jdbc.updateByPreparedStatement(sql, null);
		return flag;
	}
	
	public boolean deleteShoppingCar(String userName,String goodsName,String getInTime) throws SQLException {
		JdbcUtils jdbc=new JdbcUtils();
  		jdbc.getConnection();
  		String sql = "DELETE FROM tb_shoppingcar WHERE username='"+userName+"' AND goodsname='"+goodsName+"' AND getintime='"+getInTime+"'";
  		boolean flag = jdbc.updateByPreparedStatement(sql, null);
		return flag;
	}
	
	public boolean balanceShoppingCar(String userName,String goodsName,String shopTime,String number,String getInTime) throws SQLException {
		JdbcUtils jdbc=new JdbcUtils();
  		jdbc.getConnection();
  		String deleteSql = "DELETE FROM tb_shoppingcar WHERE username='"+userName+"' AND goodsname='"+goodsName+"' AND getintime='"+getInTime+"'";
  		boolean deleteFlag = jdbc.updateByPreparedStatement(deleteSql, null);
  		String selectSql = "SELECT * FROM tb_record WHERE shoptime='"+shopTime+"' AND username='"+userName+"' AND goodsname='"+goodsName+"'";
  		List<Map<String, Object>> list = jdbc.findModeResult(selectSql, null);
  		boolean insertFlag = false;
  		String num = "";
  		if((list==null)||(list.size()==0)) {
  			String insertSql = "INSERT INTO tb_record VALUES('"+shopTime+"','"+userName+"','"+goodsName+"','"+number+"')";
  	  		insertFlag = jdbc.updateByPreparedStatement(insertSql, null);
  		}
  		else {
  			num=String.valueOf(Integer.parseInt(list.get(0).get("number").toString())+Integer.parseInt(number));
  			String insertSql = "UPDATE tb_record SET number='"+num+"' WHERE username='"+userName+"' AND shoptime='"+shopTime+"' AND goodsname='"+goodsName+"'";
  			insertFlag = jdbc.updateByPreparedStatement(insertSql, null);
  		}
  		String selectGoodsSql = "SELECT goodsnumber FROM tb_goods WHERE goodsname='"+goodsName+"'";
  		List<Map<String,Object>>goodsList = jdbc.findModeResult(selectGoodsSql, null);
  		boolean updateGoodsFlag = false;
  		if((goodsList==null)||(goodsList.size()==0))System.out.println("未查到该商品！");
  		else {
  			int goodsNum = Integer.parseInt(goodsList.get(0).get("goodsnumber").toString());
  			String AlterSql = "UPDATE tb_goods SET goodsnumber='"+String.valueOf(goodsNum-Integer.parseInt(number))+"' WHERE goodsname='"+goodsName+"'";
  			updateGoodsFlag=jdbc.updateByPreparedStatement(AlterSql, null);
  		}
		return deleteFlag&&insertFlag&&updateGoodsFlag;
	}
}
