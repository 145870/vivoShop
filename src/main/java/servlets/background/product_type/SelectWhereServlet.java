package servlets.background.product_type;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

import DAO.ProductsClassDAO;
import entity.ProductsClass;
import entity.ProductsInformation;

@WebServlet("/background/pages/function/product_type/selectWhere")
public class SelectWhereServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductsClassDAO dao = new ProductsClassDAO();
		resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
        
		String name = req.getParameter("name");
		if (name==null) {
			name="";
		}
		 //获取分页属性
        String page = req.getParameter("page");
        String limit = req.getParameter("limit");
        
		Map<String, Object> map = dao.getProductsClassesByName(name,page,limit);

		List<ProductsClass> list = (List<ProductsClass>) map.get("list");
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.enable(SerializationFeature.INDENT_OUTPUT);

		Map<String, Object> jsonData = new HashMap();
		jsonData.put("code", 0);
		jsonData.put("msg", "");
		jsonData.put("count", map.get("count"));

		List<Map<String, Object>> dataList = new ArrayList();
		for (ProductsClass pc : list) {
		    Map<String, Object> dataMap = new HashMap<>();
		    dataMap.put("id", pc.getId());
		    dataMap.put("type_name", pc.getClassName());
		    dataList.add(dataMap);
		}

		jsonData.put("data", dataList);

		String jsonOutput = objectMapper.writeValueAsString(jsonData);
		
        // 将JSON字符串作为响应发送回客户端
        PrintWriter out = resp.getWriter();
        out.print(jsonOutput);
	}
}
