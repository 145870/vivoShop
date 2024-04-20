package servlets.front;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.User_address_informationDAO;

@WebServlet(urlPatterns = "/front/jsp/InsertAddServlet")
public class InsertAddServlet extends HttpServlet {
	User_address_informationDAO adddao=new User_address_informationDAO();
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		int id=Integer.parseInt(request.getSession().getAttribute("productid").toString());
		//获得收货人
		String iname=request.getParameter("iname");
		//获得手机号码
		String itel=request.getParameter("itel");
		//获得省
		String sheng=request.getParameter("sheng");
		//获得市
		String shi=request.getParameter("shi");
		//获得县
		String xian=request.getParameter("xian");
		//获得详细地方
		String xiangxi=request.getParameter("xiangxiadd");
		String checkboxValue = request.getParameter("default_input"); // 获取复选框的值

		 int isDefault = 0; // 默认值为0

	        // 判断复选框是否被选中
	        if (checkboxValue != null && checkboxValue.equals("1")) {
	            isDefault = 1; // 如果复选框被选中，将值设为1
	        }
	    
	     // 检查参数值是否为空
	        if (iname == null || iname.isEmpty() || itel == null || itel.isEmpty() ||
	            sheng == null || sheng.isEmpty() || shi == null || shi.isEmpty() ||
	            xian == null || xian.isEmpty() || xiangxi == null || xiangxi.isEmpty()) {
	            // 如果有任何一个参数为空，则返回错误信息
	            response.getWriter().println("请填写完整的收货信息");
	        } else {
	        	//保存地址
	    		adddao.insertAdd(id, iname, itel, sheng, shi, xian, xiangxi, isDefault);
	            response.getWriter().println("收货信息保存成功");
	        }
		
		
		 response.sendRedirect("dingdan.jsp");
	}
}
