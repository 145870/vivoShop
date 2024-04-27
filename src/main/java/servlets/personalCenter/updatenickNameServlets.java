package servlets.personalCenter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserProfileDAO;
@WebServlet("/PersonalCenter/JSP/updatenickNameServlets")
public class updatenickNameServlets extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		String newname = req.getParameter("newNickName");
		long id = 1;//测试id
		UserProfileDAO user = new UserProfileDAO();
		int key = user.updateNickname(newname, id);
		if(key>0) {
			System.out.println("修改成功");
			resp.getWriter().write(newname);
		}else {
			System.out.println("修改失败");
			resp.getWriter().write("false");
		}
	}
}
