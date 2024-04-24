package servlets.front;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class PageTag extends SimpleTagSupport {
	private String controller1;//Web组件名
	private int curpage1;//当前页
	private int pagesize1;//页大小
	private int total1;//总记录数
	private String where1="";//条件参数|其他请求参数
	
	public String getController1() {
		return controller1;
	}

	public void setController1(String controller1) {
		this.controller1 = controller1;
	}

	public int getCurpage1() {
		return curpage1;
	}

	public void setCurpage1(int curpage1) {
		this.curpage1 = curpage1;
	}

	public int getPagesize1() {
		return pagesize1;
	}

	public void setPagesize1(int pagesize1) {
		this.pagesize1 = pagesize1;
	}

	public int getTotal1() {
		return total1;
	}

	public void setTotal1(int total1) {
		this.total1 = total1;
	}

	public String getWhere1() {
		return where1;
	}

	public void setWhere1(String where1) {
		this.where1 = where1;
	}

	public PageTag() {
		super();
	}

	/**
	 * @param controller1
	 * @param curpage1
	 * @param pagesize1
	 * @param total1
	 * @param where1
	 */
	public PageTag(String controller1, int curpage1, int pagesize1, int total1, String where1) {
		super();
		this.controller1 = controller1;
		this.curpage1 = curpage1;
		this.pagesize1 = pagesize1;
		this.total1 = total1;
		this.where1 = where1;
	}
	
	@Override
	public void doTag() throws JspException, IOException {
		super.doTag();
		
		String url="<a href='%s?curpage=%d&pagesize=%d&%s'>%s</a>";
		//第一页
		String first=String.format(url, this.controller1,1,this.pagesize1,this.where1,"第一页");
		//上一页
		String pre=null;
		if (this.curpage1==1) {
			pre = "<a href=javascript:alert('已经是第一页');>上一页</a>";
		}else {
			pre=String.format(url, this.controller1,this.curpage1-1,this.pagesize1,this.where1,"上一页");
		}
		//下一页
		String next = null;
		if(this.curpage1 == this.pages()) {
			next = "<a href=javascript:alert('已经是最后一页');>下一页</a>";
		}else {
			next = String.format(url, this.controller1, this.curpage1 + 1, this.pagesize1, this.where1, "下一页");
		}
		//最后一页
		String last=String.format(url, this.controller1,this.pages(),this.pagesize1,this.where1,"最后一页");
		
		String info=String.format("第%d页/共%d页 共%d条记录", this.curpage1,this.pages(),this.total1);
		int totalPages =(total1 + pagesize1 - 1) / pagesize1;
		String xl="";
		for(int i=1;i<=totalPages;i++) {
		    if (i==this.curpage1) {
		        xl += String.format("<option value='%s' selected>%d</option>", String.format("%s?curpage=%d&pagesize=%d&%s", this.controller1, i, this.pagesize1, this.where1), i);
		    } else {
		        xl += String.format("<option value='%s'>%d</option>", String.format("%s?curpage=%d&pagesize=%d&%s", this.controller1, i, this.pagesize1, this.where1), i);
		    }
		}
		String select="<select onchange='javascript:window.location.href=this.value'>"+xl+"</select>";
		
		//拼出最后的结果
		StringBuffer sb=new StringBuffer();
		sb.append("<div class='p'>").append(first).append(pre).append(next).append(last).append(select).append(info).append("</div>");
		JspWriter out=this.getJspContext().getOut();
		out.print(sb);
		
	}

	private int pages() {
		return (this.total1-1)/this.pagesize1+1;
	}
}
