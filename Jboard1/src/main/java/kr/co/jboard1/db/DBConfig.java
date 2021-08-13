package kr.co.jboard1.db;

import java.sql.Connection;
import java.sql.DriverManager;



// �̱��� ��ü 
public class DBConfig { // ����Ⱥκ��� Ŭ������ ��� ó�����ش� 
			 // ���־��� Ŭ������ �̱������� ���� 
			// �ܺο��� �������ϰ� ����� 
			// �̱��� => �����ڴ� ���ο����� ��밡�� �ڱ��ڽžȿ��� ��ü �ܺο� ����������Ѵ� ����!!! 
			private static DBConfig instance = new DBConfig();
			private DBConfig() {} // ��ü�� ������ �� ���� new�����ڷ� �����Ҽ��ִµ� ���� => ĸ��ȭ 
			// ��ü���̵� Ŭ�����̸������� �������ϴµ� �Լ��� ��ü�� �־���ϴµ�...static�� �ٿ��� ��� 
			public static  DBConfig getInstance() { // static�� ����ؼ� Ŭ�����̸����� ��ü ���� 
				
				// �̱������� ����� Ŭ������ �ܺο��� ��ü�� ������ �� ���⶧���� ������ �޼��忡 static�� �ٿ��� ���������� �޼���� ���� ����ؾ��Ѵ� 
				// �׷��� �� static�� �����ڿ� ���������� ����ϰ� �Ѵ� 
				// �޸𸮿� �Ҵ��� �ѹ����ؼ� �ڿ��� �����Ѵ� �޼��嵵 ������ ���� 
				return instance; // �������Ѵ� ���� ���������� 
			} // ��ü�� ������ �� ���� new�����ڷ� �����Ҽ��ִµ� ���� => ĸ��ȭ 
			
			private final  String  HOST = "jdbc:mysql://54.180.160.240:3306/rio100466"; // �������̹Ƿ� final��� ���������� final ��� ������ �빮�ڷ� 
			
			private final  String  USER = "rio100466";
			
			private final  String   PASS = "1234";
			
			
			public Connection  getConnection() throws Exception { //  ����ó���� ���ش� 
				
				Class.forName("com.mysql.jdbc.Driver");
				
				Connection conn = DriverManager.getConnection(HOST,USER,PASS);
				
				return conn;
			}
}
