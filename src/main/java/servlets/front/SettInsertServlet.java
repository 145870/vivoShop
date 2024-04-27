package servlets.front;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson2.JSONObject;

import DAO.OrdersDAO;
import DAO.OrdersDetailsDAO;

@WebServlet(urlPatterns = "/front/jsp/SettInsertServlet")
public class SettInsertServlet extends HttpServlet {
	OrdersDAO ordao=new OrdersDAO(); 
	OrdersDetailsDAO detdao=new OrdersDetailsDAO();
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 新增订单
		// 用户ids
		int uid = Integer.parseInt(request.getSession().getAttribute("uid").toString());
		// 获得姓名
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String sheng = request.getParameter("sheng");
		String shi = request.getParameter("shi");
		String xian = request.getParameter("xian");
		String xiang = request.getParameter("xiang");

		System.out.println("name" + name);
		System.out.println("tel" + tel);
		
		
		// 调用方法
		Integer result = ordao.insertAddOrder(uid, name, tel, sheng, shi, xian, xiang, 0);
		System.out.println("result+"+result);
		boolean resu = false;
		if (result > 0) {
			// 新增成功
			// 执行相应的逻辑
			resu = true;
		} else {
			// 新增失败
			// 执行相应的逻辑
			resu = false;
		}
		//获取数量
		int count = Integer.parseInt(request.getSession().getAttribute("count").toString());
		//调用插入订单明细表
		//int det=detdao.insertAddOrder(uid, uid, count);
		// 创建一个 JSON 对象，包含 price 和 Jsonvals 字段
		JSONObject jsonResponse = new JSONObject();
		jsonResponse.put("resu", resu);

		// 将 JSON 对象转换为字符串，并写入响应
		response.getWriter().write(jsonResponse.toString());

	}
}
