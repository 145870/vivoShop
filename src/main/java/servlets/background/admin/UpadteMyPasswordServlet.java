package servlets.background.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import DAO.AdminDAO;
import entity.Admin;

@WebServlet("/background/pages/function/admin/updateMyPassword")
public class UpadteMyPasswordServlet extends HttpServlet{
	AdminDAO dao = new AdminDAO();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
   	    resp.setCharacterEncoding("UTF-8");
   	    
   	    String userID = ((Admin)req.getSession().getAttribute("admin")).getId()+"";
   	    String oldPwd = req.getParameter("oldpwd");
   	    String newPwd = req.getParameter("newpwd");
   	    
   	    String jg = dao.updatePasswordByOldPwdAndId(userID,oldPwd,newPwd);
   	    
        PrintWriter out = resp.getWriter();
        out.print(jg);

	}
	
	
}
