package com.firstgroup.tools;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class Db {
	/**
*
*  @author:liuyibing
*  ʾ��
*/
    private static String user = "root";
    private static String pass = "199707194535";
    private static String url = "jdbc:mysql://localhost:3306/xjtuxxq";
    private static String driver = "com.mysql.jdbc.Driver";
    static{
    	try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    public static Connection getConn(){
    	Connection conn = null;
    	try {
			conn = DriverManager.getConnection(url, user, pass);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
    }
}
