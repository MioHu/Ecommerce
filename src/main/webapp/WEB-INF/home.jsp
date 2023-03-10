<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Home</title>
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
		
		<div class="my-3 px-5 d-flex flex-wrap justify-content-start">
			<c:forEach var="item" items="${products}">
				<div class="me-3 mb-3">
					<div class="card" style="width:250px;height: 400px;">
						<img class="card-img-top" height="250" width="250" src="/productImages/${item.imgName}">
						<div class="card-body p-2">
							<p class="mb-1" style="word-wrap:break-word;">${item.name}</p>
							<p class="mb-1">
								$<fmt:formatNumber type="number" pattern="#,##0.00" value="${item.price}"/>
							</p>
							<form action="/addToCart" method="post">
								<input type="hidden" name="id" value="${item.id}"/>
								<button class="btn btn-sm btn-primary" type="submit">Add to cart</button>
							</form>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	
	</div>
</body>
</html>