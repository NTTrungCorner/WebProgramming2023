package ptithcm.controller;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.bean.Product;
import ptithcm.bean.Category;

@Transactional
@Controller
public class ProductController {

	@Autowired
	SessionFactory factory;

	// Lọc và lấy các sản phẩm, danh mục
	@RequestMapping("shopping")
	public String index(@RequestParam(value = "categoryId", required = false) Integer categoryId,
						@RequestParam(value = "searchBar", required = false) String searchBar, ModelMap model) {
		Session session = factory.getCurrentSession();

		// Lấy danh sách sản phẩm theo category hoặc tất cả
		// Nếu lọc theo danh mục thì phải dùng AND, không thì phải dùng WHERE
		String hql = "FROM Product";
		if (categoryId != null) {
			hql += " WHERE category.id = :categoryId";
			if (searchBar != null && !searchBar.isEmpty()) {
				hql += " AND lower(name) like :searchBar";
			}
		} else {
			if (searchBar != null && !searchBar.isEmpty()) {
				hql += " WHERE lower(name) like :searchBar";
			}
		}

		// Lọc sản phẩm theo tên trong thanh tìm kiếm
		Query query = session.createQuery(hql);
		if (categoryId != null) {
			query.setParameter("categoryId", categoryId);
			if (searchBar != null && !searchBar.isEmpty()) {
				query.setParameter("searchBar", "%" + searchBar.toLowerCase() + "%");
			}
		} else {
			if (searchBar != null && !searchBar.isEmpty()) {
				query.setParameter("searchBar", "%" + searchBar.toLowerCase() + "%");
			}
		}

		// Đưa ra danh sách sản phẩm cuối sau các bước lọc
		List<Product> productList = query.list();
		model.addAttribute("products", productList);

		// Lấy danh sách tất cả các category
		String hql2 = "FROM Category";
		Query query2 = session.createQuery(hql2);
		List<Category> categories = query2.list();
		model.addAttribute("categories", categories);

		return "shopping/shopping";
	}
	
	// Tạo sản phẩm
	@RequestMapping(value = "productCreate", method = RequestMethod.POST)
	public String productCreate(ModelMap model, @ModelAttribute("ProductCreate") Product product) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			// Nhớ kiểm tra nhập liệu Tên/ Số lượng/ Giá/ Danh mục
			// Kiểm tra nhập liệu cơ bản
		  

			
			session.save(product);
			t.commit();
			model.addAttribute("messageProductCRUD", "Thêm mới thành công!");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("messageProductCRUD", "Thêm mới thất bại!");

		} finally {
			session.close();
		}
		return "user/insert";
	}
	
	@RequestMapping(value = "/productUpdate/{productId}", method = RequestMethod.POST)
	public String productUpdate(ModelMap model, @PathVariable("productId") int productId,
	                             @ModelAttribute("ProductUpdate") Product updatedProduct) {
	    Session session = factory.openSession();
	    Transaction t = session.beginTransaction();

	    try {
	        // Kiểm tra xem sản phẩm cần cập nhật có tồn tại hay không
	        Product oldProduct = (Product) session.get(Product.class, productId);

	        if (oldProduct == null) {
	            model.addAttribute("messageProductCRUD", "Sản phẩm không tồn tại!");
	            return "redirect:/productList"; // Chuyển hướng đến trang admin, báo lỗi
	        }

	        // Cập nhật thông tin sản phẩm
	        oldProduct.setName(updatedProduct.getName());
	        oldProduct.setDescription(updatedProduct.getDescription());
	        oldProduct.setQuantity(updatedProduct.getQuantity());
	        oldProduct.setPrice(updatedProduct.getPrice());
	        oldProduct.setDiscount(updatedProduct.getDiscount());
	        oldProduct.setImage(updatedProduct.getImage());
	        oldProduct.setCategory(updatedProduct.getCategory());

	        session.update(oldProduct);
	        t.commit();

	        model.addAttribute("messageProductCRUD", "Cập nhật thành công!");
	    } catch (Exception e) {
	        t.rollback();
	        model.addAttribute("messageProductCRUD", "Cập nhật thất bại!");
	        e.printStackTrace();
	    } finally {
	        session.close();
	    }

	    return "redirect:/productList"; // Chuyển hướng về trang admin
	}

	@RequestMapping(value = "/deleteProduct/{productId}", method = RequestMethod.GET)
	public String deleteProduct(ModelMap model, @PathVariable("productId") int productId) {
	    Session session = factory.openSession();
	    Transaction t = session.beginTransaction();

	    try {
	        // Kiểm tra xem sản phẩm cần xóa có tồn tại hay không
	        Product productToDelete = (Product) session.get(Product.class, productId);

	        if (productToDelete == null) {
	            model.addAttribute("messageProductCRUD", "Sản phẩm không tồn tại!");
	            return "redirect:/productList"; // Chuyển hướng đến trang admin, báo lỗi
	        }

	        // Xóa sản phẩm
	        session.delete(productToDelete);
	        t.commit();

	        model.addAttribute("messageProductCRUD", "Xóa thành công!");
	    } catch (Exception e) {
	        t.rollback();
	        model.addAttribute("messageProductCRUD", "Xóa thất bại!");
	        e.printStackTrace();
	    } finally {
	        session.close();
	    }

	    return "redirect:/productList"; // Chuyển hướng về trang admin
	}
	
	// Tạo danh mục sản phẩm
		@RequestMapping(value = "categoryCreate", method = RequestMethod.POST)
		public String categoryCreate(ModelMap model, @ModelAttribute("CategoryCreate") Category category) {
			Session session = factory.openSession();
			Transaction t = session.beginTransaction();
			try {
				// Nhớ kiểm tra nhập liệu Tên
			
				session.save(category);
				t.commit();
				model.addAttribute("messageCategoryCRUD", "Thêm mới thành công!");
			} catch (Exception e) {
				t.rollback();
				model.addAttribute("messageCategoryCRUD", "Thêm mới thất bại!");

			} finally {
				session.close();
			}
			return "redirect:/categoryList";
		}
		
		@RequestMapping(value = "categoryUpdate/{categoryId}", method = RequestMethod.POST)
		public String categoryUpdate(ModelMap model, @PathVariable("categoryId") int categoryId,
														@PathVariable("categoryId") String categoryName) {
		    Session session = factory.openSession();
		    Transaction t = session.beginTransaction();

		    try {
		        // Kiểm tra xem sản phẩm cần cập nhật có tồn tại hay không
		        Category oldCategory = (Category) session.get(Category.class, categoryId);

		        if (oldCategory == null) {
		            model.addAttribute("messageCategoryCRUD", "Danh mục sản phẩm không tồn tại!");
		            return "redirect:/categoryList"; // Chuyển hướng đến trang admin, báo lỗi
		        }

		        // Cập nhật thông tin danh mục sản phẩm
		        oldCategory.setName(categoryName);

		        session.update(oldCategory);
		        t.commit();

		        model.addAttribute("messageCategoryCRUD", "Cập nhật thành công!");
		    } catch (Exception e) {
		        t.rollback();
		        model.addAttribute("messageCategoryCRUD", "Cập nhật thất bại!");
		        e.printStackTrace();
		    } finally {
		        session.close();
		    }

		    return "redirect:/categoryList"; // Chuyển hướng về trang admin
		}

		@RequestMapping(value = "deleteCategory/{categoryId}", method = RequestMethod.GET)
		public String deleteCategory(ModelMap model, @PathVariable("categoryId") int categoryId) {
		    Session session = factory.openSession();
		    Transaction t = session.beginTransaction();

		    try {
		        // Kiểm tra xem danh mục sản phẩm cần xóa có tồn tại hay không
		    	Category categoryToDelete = (Category) session.get(Category.class, categoryId);
		        if (categoryToDelete == null) {
		            model.addAttribute("messageCategoryCRUD", "Sản phẩm không tồn tại!");
		            return "redirect:/productList"; // Chuyển hướng đến trang admin, báo lỗi
		        }

		        // Xóa sản phẩm
		        session.delete(categoryToDelete);
		        t.commit();

		        model.addAttribute("messageCategoryCRUD", "Xóa thành công!");
		    } catch (Exception e) {
		        t.rollback();
		        model.addAttribute("messageCategoryCRUD", "Xóa thất bại!");
		        e.printStackTrace();
		    } finally {
		        session.close();
		    }

		    return "redirect:/categoryList"; // Chuyển hướng về trang admin
		}

}
