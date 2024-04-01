package entity;

import java.sql.Date;
/*
 * 产品表
 */
public class Products_information {
	private int id;//编号
	private String information_name;//产品名称
	private String description;//产品描述
	private int class_id;//分类id
	private int information_status;//上架状态
	private int is_last;//是否新品
	private Date create_time;//创建时间
	private Date shelves_time;//上架时间
	
	private int information_id;
	private int class_name;
	private String url;
	
	
	/**
	 * @param id
	 * @param information_name
	 * @param description
	 * @param class_id
	 * @param information_status
	 * @param is_last
	 * @param create_time
	 * @param shelves_time
	 * @param information_id
	 * @param class_name
	 * @param url
	 */
	public Products_information(int id, String information_name, String description, int class_id,
			int information_status, int is_last, Date create_time, Date shelves_time, int information_id,
			int class_name, String url) {
		super();
		this.id = id;
		this.information_name = information_name;
		this.description = description;
		this.class_id = class_id;
		this.information_status = information_status;
		this.is_last = is_last;
		this.create_time = create_time;
		this.shelves_time = shelves_time;
		this.information_id = information_id;
		this.class_name = class_name;
		this.url = url;
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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getInformation_name() {
		return information_name;
	}
	public void setInformation_name(String information_name) {
		this.information_name = information_name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getClass_id() {
		return class_id;
	}
	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}
	public int getInformation_status() {
		return information_status;
	}
	public void setInformation_status(int information_status) {
		this.information_status = information_status;
	}
	public int getIs_last() {
		return is_last;
	}
	public void setIs_last(int is_last) {
		this.is_last = is_last;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public Date getShelves_time() {
		return shelves_time;
	}
	public void setShelves_time(Date shelves_time) {
		this.shelves_time = shelves_time;
	}
	/**
	 * @param id
	 * @param information_name
	 * @param description
	 * @param class_id
	 * @param information_status
	 * @param is_last
	 * @param create_time
	 * @param shelves_time
	 */
	public Products_information(int id, String information_name, String description, int class_id,
			int information_status, int is_last, Date create_time, Date shelves_time) {
		super();
		this.id = id;
		this.information_name = information_name;
		this.description = description;
		this.class_id = class_id;
		this.information_status = information_status;
		this.is_last = is_last;
		this.create_time = create_time;
		this.shelves_time = shelves_time;
	}
	/**
	 * 
	 */
	public Products_information() {
		super();
	}
	
	
}