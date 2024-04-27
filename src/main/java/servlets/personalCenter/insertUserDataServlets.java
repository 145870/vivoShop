package servlets.personalCenter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserProfileDAO;

@WebServlet("/PersonalCenter/JSP/insertUserDataServlets")
public class insertUserDataServlets extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserProfileDAO userdao = new UserProfileDAO();
		String phone = req.getParameter("phone");
		String pwd = req.getParameter("password");
		String url = "/images/user/head_image/default.jpg";
		int results =  userdao.insertUserData(phone,pwd,url);
		if (results>0){
			System.out.println("新增成功！");
			resp.getWriter().write("true");
		}else {
			System.out.println("新增失败！");
		}
	}
}
