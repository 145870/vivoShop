package entity;
/*
 * 用户配送地址信息表
 */
public class User_address_information {
	private int id;
	private int user_id;
	private String address_name;
	private String phone;
	private String province;
	private String city;
	private String district;
	private String address;
	private int is_default;
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
	public int getIs_default() {
		return is_default;
	}
	public void setIs_default(int is_default) {
		this.is_default = is_default;
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
	 * @param is_default
	 */
	public User_address_information(int id, int user_id, String address_name, String phone, String province,
			String city, String district, String address, int is_default) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.address_name = address_name;
		this.phone = phone;
		this.province = province;
		this.city = city;
		this.district = district;
		this.address = address;
		this.is_default = is_default;
	}
	/**
	 * 
	 */
	public User_address_information() {
		super();
	}
	
	
}
