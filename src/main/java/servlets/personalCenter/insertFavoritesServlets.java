package servlets.personalCenter;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.FavoritesDAO;
import util.AliyunOssUtil;

@WebServlet("/PersonalCenter/JSP/insertFavoritesServlets")
public class insertFavoritesServlets extends HttpServlet{
	AliyunOssUtil alyoss = new AliyunOssUtil();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    int informationId = Integer.parseInt(req.getParameter("informationId"));//产品id
	    FavoritesDAO fa = new FavoritesDAO();
	    int uid = 1;
	    fa.selectShoppingData(uid);
	    System.out.println(fa.selectShoppingData(uid));
		int key = fa.insertFavorites(uid,informationId);
		
		
	}
}
