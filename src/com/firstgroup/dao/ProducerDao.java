package com.firstgroup.dao;

import java.util.ArrayList;
import java.util.List;

import com.firstgroup.tools.JdbcUtils;

public class ProducerDao {
	public void addProducer(String producername, String passwd, String telephone){
		try{
			JdbcUtils jdbcUtils = new JdbcUtils();
			jdbcUtils.getConnection();
			String sql = "INSERT INTO tb_producer (producername,propasswd,telephone) values(?,?,?)";
			 List<Object> params = new ArrayList<Object>(); 
		     params.add(producername); 
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
	public void addProInfo(String producername,String connectionperson,String prodec, String telphone,String address, String email, String classify, String prologo ){
		try{
			JdbcUtils jdbcUtils = new JdbcUtils();
			jdbcUtils.getConnection();
			String sql = "UPDATE tb_producer SET connectionperson = '"+connectionperson+"',prodec ='"+prodec+"' , address='"+address+"', email='"+email+"',telephone='"+telphone+"' ,classify='"+classify+"' , prologo='"+prologo+"' WHERE producername='"+producername+"' ";
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
