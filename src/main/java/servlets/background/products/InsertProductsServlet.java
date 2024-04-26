package servlets.background.products;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProductsInformationDAO;
import entity.Admin;

@WebServlet("/background/pages/function/product_information/add")
public class InsertProductsServlet extends HttpServlet {
	private ProductsInformationDAO dao = new ProductsInformationDAO();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String name = req.getParameter("name");
		String type = req.getParameter("type");
		String date = req.getParameter("date");
		String isNew = req.getParameter("isNew") == null ? "1" : "0";
		String description = req.getParameter("description");

		Admin admin = (Admin) req.getSession().getAttribute("admin");
		String adminType = "4";
		if (admin != null) {
			adminType = admin.getAdminTypeId() + "";
		}
		String jg = "";
		if (adminType.equals("6") || adminType.equals("1")) {
			if (dao.setProducts(name, type, date, isNew, description) > 0) {
				jg = "true";
			}
		} else {
			jg = "权限不足!";
		}
		// 返回文本内容给前端
		resp.setContentType("text/plain");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();
		out.print(jg);

	}

}
