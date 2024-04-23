package servlets.front;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import DAO.ProductSpecificationDAO;
import DAO.ProductsClassDAO;
import DAO.Products_informationDAO;
import DAO.User_address_informationDAO;
import entity.ProductSpecification;
import entity.ProductsClass;
import entity.Products_information;
import entity.User_address_information;

@WebServlet(urlPatterns = "/front/jsp/DingdanServelt")
public class DingdanServelt extends HttpServlet{
	ProductsClassDAO classDAO=new ProductsClassDAO();
	Products_informationDAO infordao=new Products_informationDAO();
	Products_informationDAO ifDao=new Products_informationDAO();
	//地址
	User_address_informationDAO adddao=new User_address_informationDAO();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//获取a标签的id
		int id=Integer.parseInt(request.getSession().getAttribute("productid").toString());
		System.out.println(id);
		//查询商品规格内容图片
		List<Products_information> pslist = infordao.queryInforurlone(id);
		//存储对应值
		HttpSession session = request.getSession();
		session.setAttribute("productid",id);
		session.setAttribute("psList", pslist);
		
		 // 获取 URL 参数
        String urlParams = request.getQueryString();

        // 解析 URL 参数为 Map
        Map<String, String[]> paramMap = request.getParameterMap();

     // 获取名为 "data" 的参数值
        String[] jsonDataArray = paramMap.get("data");
        String jsonData = null;
        if (jsonDataArray != null && jsonDataArray.length > 0) {
            jsonData = jsonDataArray[0];
            jsonData = jsonData.replace("[\"\",", "[").replace(",\"\"]", "]");
        }
     

        // 将 JSON 数据设置为请求属性
		session.setAttribute("jsonData", jsonData);
        
     // 获取名为 "price" 的参数值
        String[] jsonpriceArray = paramMap.get("price");
        String jsonprice = null;
        if (jsonpriceArray != null && jsonpriceArray.length > 0) {
            jsonprice = jsonpriceArray[0];
        }

        // 将 JSON 数据设置为请求属性
		session.setAttribute("jsonprice", jsonprice);
        
        // 获取名为 "num" 的参数值
        String[] jsonNumArray = paramMap.get("num");
        String jsonNum = null;
        if (jsonNumArray != null && jsonNumArray.length > 0) {
        	jsonNum = jsonNumArray[0];
        }

        // 将 JSON 数据设置为请求属性
		session.setAttribute("jsonNum", jsonNum);
		
		 // 获取名为 "infname" 的参数值
        String[] jsonnameArray = paramMap.get("infname");
        String jsonname = null;
        if (jsonnameArray != null && jsonnameArray.length > 0) {
        	jsonname = jsonnameArray[0];
        }

        // 将 JSON 数据设置为请求属性
		session.setAttribute("jsonname", jsonname);
		//查找图片信息缩略图
				List<Products_information> listurl=ifDao.queryInforurl(id);
				request.setAttribute("listurl", listurl);
		// 查询类别
				List<ProductsClass> leilist = classDAO.getProductsClasses();
				request.setAttribute("leilist", leilist);
		
		request.getRequestDispatcher("dingdan.jsp").forward(request, response);
	}
}
