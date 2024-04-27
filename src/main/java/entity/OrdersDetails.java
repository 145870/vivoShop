package entity;

public class OrdersDetails {
	private Long id;
    private Long orderId;
    private Long productAttrValsId;
    private int quantity;
    
    
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
