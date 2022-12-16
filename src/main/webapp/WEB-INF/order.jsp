<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Order</title>
	<!-- bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
	<!-- icon -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
	<!-- my css -->
	<link rel="stylesheet" type="text/css" href="/css/order.css">
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
			          		<a class="nav-link active" aria-current="page" href="/">Home</a>
			        	</li>
			        	<li class="nav-item">
			          		<a class="nav-link active" aria-current="page" href="/order">Order</a>
			        	</li>
	        			<li class="nav-item">
		        			<a class="nav-link active" href="/logout">Logout</a>
	        			</li>
				        <li class="nav-item">
				          <a class="nav-link active" aria-current="page" href="/cart">Cart ${cartCount}</a>
				        </li>
			      	</ul>
			    </div>
			  </div>
		</nav>

		<main class="row">
			<div class="my-5 mx-auto col-10 col-xl-6 ">
				<c:forEach var="order" items="${orders}">
					<div class="card mb-3">
						
						<div class="order-info px-4 py-3">
							<div class="row m-0">
								<div class="col-12 col-lg-7 p-0">
									<div class="row m-0">
										<div class="col-4 p-0">
											<div class="size-mini">
												<span>ORDER PLACED</span>
											</div>
											<div class="size-base">
												<span><fmt:formatDate pattern="MMM d, y" value = "${order.createdAt}"/></span>
											</div>
										</div>
										<div class="col-3 p-0">
											<div class="size-mini">
												<span>TOTAL</span>
											</div>
											<div class="size-base">
												<span>
         											$<fmt:formatNumber type="number" pattern="#,##0.00" value = "${order.total}"/>
												</span>
											</div>
										</div>
										<div class="col-5 p-0">
											<div class="size-mini">
												<span>SHIP TO</span>
											</div>
											<div class="size-base">
												<button class="popover-btn" data-bs-container="body" data-bs-toggle="popover" data-bs-placement="bottom" data-bs-trigger="hover" data-bs-html="true" 
												data-bs-content="<b>${order.firstName}  ${order.lastName}</b><br> ${order.line1}<br> ${order.line2}<br> ${order.city}, ${order.state} ${order.zip}<br> ${order.country}<br> Phone: ${order.phone}">
												  ${order.firstName}  ${order.lastName} <i class="bi bi-chevron-down"></i>
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<div class="order-products px-4 py-3">
							<c:forEach var="prod" items="${order.products}">
								<div class="row m-0 mb-2">
									<div class="p-0 col-3 col-lg-2">
	                                    <div class="mb-3 mb-md-0">
	                                        <img height="90" width="90" src="/productImages/${prod.imgName}" alt="Sample">
	                                    </div>
	                                </div>
	                                <div class="p-0 col-9 col-lg-10">
	                                    	<p class="mb-1">${prod.name}
	                                    		<span class="text-secondary" style="font-size:small;">
		                                    		<c:if test = "${prod.quantity > 1}">x${prod.quantity}</c:if>		                                    		
	                                    		</span>
	                                    	</p>
	                                    	<p class="mb-1">
	                                    		$<fmt:formatNumber type="number" pattern="#,##0.00" value="${prod.price}"/>
	                                    	</p>
	                                    		<form action="/buyItAgain" method="post">
													<input type="hidden" name="id" value="${prod.id}"/>
													<button class="btn btn-warning btn-sm" type="submit">Buy it again</button>
												</form>
	                                </div>
								</div>
							</c:forEach>
						</div>
						
					</div>
				</c:forEach>
			</div>
		</main>
				
	</div>

	<!-- popover components initialization -->
	<script>
		const popoverTriggerList = document.querySelectorAll('[data-bs-toggle="popover"]');
		const popoverList = [...popoverTriggerList].map(popoverTriggerEl => new bootstrap.Popover(popoverTriggerEl));
	</script>
</body>
</html>