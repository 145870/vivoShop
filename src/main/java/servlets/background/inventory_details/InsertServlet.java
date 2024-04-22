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

@WebServlet("/background/pages/function/inventory_details/add")
public class InsertServlet extends HttpServlet {
	InventoryDetailsDAO dao = new InventoryDetailsDAO();
	InventoryUpdateDAO iudao = new InventoryUpdateDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("UTF-8");
		
		String pavid = req.getParameter("pav");
		String count = req.getParameter("count");
		
		String jg = dao.doInsert(pavid, count)>0?"true":"false";
		if (jg == "true") {
			Admin admin = (Admin) req.getSession().getAttribute("admin");
			String admin_id = admin.getId()+"";
			//添加库存变动
			String IDid = dao.getInsertedId()+"";
			iudao.doInsert(IDid,"0","0",count, admin_id,"新增库存");
		}
		resp.getWriter().print(jg);
		
	}
}
