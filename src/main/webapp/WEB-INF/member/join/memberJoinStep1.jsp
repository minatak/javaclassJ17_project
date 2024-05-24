<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원가입</title>
	<%@ include file = "/include/bs4.jsp" %>
	<script>
		'use strict';
		
		let idCheckSw = 0;
		let nickCheckSw = 0;
		
		function fCheck() {
			// 유효성 검사 하기
			
			
			
		}
		
		
		
	</script>
<link href="css/styles.css" rel="stylesheet" />
<link href="${ctp}/css/join.css" rel="stylesheet" />
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/include/nav.jsp" />
    <div class="container join-container mt-5 mb-5">
      <div class="register-container">
        <h1 style="font-family: 'CWDangamAsac-Bold';">회원가입</h1>
        
        <div class="row gx-5 row-cols-2 row-cols-lg-3 py-5" style="color: #6f5340;">
	        <div class="col">
         		<p class="text-muted mb-0">step 1</p>
            <div class="proceedingStep step"><i class="fa-solid fa-user"></i></div>
            <div class="m-2">회원 정보 입력</div>
	        </div>
	        <div class="col">
         		<p class="text-muted mb-0">step 2</p>
            <div class="step"><i class="fa-solid fa-earth-americas"></i></div>
            <div class="m-2">언어 / 목표 입력</div>
	        </div>
	        <div class="col">
         		<p class="text-muted mb-0">step 3</p>
            <div class="step"><i class="fa-solid fa-check"></i></div>
            <div class="m-2">가입완료</div>
	        </div>
        </div>
        
        <form name="registerForm1" method="post" action="${ctp}/MemberJoinStep2.mem">
          <div class="form-group ">
            	<label for="mid">ID *&nbsp; &nbsp;<input type="button" value="아이디 중복체크" id="midBtn" class="btn checkBtn" onclick="idCheck()"/></label>
	            <input type="text" id="mid" name="mid" placeholder="아이디를 입력하세요" required>
          </div>
          <div class="form-group">
            <label for="name">Name *</label>
            <input type="text" id="name" name="name" placeholder="이름을 입력하세요" required>
          </div>
          <div class="form-group">
          	<label for="nickName">Nickname *&nbsp; &nbsp;<input type="button" value="닉네임 중복체크" id="midBtn" class="checkBtn" onclick="idCheck()"/></label>
            <input type="text" id="nickName" name="nickName" placeholder="닉네임을 입력하세요" required>
          </div>
          <div class="form-group">
            <label for="password">Password *</label>
            <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" required>
          </div>
          <div class="form-group">
            <label for="email">Email *</label>
            <input type="email" id="email" name="email" placeholder="이메일을 입력하세요" required>
          </div>
          <div class="form-group">
			      <div class="form-check-inline">
			        <label for="gender">Gender</label> &nbsp; &nbsp;
			        <label class="form-check-label">
			          <input type="radio" style="color: #6f5340;" class="form-check-input" name="gender" value="남자" checked><span style="color: #6f5340;">남자</span>
			        </label>
			      </div>
			      <div class="form-check-inline">
			        <label class="form-check-label">
			          <input type="radio" class="form-check-input" name="gender" value="여자"><span style="color: #6f5340;">여자</span>
			        </label>
			      </div>
			    </div>
          
          <div class="form-group">
            <label for="birthday">Birthday *</label>
            <input type="date" id="birthday" name="birthday" class="mb-2" required>
          </div>
			    <div class="form-group">
			      <div class="form-check-inline">
			        <label for="gender">Information *</label> &nbsp; &nbsp;
			        <label class="form-check-label">
			          <input type="radio" style="color: #6f5340;" class="form-check-input" name="userInfor" value="남자" checked><span style="color: #6f5340;">공개</span>
			        </label>
			      </div>
          </div>
          <div class="form-group text-center ">
            <input type="submit" value="다음" class="myBtn">
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
