<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
	<a class="navbar-brand" href="#"> 
		<img src="./assets/images/javaee_logo.png" alt="logo" class="logo" />
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarCollapse" aria-controls="navbarCollapse"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarCollapse">
	   <ul class="navbar-nav mr-auto">
	   		<!--  
 			<li class="nav-item active"><a class="nav-link" href="./">Accueil</a>
			</li>
			<li class="nav-item"><a class="nav-link"
				href="./main?page=about">About</a></li>
			<li class="nav-item"><a class="nav-link"
				href="./main?page=contact">Contact</a></li>
			<li>|</li>
			<li class="nav-item"><a class="nav-link"
				href="./main?page=gallery">Upload</a></li>-->
		</ul> 
		
		<ul class="nav navbar-nav navbar-right">
			<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/">Upload</a></li>
			<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/main?page=gallery">Gallery</a></li>
		</ul>
	</div>
	
	<!--  Bloc Login/Logout -->
<%-- 	<div class="navbar-nav ml-auto">
		<div class="nav-item dropdown login-dropdown">	
			
			<c:if test="${user==null}">
				<a href="#loginModal" class="nav-item nav-link " data-toggle="modal"><i class="fa fa-user-o"></i> Login</a>
			</c:if>
			<c:if test="${user!=null}">
				<span class="user-title">${user}</span>
				<a href="<%=request.getContextPath() %>/login?action=logout" class="nav-item nav-link" style="float:right">
					<i class="fa fa-user-o"></i> Logout!
				</a>
			</c:if>		
		</div>
	</div> --%>
<%-- 	<ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> 
          	 <i class="fa fa-shopping-cart pl-0"></i>
	         <span class="badge badge-pill red">(${cart.size()})</span>
          </a>
          <ul class="dropdown-menu dropdown-cart" role="menu">
          	  <c:set var="total" value="0" />
          	  <c:forEach items="${cart}" var="item">    	  
	          	  <li>
	                  <span class="item">
	                    <span class="item-left">
	                        <img src="http://lorempixel.com/50/50/" alt="" />
	                        <span class="item-info">
	                            <span>${item.name}</span>
	                            <span>${item.quantity} | ${item.price}€</span>
	                        </span>
	                    </span>
	                    <span class="item-right">
	                    	<button class="btn btn-xs btn-danger pull-right"
	                    	onclick="javascript:document.getElementById('cart-delete').submit()">x</button>
	                    </span>
	                </span>
	              </li>
	              
	              <form class="form-inline mt-2 mt-md-0" id="cart-delete"
	              		method="POST"
						action="<%=request.getContextPath() %>/main?page=articles&action=cart-delete">
						<input type="hidden" value="${item.id}" name="id" />				
                  </form>
	              
	              <c:set var="total" value="${total + item.quantity*item.price}" />
          	  </c:forEach>	
              
              <li class="divider"></li>
              
              <li class="text-center"><fmt:formatNumber type="number" maxFractionDigits="2" value="${total}"/>€</li>
              <li class="text-center"><a  href="<%=request.getContextPath() %>/main?page=articles&action=cart">Afficher Panier</a></li>
          </ul>
        </li>
      </ul>
	 --%>
</nav>


<div id="loginModal" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">
 				<div class="avatar">
					<img src="./assets/images/avatar.png" alt="Avatar">
				</div>	 
				<h4 class="modal-title">Login</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
				<form action="./login?action=login" method="post">
					<div class="form-group">
						<i class="fa fa-user"></i> <input type="text" class="form-control"
							placeholder="Login" name="login" required="required">
					</div>
					<div class="form-group">
						<i class="fa fa-lock"></i> <input type="password"
							class="form-control" placeholder="Password" name="password" required="required">
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary btn-block btn-lg"
							value="Login">
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<a href="#createModal" class="nav-item nav-link" data-dismiss="modal" data-toggle="modal" ><i class="fa fa-user"></i>Inscription</a>
			</div>
		</div>
	</div>
</div>
<div id="createModal" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<div class="modal-header">
			 				<div class="avatar">
					<img src="./assets/images/avatar.png" alt="Avatar">
				</div>	
				<h4 class="modal-title">Create</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
				<form action="./login?action=signup" method="post">
					<div class="form-group">
						<i class="fa fa-user"></i> <input type="text" class="form-control"
							placeholder="Prénom" name="prenom" required="required">
					</div>
					<div class="form-group">
						<i class="fa fa-user"></i> <input type="text"
							class="form-control" placeholder="Nom" name="nom" required="required">
					</div>
					<div class="form-group">
						<i class="fa fa-user"></i> <input type="text" class="form-control"
							placeholder="Login" name="login" required="required">
					</div>
					<div class="form-group">
						<i class="fa fa-lock"></i> <input type="password"
							class="form-control" placeholder="Password" name="password" required="required">
					</div>
					<div class="form-group">
						<i class="fa fa-lock"></i> <input type="password"
							class="form-control" placeholder="Confirmation" name="password2" required="required">
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary btn-block btn-lg" value="Inscription">
					</div>
				</form>
			</div>
<!-- 			<div class="modal-footer">
				<a href="#loginModal" class="nav-item nav-link" data-dismiss="modal" data-toggle="modal" ><i class="fa fa-user"></i>Login</a>
			</div> -->
		</div>
	</div>
</div>