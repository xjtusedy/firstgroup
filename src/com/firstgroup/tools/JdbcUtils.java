package com.firstgroup.tools;


import java.sql.Connection;
import java.sql.DriverManager;  
import java.sql.PreparedStatement;  
import java.sql.ResultSet;  
import java.sql.ResultSetMetaData;  
import java.sql.SQLException;  
import java.util.ArrayList;  
import java.util.HashMap;  
import java.util.List;  
import java.util.Map; 
public class JdbcUtils {
	//数据库用户名
		private static final String USERNAME = "root";
		//密码
		private static final String PASSWORD = "199707194535";
		//数据库连接驱动
		private static final String DRIVER = "com.mysql.jdbc.Driver";
		//数据库地址
		private static final String URL = "jdbc:mysql://localhost:3306/xjtuxxq";
		
		private Connection connection;
		
		private PreparedStatement pstmt;
		
		private ResultSet resultSet;
		
		public  JdbcUtils( ){
			try{  
	            Class.forName(DRIVER);  
	            System.out.println("数据库连接成功！");  
	  
	        }catch(Exception e){  
	  
	        } 
		}
		/*
		 *获得数据库的连接 
		 * 
		 **/
		public Connection getConnection(){
			try{
				connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			}catch(SQLException e){
				e.printStackTrace();
			}
			return connection;
		}
		
		/*
		 * 增加 删除 修改
		 * @param sql
		 * @param params
		 * @return
		 * @throws SQLException
		 * */
		public boolean updateByPreparedStatement(String sql, List<Object>params)throws SQLException{  
	        boolean flag = false;  
	        int result = -1;  
	        pstmt = connection.prepareStatement(sql);  
	        int index = 1;  
	        if(params != null && !params.isEmpty()){  
	            for(int i=0; i<params.size(); i++){  
	                pstmt.setObject(index++, params.get(i));  
	            }  
	        }  
	        result = pstmt.executeUpdate();  
	        flag = result > 0 ? true : false;  
	        return flag;  
	    }
		
		/** 
	     * 查询单条记录 
	     * @param sql 
	     * @param params 
	     * @return 
	     * @throws SQLException 
	     */  
	    public Map<String, Object> findSimpleResult(String sql, List<Object> params) throws SQLException{  
	        Map<String, Object> map = new HashMap<String, Object>();  
	        int index  = 1;  
	        pstmt = connection.prepareStatement(sql);  
	        if(params != null && !params.isEmpty()){  
	            for(int i=0; i<params.size(); i++){  
	                pstmt.setObject(index++, params.get(i));  
	            }  
	        }  
	        resultSet = pstmt.executeQuery();//返回查询结果  
	        ResultSetMetaData metaData = resultSet.getMetaData();  
	        int col_len = metaData.getColumnCount();  
	        while(resultSet.next()){  
	            for(int i=0; i<col_len; i++ ){  
	                String cols_name = metaData.getColumnName(i+1);  
	                Object cols_value = resultSet.getObject(cols_name);  
	                if(cols_value == null){  
	                    cols_value = "";  
	                }  
	                map.put(cols_name, cols_value);  
	            }  
	        }  
	        return map;  
	    }  
	  
	    /**查询多条记录 
	     * @param sql 
	     * @param params 
	     * @return 
	     * @throws SQLException 
	     */  
	    public List<Map<String, Object>> findModeResult(String sql, List<Object> params) throws SQLException{  
	        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();  
	        int index = 1;  
	        pstmt = connection.prepareStatement(sql);  
	        if(params != null && !params.isEmpty()){  
	            for(int i = 0; i<params.size(); i++){  
	                pstmt.setObject(index++, params.get(i));  
	            }  
	        }  
	        resultSet = pstmt.executeQuery();  
	        ResultSetMetaData metaData = resultSet.getMetaData();  
	        int cols_len = metaData.getColumnCount();  
	        while(resultSet.next()){  
	            Map<String, Object> map = new HashMap<String, Object>();  
	            for(int i=0; i<cols_len; i++){  
	                String cols_name = metaData.getColumnName(i+1);  
	                Object cols_value = resultSet.getObject(cols_name);  
	                if(cols_value == null){  
	                    cols_value = "";  
	                }  
	                map.put(cols_name, cols_value);  
	            }  
	            list.add(map);  
	        }  
	  
	        return list;  
	    }
	    
	    /** 
	     * 释放数据库连接 
	     */  
	    public void releaseConn(){  
	        if(resultSet != null){  
	            try{  
	                resultSet.close();  
	            }catch(SQLException e){  
	                e.printStackTrace();  
	            }  
	        }  
	    }
	    
	    public static void main(String[] args) throws SQLException {  
	        /* 
	        JdbcUtils jdbcUtils = new JdbcUtils();  
	        jdbcUtils.getConnection();
	        String sql = "select * from tb_user";
	        Map<String, Object> map = new HashMap<String, Object>();  
	         map = jdbcUtils.findSimpleResult(sql, null); 
	        System.out.println(map);
	        */
	    	JdbcUtils jdbcUtils = new JdbcUtils(); 
	    	jdbcUtils.getConnection();
	    	String sql = "insert into tb_user (username, passwd) values (?, ?), (?, ?), (?, ?)"; 
	        List<Object> params = new ArrayList<Object>(); 
	        params.add("小明"); 
	        params.add("123xiaoming"); 
	        params.add("张三"); 
	        params.add("zhangsan"); 
	        params.add("李四"); 
	        params.add("lisi000"); 
	        try { 
	            boolean flag = jdbcUtils.updateByPreparedStatement(sql, params); 
	            System.out.println(flag); 
	        } catch (SQLException e) { 
	            // TODO Auto-generated catch block 
	            e.printStackTrace(); 
	        }
	        
	    }
	    
	    
		
		
		
	
}
