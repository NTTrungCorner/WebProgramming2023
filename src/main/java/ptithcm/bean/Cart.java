package ptithcm.bean;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Carts")
public class Cart {

	@Id @GeneratedValue
	@Column(name = "Id")
	private int id;
	@OneToMany(mappedBy = "cart", fetch = FetchType.EAGER)
	private Collection<Order> Orders;
	@ManyToOne
	@JoinColumn(name = "User_Id")
	private User user;
	@Column(name = "Status")
	private int status;
	
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Collection<Order> getOrders() {
		return Orders;
	}
	public void setOrders(Collection<Order> orders) {
		Orders = orders;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}
