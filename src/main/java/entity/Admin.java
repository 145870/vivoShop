package entity;

import java.util.Date;

public class Admin {
	private Long id;
    private String account;
    private String nickname;
    private String adminName;
    private String phone;
    private int sex;
    private String adminPassword;
    private Long adminTypeId;
    private Date createTime;
    
    private String typeName;
    
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getAdminPassword() {
		return adminPassword;
	}
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
	public Long getAdminTypeId() {
		return adminTypeId;
	}
	public void setAdminTypeId(Long adminTypeId) {
		this.adminTypeId = adminTypeId;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Admin(Long id, String account, String nickname, String adminName, String phone, int sex,
			String adminPassword, Long adminTypeId, Date createTime) {
		super();
		this.id = id;
		this.account = account;
		this.nickname = nickname;
		this.adminName = adminName;
		this.phone = phone;
		this.sex = sex;
		this.adminPassword = adminPassword;
		this.adminTypeId = adminTypeId;
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		return "Admin [id=" + id + ", account=" + account + ", nickname=" + nickname + ", adminName=" + adminName
				+ ", phone=" + phone + ", sex=" + sex + ", adminPassword=" + adminPassword + ", adminTypeId="
				+ adminTypeId + ", createTime=" + createTime + "]";
	}
    
    
}
