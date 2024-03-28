package servlets.background.goPages;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.ProductsInformation;

@WebServlet("/background/gopages/goEditProductpane")
public class GoEditProductpaneServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String name = req.getParameter("name");
		String id = req.getParameter("id");
    	String type = req.getParameter("type");
    	String status = req.getParameter("status");
    	int sta = 0;
    	if (status.equals("已上架")) {
    		sta = 0;
		}else if(status.equals("未上架")){
			sta = 1;
		}else if(status.equals("已下架")){
			sta = 2;
		}
    	
    	String is_last = req.getParameter("is_last");
    	
    	ProductsInformation p=new ProductsInformation();
    	p.setInformationName(name);
    	p.setId(Long.valueOf(id));
    	p.setClassName(type);
    	p.setInformationStatus(sta);
    	p.setIsLast(is_last.equals("是")?0:1);
    	
		req.setAttribute("product",p);
		req.getRequestDispatcher("/background/pages/function/product_information/EditProductpanel.jsp").forward(req, resp);
	}
}
