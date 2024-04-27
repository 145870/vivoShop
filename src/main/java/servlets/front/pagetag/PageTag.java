package servlets.front.pagetag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class PageTag extends SimpleTagSupport {
	private String controller;//Web组件名
	private int curpage;//当前页
	private int pagesize;//页大小
	private int total;//总记录数
	private String where="";//条件参数|其他请求参数
	public String getController() {
		return controller;
	}
	public void setController(String controller) {
		this.controller = controller;
	}
	public int getCurpage() {
		return curpage;
	}
	public void setCurpage(int curpage) {
		this.curpage = curpage;
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getWhere() {
		return where;
	}
	public void setWhere(String where) {
		this.where = where;
	}
	private int pages() {
		return (this.total-1)/this.pagesize+1;
	}
	
	@Override
	public void doTag() throws JspException, IOException {
		super.doTag();
		
		String url="<a href='%s?curpage=%d&pagesize=%d&%s'>%s</a>";
		//第一页
		String first=String.format(url, this.controller,1,this.pagesize,this.where,"第一页");
		//上一页
		String pre=null;
		if (this.curpage==1) {
			pre = "<a href=javascript:alert('已经是第一页');><svg t=\"1714055563481\" class=\"icon\" viewBox=\"0 0 1024 1024\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" p-id=\"5051\" width=\"20\" height=\"20\"><path d=\"M553.38 726.62L372.69 545.94c-18.72-18.72-18.72-49.16 0-67.88l180.69-180.69c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25L429.25 512l169.38 169.38c12.5 12.5 12.5 32.75 0 45.25-6.25 6.25-14.44 9.38-22.62 9.38s-16.39-3.13-22.63-9.39zM417.62 523.31h0.31-0.31z\" fill=\"#333333\" p-id=\"5052\"></path><path d=\"M512 128c211.74 0 384 172.26 384 384S723.74 896 512 896 128 723.74 128 512s172.26-384 384-384m0-64C264.58 64 64 264.58 64 512s200.58 448 448 448 448-200.58 448-448S759.42 64 512 64z\" fill=\"#333333\" p-id=\"5053\"></path></svg></a>";
		}else {
			pre=String.format(url, this.controller,this.curpage-1,this.pagesize,this.where,"<svg t=\"1714055563481\" class=\"icon\" viewBox=\"0 0 1024 1024\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" p-id=\"5051\" width=\"20\" height=\"20\"><path d=\"M553.38 726.62L372.69 545.94c-18.72-18.72-18.72-49.16 0-67.88l180.69-180.69c12.5-12.5 32.75-12.5 45.25 0s12.5 32.75 0 45.25L429.25 512l169.38 169.38c12.5 12.5 12.5 32.75 0 45.25-6.25 6.25-14.44 9.38-22.62 9.38s-16.39-3.13-22.63-9.39zM417.62 523.31h0.31-0.31z\" fill=\"#333333\" p-id=\"5052\"></path><path d=\"M512 128c211.74 0 384 172.26 384 384S723.74 896 512 896 128 723.74 128 512s172.26-384 384-384m0-64C264.58 64 64 264.58 64 512s200.58 448 448 448 448-200.58 448-448S759.42 64 512 64z\" fill=\"#333333\" p-id=\"5053\"></path></svg>");
		}
		//下一页
		String next = null;
		if(this.curpage == this.pages()) {
			next = "<a style='margin-right: 10px;' href=javascript:alert('已经是最后一页');><svg t=\"1714055984009\" class=\"icon\" viewBox=\"0 0 1024 1024\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" p-id=\"8074\" width=\"20\" height=\"20\"><path d=\"M448 736c-8.19 0-16.38-3.12-22.62-9.38-12.5-12.5-12.5-32.75 0-45.25L594.75 512 425.38 342.62c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0l180.69 180.69c18.72 18.72 18.72 49.16 0 67.88l-180.7 180.68c-6.24 6.26-14.43 9.38-22.62 9.38z m158.06-212.69h0.31-0.31z\" fill=\"#333333\" p-id=\"8075\"></path><path d=\"M512 128c211.74 0 384 172.26 384 384S723.74 896 512 896 128 723.74 128 512s172.26-384 384-384m0-64C264.58 64 64 264.58 64 512s200.58 448 448 448 448-200.58 448-448S759.42 64 512 64z\" fill=\"#333333\" p-id=\"8076\"></path></svg></a>";
		}else {
			next = String.format(url, this.controller, this.curpage + 1, this.pagesize, this.where, "<svg t=\"1714055984009\" class=\"icon\" viewBox=\"0 0 1024 1024\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\" p-id=\"8074\" width=\"20\" height=\"20\"><path d=\"M448 736c-8.19 0-16.38-3.12-22.62-9.38-12.5-12.5-12.5-32.75 0-45.25L594.75 512 425.38 342.62c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0l180.69 180.69c18.72 18.72 18.72 49.16 0 67.88l-180.7 180.68c-6.24 6.26-14.43 9.38-22.62 9.38z m158.06-212.69h0.31-0.31z\" fill=\"#333333\" p-id=\"8075\"></path><path d=\"M512 128c211.74 0 384 172.26 384 384S723.74 896 512 896 128 723.74 128 512s172.26-384 384-384m0-64C264.58 64 64 264.58 64 512s200.58 448 448 448 448-200.58 448-448S759.42 64 512 64z\" fill=\"#333333\" p-id=\"8076\"></path></svg>");
		}
		//最后一页
		String last=String.format(url, this.controller,this.pages(),this.pagesize,this.where,"最后一页");
		
		String info="<span style='    font-size: 25px;'>"+String.format("&nbsp;%d / %d ", this.curpage,this.pages())+"</span>";
		String gong="<span style='margin-left:10px;'>共"+"<lable id='count'>"+String.format("%d", this.total)+"</lable>"+"条记录</span>";
		int totalPages =(total + pagesize - 1) / pagesize;
		String xl="";
		for(int i=1;i<=totalPages;i++) {
		    if (i==this.curpage) {
		        xl += String.format("<option value='%s' selected>%d</option>", String.format("%s?curpage=%d&pagesize=%d&%s", this.controller, i, this.pagesize, this.where), i);
		    } else {
		        xl += String.format("<option value='%s'>%d</option>", String.format("%s?curpage=%d&pagesize=%d&%s", this.controller, i, this.pagesize, this.where), i);
		    }
		}
		String select="<select style='width: 37px;border: none;margin-left: 20px;' onchange='javascript:window.location.href=this.value'>"+xl+"</select>";
		
		//拼出最后的结果
		StringBuffer sb=new StringBuffer();
		sb.append("<div class='p'>").append(pre).append(info).append(next).append(gong).append("</div>");
		JspWriter out=this.getJspContext().getOut();
		out.print(sb);
		
	}
}
