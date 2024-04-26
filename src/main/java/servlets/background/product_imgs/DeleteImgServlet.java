package servlets.background.product_imgs;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ProductImageUrlDAO;
import entity.Admin;
import util.AliyunOssUtil;

@WebServlet("/background/pages/function/product_imgs/delete")
public class DeleteImgServlet extends HttpServlet{
	ProductImageUrlDAO dao = new ProductImageUrlDAO();
	AliyunOssUtil alyoss = new AliyunOssUtil();
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("UTF-8");
		
		String id = req.getParameter("id");
		String url = req.getParameter("url");
		
		
	    Admin admin = (Admin) req.getSession().getAttribute("admin");
		String adminType = "4";
	    if (admin != null) {
			adminType=admin.getAdminTypeId()+"";
		}
	    String jg = "";
	    if (adminType.equals("6")||adminType.equals("1")) {
	    	int sqljg = dao.deleteById(id);
		    if (sqljg == -1451) {
		    	jg = "1451";
			}else if (sqljg>0) {
				jg = "true";
			}	   
		    if (sqljg == -1451) {
		    	jg = "1451";
			}else if (sqljg>0) {
				//删除云端旧图片
			    alyoss.delete(url);
				jg = "true";
			}
		 }else {
			jg="权限不足!";
		}
	    
		
		resp.getWriter().print(jg);
		
	}

}
