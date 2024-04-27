package entity;

import java.sql.Date;

public class Usercollect {
	private int id;
	private int user_id;
	private int information_id;
	private Date collect_time;
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
	public int getInformation_id() {
		return information_id;
	}
	public void setInformation_id(int information_id) {
		this.information_id = information_id;
	}
	public Date getCollect_time() {
		return collect_time;
	}
	public void setCollect_time(Date collect_time) {
		this.collect_time = collect_time;
	}
	/**
	 * @param id
	 * @param user_id
	 * @param information_id
	 * @param collect_time
	 */
	public Usercollect(int id, int user_id, int information_id, Date collect_time) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.information_id = information_id;
		this.collect_time = collect_time;
	}
	/**
	 * 
	 */
	public Usercollect() {
		super();
	}
	
	
}
