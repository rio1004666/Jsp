package service.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import model.CommonService;
import vo.UserVo;

public class ListService implements CommonService{
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		List<UserVo> users = UserDao.getInstance().selectUsers();
		// request객체를 공유한다 컨트롤러도 모델도 뷰도 왔다리갔다리한다 
		// 컴포넌트간의 데이터 공유 (view에서 해당 리스트를 참조해서 출력해야 하기 때문에)
		req.setAttribute("users", users);
		return "/user/list.jsp";
	}
}