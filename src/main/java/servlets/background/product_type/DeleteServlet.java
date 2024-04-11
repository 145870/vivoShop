package servlets.background.product_type;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProductsClassDAO;

@WebServlet("/background/pages/function/product_type/delete")
public class DeleteServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ProductsClassDAO dao = new ProductsClassDAO();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        
        String id = req.getParameter("id");
        String sqljg = dao.deleteById(id);
        
        resp.getWriter().print(sqljg);
	}
}
