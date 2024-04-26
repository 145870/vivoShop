package entity;

public class AdminType {
	private Long id;
	private String typeName;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public AdminType() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminType(Long id, String typeName) {
		super();
		this.id = id;
		this.typeName = typeName;
	}
	
}
