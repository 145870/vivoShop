package entity;



public class shopping_cartDetails {
	private Long id;
	private Long uid;
	private String name;
	private String vals;
	private String price;
	
	private Integer num;
	private Double sumPrice;
	private String image;
	
	private long pid;
	
	public long getPid() {
		return pid;
	}
	public void setPid(long pid) {
		this.pid = pid;
	}
	@Override
	public String toString() {
		return "shopping_cartDetails [id=" + id + ", uid=" + uid + ", name=" + name + ", vals=" + vals + ", price="
				+ price + ", num=" + num + ", sumPrice=" + sumPrice + ", image=" + image + "]";
	}
	public shopping_cartDetails(Long id, Long uid, String name, String vals, String price, Integer num, Double sumPrice,
			String image) {
		super();
		this.id = id;
		this.uid = uid;
		this.name = name;
		this.vals = vals;
		this.price = price;
		this.num = num;
		this.sumPrice = sumPrice;
		this.image = image;
	}
	public String getVals() {
		return vals;
	}
	public void setVals(String vals) {
		this.vals = vals;
	}
	public Double getSumPrice() {
		return sumPrice;
	}
	public void setSumPrice(Double sumPrice) {
		this.sumPrice = sumPrice;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getUid() {
		return uid;
	}
	public void setUid(Long uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}

	public shopping_cartDetails() {
		super();
	}
	
}
