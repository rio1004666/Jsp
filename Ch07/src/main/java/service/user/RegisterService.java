package service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import model.CommonService;
import vo.UserVo;

public class RegisterService implements CommonService{
			@Override
			public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
				//컨트롤러가 req를 통해 데이터를 주고받는다 
				if (req.getMethod().equals("GET")) { //페이지주세요는 GET방식 (주소에서 요청)
					return "/user/register.jsp";
				}else { // FORM으로 데이터를 보내서 처리해주세요 하면 POST전송이다 
					
					String uid = req.getParameter("uid");
					String name = req.getParameter("name"); 
					String hp = req.getParameter("hp"); 
					String age = req.getParameter("age"); 
					
					UserVo vo = new UserVo();
					vo.setUid(uid);
					vo.setName(name);
					vo.setHp(hp);
					vo.setAge(age);
					// Database  처리 로직
					UserDao.getInstance().insertUser(vo);
					
					///////
					
					return "redirect:/user/list.do"; // 컨트롤러가 받아서 리다이렉트를 수행하도록 값을 반환한다 => 문자열정보이다!!! 
				}
				
			}
}
