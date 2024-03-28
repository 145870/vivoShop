package servlets.background.products;

import java.io.IOException;
import java.io.PrintWriter;
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

import DAO.ProductsInformationDAO;
import entity.ProductsInformation;

@WebServlet("/background/pages/function/product_information/selAll")
public class SelectAllProductsServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 设置响应内容类型为JSON
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        
        ProductsInformationDAO dao = new ProductsInformationDAO();
		Map<String, Object> map = dao.getProductsInformation();
		
		List<ProductsInformation> list =(List<ProductsInformation>)map.get("list");
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.enable(SerializationFeature.INDENT_OUTPUT);

		Map<String, Object> jsonData = new HashMap();
		jsonData.put("code", 0);
		jsonData.put("msg", "");
		jsonData.put("count", map.get("count"));

		List<Map<String, Object>> dataList = new ArrayList();
		for (ProductsInformation product : list) {
		    Map<String, Object> dataMap = new HashMap<>();
		    dataMap.put("information_name", product.getInformationName());
		    dataMap.put("id", product.getId());
		    dataMap.put("description", product.getDescription());
		    dataMap.put("type", product.getClassName());
		    
		    int sta = product.getInformationStatus();
		    String status = "";
		    if (sta == 0) {
		        status = "已上架";
		    } else if (sta == 1) {
		        status = "未上架";
		    } else if (sta == 2) {
		        status = "已下架";
		    }
		    dataMap.put("status",status);
		    
		    dataMap.put("is_last", product.getIsLast() == 1 ? "是" : "否");
		    dataMap.put("create_time", product.getCreateTime());
		    dataMap.put("shelves_time", product.getShelvesTime().toString());
		    
		    dataList.add(dataMap);
		}

		jsonData.put("data", dataList);

		String jsonOutput = objectMapper.writeValueAsString(jsonData);

        // 将JSON字符串作为响应发送回客户端
        PrintWriter out = resp.getWriter();
        out.print(jsonOutput);
        
	}
}
