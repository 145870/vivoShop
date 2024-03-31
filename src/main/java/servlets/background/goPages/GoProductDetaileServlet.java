package servlets.background.goPages;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProductSpecificationDAO;
import DAO.ProductSpecificationDetailedDAO;
import entity.ProductSpecification;
import entity.ProductSpecificationDetailed;

@WebServlet("/background/gopages/goProductDetaile")
public class GoProductDetaileServlet extends HttpServlet{
	ProductSpecificationDAO psdao=new ProductSpecificationDAO();
	ProductSpecificationDetailedDAO psddao=new ProductSpecificationDetailedDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id=req.getParameter("id");
		
		//查询商品规格名称有哪些
		List<ProductSpecification> pslist = psdao.getProductSpecificationById("1");
		//存储对应值
		Map<String,List<ProductSpecificationDetailed>> map = new HashMap<String, List<ProductSpecificationDetailed>>();
		
		System.out.println(pslist);
		for(ProductSpecification ps:pslist) {
			List<ProductSpecificationDetailed> psdList = psddao.getProductSpecificationDetailedBySpecifications_id(ps.getId()+"");
			map.put(ps.getId().toString(), psdList);
		}
		System.out.println(map);
		
		req.setAttribute("pslist", pslist);
		req.setAttribute("psvalues", map);
		req.getRequestDispatcher("/background/pages/function/product_information/product_detailed.jsp").forward(req, resp);
	}
}
