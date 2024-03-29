package servlets.background.products;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProductsInformationDAO;

@WebServlet("/background/pages/function/product_information/add")
public class InsertProductsServlet extends HttpServlet{
	private ProductsInformationDAO dao = new ProductsInformationDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String name = req.getParameter("name");
    	String type = req.getParameter("type");
    	String date = req.getParameter("date");
    	String isNew = req.getParameter("isNew")==null?"1":"0";
    	String description = req.getParameter("description");
    	
    	if (dao.setProducts(name,type,date,isNew,description)>0) {
			 // 返回文本内容给前端
   	    resp.setContentType("text/plain");
   	    resp.setCharacterEncoding("UTF-8");
   	    PrintWriter out = resp.getWriter();
   	    out.print("true");
		}
	}

}
