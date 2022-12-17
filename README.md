# Ecommerce
## Overview
The project is a simple full-stack e-commerce website built with Java.

## Technologies used
* Backend: Spring Boot
* Frontend: HTML, CSS, Bootstrap
* Project Management: Maven
* Server: Embedded Tomcat Server
* Database: MySQL(Spring JPA)

## Features
Customer Module
* Register, log in, log out
* Product: view all products
* Cart: add/remove product from cart, view cart
* Order: place order, view user's orders

Administrator Module
* Only user with admin account can access management page
* Product: view all products, add new product, update/delete existed product
* Order: view all users' orders

## Screenshoots
### Customer section
* Home page, register, log in, log out

![pic](/screenshots/home_regis_login_logout.gif)

* Add products to cart, remove from cart

![pic](/screenshots/cart.gif)
* Place order, view orders

![pic](/screenshots/order.gif)
### Administrator section
* Product: view all products, add new product, update/delete existed product

![pic](/screenshots/admin_product.gif)
* Order: view all users' orders

![pic](/screenshots/admin_order.gif)

## To Do 
- [ ] payment gateway
- [ ] order status
- [ ] OAuth
- [ ] search products
- [ ] order id
