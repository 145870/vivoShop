package servlets.background.product_type;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.jdbc.DatabaseMetaData;

import DAO.ProductsClassDAO;
import entity.Admin;

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
        
        Admin admin = (Admin) req.getSession().getAttribute("admin");
		String adminType = "4";
	    if (admin != null) {
			adminType=admin.getAdminTypeId()+"";
		}
	    String jg = "";
	    if (adminType.equals("6")||adminType.equals("1")) {
	    	 int sqljg = dao.deleteById(id);
	         if (sqljg == -1451) {
	         	jg = "1451";
	 		}else if (sqljg>0) {
	         	jg = "true";
	 		}  
		 }else {
			jg="权限不足!";
		}

		resp.getWriter().print(jg);
	}
}
