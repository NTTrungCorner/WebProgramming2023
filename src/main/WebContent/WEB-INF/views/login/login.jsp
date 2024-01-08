<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width ,initial-scale=1.0">
<title>Đăng nhập</title>
<!-- link css -->
<link rel="stylesheet"
	href="http://localhost:8080/webcuoiky/assets/login.css">
<!-- link box icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
</head>
<body>
<!-- Navbar -->
<header style="background: #5e390f">
	<a href="index.htm" class="logo">Elite Interiors</a>
	<div class="bx bx-menu" id="menu-icon"></div>
	<ul class="navbar">
		<li><a href="<c:url value='/index.htm'/>"><i
				class='bx bx-home'></i> Trang chủ</a></li>
		<li><a href="<c:url value='/shopping.htm'/>"><i
				class='bx bx-layer'></i> Cửa hàng</a></li>
		<li><a href="<c:url value='/help.htm'/>"><i
				class='bx bx-help-circle'></i> Trợ giúp</a></li>
		<li><a href="<c:url value='/info.htm'/>"><i
				class='bx bx-info-circle'></i> Tham khảo</a></li>
	</ul>
	<div class="btn-header">
		<%-- Kiểm tra xem có người dùng đã đăng nhập hay chưa --%>
		<c:if test="${sessionScope.currentUser == null}">
			<a class='bx bx-user' id="btn-user" href="login.htm"></a>
			<a class="bx bx-cart bx-tada bx-rotate-90" id="btn-cart"
				href="user/cart.htm"> <span class="btn-badge">!</span>
			</a>
		</c:if>

		<%-- Nếu có người dùng đã đăng nhập, hiển thị chào mừng và nút logout --%>
		<c:if test="${sessionScope.currentUser != null}">
			<!-- Nếu có message (đã đăng nhập) -->


			<a class="bx bx-cart bx-tada bx-rotate-90" id="btn-cart"
				href="user/cart.htm"> <span class="btn-badge">!</span></a>
			<a class="bx bx-log-out" style="color: #fff;" id="" href="<c:url value='/login.htm'/>"></a>

		</c:if>
	</div>
	<c:if test="${sessionScope.currentUser != null}">
		<span class="username">Xin chào,
			${sessionScope.currentUser.username}!</span>
	</c:if>
</header>
	<!-- Login -->
	<div class=wrapper>
		<div class="form-box login">
			<h2>Đăng nhập</h2>
			${loginMessage}
			<form action="login.htm" method="post">
				<div class="input-box">
					<span class="icon bx bxs-envelope"></span><input type="email"
						name="email" required> <label>Email</label>
				</div>
				<div class=input-box>
					<span class="icon bx bxs-lock-alt"></span><input type="password"
						name="password" required> <label>Mật khẩu</label>

				</div>
				<div class="remember-forgot" name="remember" value="1">
					<label><input type="checkbox" name="rememberMe">Lưu
						tài khoản</label> <a href="#">Quên mật khẩu?</a>
				</div>
				<button type="submit" class="btn">Đăng nhập</button>
				<div class="login-register">
					<p>
						Chưa có tài khoản?<a href="#" class="register-link"
							onclick="startRegistration()" style="margin-left: 1em;"> Đăng
							ký</a>
				</div>
			</form>
		</div>
		<div class="form-box register">
			<h2>Đăng ký</h2>
			${regisMessage}
			<form action="registration.htm" method="post">
				<div class="input-box">
					<span class="icon bx bxs-user"></span> <input type="text"
						name="username" required> <label>Tên người dùng</label>
				</div>
				<div class="input-box">
					<span class="icon bx bxs-envelope"></span> <input type="email"
						name="email" required> <label>Email</label>
				</div>
				<div class=input-box>
					<span class="icon bx bxs-lock-alt"></span> <input type="password"
						name="password" required> <label>Mật khẩu</label>
				</div>
				<div class="remember-forgot">
					<label><input type="checkbox" required>Tôi đồng ý
						với điều khoản và điều lệ</label>
				</div>
				<button type="submit" class="btn">Đăng ký</button>
				<div class="login-register">
					<p>
						Đã có tài khoản?<a href="#" class="login-link"
							style="margin-left: 1em;">Đăng nhập</a>
				</div>
			</form>
		</div>
	</div>
	<!-- Script để điều khiển hiển thị form -->
	<script src="http://localhost:8080/webcuoiky/assets/login.js">
		
	</script>
</body>
</html>