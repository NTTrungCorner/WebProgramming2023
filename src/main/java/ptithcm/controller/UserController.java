package ptithcm.controller;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import ptithcm.bean.Mailer;
import ptithcm.bean.User;

@Transactional
@Controller
public class UserController {

	@Autowired
	SessionFactory factory;
	
	@Autowired
	Mailer mailer;

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String processLogin(ModelMap model, HttpSession httpSession, HttpServletResponse response, @RequestParam("email") String email,
	    @RequestParam("password") String password,@RequestParam(value = "rememberMe", required = false) String rememberMe) {
	    try {
	        Session hibernateSession = factory.getCurrentSession();
	        User user = (User) hibernateSession.createQuery("FROM User WHERE email = :email AND password = :password")
	                .setParameter("email", email).setParameter("password", password).uniqueResult();
	        
	        if (user != null) {
	            // Lưu thông tin người dùng vào session
	            httpSession.setAttribute("currentUser", user);
	            
	            // Kiểm tra xem người dùng đã chọn "Lưu tài khoản" chưa
	            if ("1".equals(rememberMe)) {
	                // Tạo cookie và lưu email và mật khẩu
	                Cookie emailCookie = new Cookie("email", email);
	                Cookie passwordCookie = new Cookie("password", password);
	                emailCookie.setMaxAge(10 * 24 * 60 * 60);  // Thời gian hiệu lực của Cookie = 10 ngày
	                passwordCookie.setMaxAge(10 * 24 * 60 * 60);
	                response.addCookie(emailCookie);
	                response.addCookie(passwordCookie);
	            }
	            
	            System.out.println("Logged in user: " + ((User) httpSession.getAttribute("currentUser")).getUsername());
	            return "index";
	        } else {
	            model.addAttribute("loginMessage", "Sai tên đăng nhập hoặc mật khẩu!");
	            return "login/login";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        model.addAttribute("loginMessage", "Đã xảy ra lỗi trong quá trình đăng nhập.");
	        return "login/login";
	    }
	}
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String logout(HttpSession httpSession, HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Log out:");

	    // Xóa thông tin đăng nhập khỏi session
	    httpSession.removeAttribute("currentUser");

	    // Xóa cookie
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().equals("email") || cookie.getName().equals("password")) {
	                cookie.setMaxAge(0);
	                response.addCookie(cookie);
	            }
	        }
	    }
	    
	    // Chuyển hướng đến trang đăng nhập
	    return "login/login";
	}

	@RequestMapping(value = "registration", method = RequestMethod.POST)
	public String processRegistration(ModelMap model, @RequestParam("username") String username,
			@RequestParam("email") String email, @RequestParam("password") String password) {
		try {
			Session session = factory.getCurrentSession();

			// Kiểm tra xem email đã tồn tại trong hệ thống chưa
			User existingUser = (User) session.createQuery("FROM User WHERE email = :email")
					.setParameter("email", email).uniqueResult();
			if(password.length()<6) {
				model.addAttribute("loginMessage", "Password phải từ 6 kí tự trở lên!");
				return "login/login";
			}
			if (existingUser != null) {
				model.addAttribute("loginMessage", "Lỗi đăng ký !");
				model.addAttribute("regisMessage", "Email đã được sử dụng. Vui lòng chọn email khác.");
			
				return "login/login"; // Chuyển hướng đến trang đăng nhập với thông báo lỗi
			}
			
			// Tạo đối tượng User mới và đặt các thông tin từ form
			User newUser = new User();
			newUser.setUsername(username);
			newUser.setEmail(email);
			newUser.setPassword(password);
			newUser.setIsAdmin(false);
			
			String from = "Elite.Interiors.Webproject@gmail.com";
			String subject = "Xác nhận Đăng Ký Thành Công";
			String body = "Chào bạn " + username + ",<br><br>"
			        + "Chúc mừng! Bạn đã đăng ký thành công tài khoản trên Elite Interiors. Dưới đây là thông tin tài khoản của bạn:<br><br>"
			        + "Tên Tài Khoản: " + username + "<br>"
			        + "Địa chỉ Email: " + email + "<br><br>"
			        + "Xin lưu ý rằng để bảo vệ thông tin cá nhân của bạn, hãy giữ thông tin này an toàn và không chia sẻ nó với người khác.<br><br>"
			        + "Nếu bạn có bất kỳ câu hỏi hoặc cần hỗ trợ, đừng ngần ngại liên hệ với chúng tôi qua Elite.Interiors.Webproject@gmail.com .<br><br>"
			        + "Cảm ơn bạn đã tham gia cùng chúng tôi, và chúng tôi mong rằng bạn sẽ có trải nghiệm tuyệt vời trên Elite Interiors.<br><br>"
			        + "Trân trọng,<br>"
			        + "Elite Interiors<br><br>";
			
			mailer.send(from, email, subject, body);

			// Lưu đối tượng User mới vào cơ sở dữ liệu
			session.save(newUser);
			
			// Thông báo đăng ký thành công
			model.addAttribute("loginMessage", "Đăng ký thành công! Vui lòng đăng nhập.");
			return "login/login"; // Chuyển hướng đến trang đăng nhập sau khi đăng ký thành công
		} catch (Exception e) {
			e.printStackTrace(); // Ghi log lỗi
			model.addAttribute("regisMessage", "Đã xảy ra lỗi trong quá trình đăng ký.");
			return "login/login";
		}
	}
}
