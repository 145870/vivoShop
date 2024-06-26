package servlets.background.inventory_update;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.InventoryUpdateDAO;
import entity.Admin;
import entity.InventoryUpdate;

@WebServlet("/background/pages/function/inventory_update/delete")
public class DeleteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		String id = req.getParameter("id");
		
		Admin admin = (Admin) req.getSession().getAttribute("admin");
		String adminType = "4";
	    if (admin != null) {
			adminType=admin.getAdminTypeId()+"";
		}
	    String jg = "";
	    if (adminType.equals("3")||adminType.equals("1")) {
	    	jg = new InventoryUpdateDAO().doDeleteByID(id)>0?"true":"false";
	    }else {
			jg="权限不足!";
		}
	    
	    

		resp.getWriter().print(jg);
	}

}
