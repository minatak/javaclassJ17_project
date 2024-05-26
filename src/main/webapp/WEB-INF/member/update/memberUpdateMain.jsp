<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원 정보 수정</title>
	<%@ include file="/include/bs4.jsp" %>
	<link href="css/styles.css" rel="stylesheet" />
	<link href="${ctp}/css/join.css" rel="stylesheet" />
	<style>
		/* Custom styles for spacing and alignment */
		.myBtn {
		  border: 1.2px solid #39b766;
		  color: #fefefe;
		  background-color: #35ae5f;
		  padding: 10px 20px;
		  font-size: 14px;
		  margin: 10px 5px;
		  display: inline-block;
		  text-decoration: none;
		  cursor: pointer;
		}
		
		.myBtn:disabled {
		  background-color: #d3d3d3;
		  border-color: #d3d3d3;
		  cursor: not-allowed;
		}

		.form-group.text-center {
		  margin-top: 20px;
		}
	</style>
	<script>
		'use strict';
		
		let pwdCheckSw = 0;
	
		function submitCheck(part) {
			if (pwdCheckSw == 0) {
				alert("비밀번호를 먼저 확인해주세요.");
				document.getElementById("password").focus();
			} else {
				if (part === 'pwd') {
					location.href = "${ctp}/MemberPwdUpdate.mem";
				} else if (part === 'user') {
					location.href = "${ctp}/MemberInfoUpdate.mem";
				}
			}
		}
		
		function checkPassword() {
			// This is a placeholder function to simulate password checking
			// Replace with actual password checking logic
			const password = document.getElementById("password").value;
			if (password === "correct_password") { // Replace with actual password check
				pwdCheckSw = 1;
				alert("비밀번호가 확인되었습니다.");
				document.querySelectorAll('.optionBtn').forEach(button => button.disabled = false);
			} else {
				alert("비밀번호가 일치하지 않습니다.");
				document.getElementById("password").focus();
			}
		}
	</script>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/include/nav.jsp" />
    <div class="container join-container mt-5 mb-5">
      <div class="register-container">
        <h1 style="font-family: 'CWDangamAsac-Bold';">회원정보 수정</h1>
        <h4 class="text-muted">회원정보 수정을 위해서는 비밀번호를 확인해야 합니다.</h4>
        
        <form name="checkPwdForm" method="post" action="javascript:checkPassword();">
          <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" required class="form-control">
          </div>
          <div class="form-group text-center">
            <input type="submit" value="확인" class="myBtn">
          </div>
        </form>
        
        <div class="row gx-5 row-cols-1 py-5 text-center" style="color: #6f5340;">
	        <div class="col">
         		<button type="button" class="myBtn optionBtn" onclick="submitCheck('pwd')" disabled>비밀번호 변경</button>
         		<button type="button" class="myBtn optionBtn" onclick="submitCheck('user')" disabled>회원정보 수정</button>
	        </div>
        </div>
      </div>
    </div>
</main>
<!-- Footer-->
<jsp:include page="/include/footer.jsp" />
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<!-- <script src="js/scripts.js"></script> -->
<script>
  // Enable buttons after password is verified
  function checkPassword() {
    const password = document.getElementById('password').value;
    password = 'correct_password';
    // Simulating password check
    if (password === 'correct_password') { // Replace with actual check
      pwdCheckSw = 1;
      alert('비밀번호가 확인되었습니다.');
      document.querySelectorAll('.optionBtn').forEach(button => button.disabled = false);
    } else {
      alert('비밀번호가 일치하지 않습니다.');
      document.getElementById('password').focus();
    }
  }
</script>
</body>
</html>
