<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Orders</title>
	<!-- bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container-fluid p-0">
	
		<nav class="navbar navbar-expand-lg bg-light">
			<div class="container-fluid">
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent">
			      	<span class="navbar-toggler-icon"></span>
			    </button>
			    
			    <div class="collapse navbar-collapse" id="navbarContent">
			    	<ul class="navbar-nav me-auto mb-2 mb-lg-0">
			        	<li class="nav-item">
			          		<a class="nav-link active" aria-current="page" href="/admin">AdminHome</a>
			        	</li>
				        <li class="nav-item">
				          <a class="nav-link active" aria-current="page" href="/logout">Logout</a>
				        </li>
			      	</ul>
			    </div>
			  </div>
		</nav>
		
		<div class="m-5">
			<table class="table table-striped my-3">
				<thead class="table-dark">
					<tr>
						<th>SN</th>
						<th>Purchase Date</th>
						<th>Ship To</th>
						<th>Total</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="order" items="${orders}" varStatus="myIdx">
						<tr>
							<td class="py-0 align-middle">${myIdx.index+1}</td>
							<td class="py-0 align-middle"><fmt:formatDate pattern="MMM d, y" value = "${order.createdAt}"/></td>
							<td class="py-0 align-middle">${order.firstName} ${order.lastName}</td>
							<td class="py-0 align-middle">$<fmt:formatNumber type="number" pattern="#,##0.00" value="${order.total}"/></td>
							<td class="py-0 align-middle">
								<button class="btn btn-link text-decoration-none" data-bs-toggle="offcanvas" data-bs-target="#order-${order.id}">View</button>
								<div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="order-${order.id}" style="width:40vw;">
									<div class="offcanvas-header">
								    	<h5 class="offcanvas-title">Order Details</h5>
								    	<button type="button" class="btn-close" data-bs-dismiss="offcanvas"></button>
								  	</div>
								  	<div class="offcanvas-body">
								  		<h5>Order & Account Information</h5>
								  		<p class="m-0">
								  			<b>Order Data:</b> <fmt:formatDate pattern="MMM d, y" value = "${order.createdAt}"/><br>
								  			<b>Order Status:</b> Pending<br>
								  			<b>Customer Name:</b> ${order.firstName} ${order.lastName}<br>
								  			<b>Email:</b> ${order.user.email}
								  		</p>
								  		<hr>
								  		<h5>Shipping Address</h5>
								  		<p class="m-0">
								  			${order.line1}<br>
								  			<c:if test="${order.line2.length()>0}">${order.line2}<br></c:if>
								  			${order.city}, ${order.state} ${order.zip}<br>
								  			${order.country}<br> 
								  			Phone: ${order.phone}
								  		</p>
								  		<hr>
								  		<h5>Ordered Items</h5>
								  		<table class="table">
								  			<thead>
								  				<tr class="table-light">
								  					<th>Product</th>
								  					<th>Price</th>
								  					<th>Qty</th>
								  					<th>Subtotal</th>
								  				</tr>
								  			</thead>
								  			<tbody>
								  				<c:forEach var="product" items="${order.products}">
								  					<tr>
									  					<td class="py-1 align-middle">${product.name}</td>
									  					<td class="py-1 align-middle">$<fmt:formatNumber type="number" pattern="#,##0.00" value="${product.price}"/></td>
									  					<td class="py-1 align-middle">${product.quantity}</td>
									  					<td class="py-1 align-middle">$<fmt:formatNumber type="number" pattern="#,##0.00" value="${product.price*product.quantity}"/></td>
									  				</tr>
								  				</c:forEach>
								  			</tbody>
								  		</table>
								  		<p class="m-0"><b>Total:</b> $${order.total}</p>
								  	</div>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
	</div>
</body>
</html>