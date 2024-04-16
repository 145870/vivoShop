package servlets.background.goPages;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProductsInformationDAO;

@WebServlet("/background/gopages/goAddInventoryDetails")
public class GoAddInventoryDetailsServlet extends HttpServlet{
	ProductsInformationDAO pdao = new ProductsInformationDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("UTF-8");
		
		req.setAttribute("pList", pdao.getProductsInformation());
		
		
		req.getRequestDispatcher("/background/pages/inventory/function/addInventoryDetails.jsp").forward(req, resp);
	}
}
