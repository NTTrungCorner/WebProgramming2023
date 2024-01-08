package ptithcm.bean;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "Products")
public class Product {

	@Id @GeneratedValue
	@Column(name = "Id")
	private int id;
	@OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
	private Collection<Order> Orders;
	@NotBlank(message = "Không được để trống tên sản phẩm!")
	@Column(name = "Name")
	private String name;
	@Column(name = "Description")
	private String description;
	@NotNull(message = "Không được để trống số lượng!")
	@DecimalMin(value = "0", message = "Số lượng hàng hóa không thể âm!")
	@Column(name = "Quantity")
	private int quantity;
	@NotNull(message = "Không được để trống giá sản phẩm!")
	@DecimalMin(value = "0", message = "Giá sản phẩm không thể âm!")
	@Column(name = "Price")
	private float price;
	@Column(name = "Discount")
	private float discount;
	@Column(name = "Image")
	private String image;
	@ManyToOne
	@JoinColumn(name = "Category_Id")
	private Category category;
	
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
}
