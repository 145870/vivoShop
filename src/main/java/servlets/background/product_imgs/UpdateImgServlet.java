package servlets.background.product_imgs;

import java.io.ByteArrayInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.Iterator;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import DAO.ProductImageUrlDAO;
import util.AliyunOssUtil;

@WebServlet("/background/pages/function/product_imgs/update")
public class UpdateImgServlet extends HttpServlet{
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
		
		String oldurl = req.getParameter("oldurl");
		String id = req.getParameter("id");
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
	    String sqlJG = dao.updateById(id, type, urlName);
	    //存储图片到云端
	    
	    if (isImageUrl(imagesUrl)) {
			imagesUrl = getImageAsBase64(imagesUrl);
		}
	    // 解析base64编码的图片数据
	    String[] parts = imagesUrl.split(",");
	    String imageString;
	    if (parts.length>1) {
	    	imageString = parts[1];
		}else {
			imageString = parts[0];
		}
	    
	    byte[] imageBytes = Base64.getDecoder().decode(imageString);
	            
	    // 创建 InputStream
	    InputStream inputStream = new ByteArrayInputStream(imageBytes);
	    
	    if (sqlJG.equals("修改成功")) {
	    	//删除云端旧图片
		    alyoss.delete(oldurl);
		    //上传到云端
		    alyoss.upload(urlName, inputStream);
		}
	    
	    PrintWriter out = resp.getWriter();
        out.print(sqlJG);
	}
	public static boolean isImageUrl(String url) {
        // 检查 URL 是否以指定域名开头，并且协议是 HTTPS
        String targetDomain = "https://vivosp.oss-cn-guangzhou.aliyuncs.com";
        return url.startsWith(targetDomain) && url.startsWith("https://");
    }
	public static String getImageAsBase64(String imageUrl) {
        try {
            CloseableHttpClient httpClient = HttpClients.createDefault();
            HttpGet httpGet = new HttpGet(imageUrl);
            HttpResponse response = httpClient.execute(httpGet);
            byte[] imageBytes = EntityUtils.toByteArray(response.getEntity());
            httpClient.close();
            return Base64.getEncoder().encodeToString(imageBytes);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
