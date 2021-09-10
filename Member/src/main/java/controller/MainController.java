package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommonService;


public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> instances = new HashMap<>();

	@Override
	public void init(ServletConfig config) throws ServletException {
		// 최초 요청시 실행되는 컨트롤러 초기화 메서드
		System.out.println("MainController init 실행!!!");
		
		// 액션주소 프로퍼티 파일 경로 구하기
		ServletContext ctx = config.getServletContext();
		String path = ctx.getRealPath("/WEB-INF") + "/urlMapping.properties";
		
		// 프로퍼티 파일 입력스트림 연결 후 프로퍼티 객체 생성
		Properties prop = new Properties();
		
		try {
			FileInputStream fis = new FileInputStream(path);
			prop.load(fis);
			fis.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		// 프로퍼티 객체로 서비스 객체 생성
		Iterator iter = prop.keySet().iterator();
		
		while(iter.hasNext()) {
			
			String k = iter.next().toString();
			String v = prop.getProperty(k);
			
			try {
				
				Class obj = Class.forName(v);
				Object instance = obj.newInstance();
				
				instances.put(k, instance);
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	} // init end...
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestProc(req, resp);
	}
	
	protected void requestProc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 요청주소에서 key 구하기
		String path = req.getContextPath();
		String uri  = req.getRequestURI();
		String key = uri.substring(path.length());
		
		// Map에서 Service 객체 꺼내기
		CommonService instance = (CommonService) instances.get(key);
		
		// Service 객체 실행 후 결과 정보 받기
		String result = instance.requestProc(req, resp);
		
		if(result.startsWith("redirect:")) {
			// 리다이렉트
			String redirecUrl = result.substring(9);
			resp.sendRedirect(path+redirecUrl);
		}else {			
			// 해당 View로 forward 하기
			RequestDispatcher dispatcher = req.getRequestDispatcher(result);
			dispatcher.forward(req, resp); // forward 안에 request를 전달한다 
		}
	}
	
}

