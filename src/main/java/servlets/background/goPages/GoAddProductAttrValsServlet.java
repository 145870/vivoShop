package servlets.background.goPages;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.ProductAttrValue;
import entity.ProductSpecification;

@WebServlet("/background/gopages/goAddAttrValsServlet")
public class GoAddProductAttrValsServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		List<ProductSpecification> pslist = (List<ProductSpecification>)req.getSession().getAttribute("psList");
		if (pslist.size() <= 0 || pslist == null) {
			 // 返回文本内容给前端
    	    resp.setContentType("text/plain");
    	    resp.setCharacterEncoding("UTF-8");
    	    PrintWriter out = resp.getWriter();
    	    out.print("false");
		}else {
			resp.sendRedirect("/vivoShop/background/pages/product/function/attrVals/addAttrVals.jsp");
		}
	}
}
