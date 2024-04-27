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

import DAO.InventoryDetailsDAO;
import DAO.OrdersDAO;
import DAO.OrdersDetailsDAO;
import DAO.ProductAttrValueDAO;
import entity.Admin;
import entity.InventoryDetails;
import entity.ProductAttrValue;

@WebServlet("/background/pages/function/orders/delete")
public class DeleteServlet extends HttpServlet {
	OrdersDAO dao = new OrdersDAO();
	OrdersDetailsDAO odDAO = new OrdersDetailsDAO();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("UTF-8");
		
		String id = req.getParameter("id");

	    Admin admin = (Admin) req.getSession().getAttribute("admin");
		String adminType = "4";
	    if (admin != null) {
			adminType=admin.getAdminTypeId()+"";
		}
	    String jg = "";
	    if (adminType.equals("2")||adminType.equals("1")) {
	    	//先删除子表
	    	odDAO.doDeleteByOid(id);
	    	int sqljg = dao.doDeleteByID(id);
		    if (sqljg == -1451) {
		    	jg = "1451";
			}else if (sqljg>0) {
				jg = "true";
			}
	    }else {
			jg="权限不足!";
		}
		
		resp.getWriter().print(jg);
		
		
	}
}
