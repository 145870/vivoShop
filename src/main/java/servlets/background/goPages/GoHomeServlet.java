package servlets.background.goPages;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.OrdersDetailsDAO;
import DAO.ProductsInformationDAO;
import DAO.UserProfileDAO;
import entity.UserProfile;

@WebServlet("/background/gopages/goHome")
public class GoHomeServlet extends HttpServlet{
	private UserProfileDAO udao = new UserProfileDAO();
	private ProductsInformationDAO pdao = new ProductsInformationDAO();
	private OrdersDetailsDAO oddao = new OrdersDetailsDAO();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int userCount = udao.getUserCount();
		int pCount = pdao.getProductsInformation().size();
		int sold = oddao.getSold();
		Double sales = oddao.getSales();
		
		req.setAttribute("userCount",userCount);
		req.setAttribute("productCount",pCount);
		req.setAttribute("sold",sold);
		req.setAttribute("sales",sales);
		
		req.getRequestDispatcher("/background/pages/home/home.jsp").forward(req, resp);

	}
}
