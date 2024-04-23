package servlets.personalCenter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.VerifyPhoneDAO;
@WebServlet("/PersonalCenter/JSP/VerifyPhoneServlets")
public class VerifyPhoneServlets extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String phonenum = req.getParameter("phone");
		
		VerifyPhoneDAO ver = new VerifyPhoneDAO();
		boolean results =  ver.isPhoneNumberExist(phonenum).get(0);
		if(results) {
            System.out.println("号码正确");
            resp.getWriter().write("true");
        } else {
            System.out.println("号码错误");
            resp.getWriter().write("false");
        }
	}
}
