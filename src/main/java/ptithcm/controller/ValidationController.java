package ptithcm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.bean.User;

@Controller
@RequestMapping("/validation/")
public class ValidationController {
	
	@RequestMapping("form")
	public String form(ModelMap model) {
		model.addAttribute("user", new User());
		return "validation/form";
	}

	@RequestMapping(value = "validate", method = RequestMethod.POST)
	public String validate(ModelMap model,
			@Validated @ModelAttribute("user") User user, BindingResult errors) {

		if(errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây!");
		}
		else {
			model.addAttribute("message", "Chúc mừng, bạn đã nhập đúng hết!");
		}
		return "validation/form";
	}
}

