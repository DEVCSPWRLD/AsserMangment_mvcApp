package springboot.model;

 

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Table;

 

@Entity
@Table(name="asset_inventory")
public class SaveAsset  implements Serializable{
    
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
   	
   	@Column(name = "email")
	private String email;
   	
   	@Column(name = "category")
   	private String category;

   	@Column(name = "asset_request")
   	private String asset_request;
   	
   	@Column(name = "dept")
    private String dept;
   	
   	@Column(name = "desk")
    private String desk;
   	
   	@Column(name = "remarks")
   	private String remarks;
   	
  	@Column(name = "status")
   	private String status;
  	
  	@Column(name = "unique_id")
   	private String  unique_id;
  	
  	@Column(name = "desig")
  	private String desig;
  	
    private String notification;
    private String notification1;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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
	

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status=status;
	}
	

	

	public String getUnique_id() {
		return unique_id;
	}

	public void setUnique_id(String unique_id) {
		this.unique_id = unique_id;
	}

	
	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getDesk() {
		return desk;
	}

	public void setDesk(String desk) {
		this.desk = desk;
	}
	

	public String getDesig() {
		return desig;
	}

	public void setDesig(String desig) {
		this.desig = desig;
	}
	
	

	public String getNotification() {
		return notification;
	}

	public void setNotification(String notification) {
		this.notification = notification;
	}

	public String getNotification1() {
		return notification1;
	}

	public void setNotification1(String notification1) {
		this.notification1 = notification1;
	}

	@Override
	public String toString() {
		return "SaveAsset [asset_id=" + asset_id + ", name=" + name + ", eid=" + eid + ", email=" + email
				+ ", category=" + category + ", asset_request=" + asset_request + ", dept=" + dept + ", desk=" + desk
				+ ", remarks=" + remarks + ", status=" + status + ", unique_id=" + unique_id + ", desig=" + desig
				+ ", notification=" + notification + ", notification1=" + notification1 + "]";
	}

	
}