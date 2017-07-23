package com.firstgroup.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.firstgroup.tools.*;

public class ShoppingRecordDao {
	public List<Map<String, Object>> selectUserRecord(String userName) throws SQLException {
		JdbcUtils jdbc=new JdbcUtils();
  		jdbc.getConnection();
  		String sql = "SELECT shoptime,goodspicture,tbr.goodsname,number,producername,price FROM tb_goods tbg INNER JOIN tb_record tbr ON tbg.goodsname=tbr.goodsname INNER JOIN tb_producer tbp ON tbg.pid=tbp.pid WHERE tbr.username='"+userName+"' ORDER BY shoptime desc";  
	    List<Map<String, Object>> list = jdbc.findModeResult(sql, null);
	    return list;
	}
}
