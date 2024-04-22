package servlets.background.goPages;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/background/gopages/goEditProductImg")
public class GoEditProductImg extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		String id = req.getParameter("id");
    	String typename = req.getParameter("type");
    	String img = req.getParameter("img");
    	String url = req.getParameter("url");
    	// 去除开头的 "images/commodity/"
    	String trimmedUrl = "";
    	String t = "";
    	if (url != null && url.startsWith("images/commodity/")) {
    	    trimmedUrl = url.substring("images/commodity/".length());
    	    t = trimmedUrl;
    	    // 去除尾部文件名部分
    	    int lastIndex = trimmedUrl.lastIndexOf('/');
    	    if (lastIndex != -1) {
    	        trimmedUrl = trimmedUrl.substring(0, lastIndex);
    	    }
    	    if (!trimmedUrl.contains("/")) {
    	    	trimmedUrl="";
    	    }
    	}
    	req.setAttribute("url", trimmedUrl);
    	
    	// 截取文件名部分
    	int lastIndex = url.lastIndexOf('/');
    	String filename = url.substring(lastIndex + 1);
    	req.setAttribute("filename", filename);
    	
    	// 截取文件后缀部分
    	int extensionIndex = filename.lastIndexOf('.');
    	String fileExtension = "";
    	if (extensionIndex != -1) {
    	    fileExtension = filename.substring(extensionIndex + 1);
    	}
    	req.setAttribute("suffix", fileExtension);
    	
    	// 去除文件后缀
    	if (extensionIndex != -1) {
    	    filename = filename.substring(0, extensionIndex);
    	}
    	
    	int type = 0;
    	if (typename.equals("缩略图")) {
    		type=0;
		}else if(typename.equals("大图")){
			type=1;
		}else if(typename.equals("介绍图")){
			type=2;
		}
    	
    	req.setAttribute("id", id);
    	req.setAttribute("name", filename);
    	
    	req.setAttribute("oldurl", url);
    	
    	req.setAttribute("type", type);
    	req.setAttribute("img", img);
    	
    	
    	
		req.getRequestDispatcher("/background/pages/product/function/images/EditProductImg.jsp").forward(req, resp);

	}
}
