<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%-- <%
  int level = session.getAttribute("sLevel")==null ? 999 : (int) session.getAttribute("sLevel");
  pageContext.setAttribute("level", level);
%>
<nav class="navbar navbar-expand-lg navbar-dark"  style="background-color:#1B263B;">>
    <div class="container px-5">
        <a class="navbar-brand" href="index.html">LinguaLink</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="about.html">About</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.html">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="pricing.html">Join</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownBlog language-select" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Language</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                        <li><a class="dropdown-item" href="blog-home.html">English</a></li>
                        <li><a class="dropdown-item" href="blog-post.html">한국어</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
 --%>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container px-5">
        <a class="navbar-brand" href="Main.com">LinguaLink</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="Main.com">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="About.com">About</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.html">Login</a></li>
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