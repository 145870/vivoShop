package servlets.background.product_imgs;

import java.io.ByteArrayInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProductImageUrlDAO;
import util.AliyunOssUtil;

@WebServlet("/background/pages/function/product_imgs/add")
public class AddImgServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ProductImageUrlDAO dao = new ProductImageUrlDAO();
	AliyunOssUtil alyoss = new AliyunOssUtil();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("UTF-8");
		
		String pid = req.getSession().getAttribute("productid").toString();
		
		String url = req.getParameter("url");
		if (url==null) {
			url="";
		}else {
			// 检查第一个字符是否是斜杠
			if (url.startsWith("/")) {
			    url = url.substring(1); // 删除第一个斜杠
			}

			// 检查最后一个字符是否是斜杠
			if (url.endsWith("/")) {
			    url = url.substring(0, url.length() - 1); // 删除最后一个斜杠
			}
		}
		
		String name = req.getParameter("name");
		if (name == null || name.isEmpty()) {
		    name = String.valueOf(System.currentTimeMillis()) + new Random().nextInt(100);
		}
		String suffix = req.getParameter("suffix");
		String type = req.getParameter("type");
		String imagesUrl = req.getParameter("imageUrl");

	    //最后存储的路径
	    String urlName = "images/commodity/" + url + "/" + name+ "." + suffix;
	    if (url=="") {
	    	urlName = "images/commodity/" + name+ "." + suffix;
		}
	    //先执行sql语句
	    String sqlJG = dao.doInsertByPid(pid, type, urlName);
	    
	    //存储图片到云端
	    // 解析base64编码的图片数据
	    String[] parts = imagesUrl.split(",");
	    String imageString = parts[1];
	    byte[] imageBytes = Base64.getDecoder().decode(imageString);
	            
	    // 创建 InputStream
	    InputStream inputStream = new ByteArrayInputStream(imageBytes);
	    //上传到云端
	    alyoss.upload(urlName, inputStream);
	    
	    PrintWriter out = resp.getWriter();
        out.print(sqlJG);
	}
}
