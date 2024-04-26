package servlets.background.goPages;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProductsInformationDAO;

@WebServlet("/background/gopages/goUpdateAdmin")
public class GoUpdateAdminServlet extends HttpServlet{
	ProductsInformationDAO pdao = new ProductsInformationDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("UTF-8");
		
		String id = req.getParameter("id");
		String account = req.getParameter("account");
   	    String pwd = req.getParameter("pwd");
   	    String nickname = req.getParameter("nickname");
	   	String phone = req.getParameter("phone");
	   	String admin_name = req.getParameter("admin_name");
	   	String typeId = req.getParameter("typeId");
	   	String sex = req.getParameter("sex").toString().equals("男")?"0":"1";
		
	   	// 将所有参数设置到请求作用域
	   	req.setAttribute("id", id);
	   	req.setAttribute("account", account);
	   	req.setAttribute("pwd", pwd);
	   	req.setAttribute("nickname", nickname);
	   	req.setAttribute("phone", phone);
	   	req.setAttribute("admin_name", admin_name);
	   	req.setAttribute("typeId", typeId);
	   	req.setAttribute("sex", sex);
		req.getRequestDispatcher("/background/pages/admin/function/update.jsp").forward(req, resp);
	}
}
