package entity;

<<<<<<< HEAD
import java.util.Arrays;

public class ProductSpecification {
	/*
	 * 规格配置
	 */
=======
public class ProductSpecification {
>>>>>>> 38abe4d133fb810f4c226411aa1e114f49c675ae
	private Long id;
    private Integer informationId;
    private String specificationsName;
    private String[] specificationsValues;
    
<<<<<<< HEAD
    

    public ProductSpecification(Long id, Integer informationId, String specificationsName,
=======
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
>>>>>>> 38abe4d133fb810f4c226411aa1e114f49c675ae
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

<<<<<<< HEAD
    @Override
	public String toString() {
		return "ProductSpecification [id=" + id + ", informationId=" + informationId + ", specificationsName="
				+ specificationsName + ", specificationsValues=" + Arrays.toString(specificationsValues) + "]";
	}
=======
    // toString() method
    @Override
    public String toString() {
        return "ProductSpecification{" +
                "id=" + id +
                ", informationId=" + informationId +
                ", specificationsName='" + specificationsName + '\'' +
                '}';
    }
>>>>>>> 38abe4d133fb810f4c226411aa1e114f49c675ae
}