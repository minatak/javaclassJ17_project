<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>LinguaLink</title>
  <%@ include file = "/include/bs4.jsp" %>
  <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
  <link href="css/styles.css" rel="stylesheet" />
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
<jsp:include page="/include/nav.jsp" />
<jsp:include page="/include/header.jsp" />

<!-- Blog preview section-->
<section class="py-5">
<div class="container px-5 my-5">
	<div class="row gx-5 justify-content-center">
		<div class="col-lg-8 col-xl-6">
			<div class="text-center">
				<h2 class="fw-bolder">주요 기능들</h2>
				<p class="lead fw-normal text-muted mb-5">뭐라고 쓰지?</p>
			</div>
		</div>
	</div>
  <div class="row gx-5">
  	<div class="col-lg-4 mb-5">
    	<div class="card h-100 shadow border-0">
      	<img class="card-img-top" src="https://dummyimage.com/600x350/ced4da/6c757d" alt="..." />
        <div class="card-body p-4">
	        <div class="badge bg-primary bg-gradient rounded-pill mb-2">첫번째</div>
	        <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">회원 조회하기</h5></a>
	        <p class="card-text mb-0">전 세계 사용자들과 언어를 교환하며 학습할 수 있습니다 :) 나와 학습목표, 관심가 일치하는 사용자를 찾아보세요 </p>
        </div>
      </div>
		</div>
    <div class="col-lg-4 mb-5">
    	<div class="card h-100 shadow border-0">
	      <img class="card-img-top" src="https://dummyimage.com/600x350/adb5bd/495057" alt="..." />
	      <div class="card-body p-4">
	        <div class="badge bg-primary bg-gradient rounded-pill mb-2">두번째</div>
	        <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">채팅하기</h5></a>
	        <p class="card-text mb-0">This text is a bit longer to illustrate the adaptive height of each card. Some quick example text to build on the card title and make up the bulk of the card's content.</p>
        </div>
      </div>
    </div>
    <div class="col-lg-4 mb-5">
    	<div class="card h-100 shadow border-0">
	      <img class="card-img-top" src="https://dummyimage.com/600x350/6c757d/343a40" alt="..." />
	      <div class="card-body p-4">
        	<div class="badge bg-primary bg-gradient rounded-pill mb-2">세번째</div>
	        <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">학습하기</h5></a>
	      	<p class="card-text mb-0">단어장 생성, 암기/테스트 기능 있음!(여기 부분 설명 수정)</p>
        </div>
    	</div>
  	</div>
	</div>
</div>
</section>
<!-- Testimonial section-->
<div class="py-5 bg-light">
	<div class="container px-5 my-5">
		<div class="row gx-5 justify-content-center">
			<div class="col-lg-10 col-xl-7">
				<div class="text-center">
        	<div class="fs-4 mb-4 fst-italic">"새로운 언어를 배우는 것은 새로운 삶을 얻는 것이다. 두 개의 언어를 알고 있으면 두 개의 삶을 산다."</div>
          <div class="d-flex align-items-center justify-content-center">
          	<img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
           	<div class="fw-bold">
            	Ludwig Wittgenstein
             	<span class="fw-bold text-primary mx-1">/</span>
              영국 철학자, 케임브리지 대학교 철학 전공 
        		</div>
        	</div>
				</div>
			</div>
		</div>
	</div>
</div>
</main>
<jsp:include page="/include/footer.jsp" />
</body>
</html>