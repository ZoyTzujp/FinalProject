package tw.eeit131.first.model;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "customer")
public class Customer implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "customerID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "Name", nullable = false, columnDefinition = "nvarchar(50)")
	private String name;

	@Column(name = "Gender", nullable = false, columnDefinition = "nvarchar(50)")
	private String gender;

	@Column(name = "Birthday", nullable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;

	@Column(name = "Email", nullable = false, columnDefinition = "nvarchar(50)")
	private String email;

	@Column(name = "Mobile", nullable = false, columnDefinition = "nvarchar(50)")
	private String cellphone;

	@Column(name = "Address", nullable = false, columnDefinition = "nvarchar(50)")
	private String address;

	@Column(name = "Password", nullable = false)
	private String password;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "customer", cascade = CascadeType.ALL)
	@JsonIgnore
	private Set<OrderList> orders = new HashSet<OrderList>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set<OrderList> getOrders() {
		return orders;
	}

	public void setOrders(Set<OrderList> orders) {
		this.orders = orders;
	}
	
	public Customer(Long id, String name, String gender, Date birthday, String email, String cellphone, String address,
			String password) {
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.email = email;
		this.cellphone = cellphone;
		this.address = address;
		this.password = password;
	}
	
	public Customer(String name, String gender, Date birthday, String email, String cellphone, String address,
			String password) {
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.email = email;
		this.cellphone = cellphone;
		this.address = address;
		this.password = password;
	}

	public Customer() {
	}
	

}
