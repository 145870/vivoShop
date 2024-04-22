package servlets.personalCenter;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PersonalCenter/JSP/registerServlets")
public class registerServlets extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			req.setCharacterEncoding("utf-8");
			String phone = req.getParameter("phone");
			
			//获取手机验证码
		
			try {
				String yzm = Sample.huoquduanxin(phone);
				resp.getWriter().write(yzm);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				// 返回异常信息给客户端
				resp.getWriter().write("Error occurred: " + e.getMessage());
			}
		}
	}


