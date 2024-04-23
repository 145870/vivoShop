package servlets.personalCenter;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.VerifyPhoneDAO;
import entity.UserProfile;

@WebServlet("/PersonalCenter/JSP/setUserSession")
public class SetUserSessionServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("UTF-8");
		String phone = req.getParameter("phone");
		String is = req.getParameter("is");
		VerifyPhoneDAO ver = new VerifyPhoneDAO();
		List<UserProfile> list = ver.getByPhone(phone);
		
		HttpSession session = req.getSession();
		session.setAttribute("user_profile", list.get(0));
		if (is.equals("true")) {
			session.setMaxInactiveInterval(60 * 60 * 24 * 7);
		}
		String url = session.getAttribute("goLoginUrl").toString();
		if (url==null) {
			url="/vivoShop/front/jsp/HomeServlet";
		}
		
		resp.getWriter().print(url);
	}
}
