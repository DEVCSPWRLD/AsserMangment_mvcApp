package springboot.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user")
public class User  implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4001860091095096725L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int uid;
	private String eid;
	private String fullname;
	private String password;
	private String email;
	private String role;
	private String resetPasswordToken;
	private String typeofuser;
	private String desig;
	private String reportingmanager;
    private String cpassword;
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getEid() {
		return eid;
	}
	public void setEid(String eid) {
		this.eid = eid;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getResetPasswordToken() {
		return resetPasswordToken;
	}
	public void setResetPasswordToken(String resetPasswordToken) {
		this.resetPasswordToken = resetPasswordToken;
	}
	public String getTypeofuser() {
		return typeofuser;
	}
	public void setTypeofuser(String typeofuser) {
		this.typeofuser = typeofuser;
	}
	public String getDesig() {
		return desig;
	}
	public void setDesig(String desig) {
		this.desig = desig;
	}
	
	
	public String getReportingmanager() {
		return reportingmanager;
	}
	public void setReportingmanager(String reportingmanager) {
		this.reportingmanager = reportingmanager;
	}
	public String getCpassword() {
		return cpassword;
	}
	public void setCpassword(String cpassword) {
		this.cpassword = cpassword;
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", eid=" + eid + ", fullname=" + fullname + ", password=" + password + ", email="
				+ email + ", role=" + role + ", resetPasswordToken=" + resetPasswordToken + ", typeofuser=" + typeofuser
				+ ", desig=" + desig + ", reportingmanager=" + reportingmanager + ", cpassword=" + cpassword + "]";
	}
	
}
