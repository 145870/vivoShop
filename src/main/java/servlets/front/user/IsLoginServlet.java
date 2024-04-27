package servlets.front.user;

import java.io.IOException;
import java.nio.file.attribute.UserPrincipal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/front/user/isLogin")
public class IsLoginServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		UserPrincipal user = (UserPrincipal) session.getAttribute("user_profile");
		//判断是否登录
		if (user==null) {
			resp.getWriter().print("false");
		}else {
			resp.getWriter().print("true");
		}
	}
}
