package servlets.background.product_attr_vals;

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

import DAO.ProductAttrValueDAO;
import DAO.ProductSpecificationDAO;
import entity.ProductAttrValue;
import entity.ProductSpecification;
import entity.ProductsInformation;

@WebServlet("/background/pages/function/product_attr_vals/selAll")
public class SelectAllServlet extends HttpServlet{
	ProductAttrValueDAO dao=new ProductAttrValueDAO();
	@Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("UTF-8");
        String id = req.getParameter("id");

        Map<String, Object> map = dao.getAllAndCountByProductId(id);
        Map<String, Object> jsonData = new HashMap();
        List<ProductAttrValue> list = (List<ProductAttrValue>) map.get("list");
		jsonData.put("code", 0);
		jsonData.put("msg", "");
		jsonData.put("count", map.get("count"));
		
		List<Map<String, Object>> dataList = new ArrayList();
		
		for (ProductAttrValue pav : list) {
		    Map<String, Object> dataMap = new HashMap<>();
		    int index = 0;
		    dataMap.put("id",pav.getId());
		    for(String val:pav.getAttrVals()) {
		    	dataMap.put("spec_"+index,val);
		    	index++;
		    }
		    dataMap.put("price",pav.getSaleAmount());
		    
		    dataList.add(dataMap);
		}
		jsonData.put("data", dataList);
		
		String jsonOutput = new ObjectMapper().writeValueAsString(jsonData);
		// 将JSON字符串作为响应发送回客户端
        PrintWriter out = resp.getWriter();
        out.print(jsonOutput);
    }
}
