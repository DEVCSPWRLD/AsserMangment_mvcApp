package springboot.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "assets")
public class Assetstype implements Serializable {

		private static final long serialVersionUID = -4001860091095096725L;
		@Id
		@GeneratedValue(strategy = GenerationType.AUTO)
		@Column(name = "assetstype")
		private String assetstype;
		@Column(name = "id")
		private int id;
		public String getAssetstype() {
			return assetstype;
		}
		public void setAssetstype(String assetstype) {
			this.assetstype = assetstype;
		}
		@Override
		public String toString() {
			return "assetstype [assetstype=" + assetstype + ", id=" + id + "]";
		}
		
}
