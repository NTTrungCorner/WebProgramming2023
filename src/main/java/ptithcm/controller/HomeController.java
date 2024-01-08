package ptithcm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class HomeController {
	@RequestMapping("index")
	public String index() {
		return "index";
	}
//@RequestMapping("shopping")
//public String shopping(){
//	return "shopping/shopping";
//}
	@RequestMapping("help")
	public String help() {
		return "help/help";
	}

	@RequestMapping("info")
	public String info() {
		return "info/info";
	}

	@RequestMapping("login")
	public String login() {
		return "login/login";
	}
	
//	@RequestMapping("cart")
//	public String cart() {
//		return "cart/cart";
//	}
	
	@RequestMapping("pay")
	public String pay() {
		return "pay/pay";
	}
	
	@RequestMapping("order")
	public String order() {
		return "order/order";
	}
//	@RequestMapping("admin")
//	public String admin() {
//		return "admin/admin";
//	}
}
