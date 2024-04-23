package servlets.statics;

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
import entity.Products_information;


//用于获取导航栏图片及信息
@WebServlet("/static/setNavSession")
public class SetStaticNavSessionServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ProductsClassDAO classDAO = new ProductsClassDAO();
	Products_informationDAO infdao = new Products_informationDAO();
	Products_images_urlDAO urldao = new Products_images_urlDAO();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		// 查询类别
		List<ProductsClass> leilist = classDAO.getProductsClasses();

		// 存储所有商品图片
		List<List<ProductsClass>> productsLists = new ArrayList<List<ProductsClass>>();
		for (ProductsClass pc : leilist) {
			Long pcId = pc.getId();
			productsLists.add(classDAO.queryclassById(pcId));
		}

		// 查询新品两个
		List<Products_information> xinlist = infdao.queryInforPriceTwo();
		req.setAttribute("xinlist", xinlist);
		// 查询智能配件
		List<Products_information> peilist = infdao.queryInforPricePei();

		HttpSession session = req.getSession();
		req.setAttribute("peilist", peilist);

		session.setAttribute("leilist", leilist);
		session.setAttribute("productsLists", productsLists);
	}
}
