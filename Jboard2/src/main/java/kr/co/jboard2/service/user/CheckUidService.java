package kr.co.jboard2.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.co.jboard2.dao.MemberDao;
import kr.co.jboard2.service.CommonService;

public class CheckUidService implements CommonService{
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		String uid = req.getParameter("uid");
		int count = MemberDao.getInstance().selectCountUid(uid);
		// json포맷
		JsonObject json = new JsonObject();
		json.addProperty("result", count); // =>>>>   {'result':1}
		// json을 출력해줘야하는데..... => 리다이렉트 기능이랑 뷰 포워드 기능이랑 json출력기능을 같이 해준다 
		return "json:"+json.toString(); // json 데이터를 문자열로 "{'result':1}"로 바뀌면서 전달한다 문자열로 전부 바꿔서 
	}
}
