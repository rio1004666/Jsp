package kr.co.farmstory1.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import kr.co.farmstory1.bean.MemberBean;
import kr.co.farmstory1.bean.TermsBean;
import kr.co.farmstory1.db.DBConfig;
import kr.co.farmstory1.db.Sql;

public class MemberDao {

	private static MemberDao instance = new MemberDao();
	
	public static MemberDao getInstance() {
		return instance;
	}
	private MemberDao() {}
	///////////////////////////////////////////////////////////////////////////////////////
	
	public void insertMember(MemberBean mb) {
			try {
				Connection conn = DBConfig.getInstance().getConnection();
				PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_MEMBER);
				psmt.setString(1, mb.getUid());
				psmt.setString(2, mb.getPass());
				psmt.setString(3, mb.getName());
				psmt.setString(4, mb.getNick());
				psmt.setString(5, mb.getEmail());
				psmt.setString(6, mb.getHp());
				psmt.setInt(7, mb.getGrade());
				psmt.setString(8, mb.getZip());
				psmt.setString(9, mb.getAdd1());
				psmt.setString(10, mb.getAdd2());
				psmt.setString(11, mb.getRegip());

				psmt.executeUpdate();
				psmt.close();
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
	}
	/* 아이디 중복 체크 */
	public int selectCountUserInfo(int type) { // 중복체크하기위해 이메서드 선언   그리고 사용자 정보들을 통합하는게 좋다  
		return 0;
	}


	
	public MemberBean selectMember(String uid, String pass) {
		
		MemberBean mb = null;
		
		try{
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_MEMBER);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				mb = new MemberBean();
				mb.setUid(rs.getString(1));
				mb.setPass(rs.getString(2));
				mb.setName(rs.getString(3));
				mb.setNick(rs.getString(4));
				mb.setEmail(rs.getString(5));
				mb.setHp(rs.getString(6));
				mb.setGrade(rs.getInt(7));
				mb.setZip(rs.getString(8));
				mb.setAdd1(rs.getString(9));
				mb.setAdd2(rs.getString(10));
				mb.setRegip(rs.getString(11));
				mb.setRdate(rs.getString(12));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return mb;
	}
	
	public void selectMembers() {}
	public void updateMember() {}
	public void deleteMember() {}
	
}