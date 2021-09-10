package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import vo.CustomerVo;

public class CustomerDao {
	private static CustomerDao instance = new CustomerDao();
	public static CustomerDao getInstance() {
		return instance;
	}
	private CustomerDao() {}
	
	private final String HOST = "jdbc:mysql://54.180.160.240:3306/rio100466";
	private final String USER = "rio100466";
	private final String PASS = "1234";
	
	
	public void insertCustomer() {}
	public void selectCustomer() {}
	public List<CustomerVo> selectCustomers() {
		List<CustomerVo> customers = new ArrayList<>();
		CustomerVo cv = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(HOST,USER,PASS);
			Statement stmt = conn.createStatement();
			
			ResultSet rs = stmt.executeQuery("SELECT * FROM `Customer`") ;
			while(rs.next()) {
				cv = new CustomerVo();
				cv.setCustid(rs.getInt(1));
				cv.setName(rs.getString(2));
				cv.setAddress(rs.getString(3));
				cv.setPhone(rs.getNString(4));
				customers.add(cv);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return customers;
	}
	public void deleteCustomer() {}
	public void updateCustomer() {}
}
