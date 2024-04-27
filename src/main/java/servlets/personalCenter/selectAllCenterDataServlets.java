package servlets.personalCenter;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import DAO.UserProfileDAO;
import entity.UserProfile;
@WebServlet("/PersonalCenter/JSP/selectAllCenterDataServlets")
public class selectAllCenterDataServlets extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserProfileDAO userdao = new UserProfileDAO();
		List<UserProfile> listdata = userdao.selectAll(1);
		
		// 将列表转换为 JSON
        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create(); // 设置日期格式
        String json = gson.toJson(listdata);

     // 设置响应内容类型为 JSON
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        
     // 将 JSON 数据写入响应
        resp.getWriter().write(json);
	}
}
