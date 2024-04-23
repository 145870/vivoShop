package servlets.front;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ProductsClassDAO;
import DAO.Products_images_urlDAO;
import DAO.Products_informationDAO;
import entity.ProductsClass;

@WebServlet(urlPatterns = "/front/jsp/TouWeiServlet")
public class TouWeiServlet extends HttpServlet {
	ProductsClassDAO classDAO = new ProductsClassDAO();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 查询类别
		List<ProductsClass> leilist = classDAO.getProductsClasses();

		// 存储所有商品图片
		List<List<ProductsClass>> productsLists = new ArrayList<List<ProductsClass>>();
		for (ProductsClass pc : leilist) {
			Long pcId = pc.getId();
			productsLists.add(classDAO.queryclassById(pcId));
		}
		HttpSession session = request.getSession();

		session.setAttribute("leilist", leilist);
		session.setAttribute("productsLists", productsLists);

		request.getRequestDispatcher("touwei.jsp").forward(request, response);
	}
}
