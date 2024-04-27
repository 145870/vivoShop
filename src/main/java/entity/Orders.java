package entity;

import java.util.Date;

public class Orders {
	private Long id;
	private Long userId;
	private String addressName;
	private String phone;
	private String province;
	private String city;
	private String district;
	private String address;
	private Date createTime;
	private int ordersStatus;
	private Long serviceId;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getAddressName() {
		return addressName;
	}
	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public int getOrdersStatus() {
		return ordersStatus;
	}
	public void setOrdersStatus(int ordersStatus) {
		this.ordersStatus = ordersStatus;
	}
	public Long getServiceId() {
		return serviceId;
	}
	public void setServiceId(Long serviceId) {
		this.serviceId = serviceId;
	}
	public Orders(Long id, Long userId, String addressName, String phone, String province, String city, String district,
			String address, Date createTime, int ordersStatus, Long serviceId) {
		super();
		this.id = id;
		this.userId = userId;
		this.addressName = addressName;
		this.phone = phone;
		this.province = province;
		this.city = city;
		this.district = district;
		this.address = address;
		this.createTime = createTime;
		this.ordersStatus = ordersStatus;
		this.serviceId = serviceId;
	}
	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
