<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.jboard1.bean.MemberBean"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.db.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	// 전송 데이터 수신 
	request.setCharacterEncoding("utf-8");

	// Multipart 전송 데이터 수신 # cos 2020.4 .jar라이브러리 업로드 까지( 파일업로드와 동시에 처리 )
	// 실제로 서버 가 로드하는 디렉터르 경로는 따로 있다 
	// 경로를 리눅스에서 사용해야하므로 다르게 셋팅
	
	String path =  request.getServletContext().getRealPath("/file");
	
	int maxSize = 1024 * 1024 * 10; // 10MB
	
	// 파일 업로드는 이 한줄로 끝난다 => request객체 , 경로 , 파일최대 크기 , 인코딩방식, 파일이름을 변경하는 객체 생성 
	
	MultipartRequest mRequest = new MultipartRequest(request,path,maxSize,"utf-8",new DefaultFileRenamePolicy());
	
	//   이 라이브러리를 사용하면 파일쓰기 읽기 형식의 스트림전송방식을 써야합니다.
	//   이제 파일이름을 바꾸어야한다 
	
	String uid = mRequest.getParameter("uid");
	String title = mRequest.getParameter("title");
	String content = mRequest.getParameter("content");
	String fname = mRequest.getFilesystemName("fname"); // 첨부 파일 이름 
	String regip = request.getRemoteAddr();	
	
	 //  세션에   저장되어있다  로그인을 하였으면 
	 
	 
	int seq = 0;		
	 
	 
	 
	try{
		
		Connection conn = DBConfig.getInstance().getConnection();
		
		Statement stmt = conn.createStatement();
		
		PreparedStatement psmt = conn.prepareStatement(Sql.INSERT_ARTICLE);
		
		psmt.setString(1, title);
		psmt.setString(2, content);
		psmt.setInt(3,  (fname == null) ? 0 : 1 ); // 파일이 있는 경우 1 없는 경우 0 
		psmt.setString(4, uid);
		psmt.setString(5, regip);

		// 이제 내가 글을 쓰는순간 글번호가 정해지고 그 글번호를 파일 글번호로 직통으로 넣는다 
		
		
		//실행
		psmt.executeUpdate(); // insert하자마자 바로 select해서 글 번호를 가져옴 바로 이어서 해야 됨 트랜잭션 하나의 단위로 하는것이 좋다 
		
		ResultSet rs = stmt.executeQuery(Sql.SELECT_MAX_SEQ);
		if(rs.next()){
			 seq = rs.getInt(1);
			
		}
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	// 파일   첨부   했으면    파일 처리 작업 
	// 파일 첨부를 하지 않으면 파일테이블에 저장이 안된다 
	if( fname !=null ){
		// 파일명 수정작업
		// 파일 테이블 INSERT작업 (원래 파일이름 저장하기 위해서 => 새로운 파일이름 수정해야만 구분가능)
		int i = fname.lastIndexOf("."); // 뒤에서 .을 찾아서 인덱스를 반환 => Sample.txt에서는 6이다 
		String ext = fname.substring(i); //  확장자를 자름 인덱스 6부터 끝까지 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_"); // _뒤에는 아이디와 확장가 차례로 붙는다!!!!!
		String now = sdf.format(new Date());
		String newName = now+uid+ext; // 새로운 파일이름을 만든다 
		File oriFile = new File(path+"/"+fname);
		File newFile = new File(path+"/"+ newName); // 이 파일이름은 가상의 파일이름이고 원래 파일이름을 새로운 파일이름으로 변경해야한다
		oriFile.renameTo(newFile);
		
		// 파일 테이블 INSERT
		
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
	 response.sendRedirect("/Jboard1/list.jsp?pg=1");
%>