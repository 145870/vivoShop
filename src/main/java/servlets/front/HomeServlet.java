package servlets.front; 

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProductsClassDAO;
import DAO.Products_images_urlDAO;
import DAO.Products_informationDAO;
import entity.ProductsClass;
import entity.Products_images_url;
import entity.Products_information;

@WebServlet(urlPatterns = "/front/jsp/HomeServlet")
public class HomeServlet extends HttpServlet {
	ProductsClassDAO classDAO=new ProductsClassDAO();
	Products_informationDAO infdao=new Products_informationDAO();
	Products_images_urlDAO urldao=new Products_images_urlDAO();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//轮播图
		List<Products_images_url> lunlist=urldao.queryInforLun();
		request.setAttribute("lunlist", lunlist);
		//Y系列
		List<ProductsClass> classlistY=classDAO.queryclassY();
		//X系列
		List<ProductsClass> classlistX=classDAO.queryclass();
		//S系列
		List<ProductsClass> classlistS=classDAO.queryclassS();
		//iQOO系列
		List<ProductsClass> classlistiQOO=classDAO.queryclassiQOO();
		//智能硬件
		List<ProductsClass> classlistZN=classDAO.queryclassZN();
		// 查询类别
		List<ProductsClass> leilist = classDAO.getProductsClasses();
		request.setAttribute("leilist", leilist);
		//查询新品两个
		List<Products_information> xinlist=infdao.queryInforPriceTwo();
		request.setAttribute("xinlist", xinlist);
		//查询智能配件
		List<Products_information> peilist=infdao.queryInforPricePei();
		request.setAttribute("peilist", peilist);
		request.setAttribute("listY", classlistY);
		request.setAttribute("listX", classlistX);
		request.setAttribute("listS", classlistS);
		request.setAttribute("listiQOO", classlistiQOO);
		request.setAttribute("listZN", classlistZN);
		request.getRequestDispatcher("home.jsp").forward(request, response);
	}
}
