package kr.co.jboard1.db;

import java.sql.Connection;
import java.sql.DriverManager;



// 싱글톤 객체 
public class DBConfig { // 공통된부분을 클래스로 묶어서 처리해준다 
			 // 자주쓰는 클래스는 싱글톤으로 만듬 
			// 외부에서 생성못하게 만든다 
			// 싱글톤 => 생성자는 내부에서만 사용가능 자기자신안에서 객체 외부에 제공해줘야한다 겟터!!! 
			private static DBConfig instance = new DBConfig();
			private DBConfig() {} // 객체를 생성할 수 없다 new연산자로 생성할수있는데 원래 => 캡슐화 
			// 객체없이도 클래스이름만으로 접근은하는데 함수도 객체가 있어야하는데...static을 붙여서 사용 
			public static  DBConfig getInstance() { // static을 사용해서 클래스이름으로 객체 생성 
				
				// 싱글톤으로 설계된 클래스는 외부에서 객체를 생성할 수 없기때문에 변수나 메서드에 static을 붙여서 정적변수나 메서드로 만들어서 사용해야한다 
				// 그래서 이 static은 공통자원 공통기능으로 사용하게 한다 
				// 메모리에 할당을 한번만해서 자원을 공유한다 메서드도 변수도 전부 
				return instance; // 참조못한다 원래 문법적으로 
			} // 객체를 생성할 수 없다 new연산자로 생성할수있는데 원래 => 캡슐화 
			
			private final  String  HOST = "jdbc:mysql://54.180.160.240:3306/rio100466"; // 고정값이므로 final상수 관례적으로 final 상수 변수는 대문자로 
			
			private final  String  USER = "rio100466";
			
			private final  String   PASS = "1234";
			
			
			public Connection  getConnection() throws Exception { //  예외처리를 해준다 
				
				Class.forName("com.mysql.jdbc.Driver");
				
				Connection conn = DriverManager.getConnection(HOST,USER,PASS);
				
				return conn;
			}
}
