package entity;

import java.sql.Date;

public class Products_images_url {
/*
 * 产品图片表
 */
	private int id;//编号
	private int information_id;//产品id
	private int class_name;//类别
	private String url;//图片路径
	private Date create_time;//创建时间
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getInformation_id() {
		return information_id;
	}
	public void setInformation_id(int information_id) {
		this.information_id = information_id;
	}
	public int getClass_name() {
		return class_name;
	}
	public void setClass_name(int class_name) {
		this.class_name = class_name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	/**
	 * @param id
	 * @param information_id
	 * @param class_name
	 * @param url
	 * @param create_time
	 */
	public Products_images_url(int id, int information_id, int class_name, String url, Date create_time) {
		super();
		this.id = id;
		this.information_id = information_id;
		this.class_name = class_name;
		this.url = url;
		this.create_time = create_time;
	}
	/**
	 * 
	 */
	public Products_images_url() {
		super();
	}
	
	
}
