package servlets.background.product_attr_vals;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProductAttrValueDAO;

@WebServlet("/background/pages/function/product_attr_vals/delete")
public class DeleteServlet extends HttpServlet{
	ProductAttrValueDAO dao = new ProductAttrValueDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		if (dao.deleteById(id)>0) {
			 // 返回文本内容给前端
   	    resp.setContentType("text/plain");
   	    resp.setCharacterEncoding("UTF-8");
   	    PrintWriter out = resp.getWriter();
   	    out.print("true");
		}
	}
}
