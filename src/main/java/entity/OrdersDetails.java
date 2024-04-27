package entity;

public class OrdersDetails {
	private Long id;
    private Long orderId;
    private Long productAttrValsId;
    private int quantity;
    
    private String imgURL;
    private String pName;
    private String pavVals;
    private Double sumPrice;
    
    private Double saleAmount;
    
    
	public Double getSaleAmount() {
		return saleAmount;
	}
	public void setSaleAmount(Double saleAmount) {
		this.saleAmount = saleAmount;
	}
	@Override
	public String toString() {
		return "OrdersDetails [id=" + id + ", orderId=" + orderId + ", productAttrValsId=" + productAttrValsId
				+ ", quantity=" + quantity + ", imgURL=" + imgURL + ", pName=" + pName + ", pavVals=" + pavVals
				+ ", sumPrice=" + sumPrice + "]";
	}
	public String getImgURL() {
		return imgURL;
	}
	public void setImgURL(String imgURL) {
		this.imgURL = imgURL;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getPavVals() {
		return pavVals;
	}
	public void setPavVals(String pavVals) {
		this.pavVals = pavVals;
	}
	public Double getSumPrice() {
		return sumPrice;
	}
	public void setSumPrice(Double sumPrice) {
		this.sumPrice = sumPrice;
	}
	public OrdersDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrdersDetails(Long id, Long orderId, Long productAttrValsId, int quantity) {
		super();
		this.id = id;
		this.orderId = orderId;
		this.productAttrValsId = productAttrValsId;
		this.quantity = quantity;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getOrderId() {
		return orderId;
	}
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	public Long getProductAttrValsId() {
		return productAttrValsId;
	}
	public void setProductAttrValsId(Long productAttrValsId) {
		this.productAttrValsId = productAttrValsId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
