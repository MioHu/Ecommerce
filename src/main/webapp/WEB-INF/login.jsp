<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Login</title>
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
			        	<li class="nav-item">
		        			<a class="nav-link active" href="/register">Register</a>
	        			</li>
	        			<li class="nav-item">
		        			<a class="nav-link active" href="/login">Login</a>
	        			</li>
				        <li class="nav-item">
				          <a class="nav-link active" aria-current="page" href="/cart">Cart ${cartCount}</a>
				        </li>
			      	</ul>
			    </div>
			  </div>
		</nav>
		
		<div class="container mt-3">
			<div class="col-sm-6">
				<h3>Log in</h3>
					<form:form action="/loginPost" method="post" modelAttribute="newLogin">
						<div class="mb-3">
							<form:label path="email">Email</form:label>
							<form:input path="email" class="form-control" type="email" required="true"/>
							<form:errors path="email"  class="text-danger"/>
						</div>
						<div class="mb-3">
							<form:label path="password">Password</form:label>
							<form:input path="password" class="form-control" type="password" required="true"/>
							<form:errors path="password"  class="text-danger"/>
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
					</form:form>
				<p class="mt-3">
					Don't have an account <a href="/register">Register here</a>
				</p>
			</div>
		</div>
		
	</div>
</body>
</html>