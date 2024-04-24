package servlets.background.goPages;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

@WebServlet("/background/gopages/goEditProductAttrVals")
public class GoEditProductAttrValsServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		   BufferedReader reader = req.getReader();
		    StringBuilder data = new StringBuilder();
		    String line;
		    while ((line = reader.readLine()) != null) {
		        data.append(line);
		    }
		    
		    
		    //解析 JSON 字符串
	        Gson gson = new Gson();
	        JsonObject jsonObject = gson.fromJson(data.toString(), JsonObject.class);
	        
	        Map<Integer, String> map = new HashMap<Integer, String>();
	        // 遍历 JSON 对象的键值对
	        for (String key : jsonObject.keySet()) {
	            JsonElement value = jsonObject.get(key);
	            String val = value.toString();
	            if (val.startsWith("\"") && val.endsWith("\"")) {
	            	val = val.substring(1, val.length() - 1);
	            }
	            
	            if (key.startsWith("spec_")) {
					map.put(Integer.valueOf(key.substring(5)), val);
				}else {
					req.setAttribute(key, value);
				}
	        }
	        req.setAttribute("spec", map);
	        
			req.getRequestDispatcher("/background/pages/product/function/attrVals/EditProductAttrVals.jsp").forward(req, resp);

	}
}
