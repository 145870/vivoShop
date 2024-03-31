package entity;

public class ProductSpecification {
    private Long id;
    private Integer informationId;
    private String specificationsName;
    
    private Long specifications_detailed_id;
    private String detailed_value;
    

    public Long getSpecifications_detailed_id() {
		return specifications_detailed_id;
	}


	public void setSpecifications_detailed_id(Long specifications_detailed_id) {
		this.specifications_detailed_id = specifications_detailed_id;
	}


	public String getDetailed_value() {
		return detailed_value;
	}


	public void setDetailed_value(String detailed_value) {
		this.detailed_value = detailed_value;
	}


	public ProductSpecification() {
    }
    

    public ProductSpecification(Long id, Integer informationId, String specificationsName) {
		super();
		this.id = id;
		this.informationId = informationId;
		this.specificationsName = specificationsName;
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