package springboot.model;

 

import java.io.Serializable;
import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

 

@Entity 
@Table(name = "master_inventory")
public class Inventory implements Serializable {

 

/**
* 
*/
private static final long serialVersionUID = -4001860091095096725L;
@Id
@GeneratedValue(strategy = GenerationType.AUTO)
@Column(name = "id")
private Integer id;
@Column(name = "supplier")
private String supplier;
@Column(name = "device")
private String device;
@Column(name = "devicemodelno")
private String devicemodelno;
@Column(name = "deviceserialno")
private String deviceserialno;
@Column(name = "warrenty")
private String warrenty;
@Column(name = "price")
private Integer price;

@Column(name = "tag")
private String tag;


@Column(name = "bill_no")
private String bill_no;


@Column(name = "po_value")
private String po_value;

@Column(name = "assign")
private Integer assign;

@Column(name = "entrydate")
private String entrydate;


  @Lob
  @Column(name = "bytes")
  private byte[] bytes;
 

 

@Column(name = "filename")
private String filename;

@Column(name = "brandname")
private String brandname;
@Column(name = "ownername")
private String ownername;



@Column(name = "category")
private String category;


public Integer getId() {
    return id;
}
public void setId(Integer id) {
    this.id = id;
}
public String getSupplier() {
    return supplier;
}
public void setSupplier(String supplier) {
    this.supplier = supplier;
}
public String getDevice() {
    return device;
}
public void setDevice(String device) {
    this.device = device;
}
public String getDevicemodelno() {
    return devicemodelno;
}
public void setDevicemodelno(String devicemodelno) {
    this.devicemodelno = devicemodelno;
}
public String getDeviceserialno() {
    return deviceserialno;
}
public void setDeviceserialno(String deviceserialno) {
    this.deviceserialno = deviceserialno;
}
public String getWarrenty() {
    return warrenty;
}
public void setWarrenty(String warrenty) {
    this.warrenty = warrenty;
}
public Integer getPrice() {
    return price;
}
public void setPrice(Integer price) {
    this.price = price;
}



public String getTag() {
	return tag;
}
public void setTag(String tag) {
	this.tag = tag;
}
public String getBill_no() {
	return bill_no;
}
public void setBill_no(String bill_no) {
	this.bill_no = bill_no;
}
public String getPo_value() {
	return po_value;
}
public void setPo_value(String po_value) {
	this.po_value = po_value;
}


public Integer getAssign() {
	return assign;
}
public void setAssign(Integer assign) {
	this.assign = assign;
}

public String getEntrydate() {
	return entrydate;
}
public void setEntrydate(String entrydate) {
	this.entrydate = entrydate;
}
public byte[] getBytes() {
	return bytes;
}
public void setBytes(byte[] bytes) {
	this.bytes = bytes;
}
public String getFilename() {
	return filename;
}
public void setFilename(String filename) {
	this.filename = filename;
}



public String getBrandname() {
	return brandname;
}
public void setBrandname(String brandname) {
	this.brandname = brandname;
}
public String getOwnername() {
	return ownername;
}
public void setOwnername(String ownername) {
	this.ownername = ownername;
}



public String getCategory() {
	return category;
}
public void setCategory(String category) {
	this.category = category;
}
@Override
public String toString() {
	return "Inventory [id=" + id + ", supplier=" + supplier + ", device=" + device + ", devicemodelno=" + devicemodelno
			+ ", deviceserialno=" + deviceserialno + ", warrenty=" + warrenty + ", price=" + price + ", tag=" + tag
			+ ", bill_no=" + bill_no + ", po_value=" + po_value + ", assign=" + assign + ", entrydate=" + entrydate
			+ ", bytes=" + Arrays.toString(bytes) + ", filename=" + filename + ", brandname=" + brandname
			+ ", ownername=" + ownername + ", category=" + category + "]";
}







}