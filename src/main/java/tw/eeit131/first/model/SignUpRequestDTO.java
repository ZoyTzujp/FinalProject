package tw.eeit131.first.model;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class SignUpRequestDTO {
	
	private String name;
	private String gender;
	private Date birthday;
	private String email;
	private String cellphone;
	private String address;
	private String password;
	

	public SignUpRequestDTO() {
	}

	public SignUpRequestDTO(String name, String gender, Date birthday, String email, String cellphone, String address,
			String password) {
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.email = email;
		this.cellphone = cellphone;
		this.address = address;
		this.password = password;
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

	@Override
	public String toString() {
		return "SignUpRequestDTO [name=" + name + ", gender=" + gender + ", birthday=" + birthday + ", email=" + email
				+ ", cellphone=" + cellphone + ", address=" + address + ", password=" + password + "]";
	}

	
	
	
	
	
	
	
	
	
	
	
	
}
