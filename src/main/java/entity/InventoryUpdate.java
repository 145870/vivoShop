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
			int newQuantity, long adminId) {
		super();
		this.id = id;
		this.inventoryDetailsId = inventoryDetailsId;
		this.updateType = updateType;
		this.updateTime = updateTime;
		this.oldQuantity = oldQuantity;
		this.newQuantity = newQuantity;
		this.adminId = adminId;
	}
	public InventoryUpdate() {
		super();
		// TODO Auto-generated constructor stub
	}
	 
	 
}
