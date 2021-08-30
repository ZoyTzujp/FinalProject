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

@Entity
@Table(name = "shop")
public class ShopBean implements Serializable{
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "shopID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer shopID;

	@Column(name = "shopName")
	private String shopName;

	@Column(name = "shopKeeper")
	private String shopKeeper;

	@Column(name = "Email")
	private String Email;

	@Column(name = "mobile")
	private String mobile;

	@Column(name = "introduce")
	private String introduce;

	@Column(name = "password")
	private String password;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "shopBean", cascade = CascadeType.ALL)
	@JsonIgnore
	private Set<Product> product = new HashSet<Product>();

	public ShopBean(String shopName, String shopKeeper, String email, String mobile, String introduce,
			String password) {
		super();
		this.shopName = shopName;
		this.shopKeeper = shopKeeper;
		this.Email = email;
		this.mobile = mobile;
		this.introduce = introduce;
		this.password = password;
	}

	public ShopBean(String email, String password) {
		this.Email = email;
		this.password = password;
	}

	public ShopBean() {
		super();
	}

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

	public String getShopKeeper() {
		return shopKeeper;
	}

	public void setShopKeeper(String shopKeeper) {
		this.shopKeeper = shopKeeper;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set<Product> getProduct() {
		return product;
	}

	public void setProduct(Set<Product> product) {
		this.product = product;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ShopBean [shopID=");
		builder.append(shopID);
		builder.append(", shopName=");
		builder.append(shopName);
		builder.append(", shopKeeper=");
		builder.append(shopKeeper);
		builder.append(", Email=");
		builder.append(Email);
		builder.append(", mobile=");
		builder.append(mobile);
		builder.append(", introduce=");
		builder.append(introduce);
		builder.append(", password=");
		builder.append(password);
		builder.append("]");
		return builder.toString();
	}

}
