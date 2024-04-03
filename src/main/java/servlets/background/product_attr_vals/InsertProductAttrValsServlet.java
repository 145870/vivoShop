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
import DAO.ProductsInformationDAO;

@WebServlet("/background/pages/function/product_attr_vals/add")
public class InsertProductAttrValsServlet extends HttpServlet{
	private ProductAttrValueDAO dao = new ProductAttrValueDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String pid = req.getSession().getAttribute("productid")+"";
		//获取各个规格组合值
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
	    String price = req.getParameter("price");

		// 返回文本内容给前端
   	    resp.setContentType("text/plain");
   	    resp.setCharacterEncoding("UTF-8");
   	    PrintWriter out = resp.getWriter();
   	    out.print(dao.insertByPid(pid, arrs, price));
   	    
	}

}
