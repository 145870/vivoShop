package servlets.background.orders;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import DAO.AreaDAO;
import DAO.InventoryDetailsDAO;
import DAO.InventoryUpdateDAO;
import DAO.OrdersDAO;
import DAO.ProductAttrValueDAO;
import entity.Admin;
import entity.Area;
import entity.InventoryDetails;
import entity.Orders;
import entity.ProductAttrValue;

@WebServlet("/background/pages/function/orders/update")
public class UpdateServlet extends HttpServlet {
	AreaDAO aDAO = new AreaDAO();
	
	OrdersDAO dao = new OrdersDAO();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("UTF-8");
		
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String province = req.getParameter("province");
		String city = req.getParameter("city");
		String district = req.getParameter("district");
		String address = req.getParameter("address");
		String state = req.getParameter("state");
		
		province=aDAO.getNameById(province);
		city=aDAO.getNameById(city);
		district=aDAO.getNameById(district);
		
		Admin admin = (Admin) req.getSession().getAttribute("admin");
		String adminType = "4";
	    if (admin != null) {
			adminType=admin.getAdminTypeId()+"";
		}
	    String jg = "";
	    if (adminType.equals("2")||adminType.equals("1")) {
	    	 jg = dao.doUpdateById(id,name,phone,province,city,district,address,state)>0?"true":"false";
	    }else {
			jg="权限不足!";
		}
		
		
		resp.getWriter().print(jg);
	}
}
