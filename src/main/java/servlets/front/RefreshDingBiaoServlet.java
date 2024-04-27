package servlets.front;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson2.JSONObject;

import DAO.ProductsClassDAO;
import entity.ProductsClass;

@WebServlet(urlPatterns = "/front/jsp/RefreshDingBiaoServlet")
public class RefreshDingBiaoServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获取 URL 参数
		String urlParams = request.getQueryString();
		String jsonData = "";
		Object jsonDataObj = request.getSession().getAttribute("jsonData");
		if (jsonDataObj != null) {
		    jsonData = jsonDataObj.toString();
		}
		String jsonprice=request.getSession().getAttribute("jsonprice").toString();
		String jsonNum=request.getSession().getAttribute("jsonNum").toString();
		String jsonname=request.getSession().getAttribute("jsonname").toString();
		


		response.setContentType("test/html;charset=utf-8");
		// 创建一个 JSON 对象，包含 price 和 Jsonvals 字段
		JSONObject jsonResponse = new JSONObject();
		jsonResponse.put("jsonData", jsonData);
		jsonResponse.put("jsonprice", jsonprice);
		jsonResponse.put("jsonNum", jsonNum);
		jsonResponse.put("jsonname", jsonname);

		// 将 JSON 对象转换为字符串，并写入响应
		response.getWriter().write(jsonResponse.toString());
	}
}
