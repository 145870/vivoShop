package entity;

import java.util.Arrays;

public class ProductAttrValue {
    
    private Long id;
    private int productId;
    private String[] attrVals;
    private int saleAmount;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String[] getAttrVals() {
		return attrVals;
	}
	public void setAttrVals(String[] attrVals) {
		this.attrVals = attrVals;
	}
	public int getSaleAmount() {
		return saleAmount;
	}
	public void setSaleAmount(int saleAmount) {
		this.saleAmount = saleAmount;
	}
	public ProductAttrValue(Long id, int productId, String[] attrVals, int saleAmount) {
		super();
		this.id = id;
		this.productId = productId;
		this.attrVals = attrVals;
		this.saleAmount = saleAmount;
	}
	public ProductAttrValue() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "ProductAttrValue [id=" + id + ", productId=" + productId + ", attrVals=" + Arrays.toString(attrVals)
				+ ", saleAmount=" + saleAmount + "]";
	}
    
    
    
}
