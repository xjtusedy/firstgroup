package com.firstgroup.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.firstgroup.bean.*;
import com.firstgroup.tools.*;

public class UserDao {
	public String findUsername(String username){
		String passwd = "none";
		JdbcUtils jdbcUtils = new JdbcUtils();
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = "select * from tb_user where username ='"+username+"' " ;
		try{
			 jdbcUtils.getConnection();
			 map = jdbcUtils.findSimpleResult(sql, null);
			 System.out.println(map);
			 if(map == null || map.size()<1){
				 return passwd;
			 }
			 if(map.size() >= 1){
//				 System.out.println( map.get("passwd"));
				 passwd = (String) map.get("passwd");
				 System.out.println(passwd);
			 }
			 
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return passwd;
		
	}
	
	public void addUser(String username, String passwd, String telephone){
		try{
			JdbcUtils jdbcUtils = new JdbcUtils();
			jdbcUtils.getConnection();
			String sql = "INSERT INTO tb_user (username,passwd,telephone) values(?,?,?)";
			 List<Object> params = new ArrayList<Object>(); 
		     params.add(username); 
		     params.add(passwd); 
		     params.add(telephone);
		     System.out.println(params);
			boolean flag = false;
			flag =jdbcUtils.updateByPreparedStatement(sql, params);
			if(flag){
				System.out.println("成功");
			}else{
				System.out.println("失败");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/*public static void main(String[] args) {  
        String psw =new UserDao().findUsername("xo");  
        System.out.println(psw);  
        UserDao u = new UserDao();  
        u.addUser("co", "345"); 
	}*/
	public void addUserInfo(String username,String sex, String telphone,String address, String email, String postcode, String userpicture ){
		try{
			JdbcUtils jdbcUtils = new JdbcUtils();
			jdbcUtils.getConnection();
			String sql = "UPDATE tb_user SET sex='"+sex+"' , address='"+address+"', email='"+email+"',telephone='"+telphone+"' ,postcode='"+postcode+"' , userpicture='"+userpicture+"' WHERE username='"+username+"' ";
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
}
