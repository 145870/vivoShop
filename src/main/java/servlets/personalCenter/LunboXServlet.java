package servlets.personalCenter;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProductsClassDAO;
import DAO.Products_informationDAO;
import entity.ProductsClass;
import entity.Products_information;

@WebServlet(urlPatterns = "/front/jsp/LunboXServlet")
public class LunboXServlet extends HttpServlet {
	ProductsClassDAO classDAO = new ProductsClassDAO();
	Products_informationDAO ifdao=new Products_informationDAO();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 查询类别
		List<ProductsClass> leilist = classDAO.getProductsClasses();

		// 获取a标签的id
		int id = Integer.parseInt(request.getParameter("cid"));
		List<Products_information> urllist=ifdao.queryInforId(id);
		request.setAttribute("urllist", urllist);
		//查找图片信息缩略图
		List<Products_information> listurl=ifdao.queryInforurl(id);
		request.setAttribute("listurl", listurl);
		
		request.setAttribute("leilist", leilist);
		request.getRequestDispatcher("Xxilie.jsp").forward(request, response);
	}

}
