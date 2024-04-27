package servlets.front;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson2.JSONObject;

import DAO.User_address_informationDAO;
import entity.User_address_information;

@WebServlet(urlPatterns = "/front/jsp/RefreshDingDanServlet")
public class RefreshDingDanServlet extends HttpServlet {
	// 地址
	User_address_informationDAO adddao = new User_address_informationDAO();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		 // 用户ids
		int uid=Integer.parseInt(request.getSession().getAttribute("uid").toString());
        // 存储对应值
        HttpSession session = request.getSession(); // 初始化session
        session.setAttribute("uid", uid);
        System.out.println("uid="+uid);
        // 根据id查找地址信息
        List<User_address_information> address = adddao.queryAdderid(uid);
        String array = JSONObject.toJSONString(address);
        
        
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write(array);
        
	}
}
