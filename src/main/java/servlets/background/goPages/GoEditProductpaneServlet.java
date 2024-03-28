package servlets.background.goPages;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/background/gopages/goEditProductpane")
public class GoEditProductpaneServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		System.err.println(req.getParameter("product"));
//		req.setAttribute("product", req.getParameterValues("product"));
//		req.getRequestDispatcher("/background/pages/function/product_information/EditProductpanel.jsp").forward(req, resp);
	}
}
