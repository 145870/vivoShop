package servlets.personalCenter;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.VerifyPhoneDAO;
@WebServlet("/PersonalCenter/JSP/loginServlets")
public class loginServlets extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String phone = req.getParameter("phone");
		String pwd = req.getParameter("pwd");
		VerifyPhoneDAO ver = new VerifyPhoneDAO();
		
		if(ver.selectUserPhPw(phone, pwd).get(0)) {
			System.out.println("有数据");
			resp.getWriter().write("true");
		}else {
			System.out.println("没有数据");
			resp.getWriter().write("false");
		}
	}
}
