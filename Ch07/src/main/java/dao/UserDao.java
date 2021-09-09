package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.dbcp.dbcp2.PStmtKey;

import vo.UserVo;

public class UserDao {
	private static UserDao instance = new UserDao(); // 내부적으로 객체생성 한번만한다 
	public static UserDao getInstance() {
		return instance;
	}
	private UserDao() {} // 생성자를 외부에서 생성못하게 한다 
	private final String HOST = "jdbc:mysql://13.124.81.181:3306/rio100466";
	private final String USER = "rio100466";
	private final String PASS = "1234";
	
	
	public void insertUser(UserVo vo) {
		try {
			// 1´Ü°è
			Class.forName("com.mysql.jdbc.Driver");
			// 2´Ü°è
			Connection conn = DriverManager.getConnection(HOST, USER, PASS);
			// 3´Ü°è
			String sql = "INSERT INTO `USER1` VALUES (?,?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getUid());
			psmt.setString(2, vo.getName());
			psmt.setString(3, vo.getHp());
			psmt.setInt(4, vo.getAge());
			// 4´Ü°è
			psmt.executeUpdate();
			// 5´Ü°è
			// 6´Ü°è
			psmt.close();
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public UserVo selectUser(String uid) {
		UserVo user = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(HOST,USER,PASS);
			String sql = "SELECT * FROM `USER1` WHERE `uid`=?;";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, uid);
			ResultSet rs = psmt.executeQuery();
			if(rs.next()) {
				user = new UserVo();
				user.setUid(rs.getString(1));
				user.setName(rs.getString(2));
				user.setHp(rs.getString(3));
				user.setAge(rs.getInt(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	public List<UserVo> selectUsers() {
		List<UserVo> users = new	ArrayList<UserVo>();
		UserVo vo = null;
		try {
			
					Class.forName("com.mysql.jdbc.Driver");
						
					Connection conn = DriverManager.getConnection(HOST, USER, PASS);
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery("SELECT * FROM `USER1`;");			
					while(rs.next()) {
						vo = new UserVo();
						vo.setUid(rs.getString(1));
						vo.setName(rs.getString(2));
						vo.setHp(rs.getString(3));
						vo.setAge(rs.getInt(4));
						users.add(vo);
					}
					
		}catch(Exception e) {
			e.printStackTrace();
		}
		return users;
		
	}
	public void updateUser(UserVo vo) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(HOST,USER,PASS);
			String sql = "UPDATE `USER1` SET `name`=?, `hp`=?, `age`=? WHERE `uid`=?;";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getName());
			psmt.setString(2, vo.getHp());
			psmt.setInt(3, vo.getAge());
			psmt.setString(4, vo.getUid());
			psmt.executeUpdate();
			psmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteUser(String uid) {
		
		try {
			// 1´Ü°è
			Class.forName("com.mysql.jdbc.Driver");
			// 2´Ü°è
			Connection conn = DriverManager.getConnection(HOST, USER, PASS);
			// 3´Ü°è
			String sql = "DELETE FROM `USER1` WHERE `uid`=?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, uid);
			
			// 4´Ü°è
			psmt.executeUpdate();
			// 5´Ü°è
			// 6´Ü°è
			psmt.close();
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
