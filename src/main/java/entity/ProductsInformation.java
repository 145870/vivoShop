package entity;

import java.util.Date;

public class ProductsInformation {
	 private Long id;
	 private String informationName;
	 private String description;
	 private Integer classId;
	 private Integer informationStatus;
	 private Integer isLast;
	 private Date createTime;
	 private Date shelvesTime;
	 
	 private String className;
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public ProductsInformation(Long id, String informationName, String description, Integer classId,
			Integer informationStatus, Integer isLast, Date createTime, Date shelvesTime) {
		super();
		this.id = id;
		this.informationName = informationName;
		this.description = description;
		this.classId = classId;
		this.informationStatus = informationStatus;
		this.isLast = isLast;
		this.createTime = createTime;
		this.shelvesTime = shelvesTime;
	}
	public ProductsInformation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getInformationName() {
		return informationName;
	}
	public void setInformationName(String informationName) {
		this.informationName = informationName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getClassId() {
		return classId;
	}
	public void setClassId(Integer classId) {
		this.classId = classId;
	}
	public Integer getInformationStatus() {
		return informationStatus;
	}
	public void setInformationStatus(Integer informationStatus) {
		this.informationStatus = informationStatus;
	}
	public Integer getIsLast() {
		return isLast;
	}
	public void setIsLast(Integer isLast) {
		this.isLast = isLast;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getShelvesTime() {
		return shelvesTime;
	}
	public void setShelvesTime(Date shelvesTime) {
		this.shelvesTime = shelvesTime;
	}
	 
	public static void main(String[] args) {
		System.out.println(1);
	}
	@Override
	public String toString() {
		return "ProductsInformation [id=" + id + ", informationName=" + informationName + ", description=" + description
				+ ", classId=" + classId + ", informationStatus=" + informationStatus + ", isLast=" + isLast
				+ ", createTime=" + createTime + ", shelvesTime=" + shelvesTime + ", className=" + className + "]";
	}
	
	 
}
