<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<style>
	@font-face {
	  font-family: 'RixInooAriDuriR';
	  src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2207-01@1.0/RixInooAriDuriR.woff2') format('woff2');
	  font-weight: normal;
	  font-style: normal;
	}
	@font-face {
    font-family: 'IM_Hyemin-Bold';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2106@1.1/IM_Hyemin-Bold.woff2') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	@font-face {
    font-family: 'PyeongChangPeace-Bold';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-02@1.0/PyeongChangPeace-Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
	}
	
	.title{
		font-family: "Playfair Display", serif;
	  font-optical-sizing: auto;
	  font-weight: <weight>;
	  font-style: normal;
	}
	
</style>
<header class="py-5" style="background-color:#1B263B;">
	<div class="container px-5">
		<div class="row gx-5 align-items-center justify-content-center">
			<div class="col-lg-8 col-xl-7 col-xxl-6">
			 	<div class="my-5 text-center text-xl-start">
			  		<h1 class="display-5 fw-bolder text-white mb-2 title">LinguaLink</h1>
			  		<h3 class="display-5 fw-bolder text-white">: Bridging Cultures Through Language</h3>
			   	<p class="lead fw-normal text-white-50 mb-4" style="font-family: 'IM_Hyemin-Bold';">'Lingua'는 라틴어로 ‘언어’를 의미하며, 'Link'는 '연결'을 의미합니다. 이 사이트는 단순한 언어 교환을 넘어, 전 세계의 사람들을 서로 연결하는 다리 역할의 플랫폼입니다. LinguaLink는 사용자들이 새로운 언어를 배우는 동시에, 다양한 문화적 배경을 가진 친구들을 만나고 소통할 수 있는 공간을 제공합니다.</p>
			   	<div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
			   		<a class="btn btn-primary btn-lg px-4 me-sm-3 mr-2" href="#features">지금 가입하기</a>
			   		<a class="btn btn-outline-light btn-lg px-4" href="#!">로그인</a>
			   	</div>
			 	</div>
			</div>
	 		<!-- <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center">
	 			<img class="img-fluid rounded-3 my-5" src="${ctp}/images/conversation.png" />
	 		</div>  -->
	  </div>
	</div>
</header>