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
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;


import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "productTypeList")
public class ProductTypeList implements Serializable{
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "PRODUCTTYPEID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productTypeID;

	@Column(name = "PRODUCTTYPENAME")
	private String productTypeName;

	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(name = "productType", joinColumns = { 
			@JoinColumn(name = "PRODUCTTYPEID") }, inverseJoinColumns = {
			@JoinColumn(name = "PRODUCTID") })
	@JsonIgnore
	private Set<Product> products = new HashSet<Product>();

	public Integer getProductTypeID() {
		return productTypeID;
	}

	public void setProductTypeID(Integer productTypeID) {
		this.productTypeID = productTypeID;
	}

	public String getProductTypeName() {
		return productTypeName;
	}

	public void setProductTypeName(String productTypeName) {
		this.productTypeName = productTypeName;
	}

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	@Override
	public String toString() {
		return "ProductTypeList  [productTypeID=" + productTypeID + ", productTypeName=" + productTypeName + "]";
	}

}
