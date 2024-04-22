package entity;

import java.util.Date;

public class InventoryUpdate {
	 private long id;
	 private long inventoryDetailsId;
	 private int updateType;
	 private Date updateTime;
	 private int oldQuantity;
	 private int newQuantity;
	 private long adminId;
	 private String reason;
	 
	 private String pName;
	 private String[] attr_vals;
	 private String admin_name;
	 
	 
	 
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String[] getAttr_vals() {
		return attr_vals;
	}
	public void setAttr_vals(String[] attr_vals) {
		this.attr_vals = attr_vals;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public long getInventoryDetailsId() {
		return inventoryDetailsId;
	}
	public void setInventoryDetailsId(long inventoryDetailsId) {
		this.inventoryDetailsId = inventoryDetailsId;
	}
	public int getUpdateType() {
		return updateType;
	}
	public void setUpdateType(int updateType) {
		this.updateType = updateType;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public int getOldQuantity() {
		return oldQuantity;
	}
	public void setOldQuantity(int oldQuantity) {
		this.oldQuantity = oldQuantity;
	}
	public int getNewQuantity() {
		return newQuantity;
	}
	public void setNewQuantity(int newQuantity) {
		this.newQuantity = newQuantity;
	}
	public long getAdminId() {
		return adminId;
	}
	public void setAdminId(long adminId) {
		this.adminId = adminId;
	}
	public InventoryUpdate(long id, long inventoryDetailsId, int updateType, Date updateTime, int oldQuantity,
			int newQuantity, long adminId,String reason) {
		super();
		this.id = id;
		this.inventoryDetailsId = inventoryDetailsId;
		this.updateType = updateType;
		this.updateTime = updateTime;
		this.oldQuantity = oldQuantity;
		this.newQuantity = newQuantity;
		this.adminId = adminId;
		this.reason = reason;
	}
	public InventoryUpdate() {
		super();
		// TODO Auto-generated constructor stub
	}
	 
	 
}
