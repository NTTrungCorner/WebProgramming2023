<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width ,initial-scale=1.0">
<title>Nhóm lập trình web</title>
<!-- link css -->
<link rel="stylesheet"
	href="http://localhost:8080/webcuoiky/assets/pay.css">
<!-- link box icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
header {
	display: flex;
}

body {
	margin: 0;
	padding-top: 10%;
	padding-left: 20%;
	color: #2e323c;
	background: #9B461C2B;
	position: relative;
	height: 100%;
}

.account-settings .user-profile {
	margin: 0 0 1rem 0;
	padding-bottom: 1rem;
	text-align: center;
}

.account-settings .user-profile .user-avatar {
	margin: 0 0 1rem 0;
}

.account-settings .user-profile .user-avatar img {
	width: 90px;
	height: 90px;
}

.account-settings .user-profile h5.user-name {
	margin: 0 0 0.5rem 0;
}

.account-settings .user-profile h6.user-email {
	margin: 0;
	font-size: 0.8rem;
	font-weight: 400;
	color: #9fa8b9;
}

.account-settings .about {
	margin: 2rem 0 0 0;
	text-align: center;
}

.account-settings .about h5 {
	margin: 0 0 15px 0;
	color: #007ae1;
}

.account-settings .about p {
	font-size: 0.825rem;
}

.form-control {
	border: 1px solid #cfd1d8;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px;
	font-size: .825rem;
	background: #ffffff;
	color: #2e323c;
}

.card {
	background: #ffffff;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	border: 0;
	margin-bottom: 1rem;
	justify-content: center;
}
</style>
</head>
<!-- Navbar -->
<header style="background: #5e390f; line-height: normal;">
	<a href="index.htm" class="logo"
		style="font-family: 'MonteCarlo', cursive !important;">Elite
		Interiors</a>
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
				href="<c:url value='/user/cart.htm'/>"> <span class="btn-badge">!</span></a>
		</c:if>
		<%-- Nếu có người dùng đã đăng nhập, hiển thị chào mừng và nút logout --%>
			<c:if test="${sessionScope.currentUser != null}">
				<!-- Nếu có message (đã đăng nhập) -->
			
				
				<a class="bx bx-cart bx-tada bx-rotate-90" id="btn-cart"
					href="<c:url value='/user/cart.htm'/>"> <span class="btn-badge">!</span></a>
				<a class="bx bx-log-out"  style="color: #fff;"" id="" href="<c:url value='/login.htm'/>""></a>
				
			</c:if>
		</div>
		<c:if test="${sessionScope.currentUser != null}">
		<span class="username">Xin chào, ${sessionScope.currentUser.username}!</span>
		</c:if>
</header>

<body style="background-color: #EFD4A9">
	<div class="container">
		<div class="row gutters">
<form method="post" action="<c:url value='/user/processOrder.htm'/>" id="orderForm">
			<div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
				<div class="card h-100">
					<div class="card-body">
						<div class="row gutters">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<h6 class="mb-2 text-primary">Thông tin nhận hàng</h6>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="Pay">Tên người nhận</label>
									<span class="form-control" id="pay">${username}</span>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="Pay">Email</label>
									 <span class="form-control" id="pay">${email}</span>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="phone">Số điện thoại</label> <input type="text"
										class="form-control" id="phone" name="phone"
										placeholder="Nhập số điện thoại">
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="website">Ghi chú</label> <input
										class="form-control" id="website" placeholder="Ghi chú" name="note">
								</div>
							</div>
						</div>
						<div class="row gutters">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<h6 class="mt-3 mb-2 text-primary">Địa chỉ người nhận</h6>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="Address">Địa chỉ</label> <input type="name"
										class="form-control" id="aDdress" name="address" placeholder="Nhập địa chỉ">
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12"></div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="Pay">Thanh toán</label>
									<p type="text" class="form-control" id="pay">Thanh toán khi
										nhận hàng</p>
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12"></div>
						</div>
						<div class="row gutters">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<div class="text-right">
									<button type="button" id="cancel" name="submit"
										class="btn btn-secondary">Cancel</button>
								<button type="submit" id="submit" name="submit" class="btn btn-primary">Đặt hàng</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
</body>
<script data-cfasync="false"
	src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	//Thêm sự kiện click cho nút "Cancel"
	document.getElementById("cancel").addEventListener("click", function() {
    // Chuyển hướng người dùng về trang cart (thay đổi '/cart' thành URL thích hợp)
    window.location.href = 'cart.htm';
});
</script>

</html>