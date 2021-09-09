package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.CommonService;
import vo.MemberVo;

public class RegisterService implements CommonService{
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		if(req.getMethod().equals("GET")) {
			return "/member/register.jsp";
		}else {
			MemberVo mv = new MemberVo();
			String uid = req.getParameter("uid");
			String name = req.getParameter("name");
			String hp = req.getParameter("hp");
			String pos = req.getParameter("pos");
			String dep = req.getParameter("dep");
			
			mv.setUid(uid);
			mv.setName(name);
			mv.setHp(hp);
			mv.setPos(pos);
			mv.setDep(dep);
			
			MemberDao.getInstance().insertMember(mv);
			return "redirect:/member/list.do";
		}
	}
}
