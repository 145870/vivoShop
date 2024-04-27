package entity;

import java.sql.Date;
import java.util.Arrays;

public class Product_attr_vals {
	/*
	 * 价格表
	 */
	private int id;
	private int product_id;
	private String[] attr_vals;
	private double sale_amount;

	// 临时字段
	private int iid;
	private String information_name;
	private String description;
	private int class_id;
	private int information_status;
	private int is_last;
	private Date create_time;
	private Date shelves_time;
	
	private String imageUrl;
	
	
	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	
	@Override
	public String toString() {
		return "Product_attr_vals [id=" + id + ", product_id=" + product_id + ", attr_vals="
				+ Arrays.toString(attr_vals) + ", sale_amount=" + sale_amount + ", iid=" + iid + ", information_name="
				+ information_name + ", description=" + description + ", class_id=" + class_id + ", information_status="
				+ information_status + ", is_last=" + is_last + ", create_time=" + create_time + ", shelves_time="
				+ shelves_time + ", imageUrl=" + imageUrl + "]";
	}

	/**
	 * @param attr_vals
	 * @param sale_amount
	 */
	public Product_attr_vals(int pavid,String[] attr_vals, double sale_amount) {
		super();
		this.id=pavid;
		this.attr_vals = attr_vals;
		this.sale_amount = sale_amount;
	}

	public int getIid() {
		return iid;
	}

	public void setIid(int iid) {
		this.iid = iid;
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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String[] getAttr_vals() {
		return attr_vals;
	}

	

	/**
	 * @param attr_vals
	 */
	public Product_attr_vals(String[] attr_vals) {
		super();
		this.attr_vals = attr_vals;
	}

	/**
	 * @param sale_amount
	 */
	public Product_attr_vals(double sale_amount) {
		super();
		this.sale_amount = sale_amount;
	}

	public void setAttr_vals(String[] attr_vals) {
		this.attr_vals = attr_vals;
	}

	public double getSale_amount() {
		return sale_amount;
	}

	public void setSale_amount(double sale_amount) {
		this.sale_amount = sale_amount;
	}

	/**
	 * @param id
	 * @param product_id
	 * @param attr_vals
	 * @param sale_amount
	 */
	public Product_attr_vals(int id, int product_id, String[] attr_vals, double sale_amount) {
		super();
		this.id = id;
		this.product_id = product_id;
		this.attr_vals = attr_vals;
		this.sale_amount = sale_amount;
	}

	/**
	 * 
	 */
	public Product_attr_vals() {
		super();
	}

}
