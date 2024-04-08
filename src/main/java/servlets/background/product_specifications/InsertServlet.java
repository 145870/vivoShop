package servlets.background.product_specifications;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProductSpecificationDAO;

@WebServlet("/background/pages/function/productSpecifications/add")
public class InsertServlet extends HttpServlet{
	ProductSpecificationDAO dao = new ProductSpecificationDAO();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("UTF-8");
		String pid = req.getSession().getAttribute("productid").toString();
		String name = req.getParameter("name");
		String[] vals = req.getParameter("val").split(",");                                  
		
		String jg = dao.doInsert(pid,name,vals);
		
		resp.getWriter().print(jg);
	}
}
