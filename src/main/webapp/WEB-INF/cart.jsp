<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Cart</title>
	<!-- bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>	
	<!-- fontawesome icon -->
	<script src="https://kit.fontawesome.com/01d86593d9.js" crossorigin="anonymous"></script>
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
				        <c:choose>
			        		<c:when test="${login==true}">
			        			<li class="nav-item">
				        			<a class="nav-link active" href="/logout">Logout</a>
			        			</li>
			        		</c:when>
			        		<c:when test="${login==false}">
			        			<li class="nav-item">
				        			<a class="nav-link active" href="/register">Register</a>
			        			</li>
			        			<li class="nav-item">
				        			<a class="nav-link active" href="/login">Login</a>
			        			</li>
			        		</c:when>
			        	</c:choose>
				        <li class="nav-item">
				          <a class="nav-link active" aria-current="page" href="/cart">Cart ${cartCount}</a>
				        </li>
			      	</ul>
			    </div>
			  </div>
		</nav>
		
		<main>
			<div class="container my-5">
				<div class="row">
				
					<!-- left -->
					<div class="col-lg-8">
						<div class="card mb-4">
							<div class="card-body">
								<h5 class="mb-4">Cart (${cartCount} items)</h5>
								
								<c:forEach var="item" items="${cart}">
									<div class="row mb-4">
										<div class="col-md-5 col-lg-3 col-xl-3">
		                                    <div class="mb-3 mb-md-0">
		                                        <img class="img-fluid w-100" src="/productImages/${item.imgName}" alt="Sample">
		                                    </div>
		                                </div>
		                                <div class="col-md-7 col-lg-9 col-xl-9">
		                                    	<h5>${item.name}
		                                    		<span class="text-secondary" style="font-size:small;">
			                                    		<c:if test = "${item.quantity > 1}">x${item.quantity}</c:if>		                                    		
		                                    		</span>
		                                    	</h5>
		                                    	<p>
		                                    		$<fmt:formatNumber type="number" pattern="#,##0.00" value="${item.price}"/>
		                                    	</p>
		                                    	<form action="/cart/remove/${item.id}" method="post">
		                                    		<input type="hidden" name="_method" value="delete">
		                                    		<button class="btn btn-link p-0 text-decoration-none"><i class="fa-regular fa-trash-can"></i> Remove item</button>
		                                    	</form>
		                                </div>
									</div>
								</c:forEach>
								
								<hr class="mb-4">
                            	<p class="text-primary mb-0"><i class="fas fa-info-circle mr-1"></i> Do not delay the purchase, adding
                                items to your cart does not mean booking them.</p>
							</div>
						</div>
					</div>
					
					<!-- right -->
					<div class="col-lg-4">
	                    <div class="card mb-4">
	                        <div class="card-body">
	                        	<h5 class="mb-3">The total amount </h5>
	                        	<ul class="list-group list-group-flush">
	                                <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
	                                    Amount Payable
	                                    <span>
	                                    	$<fmt:formatNumber type="number" pattern="#,##0.00" value="${total}"/>
	                                    </span>
	                                </li>
	                                <li class="list-group-item d-flex justify-content-between align-items-center px-0">
	                                    Shipping
	                                    <span>Free</span>
	                                </li>
	                                <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
	                                    <div>
	                                        <strong>The total amount of</strong>
	                                        <strong>
	                                            <p class="mb-0">(including VAT)</p>
	                                        </strong>
	                                    </div>
	                                    <span><strong>
	                                    	$<fmt:formatNumber type="number" pattern="#,##0.00" value="${total}"/>
	                                    </strong></span>
	                                </li>
	                            </ul>

                            	<a href="/checkout" class="btn btn-primary w-100">Go To Checkout</a>
	                        </div>
	                    </div>
					</div>
				</div>
			</div>
		</main>
	
	</div>
</body>
</html>