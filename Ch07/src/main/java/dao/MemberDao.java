package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Driver;

import vo.MemberVo;

public class MemberDao {
	private static MemberDao instance = new MemberDao();
	public static MemberDao getInstance() {
		return instance;
	}
	
	private MemberDao() {}
	
	private final String HOST = "jdbc:mysql://54.180.160.240:3306/rio100466";
	private final String USER = "rio100466";
	private final String PASS = "1234";
	
	public void insertMember(MemberVo vo) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(HOST, USER, PASS);
			String sql = "INSERT INTO `MEMBER` VALUES (?,?,?,?,?,NOW())";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getUid());
			psmt.setString(2, vo.getName());
			psmt.setString(3, vo.getHp());
			psmt.setString(4, vo.getPos());
			psmt.setInt(5, vo.getDep());
			
			psmt.executeUpdate();
			
			psmt.close();
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public MemberVo selectMember(String uid) {
		MemberVo member = new MemberVo();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(HOST,USER,PASS);
			String sql = "SELECT * FROM `MEMBER` WHERE `uid`=?;";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, uid);
			ResultSet rs = psmt.executeQuery();
			if(rs.next()) {
				member.setUid(rs.getString(1));
				member.setName(rs.getString(2));
				member.setHp(rs.getString(3));
				member.setPos(rs.getString(4));
				member.setDep(rs.getInt(5));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}
	
	
	
	public List<MemberVo> selectMembers() {
		List<MemberVo> users = new ArrayList<MemberVo>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(HOST,USER,PASS);
			String sql = "SELECT * FROM `MEMBER`;";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				MemberVo user = new MemberVo();
				user.setUid(rs.getString(1));
				user.setName(rs.getString(2));
				user.setHp(rs.getString(3));
				user.setPos(rs.getString(4));
				user.setDep(rs.getInt(5));
				user.setRdate(rs.getString(6));
				users.add(user);
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
		
	}
	public void updateMember(MemberVo member) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(HOST,USER,PASS);
			String sql = "UPDATE `MEMBER` SET `name`=?,`hp`=?,`pos`=?,`dep`=? WHERE `uid`=?";
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, member.getName());
			psmt.setString(2, member.getHp());
			psmt.setString(3, member.getPos());
			psmt.setInt(4, member.getDep());
			psmt.setString(5, member.getUid());
			psmt.executeUpdate();
			psmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void deleteMember(String uid) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(HOST,USER,PASS);
			String sql = "DELETE FROM `MEMBER` WHERE `uid`=?;";
			PreparedStatement psmt = conn.prepareStatement(sql);	
			psmt.setString(1, uid);
			psmt.executeUpdate();
			psmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
