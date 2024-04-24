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

import DAO.InventoryDetailsDAO;
import DAO.InventoryUpdateDAO;
import DAO.ProductAttrValueDAO;
import DAO.ProductsInformationDAO;
import entity.Admin;

@WebServlet("/background/pages/function/product_attr_vals/add")
public class InsertProductAttrValsServlet extends HttpServlet{
	
	private ProductAttrValueDAO dao = new ProductAttrValueDAO();
	InventoryDetailsDAO idao = new InventoryDetailsDAO();
	InventoryUpdateDAO iudao = new InventoryUpdateDAO();
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
	    String count = req.getParameter("count");
	    
		// 返回文本内容给前端
   	    resp.setContentType("text/plain");
   	    resp.setCharacterEncoding("UTF-8");
   	    PrintWriter out = resp.getWriter();
   	    
		String jg = dao.insertByPid(pid, arrs, price);
		if(jg.equals("新增成功")) {
			String newID = dao.getInsertedId().toString();
			if (newID!="-1") {
				int kcjg = idao.doInsert(newID, count);
				if (kcjg>0) {
					String IDid = idao.getInsertedId()+"";
					Admin admin = (Admin) req.getSession().getAttribute("admin");
					String admin_id = admin.getId()+"";
					//添加库存变动
					iudao.doInsert(IDid,"0","0",count, admin_id,"新增规格组合");			
				}
			}else {
				jg = "规格新增成功,库存新增错误";
			}
		}
   	    
   	    out.print(jg);
   	    
	}

}
