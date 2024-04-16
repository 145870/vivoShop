package servlets.background.product_specifications;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProductSpecificationDAO;

@WebServlet("/background/pages/function/product_specifications/delete")
public class DeleteServlet extends HttpServlet{
	ProductSpecificationDAO dao = new ProductSpecificationDAO();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("UTF-8");
		
		String id = req.getParameter("id");
		int sqljg = dao.doDeleteById(id);
	    String jg = "";
	    if (sqljg == -1451) {
	    	jg = "1451";
		}else if (sqljg>0) {
			jg = "true";
		}
		
		resp.getWriter().print(jg);
	}
}
