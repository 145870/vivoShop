package servlets.background.goPages;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProductsClassDAO;

@WebServlet("/background/gopages/goProduct_information")
public class GoProductInformationServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductsClassDAO dao = new ProductsClassDAO();
		req.setAttribute("product_type", dao.getProductsClasses());
		
		req.getRequestDispatcher("/background/pages/product_information.jsp").forward(req, resp);
	}
}
