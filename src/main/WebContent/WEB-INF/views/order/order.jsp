<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width ,initial-scale=1.0">
<title>Đơn hàng</title>
<!-- link css -->
<link rel="stylesheet"
	href="http://localhost:8080/webcuoiky/assets/order.css">
<!-- link css header -->
<link rel="stylesheet"
	href="http://localhost:8080/webcuoiky/assets/order.css">
<!-- link css footer -->
<link rel="stylesheet"
	href="https://tailwindflex.com/public/build/assets/app.ce1e0228.css"
	data-navigate-track="reload">
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
					href="cart.htm"> <span class="btn-badge">!</span>
				</a>
			</c:if>

			<%-- Nếu có người dùng đã đăng nhập, hiển thị chào mừng và nút logout --%>
			<c:if test="${sessionScope.currentUser != null}">
				<!-- Nếu có message (đã đăng nhập) -->


				<a class="bx bx-cart bx-tada bx-rotate-90" id="btn-cart"
					href="user/cart.htm"> <span class="btn-badge">!</span></a>
				<a class="bx bx-log-out" id="" href="<c:url value='/login.htm'/>""></a>

			</c:if>
		</div>
		<c:if test="${sessionScope.currentUser != null}">
			<span class="username">Xin chào,
				${sessionScope.currentUser.username}!</span>
		</c:if>
	</header>
	<div class="py-14 px-4 md:px-6 2xl:px-20 2xl:container 2xl:mx-auto">
		<div
			class="mt-10 flex flex-col xl:flex-row jusitfy-center items-stretch w-full xl:space-x-8 space-y-4 md:space-y-6 xl:space-y-0">
			<div
				class="flex flex-col justify-start items-start w-full space-y-4 md:space-y-6 xl:space-y-8">
				<div
					class="flex flex-col justify-start items-start dark:bg-rose-400 bg-gray-50 px-4 py-4 md:py-6 md:p-6 xl:p-8 w-full">
					<p
						class="text-lg md:text-xl dark:text-white font-semibold leading-6 xl:leading-5 text-gray-800">Customer’s
						Cart</p>
					<div
						class="mt-4 md:mt-6 flex flex-col md:flex-row justify-start items-start md:items-center md:space-x-6 xl:space-x-8 w-full">
						<div class="pb-4 md:pb-8 w-full md:w-40">
							<img class="w-full hidden md:block"
								src="https://i.ibb.co/84qQR4p/Rectangle-10.png" alt="dress" />
							<img class="w-full md:hidden"
								src="https://i.ibb.co/L039qbN/Rectangle-10.png" alt="dress" />
						</div>
						<div
							class="border-b border-gray-200 md:flex-row flex-col flex justify-between items-start w-full pb-8 space-y-4 md:space-y-0">
							<div
								class="w-full flex flex-col justify-start items-start space-y-8">
								<h3
									class="text-xl dark:text-white xl:text-2xl font-semibold leading-6 text-gray-800">Premium
									Quaility Dress</h3>

							</div>
							<div class="flex justify-between space-x-8 items-start w-full">
								<p class="text-base dark:text-white xl:text-lg leading-6">$36.00</p>
								<p
									class="text-base dark:text-white xl:text-lg leading-6 text-gray-800">01</p>
								<p
									class="text-base dark:text-white xl:text-lg font-semibold leading-6 text-gray-800">$36.00</p>
							</div>
						</div>
					</div>
					<div
						class="mt-6 md:mt-0 flex justify-start flex-col md:flex-row items-start md:items-center space-y-4 md:space-x-6 xl:space-x-8 w-full">
						<div class="w-full md:w-40">
							<img class="w-full hidden md:block"
								src="https://i.ibb.co/s6snNx0/Rectangle-17.png" alt="dress" />
							<img class="w-full md:hidden"
								src="https://i.ibb.co/BwYWJbJ/Rectangle-10.png" alt="dress" />
						</div>
						<div
							class="flex justify-between items-start w-full flex-col md:flex-row space-y-4 md:space-y-0">
							<div
								class="w-full flex flex-col justify-start items-start space-y-8">
								<h3
									class="text-xl dark:text-white xl:text-2xl font-semibold leading-6 text-gray-800">High
									Quaility Italic Dress</h3>

							</div>
							<div class="flex justify-between space-x-8 items-start w-full">
								<p class="text-base dark:text-white xl:text-lg leading-6">$20.00</p>
								<p
									class="text-base dark:text-white xl:text-lg leading-6 text-gray-800">01</p>
								<p
									class="text-base dark:text-white xl:text-lg font-semibold leading-6 text-gray-800">$20.00</p>
							</div>
						</div>
					</div>
				</div>
				<div
					class="flex justify-center flex-col md:flex-row flex-col items-stretch w-full space-y-4 md:space-y-0 md:space-x-6 xl:space-x-8">
					<div
						class="flex flex-col px-4 py-6 md:p-6 xl:p-8 w-full bg-rose-400 dark:bg-rose-400 space-y-6">
						<h3
							class="text-xl dark:text-white font-semibold leading-5 text-gray-800">Summary</h3>
						<div
							class="flex justify-center items-center w-full space-y-4 flex-col border-gray-200 border-b pb-4">
							<div class="flex justify-between w-full">
								<p class="text-base dark:text-white leading-4 text-gray-800">Subtotal</p>
								<p class="text-base dark:text-gray-300 leading-4 text-gray-600">$56.00</p>
							</div>
						</div>
						<div class="flex justify-between items-center w-full">
							<p
								class="text-base dark:text-white font-semibold leading-4 text-gray-800">Total</p>
							<p
								class="text-base dark:text-gray-300 font-semibold leading-4 text-gray-600">$36.00</p>
						</div>
					</div>
					<div
						class="flex flex-col justify-center items-center px-4 py-6 md:p-6 xl:p-8 w-full bg-rose-400 dark:bg-rose-400 space-y-6">
						<h3
							class="text-xl dark:text-white font-semibold leading-5 text-gray-800">Ghi
							chú</h3>
						<div class="flex flex-col justify-center items-center">
							<p
								class="text-lg leading-6 dark:text-white font-semibold text-gray-800">DPD
								Delivery</p>
						</div>
					</div>
				</div>
			</div>
			<div
				class="bg-rose-400 dark:bg-rose-400 w-full xl:w-96 flex justify-between items-center md:items-start px-4 py-6 md:p-6 xl:p-8 flex-col">
				<h3
					class="text-xl dark:text-white font-semibold leading-5 text-gray-800">Customer</h3>
				<div
					class="flex flex-col md:flex-row xl:flex-col justify-start items-stretch h-full w-full md:space-x-6 lg:space-x-8 xl:space-x-0">
					<div class="flex flex-col justify-start items-start flex-shrink-0">
						<div
							class="flex justify-center w-full md:justify-start items-center space-x-4 py-8 border-b border-gray-200">
							<img src="https://i.ibb.co/5TSg7f6/Rectangle-18.png" alt="avatar" />
							<div class="flex justify-start items-start flex-col space-y-2">
								<p
									class="text-base dark:text-white font-semibold leading-4 text-left text-gray-800">Lê
									Huỳnh Tú Uyên</p>
								<p class="text-sm dark:text-gray-300 leading-5 text-gray-600">0999.000.000</p>
							</div>
						</div>

						<div
							class="flex justify-center text-gray-800 dark:text-white md:justify-start items-center space-x-4 py-4 border-b border-gray-200 w-full">
							<img class="dark:hidden"
								src="https://tuk-cdn.s3.amazonaws.com/can-uploader/order-summary-3-svg1.svg"
								alt="email"> <img class="hidden dark:block"
								src="https://tuk-cdn.s3.amazonaws.com/can-uploader/order-summary-3-svg1dark.svg"
								alt="email">
							<p class="cursor-pointer text-sm leading-5 ">david89@gmail.com</p>
						</div>
					</div>
					<div
						class="flex justify-between xl:h-full items-stretch w-full flex-col mt-6 md:mt-0">
						<div
							class="flex justify-center md:justify-start xl:flex-col flex-col md:space-x-6 lg:space-x-8 xl:space-x-0 space-y-4 xl:space-y-12 md:space-y-0 md:flex-row items-center md:items-start">
							<div
								class="flex justify-center md:justify-start items-center md:items-start flex-col space-y-4 xl:mt-8">
								<p
									class="text-base dark:text-white font-semibold leading-4 text-center md:text-left text-gray-800">Địa
									chỉ</p>
								<p
									class="w-48 lg:w-full dark:text-gray-300 xl:w-48 text-center md:text-left text-sm leading-5 text-gray-600">97
									Man Thiện, Hiệp Phú, TP Thủ Đức, TP HCM</p>
							</div>
						</div>
						<div
							class="flex w-full justify-center items-center md:justify-start md:items-start">
							<button
								class="mt-6 md:mt-0 dark:border-white dark:hover:bg-gray-900 dark:bg-transparent dark:text-white py-5 hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-800 border border-gray-800 font-medium w-96 2xl:w-full text-base font-medium leading-4 text-gray-800">Edit
								Details</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="https://cdn.tailwindcss.com/3.1.4"></script>
</html>