package ptithcm.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import ptithcm.bean.User;

public class Interceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
		System.out.println("Pre handle interceptor");

		User user = (User) arg0.getSession().getAttribute("currentUser");
		
		if (user != null) {
				return true;
		} else {
			// arg1.getWriter().print("<h1>Please Login</h1>");
			// Nếu không có user, redirect đến trang login

			arg1.sendRedirect(arg0.getContextPath() + "/login.htm");
			return false;
		}
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		System.out.println("Post handle interceptor");

	}

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		System.out.println("After handle interceptor");

	}

}
