package entity;

public class ProductSpecification {
	private Long id;
    private Integer informationId;
    private String specificationsName;
    private String[] specificationsValues;
    
    private Long pid;
    private String pname;

    public Long getPid() {
		return pid;
	}




	public void setPid(Long pid) {
		this.pid = pid;
	}




	public String getPname() {
		return pname;
	}




	public void setPname(String pname) {
		this.pname = pname;
	}




	public ProductSpecification(Long id, Integer informationId, String specificationsName,
			String[] specificationsValues) {
		super();
		this.id = id;
		this.informationId = informationId;
		this.specificationsName = specificationsName;
		this.specificationsValues = specificationsValues;
	}




	public String[] getSpecificationsValues() {
		return specificationsValues;
	}





	public void setSpecificationsValues(String[] specificationsValues) {
		this.specificationsValues = specificationsValues;
	}


	public ProductSpecification() {
    }
    


	// Getters and setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getInformationId() {
        return informationId;
    }

    public void setInformationId(Integer informationId) {
        this.informationId = informationId;
    }

    public String getSpecificationsName() {
        return specificationsName;
    }

    public void setSpecificationsName(String specificationsName) {
        this.specificationsName = specificationsName;
    }

    // toString() method
    @Override
    public String toString() {
        return "ProductSpecification{" +
                "id=" + id +
                ", informationId=" + informationId +
                ", specificationsName='" + specificationsName + '\'' +
                '}';
    }
}