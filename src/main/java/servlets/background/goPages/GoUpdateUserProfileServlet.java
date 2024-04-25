package servlets.background.goPages;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/background/gopages/goEditUserProfile")
public class GoUpdateUserProfileServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("UTF-8");
		
		String id = req.getParameter("id");
		String account = req.getParameter("account");
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		String mailbox = req.getParameter("mailbox");
		String address = req.getParameter("address");
		String birthday = req.getParameter("birthday");
		
		req.setAttribute("id", id);
		req.setAttribute("account", account);
		req.setAttribute("name", name);
		req.setAttribute("phone", phone);
		req.setAttribute("mailbox", mailbox);
		req.setAttribute("address", address);
		req.setAttribute("birthday", birthday);

		req.getRequestDispatcher("/background/pages/user/function/profile/update.jsp").forward(req, resp);
	}
}
