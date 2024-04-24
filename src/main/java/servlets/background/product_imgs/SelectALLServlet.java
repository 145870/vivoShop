package servlets.background.product_imgs;

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

import DAO.ProductImageUrlDAO;
import entity.ProductImageUrl;
import util.AliyunOssUtil;

@WebServlet("/background/pages/function/product_imgs/selAll")
public class SelectALLServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ProductImageUrlDAO dao = new ProductImageUrlDAO();
	AliyunOssUtil aloss = new AliyunOssUtil();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 设置响应内容类型为JSON
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        
		String pid = req.getSession().getAttribute("productid").toString();
		
		String startTime = req.getParameter("startTime");
        String endTime = req.getParameter("endTime");
        String type = req.getParameter("type");
       
        
        //获取分页属性
        String page = req.getParameter("page");
        String limit = req.getParameter("limit");
        
		Map<String, Object> map = dao.getAllByWhere(pid,type,startTime,endTime,page,limit);
		
		List<ProductImageUrl> list =(List<ProductImageUrl>)map.get("list");
		
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.enable(SerializationFeature.INDENT_OUTPUT);

		Map<String, Object> jsonData = new HashMap();
		jsonData.put("code", 0);
		jsonData.put("msg", "");
		jsonData.put("count", map.get("count"));
		
		List<Map<String, Object>> dataList = new ArrayList();
		
		for (ProductImageUrl p : list) {
		    Map<String, Object> dataMap = new HashMap<>();
		    dataMap.put("id", p.getId());
		    dataMap.put("img", aloss.getImageUrl(p.getUrl()));
		    dataMap.put("url", p.getUrl());
		    
		    int types = p.getClassName();
		    type = "";
		    if (types == 0) {
		    	type = "缩略图";
		    } else if (types == 1) {
		    	type = "大图";
		    } else if (types == 2) {
		    	type = "介绍图";
		    }
		    dataMap.put("type",type );
		    
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    String createTimeString = sdf.format(p.getCreateTime());
		    dataMap.put("create_time",createTimeString);
		    
		    dataList.add(dataMap);
		    
		    
		}
		jsonData.put("data", dataList);

		String jsonOutput = objectMapper.writeValueAsString(jsonData);
		
        // 将JSON字符串作为响应发送回客户端
        PrintWriter out = resp.getWriter();
        out.print(jsonOutput);
	}
}
