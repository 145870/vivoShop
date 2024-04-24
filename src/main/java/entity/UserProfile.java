package entity;

import java.util.Date;

public class UserProfile {
<<<<<<< HEAD
	private int id;
=======
	private Long id;
>>>>>>> 38abe4d133fb810f4c226411aa1e114f49c675ae
	private String account_number;
	private String user_name;
	private String phone;
	private String user_password;
	private String mailbox;
	private String address;
	private int sex;
	private Date birthday;
	private Date create_time;
	private String head_image_url;
<<<<<<< HEAD
	public int getId() {
		return id;
	}
	public void setId(int id) {
=======
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
>>>>>>> 38abe4d133fb810f4c226411aa1e114f49c675ae
		this.id = id;
	}
	public String getAccount_number() {
		return account_number;
	}
	public void setAccount_number(String account_number) {
		this.account_number = account_number;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getMailbox() {
		return mailbox;
	}
	public void setMailbox(String mailbox) {
		this.mailbox = mailbox;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public String getHead_image_url() {
		return head_image_url;
	}
	public void setHead_image_url(String head_image_url) {
		this.head_image_url = head_image_url;
	}
<<<<<<< HEAD
	public UserProfile(int id, String account_number, String user_name, String phone, String user_password,
=======
	public UserProfile(Long id, String account_number, String user_name, String phone, String user_password,
>>>>>>> 38abe4d133fb810f4c226411aa1e114f49c675ae
			String mailbox, String address, int sex, Date birthday, Date create_time, String head_image_url) {
		super();
		this.id = id;
		this.account_number = account_number;
		this.user_name = user_name;
		this.phone = phone;
		this.user_password = user_password;
		this.mailbox = mailbox;
		this.address = address;
		this.sex = sex;
		this.birthday = birthday;
		this.create_time = create_time;
		this.head_image_url = head_image_url;
	}
	public UserProfile() {
		super();
	}
	@Override
	public String toString() {
		return "user_profile [id=" + id + ", account_number=" + account_number + ", user_name=" + user_name + ", phone="
				+ phone + ", user_password=" + user_password + ", mailbox=" + mailbox + ", address=" + address
				+ ", sex=" + sex + ", birthday=" + birthday + ", create_time=" + create_time + ", head_image_url="
				+ head_image_url + "]";
	}
	
}
