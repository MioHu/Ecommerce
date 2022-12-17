<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
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
				          <a class="nav-link active" aria-current="page" href="/logout">Logout</a>
				        </li>
				        <li class="nav-item">
				          <a class="nav-link active" aria-current="page" href="/cart">Cart ${cartCount}</a>
				        </li>
			      	</ul>
			    </div>
			  </div>
		</nav>
		
		<main>
			<div class="container my-5">

				<form:form action="/checkoutPost" method="post" modelAttribute="order">
				<div class="row">
					
					<!-- left -->
					<div class="col-lg-8">
						<div class="card mb-4">
							<div class="card-body">
								<h5 class="mb-4">Billing details</h5>

		                        <div class="row">
		                            <div class="col-lg-6">
		                            	<form:label path="firstName">First name</form:label>
		                            	<form:input required="true" class="form-control mb-0 mb-lg-2" path="firstName"/>
		                            </div>
		                            <div class="col-lg-6">
		                                <form:label path="lastName">Last name</form:label>
		                                <form:input required="true" class="form-control" path="lastName"/>
		                            </div>
		                        </div>
		
		                        <div class="mt-2">
		                            <form:label path="line1">Address (Line 1)</form:label>
		                            <form:input required="true" placeholder="House number and street name" class="form-control" path="line1"/>
		                        </div>
		                        <div class="mt-3">
		                            <form:label path="line2">Address (Line 2)</form:label>
		                            <form:input placeholder="Apartment, suite, unit etc. (optional)" class="form-control" path="line2"/>
		                        </div>
		                        
		                        <div class="row mt-3">
		                            <div class="col-lg-4">
		                            	<form:label path="city">City</form:label>
		                            	<form:input required="true" class="form-control mb-0 mb-lg-2" path="city"/>
		                            </div>
		                            <div class="col-lg-4">
		                                <form:label path="state">State</form:label>
		                                <form:input required="true" class="form-control" path="state"/>
		                            </div>
		                            <div class="col-lg-4">
		                            	<form:label path="zip">ZIP Code</form:label>
		                            	<form:input required="true" class="form-control mb-0 mb-lg-2" path="zip"/>
		                            </div>
		                        </div>
		                        
		                        <div class="mt-2">
		                        	<form:label path="country">Country</form:label>
		                        	<form:select path="country" class="form-select">
		                        		<c:forEach var="item" items="${countries}">
		                        			<form:option path="country" value="${item}">${item}</form:option>
		                        		</c:forEach>
		                        	</form:select>
		                        </div>
		                        <div class="mt-3">
		                            <form:label path="phone">Phone</form:label>
		                            <form:input path="phone" minlength="10" required="true" class="form-control"/>
		                        </div>
		                        <div class="mt-3">
		                            <form:label path="note">Additional information</form:label>
		                            <form:textarea path="note" class="md-textarea form-control" rows="4"/>
		                        </div>
		                        
							</div>
						</div>
					</div>
					<!-- left end -->
					
					<!-- right -->
					<div  class="col-lg-4">
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

                            	<button type="submit" class="btn btn-primary w-100">Place Order</button>
							</div>
						</div>
					</div>
					<!-- right end -->
					
				</div> <!-- row end -->
               	</form:form>
               	
			</div>
		</main>
	
	</div>
</body>
</html>