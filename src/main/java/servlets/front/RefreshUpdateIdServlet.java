package servlets.front;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.User_address_informationDAO;

@WebServlet(urlPatterns = "/front/jsp/RefreshUpdateIdServlet")
public class RefreshUpdateIdServlet extends HttpServlet{

	User_address_informationDAO adddao=new User_address_informationDAO();
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int addid=Integer.parseInt(request.getParameter("id"));
		adddao.updateaddId(addid);
	}
}
