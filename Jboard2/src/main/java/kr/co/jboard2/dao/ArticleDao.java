package kr.co.jboard2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.co.jboard2.db.DBConfig;
import kr.co.jboard2.db.Sql;
import kr.co.jboard2.vo.ArticleVo;
import kr.co.jboard2.vo.FileVo;

public class ArticleDao {
	private static ArticleDao instance = new ArticleDao();
	public static ArticleDao getInstance() {
		return instance;
	}
	private ArticleDao() {}
	public ArticleVo selectArticle(String seq) {
		ArticleVo av = null;
		FileVo fv = null;
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLE);
			psmt.setString(1, seq);
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				av = new ArticleVo();
				av.setSeq(rs.getInt(1));
				av.setParent(rs.getInt(2));
				av.setComment(rs.getInt(3));
				av.setCate(rs.getString(4));
				av.setTitle(rs.getString(5));
				av.setContent(rs.getString(6));
				av.setFile(rs.getInt(7));
				av.setHit(rs.getInt(8));
				av.setUid(rs.getString(9));
				av.setRegip(rs.getString(10));
				av.setRdate(rs.getString(11));
				
				fv = new FileVo();
				fv.setFseq(rs.getInt(12));
				fv.setParent(rs.getInt(13));
				fv.setOriName(rs.getString(14));
				fv.setNewName(rs.getString(15));
				fv.setDownload(rs.getInt(16));
				fv.setRdate(rs.getString(17));
				av.setFb(fv);
			}
			rs.close();
			psmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return av;
	}
	public List<ArticleVo> selectArticles(int start){

		List<ArticleVo> articles = new ArrayList<>();
		ArticleVo article = null;
		try {
			
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLES);
			psmt.setInt(1, start);
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				article =  new ArticleVo();
				article.setSeq(rs.getInt(1));
				article.setParent(rs.getInt(2));
				article.setComment(rs.getInt(3));
				article.setCate(rs.getString(4));
				article.setTitle(rs.getString(5));
				article.setContent(rs.getString(6));
				article.setFile(rs.getInt(7));
				article.setHit(rs.getInt(8));
				article.setUid(rs.getString(9));
				article.setRegip(rs.getString(10));				
				article.setRdate(rs.getString(11).substring(2,10)); // 미리 substring으로 필요한 문자열만 파싱한다 
				article.setNick(rs.getString(12)); // 글쓴이의 닉네임을 받아오기위해서 
				articles.add(article);
			}
			rs.close();
			psmt.close();
			conn.close();
		} catch (Exception e) {
				e.printStackTrace();
		}
		return articles;
	}
	public void insertFile(int seq,String fname,String newName) {
		
		try{
			Connection  conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_FILE);
			psmt.setInt(1, seq); //글번호가 내가 글을 써서 db에 저장되는 순간 그 번호가 글번호가 된다 parent
			psmt.setString(2, fname); //원래 이름은 oriName=  fname
			psmt.setString(3, newName);
			
			psmt.executeUpdate();
			
			psmt.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
			
		}
		
	}
	public int insertArticle(ArticleVo av) {
		
		try {
			
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_ARTICLE);
			psmt.setString(1, av.getTitle());
			psmt.setString(2, av.getContent());
			psmt.setInt(3, av.getFile());
			psmt.setString(4, av.getUid());
			psmt.setString(5, av.getRegip());
			int result = psmt.executeUpdate(); // 삽입하고나서도 값을 반환받을 수 있다 
			psmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectMaxSeq(); // 가장 최근글의 번호를 가져온다 
	}

	public int selectCountTotal() {
		int total = 0;
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			Statement stmt = conn.createStatement();// 쿼리문에 매핑해야할 데이터가 없으므로 Statement인터페이스 사용
			ResultSet rs = stmt.executeQuery(Sql.SELECT_COUNT_TOTAL);
			if(rs.next()) {
				total = rs.getInt(1);
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return total;
	}

	public int selectMaxSeq() {
		int seq = 0;
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(Sql.SELECT_MAX_SEQ);
			if(rs.next()){
				seq = rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return seq;
	}

	public void updateArticle() {}
	public void deleteArticle() {}
}
