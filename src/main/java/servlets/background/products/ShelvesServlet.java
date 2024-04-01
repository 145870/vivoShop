package servlets.background.products;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProductsInformationDAO;

@WebServlet("/background/pages/function/product_information/shelves")
public class ShelvesServlet extends HttpServlet{
	private ProductsInformationDAO dao=new ProductsInformationDAO();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		if (dao.updateStatuOnTrue(id)>0) {
			 // 返回文本内容给前端
			resp.setContentType("text/plain");
   	    	resp.setCharacterEncoding("UTF-8");
   	    	PrintWriter out = resp.getWriter();
   	    	out.print("true");
		}
	}
}
