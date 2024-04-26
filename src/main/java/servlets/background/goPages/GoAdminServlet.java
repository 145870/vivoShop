package servlets.background.goPages;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AdminDAO;
import DAO.AdminTypeDAO;
import entity.Admin;
import entity.AdminType;

@WebServlet("/background/gopages/goAdmin")
public class GoAdminServlet extends HttpServlet{
	AdminTypeDAO dao = new AdminTypeDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("UTF-8");
		req.getSession().setAttribute("admin_type", dao.getAdminDAOs());
		req.getRequestDispatcher("/background/pages/admin/admin.jsp").forward(req, resp);
	}
}
