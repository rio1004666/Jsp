package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
	
	public void insertCustomer(CustomerVo cv) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(HOST,USER,PASS);
				String sql = "INSERT INTO `Customer` SET `name`=?, `address`=?, `phone`=?;";
						
				PreparedStatement psmt = conn.prepareStatement(sql);
				psmt.setString(1, cv.getName());
				psmt.setString(2, cv.getAddress());
				psmt.setString(3, cv.getPhone());
				psmt.executeUpdate();
				psmt.close();
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	public List<CustomerVo> selectCustomers(){
		List<CustomerVo> customers = new ArrayList<>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(HOST,USER,PASS);
			Statement stmt = conn.createStatement();
			String sql = "SELECT * FROM `Customer`;";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				CustomerVo customer = new CustomerVo();
				customer.setCustid(rs.getInt(1));
				customer.setName(rs.getString(2));
				customer.setAddress(rs.getString(3));
				customer.setPhone(rs.getString(4));
				customers.add(customer);
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return customers;
	}

}
