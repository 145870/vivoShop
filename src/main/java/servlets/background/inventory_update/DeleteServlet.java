package servlets.background.inventory_update;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.InventoryUpdateDAO;
import entity.InventoryUpdate;

@WebServlet("/background/pages/function/inventory_update/delete")
public class DeleteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String jg = new InventoryUpdateDAO().doDeleteByID(id)>0?"true":"false";
		resp.getWriter().print(jg);
	}

}
