<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width ,initial-scale=1.0">
<title>Cửa hàng</title>
<!-- link css -->
<link rel="stylesheet"
	href="http://localhost:8080/webcuoiky/assets/shopping.css">
<!-- link box icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<link rel="stylesheet"
	href="https://tailwindflex.com/public/build/assets/app.ce1e0228.css"
	data-navigate-track="reload">
</head>

<!-- Navbar -->
<header style="background: #5e390f">
	<a href="<c:url value='/index.htm'/>" class="logo">Elite Interiors</a>
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
		<c:if test="${sessionScope.currentUser != null}">
			<c:if test="${sessionScope.currentUser.isAdmin == true}">
				<li><a href="<c:url value='/admin.htm'/>"><i
						class='bx bx-user'></i> Quản trị</a></li>
			</c:if>
		</c:if>
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
			<a class="bx bx-log-out" style="color: #fff;" id=""
				href="<c:url value='/login.htm'/>"></a>

		</c:if>
	</div>
	<c:if test="${sessionScope.currentUser != null}">
		<span class="username">Xin chào,
			${sessionScope.currentUser.username}!</span>
	</c:if>
</header>
<body>
<body>
	<div class="search-bar">
		<form action="shopping.htm" method="get">
			<input type="text" name="searchBar">
			<button type="submit">
				<i class='bx bx-search'></i>
			</button>
		</form>
	</div>
	<div class="sidebar">
		<h2>Danh mục hàng</h2>
		<ul>
			<li><a href="?categoryId">Tất cả</a></li>
			<c:forEach var="c" items="${categories}">
				<li><a href="?categoryId=${c.id}">${c.name}</a></li>
			</c:forEach>
		</ul>
	</div>
	<section class="shop" id="shop">
		<div class="containerbody">
			<c:forEach var="p" items="${products}">
				<div class="box" onclick="openModal(this)" data-productId="${p.id}">
					<img src="img/${p.image}">
					<h4>${p.name}</h4>
					<h5>${p.price}</h5>
				</div>
			</c:forEach>
		</div>
	</section>
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal()">&times;</span>
			<div class="product-details">
				<img id="modalImage" style="outline: 1px solid #5C3B28;">
				<div class="product-info" style="padding-top:35px;">
					<h4 id="modalTitle"></h4>
					<h5 id="modalPrice"></h5>
					<p id="modalDescription" class="product-description">Thông tin
						sản phẩm</p>
					<p id="modalDescription1" class="product-description">Sản phẩm
						được sản xuất tại Trung Quốc và được bảo hành lên đến 24 tháng. Sản phẩm là
						sự kết hợp hoàn hảo giữa thiết kế đẹp mắt và sự thoải mái tối đa.
						Là sự lựa chọn hoàn hảo để tối ưu hóa không gian sống của bạn với sự kết hợp giữa thẩm mỹ và sự thoải mái.</p>
				</div>
			</div>

			<form action="user/shopping.htm" method="post">
				<div class="quantity">
					<button id="decrement-btn" type="button">-</button>
					<span id="counter" name="count">1</span>
					<button id="increment-btn" type="button">+</button>
				</div>

				<!-- Thêm input ẩn để giữ ID sản phẩm và số lượng -->
				<input type="hidden" id="productId" name="productId"> <input
					type="hidden" id="quantity" name="quantity" value="1">

				<button type="submit" name="update" class="cart-button">
					<i class='bx bx-cart'></i> Thêm giỏ hàng
				</button>
			</form>
		</div>
	</div>
</body>
<script>
		function openModal(product) {
		    var modal = document.getElementById("myModal");
		    var image = product.getElementsByTagName("img")[0].src;
		    var title = product.getElementsByTagName("h4")[0].innerText;
		    var price = product.getElementsByTagName("h5")[0].innerText;
		    
		    var counterEl = document.getElementById('counter');
		    var quantityEl = document.getElementById('quantity');
		    var decrementBtn = document.getElementById('decrement-btn');
		    var incrementBtn = document.getElementById('increment-btn');
		    var productId = product.dataset.productid;
		    
		    let count = 1;

		    decrementBtn.addEventListener('click', () => {
		        if (count > 1) {
		            count--;
		            counterEl.textContent = count;
		            quantityEl.value = count; // Cập nhật giá trị số lượng
		        }
		    });

		    incrementBtn.addEventListener('click', () => {
		        count++;
		        counterEl.textContent = count;
		        quantityEl.value = count; // Cập nhật giá trị số lượng
		    });

		    document.getElementById("modalImage").src = image;
		    document.getElementById("modalTitle").innerText = title;
		    document.getElementById("modalPrice").innerText = price;
		    document.getElementById("productId").value = productId;
		    
		    modal.style.display = "block";
		}
	
		// Hàm đóng modal
		function closeModal() {
		    var modal = document.getElementById("myModal");
		    modal.style.display = "none";
		}
	</script>
<footer>
	<div class="bg-yellow-700">
		<div
			class="max-w-screen-l py-10 px-4 sm:px-6 text-gray-800 sm:flex justify-between mx-auto"
			style="padding-bottom: 10px">
			<div class="p-10 sm:w-4/12" style="padding-left: 30px">
				<h3 class="font-bold text-5xl text-white mb-4"
					style="font-family: 'MonteCarlo', cursive; text-align: center;">Elite
					Interiors</h3>
				<p class="text-white text-sm mb-5">CÔNG TY TNHH SẢN XUẤT NỘI
					THẤT ICA</p>
			</div>
			<div class=" sm:w-2/6 flex flex-col  content-center"
				style="padding-left: 12px">
				<div class="text-sm uppercase text-white font-bold mb-5">Thông
					tin liên hệ</div>
				<div class="flex mb-3">

					<div class="pl-3 w-9/12">
						<div class="font-bold text-white text-sm">Email:</div>
						<p class="text-white text-sm">Elite.Interiors.Webproject@gmail.com</p>
					</div>
				</div>
				<div class="flex mb-3">

					<div class="pl-3 w-9/12">
						<div class="font-bold text-white text-sm">Số điện thoại:</div>
						<p class="text-white text-sm">0232.999.999</p>
					</div>
				</div>
				<div class="flex mb-3">

					<div class="pl-3 w-9/12">
						<div class="font-bold text-white text-sm">Địa chỉ:</div>
						<p class="text-white text-sm">97 Man Thiện, Hiệp Phú, TP Thủ
							Đức, TP HCM</p>
					</div>
				</div>
			</div>
			<div class=" sm:w-3/12" style="padding-right: 30px">
				<div class="text-sm uppercase text-white font-bold mb-5">Thông
					tin nhóm</div>
				<ul class="grid grid-cols-4 gap-5">
					<li><a href="https://www.facebook.com/t.uyen212/"
						target="_blank"> <img
							src="https://scontent.fsgn5-14.fna.fbcdn.net/v/t39.30808-6/320233538_1523662638109858_7831962333397641472_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeF_02M3wYsSaefwj8rXV5Nq5MrsXBvX77zkyuxcG9fvvAnd7I5ZqzAorc9BtmntiP36W3pLbxVAV5rZzz1DkFNV&_nc_ohc=hBMKhsfowxAAX_MaW4E&_nc_ht=scontent.fsgn5-14.fna&oh=00_AfAOGFiNPqua-p0q4Bylymo77QflFulpYYyUKzdq9n1kNg&oe=6598CEDD"
							class="w-28 h-28">
					</a></li>
					<li><a href="https://www.facebook.com/phuccuuuuu"
						target="_blank"> <img
							src="https://zpsocial-f49-org.zadn.vn/7213e11a7a3c9562cc2d.jpg"
							class="w-28 h-28">
					</a></li>
					<li><a href="https://www.facebook.com/mo.nguyenngoc.73"
						target="_blank"> <img src="img/anhmer.jpg"
							class="w-28 h-28 object-cover">
					</a></li>
					<li><a href="https://www.facebook.com/Corner2002"
						target="_blank"> <img
							src="https://scontent.fsgn5-3.fna.fbcdn.net/v/t39.30808-6/278847024_144996848039210_8336417254343591063_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=dd5e9f&_nc_eui2=AeF9kzzcStRb2kCvfN0O9oQiAQL1fznexGcBAvV_Od7EZxtuT0da58GuFDBmFEHXWRXvqBkV1J4Q4EXNw87RC1yC&_nc_ohc=-EZJ8q6FPaYAX-vLZaX&_nc_ht=scontent.fsgn5-3.fna&oh=00_AfBC1096lfJMDWNi9EX_ETHo1YxlyoLYj6ztDdXCnIGBWA&oe=6599635A"
							class="w-28 h-28 object-cover">
					</a></li>
				</ul>
			</div>
		</div>
		<div class="bg-indigo-700 py-1 text-white">
			<div class="container mx-auto px-4">
				<div class="-mx-4 flex flex-wrap justify-between">
					<div class="px-4 w-full text-center sm:w-auto sm:text-left">
						Lập trình web
						<script>new Date().getFullYear() > 2023 && document.write( new Date().getFullYear())</script>
						PTITHCM. Giảng viên: Nguyễn Trung Hiếu
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
</html>