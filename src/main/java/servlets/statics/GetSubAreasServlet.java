package servlets.statics;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DAO.AreaDAO;
import entity.Area;
import entity.ProductAttrValue;

@WebServlet("/static/getSubAreas")
public class GetSubAreasServlet extends HttpServlet{
	AreaDAO dao = new AreaDAO();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 设置响应内容类型为JSON
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        String id = req.getParameter("id");
        
        List<Area> list = dao.getSubAreasByID(id);

        Map<Integer, String> map = new LinkedHashMap<Integer, String>();
        for(Area a:list) {
        	map.put(a.getId(), a.getName());
        }
        
        String josn = new Gson().toJson(map);

        resp.getWriter().print(josn);
	}
}
