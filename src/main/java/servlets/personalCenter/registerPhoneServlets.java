package servlets.personalCenter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.VerifyPhoneDAO;
@WebServlet("/PersonalCenter/JSP/registerPhoneServlets")
public class registerPhoneServlets extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String zcphone = req.getParameter("zcPhone");
		VerifyPhoneDAO ver = new VerifyPhoneDAO();
		boolean zc = ver.isPhoneNumberExist(zcphone).get(0);
		if(zc) {
            System.out.println("号码正确");
            resp.getWriter().write("true");
        } else {
            System.out.println("号码错误");
            resp.getWriter().write("false");
        }
	}
}
