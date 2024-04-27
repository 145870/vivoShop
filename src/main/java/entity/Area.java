package entity;

public class Area {
	private int id;
    private int parentId;
    private String name;
    private String shortName;
    private String longitude;
    private String latitude;
    private int level;
    private int sort;
    private int status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getShortName() {
		return shortName;
	}
	public void setShortName(String shortName) {
		this.shortName = shortName;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Area() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Area(int id, int parentId, String name, String shortName, String longitude, String latitude, int level,
			int sort, int status) {
		super();
		this.id = id;
		this.parentId = parentId;
		this.name = name;
		this.shortName = shortName;
		this.longitude = longitude;
		this.latitude = latitude;
		this.level = level;
		this.sort = sort;
		this.status = status;
	}
    
}
