package servlets.background.product_attr_vals;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import DAO.ProductAttrValueDAO;
import entity.ProductAttrValue;

@WebServlet("/background/pages/function/product_attr_vals/selWhere")
public class SelectWhereServlet extends HttpServlet {
	ProductAttrValueDAO dao = new ProductAttrValueDAO();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("UTF-8");

		String id = req.getParameter("id");
		String minPrice = req.getParameter("minPrice");
		String maxPrice = req.getParameter("maxPrice");

		List<String> arrs = new ArrayList<String>();

		Enumeration<String> parameterNames = req.getParameterNames();
		while (parameterNames.hasMoreElements()) {
			String paramName = parameterNames.nextElement();
			if (paramName.startsWith("spec_")) {
				String paramValue = req.getParameter(paramName);
				// 在这里处理获取到的参数值
				arrs.add(paramValue);
			}
		}

		// 获取分页属性
		String page = req.getParameter("page");
		String limit = req.getParameter("limit");

		Map<String, Object> map = dao.getAllAndCountByProductIdAndWhere(minPrice, maxPrice, arrs, id,page,limit);
		Map<String, Object> jsonData = new HashMap();
		List<ProductAttrValue> list = (List<ProductAttrValue>) map.get("list");
		jsonData.put("code", 0);
		jsonData.put("msg", "");
		jsonData.put("count", map.get("count"));

		List<Map<String, Object>> dataList = new ArrayList();

		for (ProductAttrValue pav : list) {
			Map<String, Object> dataMap = new HashMap<>();
			dataMap.put("id", pav.getId());
			int index = 0;
			for (String val : pav.getAttrVals()) {
				dataMap.put("spec_" + index, val);
				index++;
			}
			dataMap.put("price", pav.getSaleAmount());
			dataList.add(dataMap);
		}
		jsonData.put("data", dataList);

		String jsonOutput = new ObjectMapper().writeValueAsString(jsonData);
		// 将JSON字符串作为响应发送回客户端
		PrintWriter out = resp.getWriter();
		out.print(jsonOutput);
	}
}
