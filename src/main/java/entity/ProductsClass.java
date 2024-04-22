package entity;

public class ProductsClass {
	  private Long id;
	  private String className;
	public ProductsClass(Long id, String className) {
		super();
		this.id = id;
		this.className = className;
	}
	public ProductsClass() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	  
}
