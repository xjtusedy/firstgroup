package com.firstgroup.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.firstgroup.bean.GoodsBean;
import com.firstgroup.tools.Db;


public class CommodityDao {
	private boolean flag;
	
	
	public CommodityDao() {
		flag=true;
	}

	public boolean isEmpty() {
		return flag;
	}
	
	public CommodityDao(boolean flag) {
		this.flag = flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	
	public  GoodsBean searchCommodityByName(String name) throws SQLException{
		Connection conn=Db.getConn();
		GoodsBean gB=new GoodsBean();
		String sql="select  goodspicture,goodsnumber,goodsname,produceplace,description,price,pid from tb_goods where goodsname like'%"+name+"%'";
		
		Statement st= conn.createStatement();
		ResultSet rs=st.executeQuery(sql);
		if(rs.next()){
  			String goodsPicture=rs.getString("goodspicture");
  			int goodsNumber=rs.getInt("goodsnumber");
  			String goodsName=rs.getString("goodsname");
  			String producePlace=rs.getString("produceplace");
  			String description =rs.getString("description");
  			double price=rs.getDouble("price");
  			String pid=rs.getString("pid");
  			gB.setGoodsPicture(goodsPicture);
  			gB.setGoodsNumber(goodsNumber);
  			gB.setGoodsName(goodsName);
  			gB.setProducePlace(producePlace);
  			gB.setDescription(description);
  			gB.setPrice(price);
  			gB.setPid(pid);
  			}
		else{
			flag=false;
		}
		rs.close();
		st.close();
		conn.close();
		return gB;
	
	}
}
