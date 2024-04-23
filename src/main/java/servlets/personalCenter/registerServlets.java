package servlets.personalCenter;

import java.io.IOException;
import java.util.Random;

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
		
			try {
				Random ran = new Random();
		        // 生成一个10000以内的随机整数
		        int randomNumber = ran.nextInt(9000)+1000;
				resp.getWriter().write(randomNumber+"");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				// 返回异常信息给客户端
				resp.getWriter().write("Error occurred: " + e.getMessage());
			}
		}
	}


