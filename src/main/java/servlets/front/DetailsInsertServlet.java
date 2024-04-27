package servlets.front;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson2.JSONObject;

import DAO.UsercollectDAO;

@WebServlet(urlPatterns = "/front/jsp/DetailsInsertServlet")
public class DetailsInsertServlet extends HttpServlet{
	UsercollectDAO userdao=new UsercollectDAO();
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取a标签的id
		int pid=Integer.parseInt(request.getSession().getAttribute("productid").toString());
		//获取用户id
		int uid=Integer.parseInt(request.getSession().getAttribute("uid").toString());
		int result= userdao.insertShouC(uid, pid);
		boolean resu=false;
		if (result > 0) {
		    // 新增成功
		    // 执行相应的逻辑
			resu=true;
		} else {
		    // 新增失败
		    // 执行相应的逻辑
			resu=false;
		}
		// 创建一个 JSON 对象，包含 price 和 Jsonvals 字段
				JSONObject jsonResponse = new JSONObject();
				jsonResponse.put("resu", resu);

				// 将 JSON 对象转换为字符串，并写入响应
				response.getWriter().write(jsonResponse.toString());
	}
}
