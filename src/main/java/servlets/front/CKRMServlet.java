package servlets.front;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DAO.Products_informationDAO;
import entity.Products_information;

@WebServlet(urlPatterns = "/front/jsp/CKRMServlet")
public class CKRMServlet extends HttpServlet{
	Products_informationDAO infordao=new Products_informationDAO();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Products_information> list=infordao.queryInforPrice();
		String array=new Gson().toJson(list);
		response.setContentType("test/html;charset=utf-8");
		
        response.getWriter().write(array);
	}
}
