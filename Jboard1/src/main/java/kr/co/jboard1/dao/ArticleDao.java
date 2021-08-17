package kr.co.jboard1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.jboard1.bean.ArticleBean;
import kr.co.jboard1.db.DBConfig;
import kr.co.jboard1.db.Sql;

//DAO(DATA Access Object) 클래스 

public class ArticleDao { // 싱글톤 패턴으로 만듬 
	// 싱글톤 객체 
	private static ArticleDao instance = new ArticleDao();
		public static ArticleDao getInstance() {
			return instance;
		}
		private ArticleDao() {}
		
		public int selectCountTotal() {
			int total = 0;
			try {
					//1,2단계
					Connection conn = DBConfig.getInstance().getConnection();
					PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COUNT_TOTAL);
					ResultSet rs = psmt.executeQuery();;
					if(rs.next()) {
						 total = rs.getInt(1);
					}
					rs.close();
					psmt.close();
					conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			return total;
		}
		
		public void selectArticle() {}
		
		public List<ArticleBean> selectArticles(int start) {
		
			
			List<ArticleBean> articles = new ArrayList<>();
			try{
				//1단계
				Connection conn = DBConfig.getInstance().getConnection();
				//2단계
				PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLES);
				psmt.setInt(1, start);
				//3단계
				ResultSet rs = psmt.executeQuery();
				//4단계
				//5단계
				while(rs.next()){ // 빈으로 구조화시켜야 한다 9개짜리 필드 
					ArticleBean ab  = new ArticleBean();
					ab.setSeq(rs.getInt(1));
					ab.setParent(rs.getInt(2));
					ab.setComment(rs.getInt(3));
					ab.setCate(rs.getString(4));
					ab.setTitle(rs.getString(5));
					ab.setContent(rs.getString(6));
					ab.setFile(rs.getInt(7));
					ab.setHit(rs.getInt(8));
					ab.setUid(rs.getString(9));
					ab.setRegip(rs.getString(10));
					ab.setRdate(rs.getString(11));
					ab.setNick(rs.getString(12)); // Nickname을 아이디대신 널을것이므로 조인해서 가져온다 왜? article테이블에는 없다 닉네임이 member테이블과 조인해서 필요한 정보를 가져온다 
					articles.add(ab);
				}
				//6단계
				rs.close();
				psmt.close();
				conn.close();
				
			}catch(Exception e){
				e.printStackTrace();
				
			}
			return articles;
			
		}
		
		
		public void insertArticle() {}
		public void updateArticle() {}
		public void deleteArticle() {}
}
