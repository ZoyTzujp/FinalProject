package tw.eeit131.first.model;

import java.io.Serializable;
import java.util.Date;
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

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "orderList")
public class OrderList implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ORDERID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderID;

	@Column(name = "ORDERDATE")
	private Date orderDate;

	@Column(name = "ORDERSTATUS")
	private String orderStatus;

	@Column(name = "ORDERADDRESS")
	private String orderAddress;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "customerID")
	@JsonIgnore
	private Customer customer;

	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(name = "orderProduct", joinColumns = { @JoinColumn(name = "ORDERID") }, inverseJoinColumns = {
			@JoinColumn(name = "PRODUCTID") })
	@JsonIgnore
	private Set<Product> products = new HashSet<Product>();

	public Integer getOrderID() {
		return orderID;
	}

	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

}
