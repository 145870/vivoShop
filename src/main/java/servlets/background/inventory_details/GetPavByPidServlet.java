package servlets.background.inventory_details;

import java.io.IOException;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DAO.ProductAttrValueDAO;
import entity.ProductAttrValue;

@WebServlet("/background/pages/function/inventory_details/getpav")
public class GetPavByPidServlet extends HttpServlet{
	ProductAttrValueDAO dao = new ProductAttrValueDAO();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 设置响应内容类型为JSON
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        String pid = req.getParameter("pid");
        
        List<ProductAttrValue> list = dao.getAttrValuesByPid(pid);
        System.out.println(list.size());
        Map<Long, String> map = new LinkedHashMap<Long, String>();
        for(ProductAttrValue pav:list) {
        	String[] vals = pav.getAttrVals();
        	String val = "";
        	for (int i = 0; i < vals.length; i++) {
		        val += vals[i];
		        
		        // 如果不是最后一个值，则添加逗号分隔符
		        if (i < vals.length - 1) {
		            val += ",";
		        }
		    }
        	map.put(pav.getId(), val);
        }
        
        String josn = new Gson().toJson(map);

        resp.getWriter().print(josn);
	}
}
