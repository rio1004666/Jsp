package service.customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustomerDao;
import model.CommonService;
import vo.CustomerVo;

public class RegisterService implements CommonService{
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		
		
		if(req.getMethod().equals("GET")) {
			return "/customer/register.jsp";
		}else {
			CustomerVo cv = new CustomerVo();
			String name = req.getParameter("name");
			String address = req.getParameter("address");
			String phone = req.getParameter("phone");
			cv.setName(name);
			cv.setAddress(address);
			cv.setPhone(phone);
			CustomerDao.getInstance().insertCustomer(cv);
			return "/customer/list.jsp";
		}
	}
}
