<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Insert</title>
  <%@ include file = "/include/bs4.jsp" %>
</head>
<body class="d-flex flex-column">
	<main class="flex-shrink-0">
		<jsp:include page="/include/nav.jsp" />
		<!-- Header-->
		<header class="py-5">
	  	<div class="container px-5">
	    	<div class="row justify-content-center">
	      	<div class="col-lg-8 col-xxl-6">
	        	<div class="text-center my-5">
							<h1 class="fw-bolder mb-3">Our mission is to make building websites easier for everyone.</h1>
							<p class="lead fw-normal text-muted mb-4">Start Bootstrap was built on the idea that quality, functional website templates and themes should be available to everyone. Use our open source, free products, or support us by purchasing one of our premium products or services.</p>
							<a class="btn btn-primary btn-lg" href="#scroll-target">Read our story</a>
	          </div>
	        </div>
	      </div>
	    </div>
		</header>
		
	</main>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>