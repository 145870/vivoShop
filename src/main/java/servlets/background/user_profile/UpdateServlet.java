package servlets.background.user_profile;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserProfileDAO;

@WebServlet("/background/pages/function/user_profile/update")
public class UpdateServlet extends HttpServlet{
	UserProfileDAO dao = new UserProfileDAO();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8"); 
		resp.setCharacterEncoding("UTF-8");
		String id = req.getParameter("id");
		String account = req.getParameter("account");
		String pwd = req.getParameter("pwd");
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String mailbox = req.getParameter("mailbox");
		String sex = req.getParameter("sex");
		String birthday = req.getParameter("birthday");
		String address = req.getParameter("address");
		
		//返回结果
		String sqlJg = dao.doUpdateById(id,account,pwd,name,phone,mailbox,sex,birthday,address);
		resp.getWriter().print(sqlJg);
	}
}
