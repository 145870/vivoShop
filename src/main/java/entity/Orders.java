package entity;

import java.sql.Date;

public class Orders {
	private int id;
	private int user_id;
	private String address_name;
	private String phone;
	private String province;
	private String city;
	private String district;
	private String address;
	private Date create_time;
	private Date orders_status;
	private int service_id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getAddress_name() {
		return address_name;
	}
	public void setAddress_name(String address_name) {
		this.address_name = address_name;
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
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public Date getOrders_status() {
		return orders_status;
	}
	public void setOrders_status(Date orders_status) {
		this.orders_status = orders_status;
	}
	public int getService_id() {
		return service_id;
	}
	public void setService_id(int service_id) {
		this.service_id = service_id;
	}
	/**
	 * @param id
	 * @param user_id
	 * @param address_name
	 * @param phone
	 * @param province
	 * @param city
	 * @param district
	 * @param address
	 * @param create_time
	 * @param orders_status
	 * @param service_id
	 */
	public Orders(int id, int user_id, String address_name, String phone, String province, String city, String district,
			String address, Date create_time, Date orders_status, int service_id) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.address_name = address_name;
		this.phone = phone;
		this.province = province;
		this.city = city;
		this.district = district;
		this.address = address;
		this.create_time = create_time;
		this.orders_status = orders_status;
		this.service_id = service_id;
	}
	/**
	 * 
	 */
	public Orders() {
		super();
	}
	
}
