package servlets.front;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProductsClassDAO;
import DAO.Products_images_urlDAO;
import DAO.Products_informationDAO;
import entity.ProductsClass;

@WebServlet(urlPatterns = "/front/jsp/SelectServlet")
public class SelectServlet extends HttpServlet {
	ProductsClassDAO classDAO = new ProductsClassDAO();
	Products_informationDAO infdao = new Products_informationDAO();
	Products_images_urlDAO urldao = new Products_images_urlDAO();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 查询类别
		List<ProductsClass> leilist = classDAO.getProductsClasses();
		request.setAttribute("leilist", leilist);
		request.getRequestDispatcher("selectjsp.jsp").forward(request, response);
	}
}
