package servlets.background.goPages;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AreaDAO;
import entity.Area;

@WebServlet("/background/gopages/goUpdateOrders")
public class GoUpdateOrders extends HttpServlet{
	AreaDAO adao = new AreaDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("UTF-8");
		
		String id = req.getParameter("id");
		String address_name = req.getParameter("address_name");
		String phone = req.getParameter("phone");
		String int_orders_status = req.getParameter("int_orders_status");
		String province = req.getParameter("province");
		String city = req.getParameter("city");
		String district = req.getParameter("district");
		String address = req.getParameter("address");
		
		// 存储参数到 HttpServletRequest 中
		req.setAttribute("id", id);
		req.setAttribute("address_name", address_name);
		req.setAttribute("phone", phone);
		req.setAttribute("int_orders_status", int_orders_status);
		req.setAttribute("province", province);
		req.setAttribute("city", city);
		req.setAttribute("district", district);
		req.setAttribute("address", address);

		req.setAttribute("Allprovince", adao.getAreaByProvince());
		req.setAttribute("Allcity", adao.getSubAreasByParentName(province));
		req.setAttribute("Alldistrict", adao.getSubAreasByParentName(city));

		
		req.getRequestDispatcher("/background/pages/orders/function/update.jsp").forward(req, resp);
	}
}
