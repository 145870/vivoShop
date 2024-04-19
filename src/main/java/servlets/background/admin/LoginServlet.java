package servlets.background.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AdminDAO;
import entity.Admin;

@WebServlet("/background/pages/function/admin/login")
public class LoginServlet extends HttpServlet{
	AdminDAO dao = new AdminDAO();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		resp.setContentType("text/plain");
   	    resp.setCharacterEncoding("UTF-8");
   	    
		String account = req.getParameter("account");
		String pwd = req.getParameter("password");
		
		Admin admin = dao.login(account, pwd);
		
		if (admin==null) {
			resp.getWriter().print("false");
		}else {
			req.getSession().setAttribute("admin", admin);
			resp.getWriter().print("true");
		}
	}
}
