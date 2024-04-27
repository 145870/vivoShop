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

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import DAO.ProductSpecificationDAO;
import DAO.Product_attr_valsDAO;
import DAO.ProductsClassDAO;
import DAO.Products_informationDAO;
import DAO.User_address_informationDAO;
import entity.OrdersDetails;
import entity.ProductSpecification;
import entity.Product_attr_vals;
import entity.ProductsClass;
import entity.Products_information;
import entity.User_address_information;

@WebServlet(urlPatterns = "/front/jsp/DingdanServelt")
public class DingdanServelt extends HttpServlet {
	ProductsClassDAO classDAO = new ProductsClassDAO();
	Products_informationDAO infordao = new Products_informationDAO();
	Products_informationDAO ifDao = new Products_informationDAO();
	Product_attr_valsDAO pavDao = new Product_attr_valsDAO();
	// 地址
	User_address_informationDAO adddao = new User_address_informationDAO();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		//需要展示的list
		List<OrdersDetails> showList = new ArrayList<OrdersDetails>();

		String jsonArrayString = request.getParameter("jsonData");
		ObjectMapper mapper = new ObjectMapper();
		JsonNode jsonArray = mapper.readTree(jsonArrayString);
		
		List<String> pavidList=new ArrayList<String>();
		
		int count=0;
		Double sumPrices=0.0;
		// 遍历 JSON 数组
        for (JsonNode jsonNode : jsonArray) {
            // 获取 JSON 对象中的值
            String pavid = jsonNode.get("pavid").asText();
            pavidList.add(pavid);
            int num = jsonNode.get("num").asInt();
            
            count+=num;
            
            Product_attr_vals pav = pavDao.getAttr_valsAndUrlById(pavid);
            //获取商品图片
            String imgURL=pav.getImageUrl();
            //获取单价
            Double price = pav.getSale_amount();
            //计算总价
            Double sumPrice = price*num;
            sumPrices+=sumPrice;
            
            OrdersDetails od = new OrdersDetails();
            od.setSaleAmount(price);
            od.setImgURL(imgURL);
            od.setSumPrice(sumPrice);
            od.setpName(pav.getInformation_name());
            od.setQuantity(num);
            
            
            
            String val[] = pav.getAttr_vals();
            String vals="";
            for (int i = 0; i < val.length; i++) {
            	vals += val[i];
    		    // 检查是否是最后一个元素
    		    if (i < val.length - 1) {
    		    	vals += ",";
    		    }
    		}
            
            od.setPavVals(vals);
            
            showList.add(od);
        }
        //上传总数量和总价
        request.setAttribute("count", count);
        request.setAttribute("sumPrices", sumPrices);
        
        request.setAttribute("odList",showList);
        HttpSession session = request.getSession();
		session.setAttribute("count", count);

		request.getRequestDispatcher("dingdan.jsp").forward(request, response);
	}
}
