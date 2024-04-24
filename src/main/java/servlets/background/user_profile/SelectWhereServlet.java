package servlets.background.user_profile;

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
import com.mysql.cj.exceptions.RSAException;

import DAO.ProductImageUrlDAO;
import DAO.UserProfileDAO;
import entity.ProductImageUrl;
import entity.UserProfile;
import util.AliyunOssUtil;

@WebServlet("/background/pages/function/user_profile/selAll")
public class SelectWhereServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	UserProfileDAO dao = new UserProfileDAO();
	AliyunOssUtil aloss = new AliyunOssUtil();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 设置响应内容类型为JSON
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        
		String account = req.getParameter("account");
		String name = req.getParameter("name");
		if (name==null) {
			name="";
		}
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		String startTime = req.getParameter("startTime");
		String endTime = req.getParameter("endTime");
        
        //获取分页属性
        String page = req.getParameter("page");
        String limit = req.getParameter("limit");
        
		Map<String, Object> map = dao.getAllByWhere(account,name,phone,email,startTime,endTime,page,limit);
		
		List<UserProfile> list =(List<UserProfile>)map.get("list");
		
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.enable(SerializationFeature.INDENT_OUTPUT);

		Map<String, Object> jsonData = new HashMap();
		jsonData.put("code", 0);
		jsonData.put("msg", "");
		jsonData.put("count", map.get("count"));
		
		List<Map<String, Object>> dataList = new ArrayList();
		
		for (UserProfile u : list) {
		    Map<String, Object> dataMap = new HashMap<>();
		    dataMap.put("id", u.getId());
		    dataMap.put("account_number", u.getAccount_number());
		    dataMap.put("user_name", u.getUser_name());
		    dataMap.put("img", aloss.getImageUrl(u.getHead_image_url()));
		    dataMap.put("phone", u.getPhone());
		    dataMap.put("mailbox",u.getMailbox());
		    dataMap.put("address", u.getAddress());
		    dataMap.put("sex",u.getSex()==0?"男":"女");
		    
		    SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		    dataMap.put("birthday",sdf1.format(u.getBirthday()));
		    
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    dataMap.put("create_time",sdf.format(u.getCreate_time()));
		    
		    dataList.add(dataMap);
		}
		jsonData.put("data", dataList);

		String jsonOutput = objectMapper.writeValueAsString(jsonData);
		
        // 将JSON字符串作为响应发送回客户端
        PrintWriter out = resp.getWriter();
        out.print(jsonOutput);
	}
}
