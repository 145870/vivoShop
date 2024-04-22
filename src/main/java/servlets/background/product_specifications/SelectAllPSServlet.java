package servlets.background.product_specifications;

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

import DAO.ProductSpecificationDAO;
import entity.ProductAttrValue;
import entity.ProductSpecification;


@WebServlet("/background/pages/function/product_specifications/selAll")
public class SelectAllPSServlet extends HttpServlet{
	ProductSpecificationDAO dao = new ProductSpecificationDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("UTF-8");
        
        String pname = req.getParameter("pname");
        String psname = req.getParameter("psname");
        //获取分页属性
        String page = req.getParameter("page");
        String limit = req.getParameter("limit");

        Map<String, Object> map = dao.getProductSpecificationByNames(pname,psname,page,limit);
        Map<String, Object> jsonData = new HashMap();
        List<ProductSpecification> list = (List<ProductSpecification>) map.get("list");
		jsonData.put("code", 0);
		jsonData.put("msg", "");
		jsonData.put("count", map.get("count"));
		
		List<Map<String, Object>> dataList = new ArrayList();
		
		for (ProductSpecification ps : list) {
		    Map<String, Object> dataMap = new HashMap<>();
		    
		    dataMap.put("psid",ps.getId());
		    dataMap.put("pid",ps.getPid());
		    dataMap.put("pname",ps.getPname());
		    dataMap.put("ps_name",ps.getSpecificationsName());
		    
		    String vals[] = ps.getSpecificationsValues();
		    String val = "";
		    for (int i = 0; i < vals.length; i++) {
		        val += vals[i];
		        
		        // 如果不是最后一个值，则添加逗号分隔符
		        if (i < vals.length - 1) {
		            val += ",";
		        }
		    }
		   
		    dataMap.put("ps_val",val);
		    
		    dataList.add(dataMap);
		}
		jsonData.put("data", dataList);
		
		String jsonOutput = new ObjectMapper().writeValueAsString(jsonData);
		// 将JSON字符串作为响应发送回客户端
        PrintWriter out = resp.getWriter();
        out.print(jsonOutput);
	}
}
