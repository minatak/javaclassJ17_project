<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 (1/2)</title>
<%@ include file = "/include/bs4.jsp" %>
<link href="css/styles.css" rel="stylesheet" />
<style>
    body {
      font-family: 'NEXON Lv1 Gothic OTF';
      background-color: #f3f4f6;
    }
    
    .register-container {
      background-color: #ffffff;
      padding: 30px;
      max-width: 400px;
      text-align: center;
      margin: 20px auto;
    }
    
    .register-container h1 {
      margin-bottom: 20px;
      color: #35ae5f;
      font-family: 'CWDangamAsac-Bold';
    }
    
    .form-group {
      margin-bottom: 15px;
      text-align: left;
    }
    
    .form-group label {
      margin-bottom: 5px;
      color: #36b574;
    }
    
    .form-group input[type="text"],
    .form-group input[type="password"],
    .form-group input[type="email"],
    .form-group input[type="date"] {
      width: 100%;
      padding: 10px;
      border: 1px solid #ddd;
      background: #fefefe;
      font-size: 16px;
    }
    
    input {
        color: #6f5340;
    }
    
    .form-group input:focus {
      border-color: #36b574;
      outline: none;
      background: #fff;
    }
    
    .myBtn {
      border: 1.2px #39b766;
      color: #fefefe;
      background-color: #35ae5f;
      padding: 10px 20px;
      width: 100%;
    }
    
    .myBtn:hover {
      background-color: #39b766;
    }
    
    a {
        color: #35ae5f;
    }
    
    a:hover,
    a:focus,
    a:active,
    a:visited {
        color: #379866;
        text-decoration: none;
    }
    
    .step {
    	background-color: #96cdaa;
    	 border-radius: 50px;
    }
    .step .proceedingStep {
    	background-color: #39b766;
    }
    
    @font-face {
		  font-family: 'CWDangamAsac-Bold';
		  src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/CWDangamAsac-Bold.woff') format('woff');
		  font-weight: normal;
		  font-style: normal;
		}
</style>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/include/nav.jsp" />
    <div class="container mt-5 mb-5">
      <div class="register-container">
        <h2 style="font-family: 'CWDangamAsac-Bold';">회원가입</h2>
        
        <div class="row gx-5 row-cols-2 row-cols-lg-3 py-5">
	        <div class="col">
         		<p class="text-muted mb-0">step 1</p>
            <div class="proceedingStep step "><i class="fa-solid fa-user"></i></div>
            <div class="h5 mb-2">정보입력</div>
	        </div>
	        <div class="col">
         		<p class="text-muted mb-0">step 2</p>
            <div class="step "><i class="fa-solid fa-earth-americas"></i></div>
            <div class="h5">언어입력</div>
	        </div>
	        <div class="col">
         		<p class="text-muted mb-0">step 3</p>
            <div class="step "><i class="fa-solid fa-check"></i></div>
            <div class="h5">가입완료</div>
	        </div>
        </div>
        
        <form name="registerForm1" method="post" action="${ctp}/MemberJoinStep2.mem">
          <div class="form-group ">
            	<label for="mid">아이디 : &nbsp; &nbsp;<input type="button" value="아이디 중복체크" id="midBtn" class="btn btn-sm" onclick="idCheck()"/></label>
	            <input type="text" id="mid" name="mid" placeholder="아이디를 입력하세요" required>
          </div>
          <div class="form-group">
            <label for="name">이름</label>
            <input type="text" id="name" name="name" placeholder="이름을 입력하세요" required>
          </div>
          <div class="form-group">
            <label for="password">비밀번호</label>
            <input type="password" id="password" name="password" placeholder="비밀번호를 입력하세요" required>
          </div>
          <div class="form-group">
            <label for="email">이메일</label>
            <input type="email" id="email" name="email" placeholder="이메일을 입력하세요" required>
          </div>
          <div class="form-group">
            <label for="gender">성별</label>
            <select id="gender" name="gender" required>
              <option value="">선택하세요</option>
              <option value="male">남성</option>
              <option value="female">여성</option>
              <option value="other">기타</option>
            </select>
          </div>
          <div class="form-group">
            <label for="birthday">생일</label>
            <input type="date" id="birthday" name="birthday" required>
          </div>
          <div class="form-group">
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
<script>
    function checkDuplicateId() {
        // 중복 확인 로직을 여기에 추가하세요
        alert('아이디 중복 확인');
    }
</script>
</body>
</html>
