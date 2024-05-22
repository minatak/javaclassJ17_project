<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%-- <%
  int level = session.getAttribute("sLevel")==null ? 999 : (int) session.getAttribute("sLevel");
  pageContext.setAttribute("level", level);
%> --%>

<style>

	@font-face {
	  font-family: 'Pretendard-Regular';
	  src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
	  font-weight: 400;
	  font-style: normal;
	}
			
	
	@font-face {
	  font-family: 'NEXON Lv1 Gothic OTF';
	  src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
	  font-weight: normal;
	  font-style: normal;
	}

	nav {
	  background-color: #fdfad1 !important;
	  color: #35ae5f !important;
	  font-family: 'NEXON Lv1 Gothic OTF' !important;
	}
	
	.nav-link, .navbar-brand {
	  color: #35ae5f !important;
	  font-family: 'NEXON Lv1 Gothic OTF' !important;
	}
	
	.dropdown-item {
	  color: #35ae5f !important;
	  font-family: 'NEXON Lv1 Gothic OTF' !important;
	}
			
</style>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg">
    <div class="container px-5">
        <a class="navbar-brand" href="Main.com" style="font-weight: bold;">LinguaLink</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="Main.com">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="About.com">About</a></li>
                <li class="nav-item"><a class="nav-link" href="Login.mem">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="Register.mem">Join</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Language</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">English</a></li>
                        <li><a class="dropdown-item" href="#">한국어</a></li>
                    </ul>
                </li>	
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">service</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownPortfolio">
                        <li><a class="dropdown-item" href="#">회원 찾기</a></li>
                        <li><a class="dropdown-item" href="#">채팅하기</a></li>
                        <li><a class="dropdown-item" href="#">학습하기</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>