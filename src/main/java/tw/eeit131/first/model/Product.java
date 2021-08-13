package tw.eeit131.first.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

//@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler" })
@Entity
@Table(name = "product")
public class Product implements Serializable{
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "PRODUCTID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productID;

	@Transient // 外來鍵可忽略
	@Column(name = "SHOPID")
	private Integer shopID;

	@Column(name = "PRODUCTNAME")
	private String productName;

//	@Column(name = "PRODUCIMAGE")
//	private byte[] producImage;
	
	@Column(name = "PRODUCIMAGE")
	private Blob producImage;

	@Column(name = "FILENAME")
	private String filename;

	@Column(name = "PRODUCTDESCRIBE")
	private String productDescribe;

	@Column(name = "SALEDATE")
	private Timestamp saleDate;

	@Column(name = "QUANTITY")
	private Integer quantity;

	@Column(name = "PRICE")
	private Integer price;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "shopID")
	@JsonIgnore
	private ShopBean shop;

	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(name = "productType",
               joinColumns = { @JoinColumn(name = "PRODUCTID") },
               inverseJoinColumns = { @JoinColumn(name = "PRODUCTTYPEID")})
	@JsonIgnore
	private Set<ProductTypeList> productTypeList = new HashSet<ProductTypeList>();

	public Integer getProductID() {
		return productID;
	}

	public void setProductID(Integer productID) {
		this.productID = productID;
	}

	public Integer getShopID() {
		return shopID;
	}

	public void setShopID(Integer shopID) {
		this.shopID = shopID;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

//	public byte[] getProducImage() {
//		return producImage;
//	}
//
//	public void setProducImage(byte[] producImage) {
//		this.producImage = producImage;
//	}
	
	public Blob getProducImage() {
		return producImage;
	}

	public void setProducImage(Blob producImage) {
		this.producImage = producImage;
	}
	
	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getProductDescribe() {
		return productDescribe;
	}

	public void setProductDescribe(String productDescribe) {
		this.productDescribe = productDescribe;
	}

//	public Date getSaleDate() {
//		return saleDate;
//	}
//
//	public void setSaleDate(Date saleDate) {
//		this.saleDate = saleDate;
//	}

	public Timestamp getSaleDate() {
		return saleDate;
	}

	public void setSaleDate(Timestamp saleDate) {
		this.saleDate = saleDate;
	}
	
	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public ShopBean getShop() {
		return shop;
	}

	public void setShop(ShopBean shop) {
		this.shop = shop;
	}

	public Set<ProductTypeList> getProductTypeList() {
		return productTypeList;
	}

	public void setProductTypeList(Set<ProductTypeList> productTypeList) {
		this.productTypeList = productTypeList;
	}
	
	@Override
	public String toString() {
		return "Product  [productID=" + productID + ", productName=" + productName + ", filename=" + filename +"]";
	}

}
