package entity;

public class ProductSpecificationDetailed {
    private Long id;
    private Integer specificationsId;
    private String detailedValue;

    public ProductSpecificationDetailed() {
        // 默认构造函数
    }

    public ProductSpecificationDetailed(Long id, Integer specificationsId, String detailedValue) {
		super();
		this.id = id;
		this.specificationsId = specificationsId;
		this.detailedValue = detailedValue;
	}


    // Getter 和 Setter 方法
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getSpecificationsId() {
        return specificationsId;
    }

    public void setSpecificationsId(Integer specificationsId) {
        this.specificationsId = specificationsId;
    }

    public String getDetailedValue() {
        return detailedValue;
    }

    public void setDetailedValue(String detailedValue) {
        this.detailedValue = detailedValue;
    }

	@Override
	public String toString() {
		return "ProductSpecificationDetailed [id=" + id + ", specificationsId=" + specificationsId + ", detailedValue="
				+ detailedValue + "]";
	}
}