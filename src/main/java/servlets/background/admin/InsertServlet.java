package servlets.background.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AdminDAO;
import entity.Admin;

@WebServlet("/background/pages/function/admin/add")
public class InsertServlet extends HttpServlet{
	AdminDAO dao = new AdminDAO();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
   	    resp.setCharacterEncoding("UTF-8");
   	    
   	    String account = req.getParameter("account");
   	    String pwd = req.getParameter("pwd");
   	    String nickname = req.getParameter("nickname");
	   	String phone = req.getParameter("phone");
	   	String name = req.getParameter("name");
	   	String type = req.getParameter("type");
	   	String sex = req.getParameter("sex");
	   	
	   	Admin admin = (Admin) req.getSession().getAttribute("admin");
		String adminType = "4";
	    if (admin != null) {
			adminType=admin.getAdminTypeId()+"";
		}
	    String jg = "";
	    if (adminType.equals("5")||adminType.equals("1")) {
	    	jg=dao.doInsert(account,pwd,nickname,phone,name,type,sex);
		}else {
			jg="权限不足!";
		}
	   	
	   	resp.getWriter().print(jg);
	}
}
