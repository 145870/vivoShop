package servlets.background.products;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProductsInformationDAO;

@WebServlet("/background/pages/function/product_information/delete")
public class DeleteProductsServlet extends HttpServlet{
	private ProductsInformationDAO dao=new ProductsInformationDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		resp.setContentType("text/plain");
	    resp.setCharacterEncoding("UTF-8");
		String id=req.getParameter("id");
		
		int sqljg = dao.deleteById(id);
	    String jg = "";
	    if (sqljg == -1451) {
	    	jg = "1451";
		}else if (sqljg>0) {
			jg = "true";
		}
		
		resp.getWriter().print(jg);
	}
}
