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
	href="http://localhost:8080/webcuoiky/assets/info.css">
<!-- link box icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
body {
	padding-top: 20px;
	position: relative;
}

@media only screen and (min-width: 768px) {
	body:not(.layout-admin) .section, body:not(.layout-admin) section {
		padding: 100px 0;
	}
}

.d-middle {
	align-items: center;
	display: flex;
	justify-content: center;
}

.opacity-8, .overlay-opacity-8:after {
	opacity: .8
}

opacity-8, .overlay-opacity-8:after {
	opacity: .8;
}

.section, section {
	position: relative;
	word-break: break-word;
}

.overlay-dark>*, .overlay-light>* {
	position: relative;
	z-index: 1;
}

* {
	font-family: 'Mulish', sans-serif;
}

#btn-user:hover {
	color: #EFD4A9;
}

#btn-user {
	color: white;
}

#btn-cart:hover {
	color: #EFD4A9;
}

#btn-cart {
	color: white;
}

#btn-logout:hover {
	color: #EFD4A9;
}

#btn-logout {
	color: white;
}

.navbar a {
	color: #fff;
	font-size: 15px;
}

.navbar i {
	font-size: 20px;
}

.logo {
	color: #fff;
	font-family: 'MonteCarlo', cursive;
	font-size: 25px;
}

a {
	text-decoration: none;
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
		<c:if test="${sessionScope.currentUser != null}">
			<c:if test="${sessionScope.currentUser.isAdmin == true}">
				<li><a href="<c:url value='admin.htm'/>"><i
						class='bx bx-user'></i> Quản trị</a></li>
			</c:if>
		</c:if>

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
			<a class="bx bx-log-out" style="color: #fff;" " id=""
				href="<c:url value='/login.htm'/>""></a>

		</c:if>
	</div>
	<c:if test="${sessionScope.currentUser != null}">
		<span class="username">Xin chào,
			${sessionScope.currentUser.username}!</span>
	</c:if>
</header>
<body>
	<div class="section" data-loaded="true"
		style="background-color: #EFD9A7 !important;">

		<div class="container" style="width: 80%">

			<div
				class="row text-center-md text-center-xs d-middle justify-content-start">

				<div class="col-12 col-lg-6 mb-5 text-white aos-init aos-animate"
					data-aos="fade-in" data-aos-delay="0" data-aos-offset="0"
					style="padding-right: 20px;">

					<!-- main title -->
					<h1 class="display-5 fw-bold mb-0">
						<span class="d-inline-block"> <span class="text-danger"
							style="color: #3D2305 !important">1.Phong cách nội thất
								Tối Giản (Minimalism)</span>
						</span>
					</h1>

					<!-- slogan -->
					<p class="h3 fw-normal mb-0"
						style="text-align: justify; color: #820707 !important">Thiết
						kế và đường nét rõ ràng, bảng màu đơn sắc, “less is more” là những
						hình dung khi nhắc đến phong cách nội thất Tối Giản.</p>
					<p class="h3 fw-normal mb-0"
						style="text-align: justify; color: #820707 !important">Màu sắc
						được sử dụng cho phong cách Tối Giản là những màu đơn sắc, không
						sặc sỡ. Việc phối hợp màu sắc trong phong cách nội thất Tối Giản
						cũng được phân bổ. Cụ thể: 60% màu nền, 30% màu thứ cấp và 10% màu
						nhấn.</p>

				</div>

				<div
					class="col-12 col-lg-6 text-align-end text-center-md text-center-xs aos-init aos-animate"
					data-aos="fade-in" data-aos-delay="50" data-aos-offset="0"
					style="background-color: #F0CD81 !important; display: flex; justify-content: center; align-items: center;">
					<img alt=""
						src="https://truongthang.vn/wp-content/uploads/2023/08/6-5.jpg"
						id="img-body" style="padding-top: 20px; padding-bottom: 20px">

				</div>

			</div>

		</div>
		<div class="container" style="padding-top: 50px; width: 80%">

			<div
				class="row text-center-md text-center-xs d-middle justify-content-start">

				<div
					class="col-12 col-lg-6 text-align-end text-center-md text-center-xs aos-init aos-animate"
					data-aos="fade-in" data-aos-delay="50" data-aos-offset="0"
					style="background-color: #F0CD81 !important; display: flex; justify-content: center; align-items: center;">
					<img alt=""
						src="https://truongthang.vn/wp-content/uploads/2023/08/2-1-5.jpg"
						id="img-body" style="padding-top: 20px; padding-bottom: 20px">

				</div>


				<div class="col-12 col-lg-6 mb-5 text-white aos-init aos-animate"
					data-aos="fade-in" data-aos-delay="0" data-aos-offset="0"
					style="padding-left: 20px;">

					<!-- main title -->
					<h1 class="display-5 fw-bold mb-0">
						<span class="d-inline-block"> <span class="text-danger"
							style="color: #3D2305 !important">2. Phong cách nội thất
								Hiện Đại (Modernism)</span>
						</span>
					</h1>

					<!-- slogan -->
					<p class="h3 fw-normal mb-0"
						style="text-align: justify; color: #820707 !important">Nội
						thất phong cách Hiện Đại được xây dựng với những đường thẳng và
						trang trí tối thiểu, lược bỏ những chi tiết hoa mỹ không cần
						thiết. Màu sắc được sử dụng là những màu đơn sắc và trung tính.</p>
					<p class="h3 fw-normal mb-0"
						style="text-align: justify; color: #820707 !important">Với
						tính chất linh hoạt, nội thất phong cách Hiện Đại thường kết hợp
						đa dạng chất liệu như gỗ tự nhiên, plastic, thép,… đặc biệt là vật
						liệu tiên tiến.</p>

				</div>

			</div>

		</div>
		<div class="container" style="padding-top: 50px; width: 80%">

			<div
				class="row text-center-md text-center-xs d-middle justify-content-start">

				<div class="col-12 col-lg-6 mb-5 text-white aos-init aos-animate"
					data-aos="fade-in" data-aos-delay="0" data-aos-offset="0"
					style="padding-right: 20px;">

					<!-- main title -->
					<h1 class="display-5 fw-bold mb-0">
						<span class="d-inline-block"> <span class="text-danger"
							style="color: #3D2305 !important">3. Phong cách Tân Cổ
								Điển (NeoClassical)</span>
						</span>
					</h1>

					<!-- slogan -->
					<p class="h3 fw-normal mb-0"
						style="text-align: justify; color: #820707 !important">Màu sắc
						của nội thất Tân Cổ Điển có xu hướng nhẹ nhàng, trầm lắng. Màu chủ
						đạo thường là trắng, kem và xám. Các màu nổi bật hơn như đỏ, vàng,
						đen thường được dùng làm điểm nhấn.</p>
					<p class="h3 fw-normal mb-0"
						style="text-align: justify; color: #820707 !important">Vật
						liệu ưa chuộng của phong cách này thường là gỗ tự nhiên, da và đá
						hoa cương. Sự thượng hạng từ chất liệu góp phần làm tôn lên sự
						đẳng cấp của không gian mà không cần phô trương.</p>

				</div>

				<div
					class="col-12 col-lg-6 text-align-end text-center-md text-center-xs aos-init aos-animate"
					data-aos="fade-in" data-aos-delay="50" data-aos-offset="0"
					style="background-color: #F0CD81 !important; display: flex; justify-content: center; align-items: center;">
					<img alt=""
						src="https://truongthang.vn/wp-content/uploads/2023/08/10-1-1.jpg"
						id="img-body" style="padding-top: 20px; padding-bottom: 20px">

				</div>

			</div>

		</div>
		<div class="container" style="padding-top: 50px; width: 80%">

			<div
				class="row text-center-md text-center-xs d-middle justify-content-start">


				<div
					class="col-12 col-lg-6 text-align-end text-center-md text-center-xs aos-init aos-animate"
					data-aos="fade-in" data-aos-delay="50" data-aos-offset="0"
					style="background-color: #F0CD81 !important; display: flex; justify-content: center; align-items: center;">
					<img alt=""
						src="https://truongthang.vn/wp-content/uploads/2023/08/14.jpg"
						id="img-body" style="padding-top: 20px; padding-bottom: 20px">

				</div>
				<div class="col-12 col-lg-6 mb-5 text-white aos-init aos-animate"
					data-aos="fade-in" data-aos-delay="0" data-aos-offset="0"
					style="padding-left: 20px;">

					<!-- main title -->
					<h1 class="display-5 fw-bold mb-0">
						<span class="d-inline-block"> <span class="text-danger"
							style="color: #3D2305 !important">4. Phong cách thiết kế
								nội thất Boho (Bohemian)</span>
						</span>
					</h1>

					<!-- slogan -->
					<p class="h3 fw-normal mb-0"
						style="text-align: justify; color: #820707 !important">Phong
						cách thiết kế nội thất Boho bao gồm chủ nghĩa tối đa,khuyến khích
						thể hiện cá nhân thông qua việc lựa chọn và sắp xếp các đồ vật
						trang trí, vải dệt, tác phẩm nghệt thuật,…</p>
					<p class="h3 fw-normal mb-0"
						style="text-align: justify; color: #820707 !important">Hoạ
						tiết thường thấy ở nội thất Boho là hoạ tiết thổ dân mang nét
						hoang sơ. Kết hợp cùng màu sắc sặc sỡ và những đường diềm tinh tế,
						không gian sống trở nên sống động</p>

				</div>

			</div>

		</div>

	</div>
</body>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
<footer>
	<div class="bg-yellow-700">
		<div
			class="max-w-screen-l py-10 px-4 sm:px-6 text-gray-800 sm:flex justify-between mx-auto"
			style="padding-bottom: 10px; display: flex; padding-right: 60px !important;">
			<div class="p-10 sm:w-4/12"
				style="padding-left: 40px;padding-top: 40px !important; ">
				<h3 class="font-bold text-5xl text-white mb-4"
					style="font-family: 'MonteCarlo', cursive; text-align: center; text-size:22px;font-weight: 700;font-size: 3rem;
    				line-height: 1;padding-top: 50px !important;">Elite
					Interiors</h3>
				<p class="text-white text-sm mb-5">CÔNG TY TNHH SẢN XUẤT NỘI
					THẤT ICA</p>
			</div>
			<div class=" sm:w-2/6 flex flex-col  content-center"
				style="padding-left: 250px !important; padding-right:90px !important;">
				<div class="text-sm uppercase text-white font-bold mb-5" style="padding-top: 20px !important;font-weight: 700;">Thông
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
				<div class="text-sm uppercase text-white font-bold mb-5" style="padding-top: 20px !important;font-weight: 700; padding-left:28px;">Thông
					tin nhóm</div>
				<ul class="grid grid-cols-4 gap-5"
					style="display: grid; grid-template-columns: repeat(4, minmax(0, 1fr));">
					<li><a href="https://www.facebook.com/t.uyen212/"
						target="_blank"> <img
							src="https://scontent.fsgn5-14.fna.fbcdn.net/v/t39.30808-6/320233538_1523662638109858_7831962333397641472_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeF_02M3wYsSaefwj8rXV5Nq5MrsXBvX77zkyuxcG9fvvAnd7I5ZqzAorc9BtmntiP36W3pLbxVAV5rZzz1DkFNV&_nc_ohc=hBMKhsfowxAAX_MaW4E&_nc_ht=scontent.fsgn5-14.fna&oh=00_AfAOGFiNPqua-p0q4Bylymo77QflFulpYYyUKzdq9n1kNg&oe=6598CEDD"
							class="w-28 h-28"
							style="width: 7rem; height: 7rem; object-fit: cover;">
					</a></li>
					<li><a href="https://www.facebook.com/phuccuuuuu"
						target="_blank"> <img
							src="https://zpsocial-f49-org.zadn.vn/7213e11a7a3c9562cc2d.jpg"
							class="w-28 h-28"
							style="width: 7rem; height: 7rem; object-fit: cover;">
					</a></li>
					<li><a href="https://www.facebook.com/mo.nguyenngoc.73"
						target="_blank"> <img src="img/anhmer.jpg"
							class="w-28 h-28 object-cover"
							style="width: 7rem; height: 7rem; object-fit: cover;">
					</a></li>
					<li><a href="https://www.facebook.com/Corner2002"
						target="_blank"> <img
							src="https://scontent.fsgn5-3.fna.fbcdn.net/v/t39.30808-6/278847024_144996848039210_8336417254343591063_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=dd5e9f&_nc_eui2=AeF9kzzcStRb2kCvfN0O9oQiAQL1fznexGcBAvV_Od7EZxtuT0da58GuFDBmFEHXWRXvqBkV1J4Q4EXNw87RC1yC&_nc_ohc=-EZJ8q6FPaYAX-vLZaX&_nc_ht=scontent.fsgn5-3.fna&oh=00_AfBC1096lfJMDWNi9EX_ETHo1YxlyoLYj6ztDdXCnIGBWA&oe=6599635A"
							class="w-28 h-28 object-cover"
							style="width: 7rem; height: 7rem; object-fit: cover;">
					</a></li>
				</ul>

			</div>
		</div>
		<div class="bg-indigo-700 py-1 text-white">
			<div class="container mx-auto px-4">
				<div class="-mx-4 flex flex-wrap justify-between">
					<div class="px-4 w-full text-center sm:w-auto sm:text-left">
						Lập trình web
						<script>
							new Date().getFullYear() > 2023
									&& document.write(new Date().getFullYear())
						</script>
						PTITHCM. Giảng viên: Nguyễn Trung Hiếu
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>

</html>