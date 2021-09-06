package tw.eeit131.first.model;

import java.io.Serializable;
import java.sql.Timestamp;
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

	//新增8欄位，且新增getter、setter、tostring(鄧)
	@Column(name = "ORDEREMAIL")
	private String orderEmail; //收件人email
	@Column(name = "ORDERPHONE")
	private String orderPhone; //收件人電話
	@Column(name = "PRICE")
	private double price; //訂單總金額(產品總計+運費)(易造成混淆，有空再改名)
	@Column(name = "CURRENCY")
	private String currency; //貨幣
	@Column(name = "METHOD")
	private String method; //支付方法(一律為paypal)
	@Column(name = "INTENT")
	private String intent;
	@Column(name = "DESCRIPTION")
	private String description; //備註
		
		
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "shopID")
	@JsonIgnore
	private ShopBean shop;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "customerID")
	@JsonIgnore
	private Customer customer;

	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(name = "orderProduct", joinColumns = { @JoinColumn(name = "ORDERID") }, inverseJoinColumns = {
			@JoinColumn(name = "PRODUCTID") })
	@JsonIgnore
	private Set<Product> products = new HashSet<Product>();

	public ShopBean getShop() {
		return shop;
	}

	public void setShop(ShopBean shop) {
		this.shop = shop;
	}

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
	public void setOrderDate(Timestamp orderDate) {// 另外寫的setter，原型別為Date(鄧)
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

	public String getOrderEmail() {
		return orderEmail;
	}

	public void setOrderEmail(String orderEmail) {
		this.orderEmail = orderEmail;
	}

	public String getOrderPhone() {
		return orderPhone;
	}

	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getIntent() {
		return intent;
	}

	public void setIntent(String intent) {
		this.intent = intent;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("OrderList [orderID=");
		builder.append(orderID);
		builder.append(", orderDate=");
		builder.append(orderDate);
		builder.append(", orderStatus=");
		builder.append(orderStatus);
		builder.append(", orderAddress=");
		builder.append(orderAddress);
		builder.append(", orderEmail=");
		builder.append(orderEmail);
		builder.append(", orderPhone=");
		builder.append(orderPhone);
		builder.append(", price=");
		builder.append(price);
		builder.append(", currency=");
		builder.append(currency);
		builder.append(", method=");
		builder.append(method);
		builder.append(", intent=");
		builder.append(intent);
		builder.append(", description=");
		builder.append(description);
		builder.append(", shop=");
		builder.append(shop);
		builder.append(", customer=");
		builder.append(customer);
		builder.append(", products=");
		builder.append(products);
		builder.append("]");
		return builder.toString();
	}


	
}
