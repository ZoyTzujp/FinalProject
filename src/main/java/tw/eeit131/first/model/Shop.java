package tw.eeit131.first.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

//@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler" })
//@Entity
//@Table(name = "shop")
public class Shop implements Serializable{
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "SHOPID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer shopID;

	@Column(name = "SHOPNAME")
	private String shopName;

	@Column(name = "EMAIL")
	private String Email;

	@Column(name = "MOBILE")
	private String mobile;

	@Column(name = "INTRODUCE")
	private String introduce;

	@Column(name = "NAME")
	private String name;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "shop", cascade = CascadeType.ALL)
	@JsonIgnore
	private Set<Product> product = new HashSet<Product>();

	public Integer getShopID() {
		return shopID;
	}

	public void setShopID(Integer shopID) {
		this.shopID = shopID;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Product> getProduct() {
		return product;
	}

	public void setProduct(Set<Product> product) {
		this.product = product;
	}

}
