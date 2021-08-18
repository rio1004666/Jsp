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

//DAO(DATA Access Object) Ŭ���� 

public class ArticleDao { // �̱��� �������� ���� 
	// �̱��� ��ü 
	private static ArticleDao instance = new ArticleDao();
		public static ArticleDao getInstance() {
			return instance;
		}
		private ArticleDao() {}
		
		public int selectCountTotal() {
			int total = 0;
			try {
					//1,2�ܰ�
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
				ArticleBean ab = null;// ����� ������ ���ÿ� �ص������� 
				FileBean fb = null;
				try{
					//1,2�ܰ�
					Connection conn = DBConfig.getInstance().getConnection();
					//3�ܰ�
					PreparedStatement psmt =conn.prepareStatement(Sql.SELECT_ARTICLE);
					psmt.setString(1, seq); // �ظ��ϸ� ���ڿ��� ó��
					//4�ܰ�
					ResultSet rs = psmt.executeQuery();
					//5�ܰ�
					if(rs.next()) { // ������������ ����� �������� ��ü�� ��´� 
						// ��ü������ ������� ������쿡�� ���� 
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
						fb = new FileBean(); // ���� ��ü�� �������ش� 
						fb.setFseq(rs.getInt(12));
						fb.setParent(rs.getInt(13));
						fb.setOriName(rs.getString(14));
						fb.setNewName(rs.getString(15));
						fb.setDownload(rs.getInt(16));
						fb.setRdate(rs.getString(17));
						ab.setFb(fb); // �������� ���Ϻ��� �����Ѱ��� �ٽ� ArticleBean���ٰ� �־��ش� 
					}
					//6�ܰ�
					rs.close();
					psmt.close();
					conn.close();
					}catch(Exception e){
						e.printStackTrace();
					}
					return ab; // ��ȯ���־���Ѵ� �Լ����� ����� ���󰡹Ƿ� 
		}
		
		public List<ArticleBean> selectArticles(int start) {
		
			
			List<ArticleBean> articles = new ArrayList<>();
			try{
				//1�ܰ�
				Connection conn = DBConfig.getInstance().getConnection();
				//2�ܰ�
				PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLES);
				psmt.setInt(1, start);
				//3�ܰ�
				ResultSet rs = psmt.executeQuery();
				//4�ܰ�
				//5�ܰ�
				while(rs.next()){ // ������ ����ȭ���Ѿ� �Ѵ� 9��¥�� �ʵ� 
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
					ab.setNick(rs.getString(12)); // Nickname�� ���̵��� �������̹Ƿ� �����ؼ� �����´� ��? article���̺��� ���� �г����� member���̺�� �����ؼ� �ʿ��� ������ �����´� 
					articles.add(ab);
				}
				//6�ܰ�
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
				//1�ܰ�
				Connection conn = DBConfig.getInstance().getConnection();
				//2�ܰ�
				PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COMMENTS);
				psmt.setString(1, seq);
				//3�ܰ�
				ResultSet rs = psmt.executeQuery();
				//4�ܰ�
				//5�ܰ�
				while(rs.next()){ // ������ ����ȭ���Ѿ� �Ѵ� 9��¥�� �ʵ� 
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
					ab.setNick(rs.getString(12)); // Nickname�� ���̵��� �������̹Ƿ� �����ؼ� �����´� ��? article���̺��� ���� �г����� member���̺�� �����ؼ� �ʿ��� ������ �����´� 
					comments.add(ab);
				}
				//6�ܰ�
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
		public void insertComment(ArticleBean ab) { // �Ű������� 2���̻󼱾ȵǴ°� ���� �ʴ� 
			
			try
			{

				//1,2�ܰ�
				Connection conn = DBConfig.getInstance().getConnection();
				//3�ܰ�
				PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_COMMENT);
				psmt.setInt(1, ab.getParent());
				psmt.setString(2, ab.getContent());
				psmt.setString(3, ab.getUid());
				psmt.setString(4, ab.getRegip());
			
				//4�ܰ�
				psmt.executeUpdate();
				//5�ܰ�
				//6�ܰ�
				psmt.close();
				conn.close();
			}catch(Exception e) {
				
			}
			
		}
		public void updateArticle() {}
		public void updateArticleHit(String seq) {
			//��ȸ�� ������Ʈ 
			try{
			// 1,2�ܰ�
				Connection conn = DBConfig.getInstance().getConnection();
			// 3�ܰ�
			PreparedStatement psmt	 = conn.prepareStatement(Sql.UPDATE_ARTICLE_HIT);
			psmt.setString(1,seq);
			// 4�ܰ�
			psmt.executeUpdate();
			// 5�ܰ�
			psmt.close();
			conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			
			
		}
		// ����� ������ ī�����ϴ� �޼��� 
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
				// ������Ʈ�̱⶧���� 5�ܰ�� �ʿ䰡����
				psmt.executeUpdate();
				
				psmt.close();
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		public void deleteArticle() {}
}
