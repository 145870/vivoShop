package entity;

import java.util.Date;

public class ProductImageUrl {
	 private Long id;
	 private Integer informationId;
	 private Integer className;
	 private String url;
	 private Date createTime;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Integer getInformationId() {
		return informationId;
	}
	public void setInformationId(Integer informationId) {
		this.informationId = informationId;
	}
	public Integer getClassName() {
		return className;
	}
	public void setClassName(Integer className) {
		this.className = className;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public ProductImageUrl() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductImageUrl(Long id, Integer informationId, Integer className, String url, Date createTime) {
		super();
		this.id = id;
		this.informationId = informationId;
		this.className = className;
		this.url = url;
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		return "ProductImageUrl [id=" + id + ", informationId=" + informationId + ", className=" + className + ", url="
				+ url + ", createTime=" + createTime + "]";
	}
	 
}
