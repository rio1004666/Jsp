package service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import model.CommonService;
import vo.UserVo;

public class ModifyService implements CommonService{
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
			UserVo vo = null;
			String uid = req.getParameter("uid");
			String name = req.getParameter("name");
			String hp = req.getParameter("hp");
			String age = req.getParameter("age");
			
			if(req.getMethod().equals("GET")) { // 그냥 페이지 주소 그대로 쳐서 들어오는 경우 get방식으로 들어온다 리케스트의 방식이 get방식이다 
				
				UserVo user = UserDao.getInstance().selectUser(uid);
				req.setAttribute("user", user);
				return "/user/modify.jsp";
				
			}
			else { // form으로 요청이 들어왔을경우 .do 주소가.... 포스트방식이므로 수정하는 쿼리문을 날려야한다 
				
				vo = new UserVo();
				vo.setUid(uid);
				vo.setName(name);
				vo.setHp(hp);
				vo.setAge(age);
				
				UserDao.getInstance().updateUser(vo);
				
				return "redirect:/user/list.do";
			}
	}
}
