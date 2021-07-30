package springboot.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "child_asset_inventory")
public class AssetRequest 
{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "child_assetno")
	private Integer child_assetno;
	
	@Column(name = "asset_id")
	private Integer asset_id;

	@Column(name = "asset_request")
	private String asset_request;
	
	@Column(name = "model_no")
	private String model_no;
	
	@Column(name = "serial_no")
	private String serial_no;
	
	@Column(name = "condition1")
	private String condition1;
	
	@Column(name = "descriptions")
	private String descriptions;

	@Column(name = "date")
	private String date;
	
	@Column(name = "supplier")
	private String supplier;
	
	@Column(name = "warranty_expiration")
	private String warranty_expiration;

	@Column(name = "unit_price")
	private String unit_price;
	
	@Column(name = "quantity")
	private String quantity;
	
	@Column(name = "value")
	private String value;
	
	@Column(name = "information")
	private String information;
	
	@Column(name = "issue_date")
	private String issue_date;
	
	@Column(name = "return_date")
	private String return_date;
	
	@Column(name = "tag")
    private String tag;

	public Integer getChild_assetno() {
		return child_assetno;
	}

	public void setChild_assetno(Integer child_assetno) {
		this.child_assetno = child_assetno;
	}

	public Integer getAsset_id() {
		return asset_id;
	}

	public void setAsset_id(Integer asset_id) {
		this.asset_id = asset_id;
	}

	public String getAsset_request() {
		return asset_request;
	}

	public void setAsset_request(String asset_request) {
		this.asset_request = asset_request;
	}

	public String getModel_no() {
		return model_no;
	}

	public void setModel_no(String model_no) {
		this.model_no = model_no;
	}

	public String getSerial_no() {
		return serial_no;
	}

	public void setSerial_no(String serial_no) {
		this.serial_no = serial_no;
	}

	public String getCondition1() {
		return condition1;
	}

	public void setCondition1(String condition1) {
		this.condition1 = condition1;
	}

	public String getDescriptions() {
		return descriptions;
	}

	public void setDescriptions(String descriptions) {
		this.descriptions = descriptions;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getSupplier() {
		return supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}

	public String getWarranty_expiration() {
		return warranty_expiration;
	}

	public void setWarranty_expiration(String warranty_expiration) {
		this.warranty_expiration = warranty_expiration;
	}

	public String getUnit_price() {
		return unit_price;
	}

	public void setUnit_price(String unit_price) {
		this.unit_price = unit_price;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	

	public String getInformation() {
		return information;
	}

	public void setInformation(String information) {
		this.information = information;
	}

	public String getIssue_date() {
		return issue_date;
	}

	public void setIssue_date(String issue_date) {
		this.issue_date = issue_date;
	}

	public String getReturn_date() {
		return return_date;
	}

	public void setReturn_date(String return_date) {
		this.return_date = return_date;
	}
	
	

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	@Override
	public String toString() {
		return "AssetRequest [child_assetno=" + child_assetno + ", asset_id=" + asset_id + ", asset_request="
				+ asset_request + ", model_no=" + model_no + ", serial_no=" + serial_no + ", condition1=" + condition1
				+ ", descriptions=" + descriptions + ", date=" + date + ", supplier=" + supplier
				+ ", warranty_expiration=" + warranty_expiration + ", unit_price=" + unit_price + ", quantity="
				+ quantity + ", value=" + value + ", information=" + information + ", issue_date=" + issue_date
				+ ", return_date=" + return_date + ", tag=" + tag + "]";
	}

	

	

}
