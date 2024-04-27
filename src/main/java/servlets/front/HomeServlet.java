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
import entity.Products_images_url;
import entity.Products_information;

@WebServlet(urlPatterns = "/front/jsp/HomeServlet")
public class HomeServlet extends HttpServlet {
	ProductsClassDAO classDAO = new ProductsClassDAO();
	Products_informationDAO infdao = new Products_informationDAO();
	Products_images_urlDAO urldao = new Products_images_urlDAO();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 轮播图
		List<Products_images_url> lunlist = urldao.queryInforLun();
		request.setAttribute("lunlist", lunlist);
		request.setCharacterEncoding("utf-8");
		// 查询类别
		List<ProductsClass> leilist = classDAO.getProductsClasses();
		// 查询新品
		List<Products_information> xinlist = infdao.queryInforPriceTwo();
		request.setAttribute("xinlist", xinlist);
		// 查询智能配件
		List<Products_information> peilist = infdao.queryInforPricePei();

		// 存储所有商品图片
		List<List<ProductsClass>> productsLists = new ArrayList<List<ProductsClass>>();
		for (ProductsClass pc : leilist) {
			Long pcId = pc.getId();
			productsLists.add(classDAO.queryclassById(pcId));
		}
		//创建一个uid
		int uid=1;
		HttpSession session = request.getSession();
		request.setAttribute("peilist", peilist);
		session.setAttribute("productsLists", productsLists);
		session.setAttribute("uid", uid);
		session.setAttribute("leilist", leilist);
		request.getRequestDispatcher("home.jsp").forward(request, response);
	}
}
