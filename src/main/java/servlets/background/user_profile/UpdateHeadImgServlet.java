package servlets.background.user_profile;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserProfileDAO;
import entity.Admin;

@WebServlet("/background/pages/function/user_profile/updateHeadImg")
public class UpdateHeadImgServlet extends HttpServlet{
	UserProfileDAO dao = new UserProfileDAO();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8"); 
		resp.setCharacterEncoding("UTF-8");
		String id = req.getParameter("id");
		
		//返回结果
		Admin admin = (Admin) req.getSession().getAttribute("admin");
		String adminType = "4";
		if (admin != null) {
			adminType = admin.getAdminTypeId() + "";
		}
		String jg = "";
		if (adminType.equals("7") || adminType.equals("1")) {
			jg = dao.doUpdateByIdAndUrl(id,"/images/user/head_image/default.jpg");
		} else {
			jg = "权限不足!";
		}
		resp.getWriter().print(jg);
	}
}
