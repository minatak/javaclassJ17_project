<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원 정보</title>
	<%@ include file="/include/bs4.jsp" %>
	<link href="css/styles.css" rel="stylesheet" />
	<link href="${ctp}/css/join.css" rel="stylesheet" />
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/include/nav.jsp" />
    <div class="container join-container mt-5 mb-5">
      <div class="register-container">
        <h1 style="font-family: 'CWDangamAsac-Bold';" class="mb-4">회원 정보</h1>
        
        <form name="registerForm1" method="post" action="${ctp}/MemberInfoUpdate.mem">
          <div class="form-group mt-2">
            <div>Id : ${vo.mid}</div>
          </div>
          <div class="form-group">
          	<div>Nickname : ${vo.nickName}</div>
          </div>
          <div class="form-group">
            <div>Name : ${vo.name}</div>
          </div>
          <div class="form-group">
            <div>Email : ${vo.email}</div>
          </div>
          <div class="form-group">
            <div>Gender : ${vo.gender}</div>
          </div>
          <div class="form-group">
            <div>Birthday : ${vo.birthday}</div>
          </div>
          <div class="form-group">
            <div>Country : ${vo.country}</div>
          </div>
          <div class="form-group">
            <c:if test="${empty vo.city}"><div>City : 미공개</div></c:if>
            <c:if test="${!empty vo.city}"><div>City : ${vo.city}</div></c:if>
          </div>
          <div class="form-group">
            <div>Native Language : ${vo.nativeLanguage}</div>
          </div>
          <div class="form-group">
            <div>Learning Language : ${vo.learningLanguage}</div>
          </div>
          <div class="form-group">
            <div>Learning Language Level : ${vo.languageLevel}</div>
          </div>
          <div class="form-group">
            <div>Self Introduction : ${vo.content}</div>
          </div>
          
          <div class="form-group text-center ">
            <input type="submit" value="대시보드로 이동하기" class="myBtn">
          </div>
          
        </form>
      </div>
    </div>
</main>
<!-- Footer-->
<jsp:include page="/include/footer.jsp" />
<!-- Bootstrap core JS-->
<script src="js/scripts.js"></script>
</body>
</html>
