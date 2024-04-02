package servlets.background.product_detailed;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/background/pages/function/product_detailed/selWhere")
public class SelectWhereServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("UTF-8");
		
		String minPrice = req.getParameter("minPrice");
		String maxPrice = req.getParameter("maxPrice");
		
		Enumeration<String> parameterNames = req.getParameterNames();
	        while (parameterNames.hasMoreElements()) {
	            String paramName = parameterNames.nextElement();
	            if (paramName.startsWith("spec_")) {
	                String paramValue = req.getParameter(paramName);
	                // 在这里处理获取到的参数值
	                System.out.println(paramValue);
	            }
	        }
	}
}
