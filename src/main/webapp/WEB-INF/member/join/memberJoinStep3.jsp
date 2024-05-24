<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>가입 완료</title>
<%@ include file="/include/bs4.jsp" %>
<link href="css/styles.css" rel="stylesheet" />
<link href="${ctp}/css/join.css" rel="stylesheet" /> 
<style>

		a:hover,
		a:focus,
		a:active,
		a:visited {
			color: #fefefe; /* 링크의 상태별로 색상 변경 */
			text-decoration: none;
		}
</style>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/include/nav.jsp" />
    <div class="container join-container mt-5 mb-5">
      <div class="complete-container">
        <h1>가입 완료</h1>
        <p>회원가입이 성공적으로 완료되었습니다 :)</p>
        <div class="row gx-5 row-cols-2 row-cols-lg-3 py-5" style="color: #6f5340;">
          <div class="col">
            <p class="text-muted mb-0">step 1</p>
            <div class="step"><i class="fa-solid fa-user"></i></div>
            <div class="m-2">회원 정보 입력</div>
          </div>
          <div class="col">
            <p class="text-muted mb-0">step 2</p>
            <div class="step"><i class="fa-solid fa-earth-americas"></i></div>
            <div class="m-2">언어 / 목표 입력</div>
          </div>
          <div class="col">
            <p class="text-muted mb-0">step 3</p>
            <div class="proceedingStep step"><i class="fa-solid fa-check"></i></div>
            <div class="m-2">가입완료</div>
          </div>
        </div>
        <a href="${ctp}/Login.mem" class="myBtn">&nbsp;로그인&nbsp;</a>
        <a href="${ctp}/Main.com" class="myBtn">홈으로 돌아가기</a>
      </div>
    </div>
</main>
<!-- Footer-->
<jsp:include page="/include/footer.jsp" />
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>
