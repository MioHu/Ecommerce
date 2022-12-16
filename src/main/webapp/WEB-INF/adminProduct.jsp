<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Products</title>
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
		
		<div class="m-5 mt-4">
			<a class="btn btn-sm btn-primary mb-3" href="/admin/products/add">Add Product</a>
		
			<table class="table">
				<thead>
					<tr class="table-secondary">
						<th>SN</th>
						<th>Product Name</th>
						<th>Price</th>
						<th>Preview</th>
						<th>Update</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${products}" varStatus="myIdx">
						<tr>
							<td class="py-0 align-middle">${myIdx.index+1}</td>
							<td class="py-0 align-middle">${item.name}</td>
							<td class="py-0 align-middle">
								$<fmt:formatNumber type="number" pattern="#,##0.00" value="${item.price}"/>
							</td>
							<td class="align-middle">
								<img height="90" width="90" src="/productImages/${item.imgName}">
							</td>
							<td class="py-0 align-middle">
								<a class="btn btn-sm btn-warning" href="/admin/products/update/${item.id}">Update</a>
							</td>
							<td class="py-0 align-middle">
								<form action="/admin/products/delete/${item.id}" method="post">
									<input type="hidden" name="_method" value="delete"/>
									<button class="btn btn-sm btn-danger" type="submit">Delete</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
	</div>
</body>
</html>