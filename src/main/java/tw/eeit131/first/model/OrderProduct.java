package tw.eeit131.first.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "orderProduct")
public class OrderProduct implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Transient // 外來鍵可忽略
	@Column(name = "ORDERID")
	private Integer orderID;

	@Transient // 外來鍵可忽略
	@Column(name = "PRODUCTID")
	private Integer productID;

	@Column(name = "SALEQTY")
	private Integer saleQty;

	private Integer newSaleQty;
	private String productName;
	private Integer quantity;
	private String standard;
	private Integer price;

	public OrderProduct() {
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("OrderProduct [productID=");
		builder.append(productID);
		builder.append(", saleQty=");
		builder.append(saleQty);
		builder.append(", newSaleQty=");
		builder.append(newSaleQty);
		builder.append(", productName=");
		builder.append(productName);
		builder.append(", quantity=");
		builder.append(quantity);
		builder.append(", standard=");
		builder.append(standard);
		builder.append(", price=");
		builder.append(price);
		builder.append("]");
		return builder.toString();
	}

	public OrderProduct(Integer productID, Integer saleQty, Integer newSaleQty, String productName, Integer quantity,
			String standard, Integer price) {
		super();
		this.productID = productID;
		this.saleQty = saleQty;
		this.newSaleQty = newSaleQty;
		this.productName = productName;
		this.quantity = quantity;
		this.standard = standard;
		this.price = price;
	}

	public Integer getOrderID() {
		return orderID;
	}

	public void setOrderID(Integer orderID) {
		this.orderID = orderID;
	}

	public Integer getProductID() {
		return productID;
	}

	public void setProductID(Integer productID) {
		this.productID = productID;
	}

	public Integer getSaleQty() {
		return saleQty;
	}

	public void setSaleQty(Integer saleQty) {
		this.saleQty = saleQty;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getStandard() {
		return standard;
	}

	public void setStandard(String standard) {
		this.standard = standard;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getNewSaleQty() {
		return newSaleQty;
	}

	public void setNewSaleQty(Integer newSaleQty) {
		this.newSaleQty = newSaleQty;
	}	

}
