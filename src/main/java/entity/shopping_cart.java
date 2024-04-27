package entity;

public class shopping_cart {
	private Integer id;//主键
	private Integer user_id;//用户id
	private Integer product_attr_vals_id;//规格配置id
	private Integer quantity;//数量
	public Integer getId() {
		return id;
	} 
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public Integer getProduct_attr_vals_id() {
		return product_attr_vals_id;
	}
	public void setProduct_attr_vals_id(Integer product_attr_vals_id) {
		this.product_attr_vals_id = product_attr_vals_id;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public shopping_cart(Integer id, Integer user_id, Integer product_attr_vals_id, Integer quantity) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.product_attr_vals_id = product_attr_vals_id;
		this.quantity = quantity;
	}
	public shopping_cart() {
		super();
	}
	@Override
	public String toString() {
		return "shopping_cart [id=" + id + ", user_id=" + user_id + ", product_attr_vals_id=" + product_attr_vals_id
				+ ", quantity=" + quantity + "]";
	}
	
}
