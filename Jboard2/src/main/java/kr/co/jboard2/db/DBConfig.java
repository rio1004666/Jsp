package kr.co.jboard2.db;

import java.sql.Connection;
import java.sql.DriverManager;



// �̱��� ��ü 
public class DBConfig {  
			
			private static DBConfig instance = new DBConfig();
			private DBConfig() {}
			public static  DBConfig getInstance() { 
				
				return instance; 
			
			} 
			
			private final String HOST = "jdbc:mysql://54.180.160.240:3306/rio100466";
			private final String USER = "rio100466";
			private final String PASS = "1234";
			
			
			public Connection  getConnection() throws Exception {  
				
				Class.forName("com.mysql.jdbc.Driver");
				
				Connection conn = DriverManager.getConnection(HOST,USER,PASS);
				
				return conn;
			}
}
