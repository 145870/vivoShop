package servlets.personalCenter;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AddressDAO;
import entity.Address;
@WebServlet("/PersonalCenter/JSP/UpdateAddressServlets")
public class UpdateAddressServlets extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AddressDAO a = new AddressDAO();
		List<Address> list = a.selectAddress(1);//传入测试数据用户id = 1
		
	}
}
