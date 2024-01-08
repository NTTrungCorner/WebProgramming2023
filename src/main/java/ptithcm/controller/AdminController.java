package ptithcm.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.bean.Cart;
import ptithcm.bean.Category;
import ptithcm.bean.Order;
import ptithcm.bean.Product;
import ptithcm.bean.User;

@Transactional
@Controller
public class AdminController {
 
	@Autowired
	SessionFactory sessionFactory;
	
	@Autowired
	ServletContext context;
	
	// Lọc và lấy các sản phẩm, danh mục
	@RequestMapping("admin")
	public String index(ModelMap model) {
		Session session = sessionFactory.getCurrentSession();

		// Lấy danh sách tất cả các sản phẩm
		String hql = "FROM Product";
		Query query = session.createQuery(hql);
		List<Product> products = query.list();
		model.addAttribute("products", products);
		
		// Lấy danh sách tất cả các danh mục sản phẩm
		String hql2 = "FROM Category";
		Query query2 = session.createQuery(hql2);
		List<Category> categories = query2.list();
		model.addAttribute("categories", categories);
		
		// Lấy danh sách tất cả các danh mục sản phẩm
		String hql3 = "FROM User";
		Query query3 = session.createQuery(hql3);
		List<User> users = query3.list();
		model.addAttribute("users", users);
					
		// Lấy danh sách tất cả các danh mục sản phẩm
		String hql4 = "FROM Order";
		Query query4 = session.createQuery(hql4);
		List<Order> orders = query4.list();
		model.addAttribute("orders", orders);
		
		// Lấy danh sách tất cả các danh mục sản phẩm
		String hql5 = "FROM Cart";
		Query query5 = session.createQuery(hql5);
		List<Cart> carts = query5.list();
		model.addAttribute("carts", carts);
		return "admin/admin";
	} 
	
	//// 	<NHÓM HÀM LÀM VIÊC VỚI NGƯỜI DÙNG (USER)> 
	
	@RequestMapping(value = "admin", params = "btnUpdateUser", method = RequestMethod.POST)
	public String updateUser(ModelMap model, HttpSession httpSession, @RequestParam("adminUserId") int id,
			@RequestParam("adminUserRole") Boolean role) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		
		User user = (User) session.createQuery("FROM User WHERE id =:id").setParameter("id", id).uniqueResult();
		user.setIsAdmin(role);
		

		try { 
			session.update(user);
			session.flush();
			t.commit();
			// Thông báo đã thành công?
		} catch (Exception e) {
			t.rollback();
			// Thông báo có lỗi
		} finally {
			session.close();
		}
		return "redirect:/admin.htm";
	}
	
	@RequestMapping(value = "admin", params = "btnDeleteUser", method = RequestMethod.POST)
	public String deleteUser(ModelMap model, HttpSession httpSession, @RequestParam("adminUserid") int id) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();

		User user = (User) session.createQuery("FROM User WHERE id =:id").setParameter("id", id).uniqueResult();

		try {
			session.delete(user);
			session.flush();
			t.commit();
			// Thông báo đã thành công?
		} catch (Exception e) {
			t.rollback();
			// Thông báo có lỗi
		} finally {
			session.close();
		}
		return "redirect:/admin.htm";
	}
	
	////	</NHÓM HÀM LÀM VIÊC VỚI NGƯỜI DÙNG (USER)> 
	
	
	
	
	
	////	<NHÓM HÀM LÀM VIÊC VỚI SẢN PHẨM (PRODUCT)> 
	
	@RequestMapping(value = "admin", params = "btnInsertProduct", method = RequestMethod.POST)
	public String insertProduct(ModelMap model, HttpSession httpSession,
			@RequestParam("newProductName") String name, @RequestParam("newProductQuantity") Integer quantity, 
			@RequestParam("newProductPrice") float price, @RequestParam("newProductDescription") String description,
			@RequestParam("newProductDiscount") float discount, @RequestParam("newProductPhoto") MultipartFile image, 
			@RequestParam("newProductCategory") int categoryId) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();

		Product product = new Product();
		product.setName(name);
		product.setQuantity(quantity);
		product.setPrice(price);
		product.setDescription(description);
		product.setDiscount(discount);
		String toImage = image.getOriginalFilename();
		product.setImage(toImage);
		if(image.isEmpty()) {
			model.addAttribute("message", "Vui lòng chọn file !");
			return "redirect:/admin.htm";
		}
		if (name.isBlank()||quantity.equals(null)||price == 0.0f||description.isBlank()||discount==0.0f||categoryId==0) {
			model.addAttribute("message","Vui lòng điền đầy đủ thông tin !");
		} 
		else {
		try {
			String photoPath = context.getRealPath("/img/" + image.getOriginalFilename());
			image.transferTo(new File(photoPath));
		} catch (Exception e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		Category cate = (Category) session.createQuery("FROM Category WHERE id =:id").setParameter("id", categoryId).uniqueResult();
		product.setCategory(cate);
		
		// Kiểm tra tên sản phẩm
		if (session.createQuery("FROM Product WHERE name =:name").setParameter("name", name).uniqueResult() != null) {
			// Thông báo lỗi đã có tên sản phẩm
			model.addAttribute("nameError", "Tên sản phẩm này đã tồn tại");
			return "redirect:/admin.htm";
		}
		
		// Kiểm tra tên hình ảnh
		if (session.createQuery("FROM Product WHERE image =:toImage").setParameter("toImage", toImage).uniqueResult() != null) {
			// Thông báo lỗi đã có tên hình ảnh
			model.addAttribute("imageError", "Hình sản phẩm này đã tồn tại");
			return "redirect:/admin.htm";
		}

		try {
			session.save(product);
			t.commit();
			// Thông báo đã thành công?
		} catch (Exception e) {
			t.rollback();
			// Thông báo có lỗi
		} finally {
			session.close();
		}
		return "redirect:/admin.htm";
	}

	@RequestMapping(value = "admin", params = "btnUpdateProduct", method = RequestMethod.POST)
	public String updateProduct(ModelMap model, HttpSession httpSession, @RequestParam("adminProductId") int id,
			@RequestParam("adminProductName") String name, @RequestParam("adminProductQuantity") Integer quantity, 
			@RequestParam("adminProductPrice") float price, @RequestParam("adminProductDescription") String description,
			@RequestParam("adminProductDiscount") float discount, @RequestParam("adminProductPhoto") MultipartFile image, 
			@RequestParam("adminProductCategory") int categoryId) {
		
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();

		Product newProduct = (Product) session.createQuery("FROM Product WHERE id =:id").setParameter("id", id).uniqueResult();
		newProduct.setName(name);
		newProduct.setQuantity(quantity);
		newProduct.setPrice(price);
		newProduct.setDescription(description);
		newProduct.setDiscount(discount);
		
		String toImage = image.getOriginalFilename();
		newProduct.setImage(toImage);
		
		
		try {
			String photoPath = context.getRealPath("/img/" + image.getOriginalFilename());
			image.transferTo(new File(photoPath));
		} catch (Exception e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//
		Category cate = (Category) session.createQuery("FROM Category WHERE id =:id").setParameter("id", categoryId).uniqueResult();
		newProduct.setCategory(cate);
//		// Kiểm tra tên sản phẩm
//		if (session.createQuery("FROM Product WHERE name =:name").setParameter("name", name).uniqueResult() != null) {
//			// Thông báo lỗi đã có tên sản phẩm
//			model.addAttribute("namefixError", "Tên sản phẩm này đã tồn tại");
//			return "redirect:/admin.htm";
//		}
		
//		// Kiểm tra tên hình ảnh
//		if (session.createQuery("FROM Product WHERE image =:toImage").setParameter("toImage", toImage).uniqueResult() != null) {
//			// Thông báo lỗi đã có tên hình ảnh
//			model.addAttribute("imageError", "Hình sản phẩm này đã tồn tại");
//			return "redirect:/admin.htm";
//		}
		try {
			session.update(newProduct);
			session.flush();
			t.commit();
			// Thông báo đã thành công?
		} catch (Exception e) {
			t.rollback();
			// Thông báo có lỗi
		} finally {
			session.close();
		}
		return "redirect:/admin.htm";
	}

	@RequestMapping(value = "admin", params = "btnDeleteProduct", method = RequestMethod.POST)
	public String deleteProduct(ModelMap model, HttpSession httpSession, @RequestParam("adminProductId") int id) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();

		Product product = (Product) session.createQuery("FROM Product WHERE id =:id").setParameter("id", id).uniqueResult();
		try {
			session.delete(product);
			session.flush();
			t.commit();
			// Thông báo đã thành công?
		} catch (Exception e) {
			t.rollback();
			// Thông báo có lỗi
		} finally {
			session.close();
		}
		return "redirect:/admin.htm";
	}

	////	</NHÓM HÀM LÀM VIÊC VỚI SẢN PHẨM (PRODUCT)> 
	
	
	
	
	
	////	<NHÓM HÀM LÀM VIÊC VỚI GIỎ HÀNG (CART)> 
	
	@RequestMapping(value = "admin", params = "btnUpdateCart", method = RequestMethod.POST)
	public String updateOrder(ModelMap model, HttpSession httpSession, @RequestParam("adminCartId") int id) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		
		Cart cart = (Cart) session.createQuery("FROM Cart WHERE id =:id").setParameter("id", id).uniqueResult();
		
		// Chỉ chuyển đổi status khi đã xác nhận đơn hàng (status = 1)
	    if (cart.getStatus() == 1) {
	        cart.setStatus(2);
	    }
	    
		try { 
			session.update(cart);
			session.flush();
			t.commit();
			// Thông báo đã thành công?
		} catch (Exception e) {
			t.rollback();
			// Thông báo có lỗi
		} finally {
			session.close();
		}
		return "redirect:/admin.htm";
	}
	
	////	</NHÓM HÀM LÀM VIÊC VỚI ĐƠN HÀNG (ORDER)> 

	
	
	
	
	//// 	<NHÓM HÀM LÀM VIÊC VỚI DANH MỤC HÀNG HÓA (CATEGORY)> 
	
	@RequestMapping(value = "admin", params = "btnInsertCategory", method = RequestMethod.POST)
	public String insertCategory(ModelMap model, HttpSession httpSession, @RequestParam("newCategoryName") String name) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();

		Category category = new Category();
		category.setName(name);

		if (session.createQuery("FROM Category WHERE name =:name")
				.setParameter("name", name).uniqueResult() != null) {
			// Thông báo lỗi đã có category
			
				model.addAttribute("Categoryname", "Tên danh mục này đã tồn tại");
				
			

				return "redirect:/admin.htm";
		}
		if(name.isBlank()) {
			model.addAttribute("Categoryname", "Vui lòng điền đầy đủ thông tin!");
		}
		else {
		try {
			session.save(category);
			t.commit();
			// Thông báo đã thành công?
		} catch (Exception e) {
			t.rollback();
			// Thông báo có lỗi
		} finally {
			session.close();
		}
		}
		return "redirect:/admin.htm";
	}
	
	@RequestMapping(value = "admin", params = "btnUpdateCategory", method = RequestMethod.POST)
	public String updateCategory(ModelMap model, HttpSession httpSession, @RequestParam("adminCategoryId") int id,
			@RequestParam("adminCategoryName") String name) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		
		Category category = (Category) session.createQuery("FROM Category WHERE id =:id").setParameter("id", id).uniqueResult();
		category.setName(name);
//		if (session.createQuery("FROM Category WHERE name =:name")
//				.setParameter("name", name).uniqueResult() != null) {
//			// Thông báo lỗi đã có category
//			
//				model.addAttribute("Categoryname", "Tên danh mục này đã tồn tại");
//				return "redirect:/admin.htm";
//			}
		
		try { 
			session.update(category);
			session.flush();
			t.commit();
			// Thông báo đã thành công?
		} catch (Exception e) {
			t.rollback();
			// Thông báo có lỗi
		} finally {
			session.close();
		}
		return "redirect:/admin.htm";
	}
	
	@RequestMapping(value = "admin", params = "btnDeleteCategory", method = RequestMethod.POST)
	public String deleteCategory(ModelMap model, HttpSession httpSession, @RequestParam("adminCategoryId") int id) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();

		Category category = (Category) session.createQuery("FROM Category WHERE id =:id").setParameter("id", id).uniqueResult();

		try {
			session.delete(category);
			session.flush();
			t.commit();
			// Thông báo đã thành công?
		} catch (Exception e) {
			t.rollback();
			// Thông báo có lỗi
		} finally {
			session.close();
		}
		return "redirect:/admin.htm";
	}
		
	////	</NHÓM HÀM LÀM VIÊC VỚI DANH MỤC HÀNG HÓA (CATEGORY)> 
}
