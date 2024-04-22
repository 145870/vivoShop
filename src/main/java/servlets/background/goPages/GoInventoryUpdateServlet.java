package servlets.background.goPages;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AdminDAO;
import DAO.ProductsClassDAO;

@WebServlet("/background/gopages/goInventoryUpdate")
public class GoInventoryUpdateServlet extends HttpServlet{
	AdminDAO dao = new AdminDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		req.setAttribute("admin_list",dao.getAdmin());
		req.getRequestDispatcher("/background/pages/inventory/update.jsp").forward(req, resp);
	}
}
