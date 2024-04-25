package servlets.background.user_profile;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserProfileDAO;

@WebServlet("/background/pages/function/user_profile/add")
public class Insertservlet extends HttpServlet{
	UserProfileDAO dao = new UserProfileDAO();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8"); 
		resp.setCharacterEncoding("UTF-8");
		String account = req.getParameter("account");
		String pwd = req.getParameter("pwd");
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String mailbox = req.getParameter("mailbox");
		String sex = req.getParameter("sex");
		String birthday = req.getParameter("birthday");
		
		//返回结果
		String sqlJg = dao.doInsertByCount(account,pwd,name,phone,mailbox,sex,birthday);
		resp.getWriter().print(sqlJg);
	}
}
