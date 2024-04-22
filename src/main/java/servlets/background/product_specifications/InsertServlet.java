package servlets.background.product_specifications;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.InventoryDetailsDAO;
import DAO.ProductSpecificationDAO;

@WebServlet("/background/pages/function/productSpecifications/add")
public class InsertServlet extends HttpServlet{
	ProductSpecificationDAO dao = new ProductSpecificationDAO();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("UTF-8");
		String pid = req.getParameter("pid");
		String name = req.getParameter("name");
		String val = req.getParameter("val"); 
		
		String[] vals = val.split("\\r?\\n"); // 使用正则表达式拆分多行字符串
		Set<String> set = new HashSet(); // 使用Set来去重
		for(String s:vals) {
		    if (s != null && !s.isEmpty()) {
		        set.add(s);
		    }
		}

		List<String> list = new ArrayList<String>(set); // 转回列表

		String jg = dao.doInsert(pid, name, list.toArray(new String[0]));
				
		resp.getWriter().print(jg);
	}
}
