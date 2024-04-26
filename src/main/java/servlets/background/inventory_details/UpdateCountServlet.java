package servlets.background.inventory_details;

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
import DAO.InventoryUpdateDAO;
import DAO.ProductAttrValueDAO;
import entity.Admin;
import entity.InventoryDetails;
import entity.ProductAttrValue;

@WebServlet("/background/pages/function/inventory_details/update")
public class UpdateCountServlet extends HttpServlet {
	InventoryDetailsDAO dao = new InventoryDetailsDAO();
	InventoryUpdateDAO iudao = new InventoryUpdateDAO();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("UTF-8");
		
		String id = req.getParameter("id");
		String count = req.getParameter("count");
		
		int oldCount = dao.getQuantityById(id);
		
		Admin admin = (Admin) req.getSession().getAttribute("admin");
		String adminType = "4";
	    if (admin != null) {
			adminType=admin.getAdminTypeId()+"";
		}
	    String jg = "";
	    if (adminType.equals("3")||adminType.equals("1")) {
	    	 jg = dao.doUpdateCountByID(id, count)>0?"true":"false";
	    	 if (jg == "true") {
	 			String admin_id = admin.getId()+"";
	 			//添加库存变动
	 			String IDid = dao.getInsertedId()+"";
	 			iudao.doInsert(IDid,"2",oldCount+"",count, admin_id,"修改库存");
	 		}
	    }else {
			jg="权限不足!";
		}
		
		
		resp.getWriter().print(jg);
	}
}
