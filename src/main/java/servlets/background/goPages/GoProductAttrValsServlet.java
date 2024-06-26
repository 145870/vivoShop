package servlets.background.goPages;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import DAO.ProductSpecificationDAO;
import entity.ProductSpecification;

@WebServlet("/background/gopages/goProductAttrVals")
public class GoProductAttrValsServlet extends HttpServlet{
	ProductSpecificationDAO psdao=new ProductSpecificationDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id=req.getParameter("id");
		
		//查询商品规格内容
		List<ProductSpecification> pslist = (List<ProductSpecification>) psdao.getProductSpecificationById(id).get("list");
		//存储对应值
		List<String[]> valList = new ArrayList<String[]>();
		
		for(ProductSpecification p:pslist) {
			valList.add(p.getSpecificationsValues());
		}
		HttpSession session = req.getSession();
		session.setAttribute("productid",id);
		session.setAttribute("psList", pslist);
		session.setAttribute("valList", valList);
		
		List<Map<String, Object>> columns = new ArrayList();
		
		// 添加静态部分1
		Map<String, Object> staticColumn1 = new HashMap<>();
		staticColumn1.put("type", "checkbox");
		staticColumn1.put("fixed", "left");
		columns.add(staticColumn1);
		
		// 添加静态部分2
		Map<String, Object> staticColumn2 = new HashMap<>();
		staticColumn2.put("field", "id");
		staticColumn2.put("hide", true);
		columns.add(staticColumn2);
		
		//动态表头
		int index = 0;
		for (ProductSpecification ps : pslist) {
		    Map<String, Object> dynamicColumn = new HashMap<>();
		    dynamicColumn.put("field", "spec_"+index);
		    dynamicColumn.put("title", ps.getSpecificationsName());
		    dynamicColumn.put("minWidth", 100);
		    columns.add(dynamicColumn);
		    index++;
		}
		
		Map<String, Object> staticColumn3 = new HashMap<>();
		staticColumn3.put("field", "price");
		staticColumn3.put("title", "售价");
		staticColumn3.put("width", 100);
		staticColumn3.put("sort", true);
		columns.add(staticColumn3);
		
		Map<String, Object> staticColumn4 = new HashMap<>();
		staticColumn4.put("fixed", "right");
		staticColumn4.put("title", "操作");
		staticColumn4.put("width", 134);
		staticColumn4.put("toolbar", "#product-attrVals-table-operate");
		columns.add(staticColumn4);
		
		// 将结果转换为JSON格式
		String jsonColumns = new Gson().toJson(columns);
		req.setAttribute("tableHead", jsonColumns);
		
		req.getRequestDispatcher("/background/pages/product/product_attr_vals.jsp").forward(req, resp);
	}
}
