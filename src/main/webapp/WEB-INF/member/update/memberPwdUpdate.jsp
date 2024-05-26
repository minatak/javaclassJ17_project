<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>비밀번호 변경</title>
	<%@ include file="/include/bs4.jsp" %>
	<link href="css/styles.css" rel="stylesheet" />
	<link href="${ctp}/css/join.css" rel="stylesheet" />
	<script>
	  document.passwordChangeForm.onsubmit = function() {
	    var newPassword = document.getElementById('newPassword').value;
	    var confirmPassword = document.getElementById('confirmPassword').value;
	    if (newPassword !== confirmPassword) {
	      alert('새로운 비밀번호가 일치하지 않습니다.');
	      return false;
	    }
	    // Add encryption logic here if needed before form submission
	    return true;
	  };
</script>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/include/nav.jsp" />
    <div class="container join-container mt-5 mb-5">
      <div class="register-container">
        <h1 style="font-family: 'CWDangamAsac-Bold';" class="mb-5">비밀번호 변경</h1>
        
        <form name="passwordChangeForm" method="post" action="${ctp}/MemberPwdUpdateOk.mem">
          <div class="form-group">
            <label for="currentPassword">Current Password *</label>
            <input type="password" id="currentPassword" name="currentPassword" placeholder="현재 비밀번호를 입력하세요" required>
          </div>
          <div class="form-group">
            <label for="newPassword">New Password *</label>
            <input type="password" id="newPassword" name="newPassword" placeholder="새로운 비밀번호를 입력하세요" required>
          </div>
          <div class="form-group">
            <label for="confirmPassword">Confirm New Password *</label>
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="새로운 비밀번호를 다시 입력하세요" required>
          </div>
          <div class="form-group text-center">
            <input type="submit" value="비밀번호 변경" class="myBtn">
          </div>
        </form>
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
