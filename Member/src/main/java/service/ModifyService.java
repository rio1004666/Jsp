package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import service.CommonService;
import vo.MemberVo;

public class ModifyService implements CommonService{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		String uid = req.getParameter("uid");
		String name = req.getParameter("name");
		String hp = req.getParameter("hp");
		String pos = req.getParameter("pos");
		String dep = req.getParameter("dep");
		if(req.getMethod().equals("GET")) {
			MemberVo member = new MemberVo();
			
			member = MemberDao.getInstance().selectMember(uid);
			req.setAttribute("member",member);
			return "/modify.jsp";
		}else {
			MemberVo member = new MemberVo();
			member.setUid(uid);
			member.setName(name);
			member.setHp(hp);
			member.setPos(pos);
			member.setDep(dep);
			MemberDao.getInstance().updateMember(member);
			return "redirect:/list.do";
		}
		
	}
}
