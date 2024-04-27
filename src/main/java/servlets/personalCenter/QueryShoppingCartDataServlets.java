package servlets.personalCenter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.shopping_cartDAO;
import entity.UserProfile;
@WebServlet("/PersonalCenter/JSP/QueryShoppingCartDataServlets")
public class QueryShoppingCartDataServlets extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		shopping_cartDAO sh = new shopping_cartDAO();
		UserProfile user = (UserProfile) req.getSession().getAttribute("user_profile");
		//int userID=(Integer.valueOf(user.getId()+""));
		req.setAttribute("carData",sh.quershopping_carts_data(1));
		req.getRequestDispatcher("shopping_cart.jsp").forward(req, resp);
	}}
