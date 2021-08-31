package tw.eeit131.first.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="shopComment")
public class ShopComment implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "commentID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer commentID;
	
	@Column(name="name")
	private String name;
	
	@Column(name="email")
	private String email;	
	
	@Column(name="shopContent")
	private String shopContent;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="shopID")
	@JsonIgnore
	private ShopBean shopBean;
	
	@Transient // 外來鍵可忽略
	@Column(name = "shopID")
	private Integer shopID;
	
	
	
	
	
	public void setShopBean(ShopBean shopBean) {
		this.shopBean = shopBean;
	}


	public ShopBean getShopBean() {
		return this.shopBean;
	}

	

	
	public Integer getCommentID() {
		return commentID;
	}


	public void setCommentID(Integer commentID) {
		this.commentID = commentID;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public Integer getShopID() {
		return shopID;
	}


	public void setShopID(Integer shopID) {
		this.shopID = shopID;
	}



	public String getShopContent() {
		return shopContent;
	}


	public void setShopContent(String shopContent) {
		this.shopContent = shopContent;
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ShopComment [commentID=");
		builder.append(commentID);
		builder.append(", name=");
		builder.append(name);
		builder.append(", email=");
		builder.append(email);
		builder.append(", shopContent=");
		builder.append(shopContent);
		builder.append(", shopBean=");
		builder.append(shopBean);
		builder.append(", shopID=");
		builder.append(shopID);
		builder.append("]");
		return builder.toString();
	}
	
	
	
}
