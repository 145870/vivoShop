package servlets.front;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson2.JSONObject;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import DAO.Product_attr_valsDAO;
import entity.Product_attr_vals;

@WebServlet(urlPatterns = "/front/jsp/RefreshServlet")
public class RefreshServlet extends HttpServlet {
	Product_attr_valsDAO valsDAO = new Product_attr_valsDAO();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("test/html;charset=utf-8");

		String Jsonvals = request.getParameter("jsonavt");

		String vals[] = new Gson().fromJson(Jsonvals,String[].class);
		String val = "";
		for(int i=0;i<vals.length;i++) {
			if (i==vals.length-1) {
				val+=vals[i];
			}else {
				val+=vals[i]+",";
			}
		}
		
		
		// 获取产品id
		int id = Integer.parseInt(request.getSession().getAttribute("productid").toString());

		JsonArray jsonArray = JsonParser.parseString(Jsonvals).getAsJsonArray();

		// 获取数组的长度
		int length = jsonArray.size();
		// 查询规格价格信息

		List<Product_attr_vals> list = valsDAO.getProductsvals(id, length, Jsonvals);
		String price = "0";
		if (list.size() > 0) {
			price = list.get(0).getSale_amount() + "";
		}

		System.out.println(price);

		
		// 创建一个 JSON 对象，包含 price 和 Jsonvals 字段
		JSONObject jsonResponse = new JSONObject();
		jsonResponse.put("price", price);
		jsonResponse.put("Jsonvals", val);

		// 将 JSON 对象转换为字符串，并写入响应
		response.getWriter().write(jsonResponse.toString());

//		System.out.println(array);
	}

}
