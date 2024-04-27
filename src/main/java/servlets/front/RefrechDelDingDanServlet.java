package servlets.front;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import DAO.User_address_informationDAO;

@WebServlet(urlPatterns = "/front/jsp/RefrechDelDingDanServlet")
public class RefrechDelDingDanServlet extends HttpServlet {
	User_address_informationDAO adddao=new User_address_informationDAO();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int addid=Integer.parseInt(request.getParameter("id"));
		int re=adddao.delete(addid);
		
		String array=new Gson().toJson(re);
		response.setContentType("test/html;charset=utf-8");
		
		response.getWriter().write(array);
	}
}
