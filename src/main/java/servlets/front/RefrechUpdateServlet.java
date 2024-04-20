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
		int addid=Integer.parseInt(request.getParameter("id"));
		List<User_address_information> addlist=adddao.queryAdderid(addid);
		// 获得收货人
		String iname = request.getParameter("iname");
		// 获得手机号码
		String itel = request.getParameter("itel");
		// 获得省
		String sheng = request.getParameter("sheng");
		// 获得市
		String shi = request.getParameter("shi");
		// 获得县
		String xian = request.getParameter("xian");
		// 获得详细地方
		String xiangxi = request.getParameter("xiangxiadd");
		String checkboxValue = request.getParameter("default_input"); // 获取复选框的值

		int isDefault = 0; // 默认值为0

		// 判断复选框是否被选中
		if (checkboxValue != null && checkboxValue.equals("1")) {
			isDefault = 1; // 如果复选框被选中，将值设为1
		}
	}
}
