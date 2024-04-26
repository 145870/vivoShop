package servlets.background.admin;

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

import DAO.AdminDAO;
import DAO.AdminTypeDAO;
import entity.Admin;
import entity.InventoryUpdate;

@WebServlet("/background/pages/function/admin/selAll")
public class SelectAllServlet extends HttpServlet{
	AdminDAO adao=new AdminDAO();
	AdminTypeDAO atdao = new AdminTypeDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
   	    resp.setCharacterEncoding("UTF-8");
   	    
   	    // 获取表单数据
        String account = req.getParameter("account");
        String name = req.getParameter("name");
        String phone =req.getParameter("phone");
        String type =req.getParameter("type");
        String sex =req.getParameter("sex");
        String startTime = req.getParameter("startTime");
        String endTime = req.getParameter("endTime");
        
        if (name==null) {
			name="";
		}
        
        // 获取分页属性
     	String page = req.getParameter("page");
     	String limit = req.getParameter("limit");
     	
		Map<String, Object> map = adao.getAdminByWheres(account, name,phone,type,sex,startTime,endTime,page,limit);
		
		Map<String, Object> jsonData = new HashMap();
		
		List<Admin> list = (List<Admin>) map.get("list");
		jsonData.put("code", 0);
		jsonData.put("msg", "");
		jsonData.put("count", map.get("count"));
        
		List<Map<String, Object>> dataList = new ArrayList();
		
		for (Admin a : list) {
			Map<String, Object> dataMap = new HashMap<>();
			dataMap.put("id", a.getId());
			dataMap.put("account", a.getAccount());
			dataMap.put("nickname", a.getNickname());
			dataMap.put("admin_name", a.getAdminName());
			dataMap.put("phone", a.getPhone());
			dataMap.put("sex", a.getSex()==0?"男":"女");
			
			Long typeId = a.getAdminTypeId();
			dataMap.put("admin_type_id", typeId);
			dataMap.put("admin_type", atdao.getTypeNameById(typeId));
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    String createTimeString = sdf.format(a.getCreateTime());
			dataMap.put("create_time",createTimeString);
			
			dataList.add(dataMap);
		}
		jsonData.put("data", dataList);
		
		String jsonOutput = new ObjectMapper().writeValueAsString(jsonData);
		// 将JSON字符串作为响应发送回客户端
		PrintWriter out = resp.getWriter();
		out.print(jsonOutput);
	}
}
