package entity;

import java.util.Date;

public class UserProfile {
	 private Long id;
	 private String accountNumber;
	 private String userName;
	 private String phone;
	 private String userPassword;
	 private String mailbox;
	 private String address;
	 private int sex;
	 private Date birthday;
	 private Date createTime;
	 private String headImageUrl;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
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
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getHeadImageUrl() {
		return headImageUrl;
	}
	public void setHeadImageUrl(String headImageUrl) {
		this.headImageUrl = headImageUrl;
	}
	@Override
	public String toString() {
		return "UserProfile [id=" + id + ", accountNumber=" + accountNumber + ", userName=" + userName + ", phone="
				+ phone + ", userPassword=" + userPassword + ", mailbox=" + mailbox + ", address=" + address + ", sex="
				+ sex + ", birthday=" + birthday + ", createTime=" + createTime + ", headImageUrl=" + headImageUrl
				+ "]";
	}
	public UserProfile(Long id, String accountNumber, String userName, String phone, String userPassword,
			String mailbox, String address, int sex, Date birthday, Date createTime, String headImageUrl) {
		super();
		this.id = id;
		this.accountNumber = accountNumber;
		this.userName = userName;
		this.phone = phone;
		this.userPassword = userPassword;
		this.mailbox = mailbox;
		this.address = address;
		this.sex = sex;
		this.birthday = birthday;
		this.createTime = createTime;
		this.headImageUrl = headImageUrl;
	}
	public UserProfile() {
		super();
		// TODO Auto-generated constructor stub
	}
	 
	 
}
