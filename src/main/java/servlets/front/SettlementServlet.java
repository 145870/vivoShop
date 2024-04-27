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

import com.alibaba.fastjson2.JSONObject;

import DAO.OrdersDAO;
import DAO.ProductsClassDAO;
import DAO.Products_informationDAO;
import entity.ProductsClass;

@WebServlet(urlPatterns = "/front/jsp/SettlementServlet")
public class SettlementServlet extends HttpServlet {
	ProductsClassDAO classDAO = new ProductsClassDAO();
	Products_informationDAO infdao = new Products_informationDAO();
	
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
		session.setAttribute("productsLists", productsLists);
		session.setAttribute("leilist", leilist);
		request.getRequestDispatcher("jiesuan.jsp").forward(request, response);
	}
}
