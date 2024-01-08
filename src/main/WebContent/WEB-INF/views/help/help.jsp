<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width ,initial-scale=1.0">
<title>Help</title>
<!-- link css -->
<link rel="stylesheet"
	href="http://localhost:8080/webcuoiky/assets/help.css">
<!-- link box icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
<!-- link css footer -->
<link rel="stylesheet"
	href="https://tailwindflex.com/public/build/assets/app.ce1e0228.css"
	data-navigate-track="reload">
</head>
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
<body
	style="background-color: #EFD9A7; min-height: 100vh; margin-bottom: 50px; position: relative;">
	<div
		class="relative w-full px-6 pt-20 pb-8 mt-8 shadow-xl ring-1 ring-gray-900/5 sm:mx-auto sm:max-w-4xl sm:rounded-lg sm:px-10"
		style="background-color: #F0CD81">
		<div class="mx-auto px-5">
			<div class="flex flex-col items-center">
				<h2
					class="mt-5 text-center text-2xl font-bold tracking-tight md:text-4xl">CÁC
					CÂU HỎI THƯỜNG GẶP</h2>
				<p class="mt-3 text-lg text-neutral-500 md:text-xl">ELITE
					INTERIORS</p>
			</div>
			<div class="mx-auto mt-8 grid max-w-2xl divide-y divide-neutral-200">
				<div class="py-5">
					<details class="group">
						<summary
							class="flex cursor-pointer list-none items-center justify-between font-medium text-xl">
							<span> Tại sao tôi lại không đặt hàng được?</span> <span
								class="transition group-open:rotate-180"> <svg
									fill="none" height="24" shape-rendering="geometricPrecision"
									stroke="currentColor" stroke-linecap="round"
									stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24"
									width="24">
                                    <path d="M6 9l6 6 6-6"></path>
                                </svg>
							</span>
						</summary>
						<p class="group-open:animate-fadeIn mt-3 text-neutral-600">Có
							nhiều nguyên nhân như: tài khoản của bạn chưa xác thực, lỗi hệ
							thống, lỗi mạng, thiếu thông tin,... Bạn có thể load lại hệ thống
							hoặc liên hệ trực tiếp với chúng tôi.</p>
					</details>
				</div>
				<div class="py-5">
					<details class="group">
						<summary
							class="flex cursor-pointer list-none items-center justify-between font-medium text-xl">
							<span> Làm thế nào để liên hệ chăm sóc khách hàng?</span> <span
								class="transition group-open:rotate-180"> <svg
									fill="none" height="24" shape-rendering="geometricPrecision"
									stroke="currentColor" stroke-linecap="round"
									stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24"
									width="24">
                                    <path d="M6 9l6 6 6-6"></path>
                                </svg>
							</span>
						</summary>
						<p class="group-open:animate-fadeIn mt-3 text-neutral-600">Bạn
							có thể gọi vào số điện thoại 0232.999.999(cuộc gọi hoàn toàn miễn
							phí) hoặc nhắn qua email elite@interiors.vn</p>
					</details>
				</div>
				<div class="py-5">
					<details class="group">
						<summary
							class="flex cursor-pointer list-none items-center justify-between font-medium text-xl">
							<span> Tôi muốn thay đổi thông tin cá nhân thì phải thực
								hiện như thế nào?</span> <span class="transition group-open:rotate-180">
								<svg fill="none" height="24"
									shape-rendering="geometricPrecision" stroke="currentColor"
									stroke-linecap="round" stroke-linejoin="round"
									stroke-width="1.5" viewBox="0 0 24 24" width="24">
                                    <path d="M6 9l6 6 6-6"></path>
                                </svg>
							</span>
						</summary>
						<p class="group-open:animate-fadeIn mt-3 text-neutral-600">Để
							thay đổi thông tin cá nhân, bạn hãy nhấn vào icon user. Sau đó
							chọn thông tin bạn muốn chỉnh sửa và tiến hành chỉnh sửa. Sau đó
							bạn chỉ cần lưu lại thì thông tin sẽ được cập nhập.</p>
					</details>
				</div>
				<div class="py-5">
					<details class="group">
						<summary
							class="flex cursor-pointer list-none items-center justify-between font-medium text-xl">
							<span> Làm thế nào để tôi theo dõi đơn hàng của mình?</span> <span
								class="transition group-open:rotate-180"> <svg
									fill="none" height="24" shape-rendering="geometricPrecision"
									stroke="currentColor" stroke-linecap="round"
									stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24"
									width="24">
                                    <path d="M6 9l6 6 6-6"></path>
                                </svg>
							</span>
						</summary>
						<p class="group-open:animate-fadeIn mt-3 text-neutral-600">Sau
							khi đơn hàng được giao cho đơn vị vận chuyển, chúng tôi sẽ gửi về
							email của bạn thông tin hóa đơn bao gồm cả đơn vị và mã vận
							chuyển. Dựa vào mã vận chuyển, bạn có thể tra cứu đơn hàng của
							mình.</p>
					</details>
				</div>
				<div class="py-5">
					<details class="group">
						<summary
							class="flex cursor-pointer list-none items-center justify-between font-medium text-xl">
							<span> Tôi có thể hủy đơn hàng của mình được không?</span> <span
								class="transition group-open:rotate-180"> <svg
									fill="none" height="24" shape-rendering="geometricPrecision"
									stroke="currentColor" stroke-linecap="round"
									stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24"
									width="24">
                                    <path d="M6 9l6 6 6-6"></path>
                                </svg>
							</span>
						</summary>
						<p class="group-open:animate-fadeIn mt-3 text-neutral-600">Tùy
							thuộc vào tình trạng đơn hàng của bạn. Nếu đơn hàng chưa giao cho
							đơn vị vận chuyển thì bạn có thể liên hệ trực tiếp bộ phận chăm
							sóc khách hàng để hủy. Còn nếu đơn hàng đã giao cho đơn vị vận
							chuyển thì bạn không thể hủy.</p>
					</details>
				</div>
				<div class="py-5">
					<details class="group">
						<summary
							class="flex cursor-pointer list-none items-center justify-between font-medium text-xl">
							<span> Các bạn có chương trình ưu đãi dành cho khách hàng
								không?</span> <span class="transition group-open:rotate-180"> <svg
									fill="none" height="24" shape-rendering="geometricPrecision"
									stroke="currentColor" stroke-linecap="round"
									stroke-linejoin="round" stroke-width="1.5" viewBox="0 0 24 24"
									width="24">
                                    <path d="M6 9l6 6 6-6"></path>
                                </svg>
							</span>
						</summary>
						<p class="group-open:animate-fadeIn mt-3 text-neutral-600">Chúng
							tôi sẽ có những ưu đãi hấp dẫn vào các dịp đặc biệt và ưu đãi
							dành cho khách hàng thân thiết. Bắt đầu từ đơn hàng thứ hai thì
							bạn sẽ nhận được ưu đãi này.</p>
					</details>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="https://cdn.tailwindcss.com/3.1.4"></script>

<footer>
    <div class="bg-yellow-700" style="background-color: #7D6A55 !important;">
    <div class="max-w-screen-l py-10 px-4 sm:px-6 text-gray-800 sm:flex justify-between mx-auto" style="padding-bottom:10px;padding-right:30px !important;">
        <div class="p-10 sm:w-4/12">
            <h3 class="font-bold text-5xl text-white mb-4" style="font-family: 'MonteCarlo', cursive;">Elite Interiors</h3>
            <p class="text-white text-sm mb-5">CÔNG TY TNHH SẢN XUẤT NỘI THẤT ICA</p>
        </div>
        <div class=" sm:w-2/6 flex flex-col  content-center">
            <div class="text-sm uppercase text-white font-bold mb-5">Thông tin liên hệ</div>
            <div class="flex mb-3">
                
                <div class="pl-3 w-9/12">
                    <div class="font-bold text-white text-sm">Email:</div>
                    <p class="text-white text-sm">
                        Elite.Interiors.Webproject@gmail.com
                    </p>
                </div>
            </div>
            <div class="flex mb-3">
                
                <div class="pl-3 w-9/12">
                    <div class="font-bold text-white text-sm">Số điện thoại:</div>
                    <p class="text-white text-sm">
                        0232.999.999
                    </p>
                </div>
            </div>
            <div class="flex mb-3">
                
                <div class="pl-3 w-9/12">
                    <div class="font-bold text-white text-sm">Địa chỉ:</div>
                    <p class="text-white text-sm">
                        97 Man Thiện, Hiệp Phú, TP Thủ Đức, TP HCM
                    </p>
                </div>
            </div>
        </div>
        <div class=" sm:w-3/12">
            <div class="text-sm uppercase text-white font-bold mb-5">Thông tin nhóm</div>
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
    <div class="py-1 text-white">
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