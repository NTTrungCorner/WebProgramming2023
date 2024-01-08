package ptithcm.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.SharedSessionContract;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.bean.Cart;
import ptithcm.bean.Mailer;
import ptithcm.bean.Order;
import ptithcm.bean.Product;
import ptithcm.bean.User;

@Transactional
@Controller
public class OrderController {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	Mailer mailer;

//	@RequestMapping("cart")
//	public String cart() {
//		return "cart/cart";
//	}

	@RequestMapping("user/cart")
	public String index(ModelMap model, HttpSession httpSession) {
		Integer userId = ((User) httpSession.getAttribute("currentUser")).getId();
		Session hibernateSession = sessionFactory.getCurrentSession();

		Cart cart = (Cart) hibernateSession.createQuery("FROM Cart WHERE user.id = :userId AND status = 0")
				.setParameter("userId", userId).uniqueResult();

		if (cart != null) {
			List<Order> orderList = hibernateSession.createQuery("FROM Order WHERE cart.id = :cartId")
					.setParameter("cartId", cart.getId()).list();

			if (!orderList.isEmpty()) {
				model.addAttribute("orders", orderList);
			} else {
				model.addAttribute("status", "Giỏ hàng trống !");
			}
		} else {
			model.addAttribute("status", "Giỏ hàng trống !");
		}

		return "cart/cart";
	}

	@RequestMapping(value = "user/shopping", method = RequestMethod.POST)
	public String addToCart(ModelMap model, HttpSession httpSession, @RequestParam("productId") Integer productId,
			@RequestParam("quantity") Integer quantity) {
		try {
			Integer userId = ((User) httpSession.getAttribute("currentUser")).getId();
			Session hibernateSession = sessionFactory.getCurrentSession();
			// Lấy đối tượng Product từ productId
			Product product = (Product) hibernateSession.get(Product.class, productId);
			// Truy vấn xem có Cart nào được liên kết với userId hay không
			Cart cart = (Cart) hibernateSession.createQuery("FROM Cart WHERE user.id = :userId AND status = 0")
					.setParameter("userId", userId).uniqueResult();

			if (cart != null) {
				System.out.println("userId: " + userId + " status " + cart.getStatus());
				Order order = (Order) hibernateSession
						.createQuery("FROM Order WHERE cart.id = :cartId AND product.id = :productId")
						.setParameter("cartId", cart.getId()).setParameter("productId", productId).uniqueResult();

				if (order != null) {
					// Sản phẩm đã có trong đơn hàng, thực hiện cập nhật số lượng
					int newQuantity = order.getQuantity() + quantity; // Cộng số lượng mới vào số
																		// lượng cũ
					order.setQuantity(newQuantity);
					// Lưu cập nhật vào cơ sở dữ liệu
					hibernateSession.update(order);
					model.addAttribute("addtoCart", "Cập nhập số lượng thành công !");
				} else {
					// Sản phẩm chưa có trong đơn hàng, tạo mới Order
					Order newOrder = new Order();
					newOrder.setCart(cart);
					newOrder.setProduct(product);
					newOrder.setQuantity(quantity);

					// Lưu mới Order vào cơ sở dữ liệu
					hibernateSession.save(newOrder);
					model.addAttribute("addtoCart", "Đã thêm sản phẩm vào giỏ hàng thành công !");
				}
			}

			if (cart == null) {
				// Nếu không có Cart, tạo mới một Cart và liên kết nó với User
				User user = (User) hibernateSession.get(User.class, userId);
				Cart newCart = new Cart();
				newCart.setUser(user);
				newCart.setStatus(0);
				// Lưu Cart mới vào cơ sở dữ liệu
				hibernateSession.save(newCart);

				System.out.println("Cart Id before save: " + newCart.getId());
				// ... Lưu đối tượng cart ...

				// Giỏ hàng mới tạo nên chắc chắn chưa có đơn hàng nào, tạo mới đơn hàng
				Order newOrder = new Order();
				newOrder.setCart(newCart);
				newOrder.setProduct(product);
				newOrder.setQuantity(quantity);

				// Lưu mới Order vào cơ sở dữ liệu
				// hibernateSession.save(newOrder);
				model.addAttribute("addtoCart", "Đã thêm sản phẩm vào giỏ hàng thành công !");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("addtoCart", "Đã xảy ra lỗi trong quá trình thêm giỏ hàng.");
		}
		return "redirect:/shopping.htm";
	}

	@RequestMapping(value = "/user/removeFromCart/{orderId}", method = RequestMethod.GET)
	public String removeFromCart(@PathVariable Integer orderId, ModelMap model, HttpSession httpSession) {
		try {
			Session hibernateSession = sessionFactory.getCurrentSession();

			// Lấy đối tượng Order cần xóa
			Order order = (Order) hibernateSession.get(Order.class, orderId);

			hibernateSession.delete(order);

			model.addAttribute("delete", "Xóa thành công!");

			return "redirect:/user/cart.htm"; // Chuyển hướng đến trang giỏ hàng sau khi xóa
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("delete", "Đã xảy ra lỗi trong quá trình xóa giỏ hàng.");
			return "redirect:/user/cart.htm"; // hoặc trả về trang lỗi
		}
	}

	@RequestMapping("user/pay")
	public String pay(ModelMap model, HttpSession httpSession) {
		String userName = ((User) httpSession.getAttribute("currentUser")).getUsername();
		String userEmail = ((User) httpSession.getAttribute("currentUser")).getEmail();
		Session hibernateSession = sessionFactory.getCurrentSession();
		 // In ra console để kiểm tra giá trị
        System.out.println("Username: " + userName);
        System.out.println("Email: " + userEmail);
        
		model.addAttribute("username", userName);
		model.addAttribute("email", userEmail);
		
		
		
		
		
		
		
		return "pay/pay";
	}
	
	@RequestMapping(value = "/user/processOrder", method = RequestMethod.POST)
	public String processOrder(@RequestParam("phone") String phoneNumber,
	                            @RequestParam("address") String address,
	                            @RequestParam("note") String note,
	                            ModelMap model,HttpSession httpSession) {
		Session hibernateSession = sessionFactory.getCurrentSession();
		Integer userId = ((User) httpSession.getAttribute("currentUser")).getId();
		
		String phone = phoneNumber;
		String address1 = address;
		
		((User) httpSession.getAttribute("currentUser")).setPhone(phone);
		((User) httpSession.getAttribute("currentUser")).setAddress(address1);
		// Lưu cập nhật vào cơ sở dữ liệu
		hibernateSession.update((User) httpSession.getAttribute("currentUser"));
		
		Cart cart = (Cart) hibernateSession.createQuery("FROM Cart WHERE user.id = :userId AND status = 0")
				.setParameter("userId", userId).uniqueResult();
		
		List<Order> orderList = hibernateSession.createQuery("FROM Order WHERE cart.id = :cartId")
                .setParameter("cartId", cart.getId()).list();
		
		model.addAttribute("orderList", orderList);
		
		// Trước phần gửi email, xây dựng nội dung Thẻ JSTL <c:forEach>
		
		String orderDetails = "";
		for (Order order : orderList) {
		    orderDetails += "Tên sản phẩm: " + order.getProduct().getName() + "<br>"
		            + "Số lượng: " + order.getQuantity() + "<br>"
		            + "Tổng tiền sản phẩm: " + order.getQuantity()*order.getProduct().getPrice() + "<br><br>";
		}
		
		String from = "Elite.Interiors.Webproject@gmail.com";
		String subject = "Xác nhận Đặt Hàng Thành Công";
		String body = "Chào bạn " + ((User) httpSession.getAttribute("currentUser")).getUsername() + ",<br><br>"
		        + "Chúc mừng! Bạn đã đặt hàng thành công trên Elite Interiors. Dưới đây là thông tin đơn hàng của bạn:<br><br>"
		        + "Tên người nhận: " + ((User) httpSession.getAttribute("currentUser")).getUsername() + "<br>"
		        + "Địa chỉ Email: " + ((User) httpSession.getAttribute("currentUser")).getEmail() + "<br>"
		        + "Số điện thoại: " + phone + "<br>"
		        + "Ghi chú: " + note + "<br>"
		        + "Địa chỉ: " + address1 + "<br><br>"
		        + "Thông tin đơn hàng" +"<br><br>"
		        + orderDetails  // Thêm thông tin đơn hàng đã lặp vào đây
		        + "Nếu bạn có bất kỳ câu hỏi hoặc cần hỗ trợ, đừng ngần ngại liên hệ với chúng tôi qua Elite.Interiors.Webproject@gmail.com .<br><br>"
		        + "Cảm ơn bạn đã tin tưởng chúng tôi, và chúng tôi mong rằng bạn sẽ có trải nghiệm tuyệt vời trên Elite Interiors.<br><br>"
		        + "Trân trọng,<br>"
		        + "Elite Interiors<br><br>";
		
		mailer.send(from, ((User) httpSession.getAttribute("currentUser")).getEmail(), subject, body);

		cart.setStatus(1);
		hibernateSession.update(cart);
		model.addAttribute("mess", "Đặt hàng thành công !");
	    return "redirect:/shopping.htm";
	}

}
