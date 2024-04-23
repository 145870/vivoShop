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

@WebServlet("/background/pages/function/inventory_details/enter")
public class EnterServlet extends HttpServlet {
	InventoryDetailsDAO dao = new InventoryDetailsDAO();
	InventoryUpdateDAO iudao = new InventoryUpdateDAO();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("UTF-8");
		
		String id = req.getParameter("id");
		int count = Integer.valueOf(req.getParameter("count"));
		int oldCount = dao.getQuantityById(id);
		
		int newCount = oldCount+count;
		
		String jg = dao.doUpdateCountByID(id, newCount+"")>0?"true":"false";
		if (jg == "true") {
			Admin admin = (Admin) req.getSession().getAttribute("admin");
			String admin_id = admin.getId()+"";
			//添加库存变动
			iudao.doInsert(id,"0",oldCount+"",newCount+"", admin_id,"入库");
		}
		resp.getWriter().print(jg);
		
	}
}