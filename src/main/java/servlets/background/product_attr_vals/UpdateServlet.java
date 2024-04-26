package servlets.background.product_attr_vals;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProductAttrValueDAO;
import entity.Admin;

@WebServlet("/background/pages/function/product_attr_vals/update")
public class UpdateServlet extends HttpServlet {
	ProductAttrValueDAO dao = new ProductAttrValueDAO();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String pid = req.getSession().getAttribute("productid").toString();

		String pavid = req.getParameter("id");
		String price = req.getParameter("price");

		List<String> arrs = new ArrayList<String>();
		Enumeration<String> parameterNames = req.getParameterNames();
		while (parameterNames.hasMoreElements()) {
			String paramName = parameterNames.nextElement();
			if (paramName.startsWith("spec_")) {
				String paramValue = req.getParameter(paramName);
				// 在这里处理获取到的参数值
				arrs.add(paramValue);
			}
		}
		resp.setContentType("text/plain");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out = resp.getWriter();

		// 返回文本内容给前端
		Admin admin = (Admin) req.getSession().getAttribute("admin");
		String adminType = "4";
		if (admin != null) {
			adminType = admin.getAdminTypeId() + "";
		}
		String jg = "";
		if (adminType.equals("6") || adminType.equals("1")) {
			jg = dao.updateById(pid, arrs, price, pavid);
		} else {
			jg = "权限不足!";
		}

		out.print(jg);

	}
}
