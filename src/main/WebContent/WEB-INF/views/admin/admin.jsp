<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản trị viên</title>
<script src="https://cdn.tailwindcss.com/3.1.4"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
<div class="flex">
    <div class="w-1/6 h-screen bg-gray-200 sticky top-0 p-4">
        <h2 class="text-lg font-bold mb-4">Hệ thống quản lý</h2>
        <ul class="list-none">
            <li class="mb-2"><a href="index.htm" class="text-gray-700 hover:text-gray-900">Trang chủ</a></li>
            <li class="mb-2"><a id="productLink" href="#" class="sidebar-link text-gray-700 hover:text-gray-900">Quản lý sản phẩm</a></li>
            <li class="mb-2"><a id="categoryLink" href="#" class="sidebar-link text-gray-700 hover:text-gray-900">Quản lý danh mục</a></li>
            <li class="mb-2"><a id="orderLink" href="#" class="text-gray-700 hover:text-gray-900">Quản lý đơn hàng</a></li>
            <li class="mb-2"><a id="customerLink" href="#" class="sidebar-link text-gray-700 hover:text-gray-900">Quản lý tài khoản</a></li>
        </ul>
    </div>
    <div class="w-5/6 bg-white p-4">
    
    <!-- component users -->
<div id="usersComponent" class="text-gray-900 ">
    <div class="p-4 flex">
        <h1 class="text-3xl">Tài khoản </h1>
    </div>
    <div class="px-3 py-4 flex justify-center">
        <table class="w-full text-md bg-white shadow-md rounded mb-4">
            <tbody>
                <tr class="border-b">
                    <th class="text-left p-3 px-5">Tên</th>
                    <th class="text-left p-3 px-5">Email</th>
                    <th class="text-left p-3 px-5">Vai trò</th>
                    <th></th>
                </tr>
                <c:forEach var="u" items="${users}">
                	<form:form action="admin.htm" method="post">
		                <tr class="border-b hover:bg-orange-100 bg-gray-100">
		                    <td class="p-3 px-5">
		                    	<input type="text" name="adminUserId" value="${u.id}" class="hidden">
		                        <input type="text" name="adminUsername" value="${u.username}" class="bg-transparent border-b-2 border-gray-300 py-2" readonly>
		                    </td>
		                    <td class="p-3 px-5">
		                        <input type="text" name="adminUseremail" value="${u.email}" class="bg-transparent border-b-2 border-gray-300 py-2" readonly>
		                    </td>
		                    <td class="p-3 px-5">
		                        <select class="bg-transparent border-b-2 border-gray-300 py-2" name="adminUserRole">
		                        	<c:choose>
		                        		<c:when test="${u.isAdmin}">
	                                        <option value="true" selected>Admin</option>
	                                        <option value="false">Người dùng</option>
	                                    </c:when>
	                                    <c:otherwise>
	                                        <option value="false" selected>Người dùng</option>
	                                        <option value="true">Admin</option>
	                                    </c:otherwise>
	                            	</c:choose>
		                        </select>
		                    </td>
		                    <td class="p-3 px-5 flex justify-end">
		                        <button type="submit" name="btnUpdateUser" class="mr-3 text-sm bg-blue-500 hover:bg-blue-700 text-white py-1 px-2 rounded focus:outline-none focus:shadow-outline">Save</button>                            
		                         <button  type="submit" name="btnDeleteUser"
		                            class="text-sm bg-red-500 hover:bg-red-700 text-white py-1 px-2 rounded focus:outline-none focus:shadow-outline">Delete</button>
		                    </td>
		                </tr>
	                </form:form>
	            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
	
	<!-- component product -->
    <div id="productsComponent" class="text-gray-900 ">
        <div class="p-4 flex">
            <h1 class="text-3xl">Sản phẩm</h1>

        </div>
        <h1 class="error" style="color:#FF0000;">${param.message}</h1>
        <h1 class="error"style="color:#FF0000;">${param.nameError}</h1>
         <h1 class="error" style="color:#FF0000;">${param.imageError}</h1>
        <div class="px-3 py-4 flex" style="overflow-x: auto;">
            <table class="w-full text-md bg-white shadow-md rounded mb-4 table-auto" >
                <tbody>
                    <tr class="border-b">
                        <th class="text-left ">Tên sản phẩm</th>
                        <th class="text-left ">Số lượng</th>
                        <th class="text-left ">Đơn giá</th>
                        <th class="text-left ">Mô tả</th>
						<th class="text-left ">Giảm giá</th>
                        <th class="text-left ">Hình ảnh</th>
                        <th class="text-left ">Danh mục</th>
                        <th></th>
                    </tr>
                    
                    <c:forEach var="p" items="${products}">
	                    <form:form action="admin.htm" method="post" enctype="multipart/form-data">
		                    <tr class="border-b hover:bg-orange-100 bg-gray-100">
							    <td class="p-3 px-5">
							    	<input type="text" name="adminProductId" value="${p.id}" class="hidden">
							        <input type="text" name="adminProductName" value="${p.name}" class="bg-transparent border-b-2 border-gray-300 py-2">
							    </td>
							    <td class="p-3 px-5">
							        <input type="number" name="adminProductQuantity" value="${p.quantity}" class="bg-transparent border-b-2 border-gray-300 py-2">
							    </td>
							    <td class="p-3 px-5">
							        <input type="number" name="adminProductPrice" value="${p.price}" class="bg-transparent border-b-2 border-gray-300 py-2">
							    </td>
							    <td class="p-3 px-5">
							        <textarea name="adminProductDescription" class="bg-transparent border-b-2 border-gray-300 py-2">${p.description}</textarea>
							    </td>
							    <td class="p-3 px-5">
							        <input type="number" name="adminProductDiscount" value="${p.discount}" class="bg-transparent border-b-2 border-gray-300 py-2">
							    </td>
							    <td class="p-3 px-5">
							    	<img src="img/${p.image}" class="bg-transparent py-2 w-28 h-28 justìy-center">
							        <input type="file" name="adminProductPhoto" class="bg-transparent py-2">
							    </td>
							    <td class="p-3 px-5">
								    <select class="bg-transparent border-b-2 border-gray-300 py-2" name="adminProductCategory">
									    <c:forEach var="c" items="${categories}">
									        <c:choose>
									            <c:when test="${c.name eq p.category.name}">
									                <option value="${c.id}" selected>${c.name}</option>
									            </c:when>
									            <c:otherwise>
									                <option value="${c.id}">${c.name}</option>
									            </c:otherwise>
									        </c:choose>
									    </c:forEach>
									</select>
							    </td>
							    <td class="p-3 px-5 flex justify-end">
							        <button type="submit" name = "btnUpdateProduct"
							        	class="mr-3 text-sm bg-blue-500 hover:bg-blue-700 text-white py-1 px-2 rounded focus:outline-none focus:shadow-outline">Lưu</button>        
							        <button type="submit" name = "btnDeleteProduct"
							        	class="text-sm bg-red-500 hover:bg-red-700 text-white py-1 px-2 rounded focus:outline-none focus:shadow-outline">Xóa</button>
							    </td>
							</tr>
						</form:form>
					</c:forEach>
					<form:form action="admin.htm" method="post" enctype="multipart/form-data">
						<tr class="border-b hover:bg-orange-100 bg-gray-100">
						    <td class="p-3 px-5">
						        <input type="text" name="newProductName" class="bg-transparent border-b-2 border-gray-300 py-2">
						    </td>
						    <td class="p-3 px-5">
						        <input type="number" name="newProductQuantity" class="bg-transparent border-b-2 border-gray-300 py-2">
						    </td>
						    <td class="p-3 px-5">
						        <input type="number" name="newProductPrice" class="bg-transparent border-b-2 border-gray-300 py-2">
						    </td>
						    <td class="p-3 px-5">
						        <textarea name="newProductDescription" class="bg-transparent border-b-2 border-gray-300 py-2">product.description</textarea>
						    </td>
						    <td class="p-3 px-5">
						        <input type="number" name="newProductDiscount" class="bg-transparent border-b-2 border-gray-300 py-2">
						    </td>
						    <td class="p-3 px-5">
						    	<img class="bg-transparent py-2 w-28 h-28 justìy-center">
						        <input type="file" name="newProductPhoto" class="bg-transparent py-2">
						    </td>
						    <td class="p-3 px-5">
						        <select name="newProductCategory" class="bg-transparent border-b-2 border-gray-300 py-2">
								    <c:forEach var="c" items="${categories}">
								    	<option value="${c.id}">${c.name}</option>
								    </c:forEach>
								</select>
						    </td>
						    <td class="p-3 px-5 flex justify-end">
						       	<button type="submit" name="btnInsertProduct" class="mr-3 text-sm bg-orange-500 hover:bg-orange-700 text-white py-1 px-2 rounded focus:outline-none focus:shadow-outline">Thêm</button>
						    </td>
						</tr>
					</form:form>
				</tbody>
            </table>
        </div>
    </div>
    
    <!-- component category -->
			<div id="categoryComponent" class="text-gray-900">
				<div class="p-4 flex">
					<h1 class="text-3xl">Danh mục hàng hóa</h1>
				</div>
				<h1 class="error"style="color:#FF0000;">${param.Categoryname}</h1>
				<div class="px-3 py-4 ">
					<table
						class="w-full text-md bg-white shadow-md rounded mb-4 table-auto">
						<tbody>
							<tr class="border-b">
								<th class="text-left ">Tên danh mục</th>
								<th></th>
							</tr>
							<c:forEach var="c" items="${categories}">
								<form:form action="admin.htm" method="post">
									<tr class="border-b hover:bg-orange-100 bg-gray-100">
										<td class="p-3 px-5 justify-center">
											<input type="text" name="adminCategoryId" value="${c.id}" class="hidden">
											<input type="text" name="adminCategoryName" value="${c.name}" class="bg-transparent border-b-2 border-gray-300 py-2">
										</td>
	
										<td class="p-3 px-5 flex justify-end">
											<button type="submit" name="btnUpdateCategory"
												class="mr-3 text-sm bg-blue-500 hover:bg-blue-700 text-white py-1 px-2 rounded focus:outline-none focus:shadow-outline">Lưu</button>
											<button type="submit" name="btnDeleteCategory"
												class="text-sm bg-red-500 hover:bg-red-700 text-white py-1 px-2 rounded focus:outline-none focus:shadow-outline">Xóa</button>
										</td>
									</tr>
								</form:form>
							</c:forEach>
							<form:form action="admin.htm" method="post">
								<tr class="border-b hover:bg-orange-100 bg-gray-100">
									<td class="p-3 px-5 justify-center"><input type="text"
										name="newCategoryName"
										class="bg-transparent border-b-2 border-gray-300 py-2">
									</td>
									<td class="p-3 px-5 flex justify-end">
										<button type="submit" name="btnInsertCategory"
											class="mr-3 text-sm bg-orange-500 hover:bg-orange-700 text-white py-1 px-2 rounded focus:outline-none focus:shadow-outline">Thêm</button>
									</td>
								</tr>
							</form:form>
						</tbody>
					</table>
				</div>
			</div>
			
	<!-- component order -->
    <div id="orderComponent" class="text-gray-900">

		<c:forEach var="c" items="${carts}" varStatus="loop">
			<form:form action="admin.htm" method="post">	
			<input type="text" name="adminCartId" value="${c.id}" class="hidden">
				<div class="p-4 flex">
					<h1 class="text-3xl">Đơn đặt hàng ${loop.index +1}</h1>
				</div>
				<div class="p-4 flex grid grid-cols-3 gap-10">
					<h2 class="text-xl">Người đặt hàng: ${c.user.username}</h2>
					<h2 class="text-xl">Mã giỏ hàng: ${c.id}</h2>
					<h2 class="text-xl"> Tình trạng: 
						<c:choose>
				            <c:when test="${c.status == 0}">
				                Chưa xác nhận đơn hàng
				            </c:when>
				            <c:when test="${c.status == 1}">
	            				Xác nhận đơn hàng hoàn tất
	        				</c:when>
	        				<c:when test="${c.status == 2}">
	            				Đã chuẩn bị hàng
	        				</c:when>
				        </c:choose> 
					</h2>
				</div>
				
				<div class="p-4 flex grid grid-cols-3 gap-10">
					<h2 class="text-xl">Số điện thoại người đặt: ${c.user.phone}</h2>
					<h2 class="text-xl">Địa chỉ: ${c.user.address}</h2>
				</div>
	
				<div class="px-3 py-4 flex">
					<table
						class="w-full text-md bg-white shadow-md rounded mb-4 table-auto">
						<tbody>
							<tr class="border-b">
								<th class="text-left ">Sản phẩm</th>
								<th class="text-left ">Số lượng</th>
								<th class="text-left ">Đơn giá</th>
								<th class="text-left ">Thành tiền</th>
								<th></th>
							</tr>
							<c:forEach var="o" items="${c.orders}" >
								<tr class="border-b hover:bg-orange-100 bg-gray-100">
									<td class="p-3 px-5"><input type="text" value="${o.product.name}"
										class="bg-transparent border-b-2 border-gray-300 py-2" readonly>
									</td>
									<td class="p-3 px-5"><input type="number"
										value="${o.quantity}"
										class="bg-transparent border-b-2 border-gray-300 py-2" readonly>
									</td>
									<td class="p-3 px-5"><input type="number"
										value="${o.product.price}"
										class="bg-transparent border-b-2 border-gray-300 py-2" readonly>
									</td>
									<td class="p-3 px-5"><input type="number"
										value="${o.orderPrice}"
										class="bg-transparent border-b-2 border-gray-300 py-2" readonly>
									</td>
									
								</tr>
							</c:forEach>
							
						</tbody>
					</table>
	
				</div>
				<div class="flex justify-center">
				
					<button type="submit" name = "btnUpdateCart"
						class="text-sm bg-red-500 hover:bg-red-700 text-white py-1 px-2 rounded focus:outline-none focus:shadow-outline">Xác nhận giao hàng</button>
				
					<h2 class="text-xl ">Thành tiền:...VND</h2>
				</div>
			</form:form>
		</c:forEach>

		</div>
</div>
</div>
</body>

<script type="text/javascript">
	// Get references to the components
	const productsComponent = document.getElementById("productsComponent");
	const usersComponent = document.getElementById("usersComponent");
	const categoryComponent = document.getElementById("categoryComponent");
	const orderComponent = document.getElementById("orderComponent");
	// Hide the users component initially
	usersComponent.style.display = "none";
	categoryComponent.style.display = "none";
	orderComponent.style.display = "none";

	// Add click event listener to the "Quản lý khách hàng" link
	const customerLink = document.getElementById("customerLink");
	customerLink.addEventListener("click", function() {
		// Toggle the visibility of the components
		productsComponent.style.display = "none";
		categoryComponent.style.display = "none";
		usersComponent.style.display = "block";
		orderComponent.style.display = "none";
	});
	const productLink = document.getElementById("productLink");
	productLink.addEventListener("click", function() {
		// Toggle the visibility of the components
		productsComponent.style.display = "block";
		usersComponent.style.display = "none";
		categoryComponent.style.display = "none";
		orderComponent.style.display = "none";
	});
	const categoryLink = document.getElementById("categoryLink");
	categoryLink.addEventListener("click", function() {
		// Toggle the visibility of the components
		categoryComponent.style.display = "block";
		usersComponent.style.display = "none";
		productsComponent.style.display = "none";
		orderComponent.style.display = "none";
	});
	const orderLink = document.getElementById("orderLink");
	orderLink.addEventListener("click", function() {
		// Toggle the visibility of the components
		orderComponent.style.display = "block";
		usersComponent.style.display = "none";
		productsComponent.style.display = "none";
		categoryComponent.style.display = "none";
	});
</script>

</html>