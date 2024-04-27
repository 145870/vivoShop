package servlets.front;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.User_address_informationDAO;
import entity.User_address_information;

@WebServlet(urlPatterns = "/front/jsp/RefrechUpdateServlet")
public class RefrechUpdateServlet extends HttpServlet {
	User_address_informationDAO adddao=new User_address_informationDAO();
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("id"));
		int addid=Integer.parseInt(request.getParameter("id"));
		System.out.println(addid+"svb");
		// 获得收货人
		 // 获取收货人姓名
        String sname = request.getParameter("sname");
        
        // 获取手机号码
        String stel = request.getParameter("stel");
        
        // 获取收货地址
        String ssheng = request.getParameter("ssheng");
        String sshi = request.getParameter("sshi");
        String sxian = request.getParameter("sxian");
        String sxiangxiadd = request.getParameter("sxiangxiadd");
        
        // 获取是否设为默认地址
        String sdefault_input = request.getParameter("mo");

        // 打印获取到的信息（示例）
        System.out.println("收货人姓名: " + sname);
        System.out.println("手机号码: " + stel);
        System.out.println("收货地址: " + ssheng + sshi + sxian + sxiangxiadd);
        System.out.println("是否设为默认地址: " + sdefault_input);

		int isDefault = 0; // 默认值为0

		// 判断复选框是否被选中
		if (sdefault_input != null && sdefault_input.equals("1")) {
			isDefault = 1; // 如果复选框被选中，将值设为1
		}
		Integer re=adddao.updateadd(sname, stel, ssheng, sshi, sxian, sxiangxiadd, isDefault, addid);

		 //response.sendRedirect("dingdan.jsp");
	}
}
