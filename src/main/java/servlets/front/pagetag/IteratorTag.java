package servlets.front.pagetag;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class IteratorTag extends SimpleTagSupport{
	private Collection collection;
	private String item;
	public Collection getCollection() {
		return collection;
	}
	public void setCollection(Collection collection) {
		this.collection = collection;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	/**
	 * @param collection
	 * @param item
	 */
	public IteratorTag(Collection collection, String item) {
		super();
		this.collection = collection;
		this.item = item;
	}
	/**
	 * 
	 */
	public IteratorTag() {
		super();
	}
	@Override
	public void doTag() throws JspException, IOException {
		super.doTag();

		// 循环遍历集合

		for (Object obj : this.collection) {
			this.getJspContext().setAttribute(this.item, obj);
			// Invoke the body of the tag to output the contents for each item
			this.getJspBody().invoke(null);
		}

	}
	
}
