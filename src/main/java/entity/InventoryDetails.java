package entity;

public class InventoryDetails {
	private Long id;
	private Integer attrValsId;
    private Integer quantity;
    
    private String pname;
    private String[] attr_vals;
    
    
    public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String[] getAttr_vals() {
		return attr_vals;
	}
	public void setAttr_vals(String[] attr_vals) {
		this.attr_vals = attr_vals;
	}
	public InventoryDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	public InventoryDetails(Long id, Integer attrValsId, Integer quantity) {
		super();
		this.id = id;
		this.attrValsId = attrValsId;
		this.quantity = quantity;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Integer getAttrValsId() {
		return attrValsId;
	}
	public void setAttrValsId(Integer attrValsId) {
		this.attrValsId = attrValsId;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
}
