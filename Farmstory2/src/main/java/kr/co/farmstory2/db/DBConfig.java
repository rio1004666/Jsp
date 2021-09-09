package kr.co.farmstory2.db;

import java.sql.Connection;
import java.sql.DriverManager;



// �̱��� ��ü 
public class DBConfig {  
			
			private static DBConfig instance = new DBConfig();
			private DBConfig() {}
			public static  DBConfig getInstance() { 
				
				return instance; 
			
			} 
			
			String HOST = "jdbc:mysql://13.124.81.181:3306/rio100466";
			String USER = "rio100466";
			String PASS = "1234";
			
			
			public Connection  getConnection() throws Exception {  
				
				Class.forName("com.mysql.jdbc.Driver");
				
				Connection conn = DriverManager.getConnection(HOST,USER,PASS);
				
				return conn;
			}
}
