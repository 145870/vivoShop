package servlets.background.goPages;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/background/gopages/goUpdateProductSpecifications")
public class GoUpdateProductSpecificationsServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String pid = req.getParameter("pid");
		String psid = req.getParameter("psid");
		String psname = req.getParameter("psname");
    	String[] psvals = req.getParameter("psvals").split(",");
    	String vals = "";
    	for(String t:psvals) {
    		vals += t+"\n";
    	}

    	req.setAttribute("pid", pid);
    	req.setAttribute("psid", psid);
    	req.setAttribute("psname", psname);
    	req.setAttribute("vals", vals.trim());
    	
		req.getRequestDispatcher("/background/pages/specifications/function/updateProductSprcifications.jsp").forward(req, resp);
		
	}
}
