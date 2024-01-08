package ptithcm.bean;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Users")
public class User {

	@Id @GeneratedValue
	@Column(name = "Id")
	private int id;
	@OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
	private Collection<Cart> Carts;
	@NotBlank(message = "Vui lòng điền tên người dùng!")
	@Column(name = "Username")
	private String username;
	@NotBlank(message = "Vui lòng điền email!")
	@Column(name = "Email")
	private String email;
	@NotBlank(message = "Vui lòng điền mật khẩu!")
	@Column(name = "Password")
	private String password;
	@Column(name = "Gender")
	private Boolean gender;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/mm/yyyy")
	@Column(name = "Birthday")
	private Date birthday;
	@Column(name = "Address")
	private String address;
	@Column(name = "Phone")
	private String phone;
	@Column(name = "IsAdmin")
	private Boolean isAdmin;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Collection<Cart> getCarts() {
		return Carts;
	}
	public void setCarts(Collection<Cart> carts) {
		Carts = carts;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Boolean getGender() {
		return gender;
	}
	public void setGender(Boolean gender) {
		this.gender = gender;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Boolean getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(Boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
}
