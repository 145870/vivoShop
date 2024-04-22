package servlets.background.inventory_details;

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

import DAO.InventoryDetailsDAO;
import DAO.ProductAttrValueDAO;
import entity.InventoryDetails;
import entity.ProductAttrValue;

@WebServlet("/background/pages/function/inventory_details/selWhere")
public class SelectWhereServlet extends HttpServlet {
	InventoryDetailsDAO dao = new InventoryDetailsDAO();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("UTF-8");

		String pname = req.getParameter("name");
		if (pname==null) {
			pname="";
		}
		String cid = req.getParameter("type");

		List<String> arrs = new ArrayList<String>();

		// 获取分页属性
		String page = req.getParameter("page");
		String limit = req.getParameter("limit");

		Map<String, Object> map = dao.getInventoryDetailsAndCountByWhere(pname, cid,page,limit);
		Map<String, Object> jsonData = new HashMap();
		List<InventoryDetails> list = (List<InventoryDetails>) map.get("list");
		jsonData.put("code", 0);
		jsonData.put("msg", "");
		jsonData.put("count", map.get("count"));

		List<Map<String, Object>> dataList = new ArrayList();

		for (InventoryDetails i : list) {
			Map<String, Object> dataMap = new HashMap<>();
			dataMap.put("id", i.getId());
			dataMap.put("product_name", i.getPname());
			
			 String vals[] = i.getAttr_vals();
			 String val = "";
			 for (int x = 0; x < vals.length; x++) {
			 	val += vals[x];
			    // 如果不是最后一个值，则添加逗号分隔符
			    if (x < vals.length - 1) {
			    	val += ",";
			    }
			}
			dataMap.put("attr_vals",val);
			
			
			dataMap.put("quantity", i.getQuantity());
			dataList.add(dataMap);
		}
		jsonData.put("data", dataList);

		String jsonOutput = new ObjectMapper().writeValueAsString(jsonData);
		// 将JSON字符串作为响应发送回客户端
		PrintWriter out = resp.getWriter();
		out.print(jsonOutput);
	}
}
