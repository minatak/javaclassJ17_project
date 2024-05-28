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

    body {
        margin: 0;
        padding: 0;
    }

    .navbar {
        padding-top: 0;
        padding-bottom: 0;
        background-color: #fdfad1 !important;
        color: #35ae5f !important;
        font-family: 'NEXON Lv1 Gothic OTF' !important;
    }

    .navbar .container {
        display: flex;
        justify-content: flex-end; /* 텍스트를 오른쪽 정렬 */
        padding-left: 0;
        padding-right: 0;
    }

    .navbar-brand {
        color: #35ae5f !important;
        font-weight: bold;
        margin: 0;
    }

    .nav-link, .navbar-brand {
        color: #35ae5f !important;
        font-family: 'NEXON Lv1 Gothic OTF' !important;
    }

    .dropdown-item {
        color: #35ae5f !important;
        font-family: 'NEXON Lv1 Gothic OTF' !important;
    }

    .profile-dropdown img {
        border-radius: 50%;
        width: 40px;
        height: 40px;
        object-fit: cover;
    }

</style>

<c:if test="${sLevel == 0}">
	<nav class="navbar navbar-expand-lg">
	    <div class="container px-1">
	        <a class="navbar-brand" href="AdminMain.ad">admin</a>
	    </div>
	</nav>
</c:if>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg">
    <div class="container px-5">
        <a class="navbar-brand" href="Main.com" style="font-weight: bold;">LinguaLink</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="Main.com">Home</a></li>
                <c:if test="${empty sMid}"><li class="nav-item"><a class="nav-link" href="About.com">About</a></li></c:if>
                <c:if test="${empty sMid}"><li class="nav-item"><a class="nav-link" href="Login.mem">Login</a></li></c:if>
                <c:if test="${empty sMid}"><li class="nav-item"><a class="nav-link" href="Register.mem">Join</a></li></c:if>
                <c:if test="${!empty sMid}"><li class="nav-item"><a class="nav-link" href="MemberList.mem">Find</a></li></c:if>
                <c:if test="${!empty sMid}"><li class="nav-item"><a class="nav-link" href="ChatList.chat">Message</a></li></c:if>
                <c:if test="${!empty sMid}"><li class="nav-item"><a class="nav-link" href="ChatDetail.chat">Message디테일</a></li></c:if>
                <c:if test="${!empty sMid}"><li class="nav-item"><a class="nav-link" href="VocaMain.st">Study</a></li></c:if>
                <%-- <c:if test="${empty sMid}"> --%>
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Language</a>
	                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
	                        <li><a class="dropdown-item" href="#">English</a></li>
	                        <li><a class="dropdown-item" href="#">한국어</a></li>
	                    </ul>
	                </li>    
                <%-- </c:if> --%>
                <c:if test="${empty sMid}">
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Service</a>
	                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownPortfolio">
	                        <li><a class="dropdown-item" href="MemberList.mem">회원 찾기</a></li>
	                        <li><a class="dropdown-item" href="ChatList.chat">채팅하기</a></li>
	                        <li><a class="dropdown-item" href="VocaMain.st">학습하기</a></li>
	                    </ul>
	                </li>
                </c:if>
                <c:if test="${!empty sMid}">
	                <li class="nav-item dropdown profile-dropdown ml-3">
	                    <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	                        <img src="${ctp}/images/member/${sPhoto}" alt="Profile Picture">
	                    </a>
	                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profileDropdown">
	                        <li><a class="dropdown-item" href="MemberMain.mem">대시보드</a></li>
	                        <li><a class="dropdown-item" href="MemberInfo.mem">내 정보 확인</a></li>
	                        <li><a class="dropdown-item" href="MemberUpdate.mem">정보 수정</a></li>
	                        <li><hr class="dropdown-divider"></li>
	                        <li><a class="dropdown-item" href="MemberLogout.mem">Logout</a></li>
	                    </ul>
	                </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
