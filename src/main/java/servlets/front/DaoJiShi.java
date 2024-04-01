package servlets.front;

import java.io.IOException;
import java.util.concurrent.atomic.AtomicLong;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/front/DaoJiShi")
public class DaoJiShi extends HttpServlet{
    private final AtomicLong endTime = new AtomicLong(System.currentTimeMillis() + 60000); // 设定倒计时结束时间为当前时间后的60秒
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long remainingTime;
	      
        while ((remainingTime = endTime.get() - System.currentTimeMillis()) > 0) {
            try {
                Thread.sleep(1000); // 每秒更新一次倒计时
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        request.setAttribute("remainingTime", "Countdown finished!");
        request.getRequestDispatcher("home.jsp").forward(request, response);
	    
	}
}
