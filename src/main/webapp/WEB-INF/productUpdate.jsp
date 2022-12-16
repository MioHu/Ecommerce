<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Edit a product</title>
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
		
		<div class="row my-3">
			<div class="mx-auto col-10 col-sm-8 col-md-5">
				<h3>Edit the product</h3>
				<form:form action="/admin/products/update/${product.id}" method="post" modelAttribute="product" class="form">
					<input type="hidden" name="_method" value="put"/>
					<form:input type="hidden" path="imgName"/>
					<div class="mb-3">
						<form:label path="name" class="form-label">Name</form:label>
						<form:input path="name" class="form-control" required="true"/>
					</div>
					<div class="mb-3">
						<form:label path="price" class="form-label">Price</form:label>
						<form:input path="price" class="form-control" type="number" step="any" required="true"/>
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
					<a class="btn btn-secondary ms-3" role="button" href="/admin/products">Cancel</a>
				</form:form>
			</div>
		</div>
		
	</div>
</body>
</html>