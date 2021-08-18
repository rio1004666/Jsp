package kr.co.jboard1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.jboard1.bean.ArticleBean;
import kr.co.jboard1.bean.FileBean;
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
		
		public ArticleBean selectArticle(String seq) {
				ArticleBean ab = null;// 선언과 생성을 동시에 해도되지만 
				FileBean fb = null;
				try{
					//1,2단계
					Connection conn = DBConfig.getInstance().getConnection();
					//3단계
					PreparedStatement psmt =conn.prepareStatement(Sql.SELECT_ARTICLE);
					psmt.setString(1, seq); // 왠만하면 문자열로 처리
					//4단계
					ResultSet rs = psmt.executeQuery();
					//5단계
					if(rs.next()) { // 쿼리문날려서 결과를 가져오면 빈객체에 담는다 
						// 객체생성은 결과값이 잇을경우에만 생성 
						ab = new ArticleBean();
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
						fb = new FileBean(); // 따로 빈객체를 생성해준다 
						fb.setFseq(rs.getInt(12));
						fb.setParent(rs.getInt(13));
						fb.setOriName(rs.getString(14));
						fb.setNewName(rs.getString(15));
						fb.setDownload(rs.getInt(16));
						fb.setRdate(rs.getString(17));
						ab.setFb(fb); // 마지막에 파일빈을 셋팅한것을 다시 ArticleBean에다가 넣어준다 
					}
					//6단계
					rs.close();
					psmt.close();
					conn.close();
					}catch(Exception e){
						e.printStackTrace();
					}
					return ab; // 반환해주어야한다 함수에서 벗어나서 날라가므로 
		}
		
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
		public List<ArticleBean> selectComments(String seq) {
			List<ArticleBean> comments = new ArrayList<>();
			try{
				//1단계
				Connection conn = DBConfig.getInstance().getConnection();
				//2단계
				PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COMMENTS);
				psmt.setString(1, seq);
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
					comments.add(ab);
				}
				//6단계
				rs.close();
				psmt.close();
				conn.close();
				
			}catch(Exception e){
				e.printStackTrace();
				
			}
			return comments;
		}
		
		public void insertArticle() 
		{}
		public void insertComment(ArticleBean ab) { // 매개변수가 2개이상선안되는건 좋지 않다 
			
			try
			{

				//1,2단계
				Connection conn = DBConfig.getInstance().getConnection();
				//3단계
				PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_COMMENT);
				psmt.setInt(1, ab.getParent());
				psmt.setString(2, ab.getContent());
				psmt.setString(3, ab.getUid());
				psmt.setString(4, ab.getRegip());
			
				//4단계
				psmt.executeUpdate();
				//5단계
				//6단계
				psmt.close();
				conn.close();
			}catch(Exception e) {
				
			}
			
		}
		public void updateArticle() {}
		public void updateArticleHit(String seq) {
			//조회수 업데이트 
			try{
			// 1,2단계
				Connection conn = DBConfig.getInstance().getConnection();
			// 3단계
			PreparedStatement psmt	 = conn.prepareStatement(Sql.UPDATE_ARTICLE_HIT);
			psmt.setString(1,seq);
			// 4단계
			psmt.executeUpdate();
			// 5단계
			psmt.close();
			conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			
			
		}
		// 댓글의 갯수를 카운팅하는 메서드 
		public int countComment(int parent) {
				int count = 0;
				try {
					Connection conn  = DBConfig.getInstance().getConnection();
					PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COUNT_COMMENT);
					psmt.setInt(1, parent);
					ResultSet rs = psmt.executeQuery();
					if(rs.next()) {
						count = rs.getInt(1);
					}
					rs.close();
					psmt.close();
					conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			
			return count;
		}
		
		public void updateComment(int count,int seq) {
			try {
				Connection conn =  DBConfig.getInstance().getConnection();
				PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_COMMENT);
				psmt.setInt(1,count);
				psmt.setInt(2, seq);
				// 업데이트이기때문에 5단계는 필요가없다
				psmt.executeUpdate();
				
				psmt.close();
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		public void deleteArticle() {}
}
