package service.member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.CommonService;
import vo.MemberVo;

public class ListService implements CommonService{
	
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		List<MemberVo> users = new ArrayList<>();
		users = MemberDao.getInstance().selectMembers();
		req.setAttribute("users", users);	
		return "/member/list.jsp";
	}
	
	 
}
