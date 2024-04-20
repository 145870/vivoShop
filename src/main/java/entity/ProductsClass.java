package entity;

import java.sql.Date;
import java.util.Arrays;

public class ProductsClass {
	  private Long id;
	  private String className;
	  
	  //产品表的临时字段
	  private int iid;
	  private String information_name;
	  private String description;
	  private int class_id;
	  private int information_status;
	  private int is_last;
	  private Date create_time;
	  private Date shelves_time;
	  
	  //产品图片表的临时字段
	  private int uid;
	  private int information_id;
	  private int class_name;
	  private String url;
	  private Date create_timeu;
	  
	  //产品规格配置的临时字段
	  private int sid;
	  private int information_ids;
	  private String specifications_name;
	  private String[] specifications_values;
	  
	  
	  
	  
	/**
	 * @param information_name
	 * @param description
	 * @param specifications_values
	 */
	public ProductsClass(String information_name, String description, String[] specifications_values) {
		super();
		this.information_name = information_name;
		this.description = description;
		this.specifications_values = specifications_values;
	}
	/**
	 * @param specifications_values
	 */
	public ProductsClass(String[] specifications_values) {
		super();
		this.specifications_values = specifications_values;
	}
	/**
	 * @param id
	 * @param className
	 * @param iid
	 * @param information_name
	 * @param description
	 * @param class_id
	 * @param information_status
	 * @param is_last
	 * @param create_time
	 * @param shelves_time
	 * @param uid
	 * @param information_id
	 * @param class_name
	 * @param url
	 * @param create_timeu
	 * @param sid
	 * @param information_ids
	 * @param specifications_name
	 * @param specifications_values
	 */
	public ProductsClass(Long id, String className, int iid, String information_name, String description, int class_id,
			int information_status, int is_last, Date create_time, Date shelves_time, int uid, int information_id,
			int class_name, String url, Date create_timeu, int sid, int information_ids, String specifications_name,
			String[] specifications_values) {
		super();
		this.id = id;
		this.className = className;
		this.iid = iid;
		this.information_name = information_name;
		this.description = description;
		this.class_id = class_id;
		this.information_status = information_status;
		this.is_last = is_last;
		this.create_time = create_time;
		this.shelves_time = shelves_time;
		this.uid = uid;
		this.information_id = information_id;
		this.class_name = class_name;
		this.url = url;
		this.create_timeu = create_timeu;
		this.sid = sid;
		this.information_ids = information_ids;
		this.specifications_name = specifications_name;
		this.specifications_values = specifications_values;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getInformation_ids() {
		return information_ids;
	}
	public void setInformation_ids(int information_ids) {
		this.information_ids = information_ids;
	}
	public String getSpecifications_name() {
		return specifications_name;
	}
	public void setSpecifications_name(String specifications_name) {
		this.specifications_name = specifications_name;
	}
	public String[] getSpecifications_values() {
		return specifications_values;
	}
	public void setSpecifications_values(String[] specifications_values) {
		this.specifications_values = specifications_values;
	}
	/**
	 * @param id
	 * @param className
	 * @param iid
	 * @param information_name
	 * @param description
	 * @param class_id
	 * @param information_status
	 * @param is_last
	 * @param create_time
	 * @param shelves_time
	 * @param uid
	 * @param information_id
	 * @param class_name
	 * @param url
	 * @param create_timeu
	 */
	public ProductsClass(Long id, String className, int iid, String information_name, String description, int class_id,
			int information_status, int is_last, Date create_time, Date shelves_time, int uid, int information_id,
			int class_name, String url, Date create_timeu) {
		super();
		this.id = id;
		this.className = className;
		this.iid = iid;
		this.information_name = information_name;
		this.description = description;
		this.class_id = class_id;
		this.information_status = information_status;
		this.is_last = is_last;
		this.create_time = create_time;
		this.shelves_time = shelves_time;
		this.uid = uid;
		this.information_id = information_id;
		this.class_name = class_name;
		this.url = url;
		this.create_timeu = create_timeu;
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
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
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
	public Date getCreate_timeu() {
		return create_timeu;
	}
	public void setCreate_timeu(Date create_timeu) {
		this.create_timeu = create_timeu;
	}
	public ProductsClass(Long id, String className) {
		super();
		this.id = id;
		this.className = className;
	}
	public ProductsClass() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	@Override
	public String toString() {
		return "ProductsClass [id=" + id + ", className=" + className + ", iid=" + iid + ", information_name="
				+ information_name + ", description=" + description + ", class_id=" + class_id + ", information_status="
				+ information_status + ", is_last=" + is_last + ", create_time=" + create_time + ", shelves_time="
				+ shelves_time + ", uid=" + uid + ", information_id=" + information_id + ", class_name=" + class_name
				+ ", url=" + url + ", create_timeu=" + create_timeu + ", sid=" + sid + ", information_ids="
				+ information_ids + ", specifications_name=" + specifications_name + ", specifications_values="
				+ Arrays.toString(specifications_values) + "]";
	}
	
	
	  
}
