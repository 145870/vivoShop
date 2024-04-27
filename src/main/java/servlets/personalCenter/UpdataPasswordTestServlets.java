package servlets.personalCenter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserProfileDAO;
import entity.UserProfile;
@WebServlet("/PersonalCenter/JSP/UpdataPasswordTestServlets")
public class UpdataPasswordTestServlets extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String oldPwd = req.getParameter("oldpwd");
		String newPwd = req.getParameter("newpwd");
		UserProfileDAO us = new UserProfileDAO();
		
		UserProfile user = (UserProfile) req.getSession().getAttribute("user_profile");
		String id = user==null?"1":user.getId()+"";
	    boolean key = us.isOldPassword(id, oldPwd);
	    if(key) {
	    	System.out.println("有数据");
	    	int pwdkey =  us.updatePwd(newPwd, id);
	    	if(pwdkey>0) {
	    		System.out.println("修改成功");
	    		resp.getWriter().write("true");
	    	}else {
	    		System.out.println("修改失败");
	    	}
	    }else {
	    	System.out.println("没有数据");
	    	resp.getWriter().write("false");
	    }
	}
}
