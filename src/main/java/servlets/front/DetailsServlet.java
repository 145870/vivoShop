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

import com.google.gson.Gson;

import DAO.ProductSpecificationDAO;
import DAO.Product_attr_valsDAO;
import DAO.ProductsClassDAO;
import DAO.Products_informationDAO;
import entity.ProductSpecification;
import entity.Product_attr_vals;
import entity.ProductsClass;
import entity.Products_information;

@WebServlet(urlPatterns = "/front/jsp/DetailsServlet")
public class DetailsServlet extends HttpServlet {
	ProductsClassDAO classDAO = new ProductsClassDAO();
	ProductSpecificationDAO psdao = new ProductSpecificationDAO();
	Products_informationDAO ifDao = new Products_informationDAO();
	Product_attr_valsDAO valsDAO = new Product_attr_valsDAO();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
//		String id=request.getParameter("id");
		// 获取商品的id
		int id = Integer.parseInt(request.getParameter("id"));
		// 查询商品规格内容
		List<ProductSpecification> pslist = (List<ProductSpecification>) psdao.getProductSpecificationById(id).get("list");
		
		// 存储对应值
		List<String[]> valList = new ArrayList<String[]>();

		for (ProductSpecification p : pslist) {
			valList.add(p.getSpecificationsValues());
		}

		//存储第一个规格获取最后的组合id
		List<String> list = new ArrayList<String>();
		for(String[] varName:valList) {
			list.add(varName[0]);
		}
		Gson gson = new Gson();
	    String jsonArray = gson.toJson(list);
		
		List<Product_attr_vals> pavlist = valsDAO.getProductsvals(id, list.size(), jsonArray);
		String pavID=pavlist.get(0).getId()+"";
		String pavPrice=pavlist.get(0).getSale_amount()+"";
		request.setAttribute("pavID", pavID);
		request.setAttribute("pricelow", pavPrice);
		
		HttpSession session = request.getSession();
		session.setAttribute("productid", id);
		session.setAttribute("psList", pslist);
		session.setAttribute("valList", valList);

		// 查询商品规格内容图片
		List<Products_information> pslistt = ifDao.queryInforurlone(id);
		request.setAttribute("pslistt", pslistt);

		String guige = "";
		for (int i = 0; i < list.size(); i++) {
		    guige += list.get(i);
		    // 检查是否是最后一个元素
		    if (i < list.size() - 1) {
		        guige += ",";
		    }
		}
		request.setAttribute("guilow", guige);
		// 查找图片信息缩略图
		List<Products_information> listurl = ifDao.queryInforurl(id);
		// 查找图片信息介绍图
		List<Products_information> listurlin = ifDao.queryInforurlin(id);

		//查询商品名称
		String pname = ifDao.getPnameById(id+"");
		
		request.setAttribute("pname", pname);

		// 查询类别
		List<ProductsClass> leilist = classDAO.getProductsClasses();
		request.setAttribute("leilist", leilist);

		request.setAttribute("listurlin", listurlin);
		request.setAttribute("listurl", listurl);
		request.setAttribute("id", id);
		

		request.getRequestDispatcher("xiangqing.jsp").forward(request, response);
		
		
		//获取当前商品链接，然后新增足迹
		
	}
}
