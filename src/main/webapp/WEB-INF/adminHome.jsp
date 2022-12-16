<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Admin Home</title>
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
		
		<div style="background:#f2f2f2; height:300px;" class="position-relative mb-3">
			<div class="position-absolute top-50 start-50 translate-middle">
				<h1>Welcome back, ${userName}</h1>
				<p class="text-center">Easily manage your data from this admin CMS</p>
			</div>
		</div>
		
		<div class="d-flex p-3">
			<div class="card me-3" style="width:300px;">
				<div class="card-body">
					<h3>Products</h3>
					<p>Manage all the products here</p>
					<a class="btn btn-primary" href="/admin/products" href="/admin/products">Manage</a>
				</div>
			</div>
			
			<div class="card" style="width:300px;">
				<div class="card-body">
					<h3>Orders</h3>
					<p>Manage all the orders here</p>
					<a class="btn btn-primary" href="/admin/orders" href="/admin/orders">Manage</a>
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>