package springboot.model;

 

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

 

@Entity
@Table(name="asset_inventory")
public class Asset  implements Serializable{
    
    /**
     * 
     */
    private static final long serialVersionUID = -4001860091095096725L;
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "asset_id")
	private Integer asset_id;

	@Column(name = "name")
	private String name;

	@Column(name = "eid")
	private String eid;
	
	@Column(name = "category")
	private String category;

	@Column(name = "asset_request")
	private String asset_request;
	
	@Column(name = "remarks")
	private String remarks;

	public Integer getAsset_id() {
		return asset_id;
	}

	public void setAsset_id(Integer asset_id) {
		this.asset_id = asset_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEid() {
		return eid;
	}

	public void setEid(String eid) {
		this.eid = eid;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getAsset_request() {
		return asset_request;
	}

	public void setAsset_request(String asset_request) {
		this.asset_request = asset_request;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Override
	public String toString() {
		return "Asset [asset_id=" + asset_id + ", name=" + name + ", eid=" + eid + ", category=" + category
				+ ", asset_request=" + asset_request + ", remarks=" + remarks + "]";
	}

	
	
	

}