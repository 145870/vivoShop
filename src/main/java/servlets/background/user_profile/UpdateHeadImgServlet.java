package servlets.background.user_profile;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserProfileDAO;

@WebServlet("/background/pages/function/user_profile/updateHeadImg")
public class UpdateHeadImgServlet extends HttpServlet{
	UserProfileDAO dao = new UserProfileDAO();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8"); 
		resp.setCharacterEncoding("UTF-8");
		String id = req.getParameter("id");
		
		//返回结果
		String sqlJg = dao.doUpdateByIdAndUrl(id,"/images/user/head_image/default.jpg");
		resp.getWriter().print(sqlJg);
	}
}
