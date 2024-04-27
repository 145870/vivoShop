package servlets.front;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
		// 存储所有商品图片
		List<List<ProductsClass>> productsLists = new ArrayList<List<ProductsClass>>();
		for (ProductsClass pc : leilist) {
			Long pcId = pc.getId();
			productsLists.add(classDAO.queryclassById(pcId));
		}
		HttpSession session = request.getSession();
		session.setAttribute("productsLists", productsLists);

		// 获得请求参数
		int curpage = 1;
		int pagesize = 2;
		//获取当前页码
		String curpageStr = request.getParameter("curpage");
		if (curpageStr !=null && !curpageStr.isEmpty()) {
			curpage=Integer.parseInt(curpageStr);
		}
		System.out.println(curpage);
		String keyword=request.getParameter("keyword");
		request.setAttribute("keyword", keyword);
		System.out.println("keyword"+keyword);
		
		// 调用dao
		Map<String, Object> map = infdao.queryByPage(keyword,curpage, pagesize);
		List<Products_information> list=(List<Products_information>)map.get("list");
		
		//查询智能硬件
		Map<String, Object> mapz=infdao.queryByPageZhiNeng(keyword, curpage, pagesize);
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("list", list);

		request.setAttribute("total",map.get("total"));

		System.out.println("total"+map.get("total"));
		request.getRequestDispatcher("selectjsp.jsp").forward(request, response);
	}
}
