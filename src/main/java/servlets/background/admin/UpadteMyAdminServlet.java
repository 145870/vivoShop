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

@WebServlet("/background/pages/function/admin/updateMyAdmin")
public class UpadteMyAdminServlet extends HttpServlet{
	AdminDAO dao = new AdminDAO();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
   	    resp.setCharacterEncoding("UTF-8");
   	    
   	    String userID = ((Admin)req.getSession().getAttribute("admin")).getId()+"";
   	    String account = req.getParameter("account");
   	    String nickname = req.getParameter("nickname");
   	    String phone = req.getParameter("phone");
   	    String sex = req.getParameter("sex");
   	    
	   	String jg = dao.doUpdateById(userID,account,nickname,phone,sex);


        Map<String, Object> jsonData = new HashMap();
		jsonData.put("result", jg);
		
		Map<String, Object> dataMap = new HashMap<>();
		if (jg.equals("true")) {
			Admin admin = dao.getAdminById(userID);
			HttpSession session = req.getSession();
			session.setAttribute("admin", admin);
			
			String acc = admin.getAccount();
			String nickname2 = admin.getNickname();
			String phone2 = admin.getPhone();
			String sex2 = admin.getSex() == 0?"男":"女";
			String typename = admin.getTypeName();
			
			dataMap.put("account", acc);
			dataMap.put("nickname", nickname2);
			dataMap.put("phone", phone2);
			dataMap.put("sex", sex2);
			dataMap.put("admin_type", typename);
			
		}
		jsonData.put("data", dataMap);

		String jsonOutput = new ObjectMapper().writeValueAsString(jsonData);

        // 发送响应
        resp.setContentType("application/json");
        PrintWriter out = resp.getWriter();
        out.print(jsonOutput);

	}
	
	
}
