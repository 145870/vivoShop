package servlets.background.orders;

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
import DAO.OrdersDAO;
import DAO.ProductAttrValueDAO;
import entity.InventoryDetails;
import entity.InventoryUpdate;
import entity.Orders;
import entity.ProductAttrValue;

@WebServlet("/background/pages/function/orders/selAll")
public class SelectWhereServlet extends HttpServlet {
	OrdersDAO dao = new OrdersDAO();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		// 设置响应内容类型为JSON
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
		 
        // 获取表单数据
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String state = req.getParameter("state");
        String startTime = req.getParameter("startTime");
        String endTime = req.getParameter("endTime");
        
        String service = req.getParameter("service");

		if (name==null) {
			name="";
		}

		// 获取分页属性
		String page = req.getParameter("page");
		String limit = req.getParameter("limit");

		
		Map<String, Object> map = dao.getOrdersByWhere(id, name,phone,state,startTime,endTime,service,page,limit);
		Map<String, Object> jsonData = new HashMap();
		
		List<Orders> list = (List<Orders>) map.get("list");
		jsonData.put("code", 0);
		jsonData.put("msg", "");
		jsonData.put("count", map.get("count"));

		List<Map<String, Object>> dataList = new ArrayList();

		for (Orders o : list) {
			Map<String, Object> dataMap = new HashMap<>();
			dataMap.put("id",o.getId());
			dataMap.put("address_name", o.getAddressName());
			dataMap.put("phone", o.getPhone());
			dataMap.put("address", o.getAddress());
			
			int ordersStatus = o.getOrdersStatus();
			dataMap.put("int_orders_status", ordersStatus);
			String statusDescription = mapOrderStatus(ordersStatus);
			dataMap.put("orders_status", statusDescription);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    String createTimeString = sdf.format(o.getCreateTime());
			dataMap.put("create_time",createTimeString);
			
			Long service_id = o.getServiceId();
			if (service_id==null) {
				dataMap.put("service_id",-1);
				dataMap.put("service","否");
			}else {
				dataMap.put("service_id",service_id);
				dataMap.put("service","是");
			}
			dataMap.put("province",o.getProvince());
			dataMap.put("city",o.getCity());
			dataMap.put("district",o.getDistrict());
			
			dataList.add(dataMap);
		}
		jsonData.put("data", dataList);

		String jsonOutput = new ObjectMapper().writeValueAsString(jsonData);
		// 将JSON字符串作为响应发送回客户端
		PrintWriter out = resp.getWriter();
		out.print(jsonOutput);
	}
	public static String mapOrderStatus(int status) {
	    switch (status) {
	        case 0:
	            return "未支付";
	        case 1:
	            return "未发货";
	        case 2:
	            return "已发货";
	        case 3:
	            return "已收货";
	        default:
	            return "未知状态";
	    }
	}
}
