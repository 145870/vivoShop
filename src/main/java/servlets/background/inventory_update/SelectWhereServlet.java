package servlets.background.inventory_update;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
import DAO.InventoryUpdateDAO;
import DAO.ProductAttrValueDAO;
import entity.InventoryDetails;
import entity.InventoryUpdate;
import entity.ProductAttrValue;

@WebServlet("/background/pages/function/inventory_update/selWhere")
public class SelectWhereServlet extends HttpServlet {
	InventoryUpdateDAO dao = new InventoryUpdateDAO();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		// 设置响应内容类型为JSON
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
		 
        // 获取表单数据
        String name = req.getParameter("name");
        String type = req.getParameter("type");
        String adminID =req.getParameter("adminID");
        String startTime = req.getParameter("startTime");
        String endTime = req.getParameter("endTime");

		if (name==null) {
			name="";
		}

		// 获取分页属性
		String page = req.getParameter("page");
		String limit = req.getParameter("limit");

		
		Map<String, Object> map = dao.getInventoryUpdateAndPavAndPByWhere(name, type,adminID,startTime,endTime,page,limit);
		Map<String, Object> jsonData = new HashMap();
		
		List<InventoryUpdate> list = (List<InventoryUpdate>) map.get("list");
		jsonData.put("code", 0);
		jsonData.put("msg", "");
		jsonData.put("count", map.get("count"));

		List<Map<String, Object>> dataList = new ArrayList();

		for (InventoryUpdate i : list) {
			Map<String, Object> dataMap = new HashMap<>();
			dataMap.put("id", i.getId());
			dataMap.put("information_name", i.getpName());
			
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
			
			int intType = i.getUpdateType();
			if (intType == 0) {
				type = "入库";
			}else if(intType == 1) {
				type = "出库";
			}else if(intType == 2) {
				type = "调整";
			}
			
			dataMap.put("type",type);
			dataMap.put("old_quantity",i.getOldQuantity());
			dataMap.put("new_quantity",i.getNewQuantity());
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    String createTimeString = sdf.format(i.getUpdateTime());
			
			dataMap.put("update_time",createTimeString);
			dataMap.put("reason",i.getReason());
			dataMap.put("admin_name",i.getAdmin_name());
			
			dataList.add(dataMap);
		}
		jsonData.put("data", dataList);

		String jsonOutput = new ObjectMapper().writeValueAsString(jsonData);
		// 将JSON字符串作为响应发送回客户端
		PrintWriter out = resp.getWriter();
		out.print(jsonOutput);
	}
}
