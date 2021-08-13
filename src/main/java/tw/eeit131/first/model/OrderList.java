package tw.eeit131.first.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "orderList")
public class OrderList implements Serializable{
	private static final long serialVersionUID = 1L;

	@Id @Column(name = "ORDERID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderID;

	@Column(name = "ORDERDATE")
	private Date orderDate;

	@Column(name = "ORDERSTATUS")
	private String orderStatus;

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

}
