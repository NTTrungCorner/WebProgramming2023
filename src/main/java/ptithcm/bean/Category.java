package ptithcm.bean;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "Categories")
public class Category {

	@Id @GeneratedValue
	@Column(name = "Id")
	private int id;
	@OneToMany(mappedBy = "category", fetch = FetchType.EAGER)
	private Collection<Product> Products;
	@NotBlank(message = "Không được để trống tên danh mục sản phẩm!")
	@Column(name = "Name")
	private String name;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Collection<Product> getProducts() {
		return Products;
	}
	public void setProducts(Collection<Product> products) {
		Products = products;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
