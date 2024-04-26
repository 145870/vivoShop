package servlets.background.product_imgs;

import java.io.ByteArrayInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Base64;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import com.google.gson.Gson;

import DAO.ProductImageUrlDAO;
import entity.Admin;
import util.AliyunOssUtil;

@WebServlet("/background/pages/function/product_imgs/update")
@MultipartConfig()
public class UpdateImgServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ProductImageUrlDAO dao = new ProductImageUrlDAO();
	AliyunOssUtil alyoss = new AliyunOssUtil();

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

		//获取文件
		Part p = null;
		if (req.getParameter("upType")==null) {
			p = req.getPart("file");
		}
		String type = req.getParameter("type");
		
		//文件属性
		String cp;
		//文件名
		String fileName;
		//文件后缀
		String endName="png";
		if (p!=null) {
			cp = p.getHeader("content-disposition");
			fileName = cp.split(";")[2].split("=")[1].replaceAll("\"", "");
			fileName.substring(fileName.lastIndexOf('.'));
		}
		
		
		//最后存储的路径
		String urlName = "images/commodity/" + url + "/" + name + endName;
		if (url=="") {
			urlName = "images/commodity/" + name + endName;
		}

	    //先执行sql语句
		Admin admin = (Admin) req.getSession().getAttribute("admin");
		String adminType = "4";
	    if (admin != null) {
			adminType=admin.getAdminTypeId()+"";
		}
	    String jg = "";
	    if (adminType.equals("6")||adminType.equals("1")) {
	    	jg = dao.updateById(id, type, urlName);    
		 }else {
			jg="权限不足!";
		}
	    //存储图片到云端
	    if (jg.equals("修改成功")) {
	    	if (p==null) {
	    		InputStream oldImg = alyoss.downloadToInputStream(oldurl);
	    		//删除云端旧图片
			    alyoss.delete(oldurl);
			    //上传到云端
			    alyoss.upload(urlName, oldImg);
			}else {
				//删除云端旧图片
			    alyoss.delete(oldurl);
			    //上传到云端
			    alyoss.upload(urlName, p.getInputStream());
			}
	    	
		}
	    
	    PrintWriter out = resp.getWriter();
	    Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", 0);
		map.put("msg",jg);
		map.put("data", new HashMap<>()); 
		String jsonOutput = new Gson().toJson(map);
		out.print(jsonOutput);
	}

}
