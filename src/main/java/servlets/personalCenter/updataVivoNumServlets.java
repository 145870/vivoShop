package servlets.personalCenter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserProfileDAO;
import entity.UserProfile;

@WebServlet("/PersonalCenter/JSP/updataVivoNumServlets")
public class updataVivoNumServlets extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		UserProfile	 user = (entity.UserProfile) req.getSession().getAttribute("user_profile");
		String uid="1";
		if (user==null) {
			uid="1";
		}else {
			uid=user.getId()+"";
		}
		
		String vivoNum = req.getParameter("vivonum");
		UserProfileDAO usdao = new UserProfileDAO();
		int key = usdao.updatavivonum(uid,vivoNum);

		if(key!=0) {
			System.out.println("修改成功！");
		}else {
			System.out.println("修改失败！");
		}
	}
}
