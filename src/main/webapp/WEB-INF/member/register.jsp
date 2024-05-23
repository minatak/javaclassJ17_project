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
    .form-group input[type="date"],
    .form-group select {
      width: 100%;
      padding: 10px;
      border: 1px solid #ddd;
      background: #fefefe;
      font-size: 16px;
    }
    
    input,
    select {
        color: #6f5340;
    }
    
    .form-group input:focus,
    .form-group select:focus {
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
</style>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/include/nav.jsp" />
    <div class="container mt-5 mb-5">
      <div class="register-container">
        <h1>회원가입</h1>
        <form name="registerForm" method="post" action="${ctp}/MemberJoinOk.mem">
          <div class="form-group">
            <label for="mid">아이디</label>
            <input type="text" id="mid" name="mid" placeholder="아이디를 입력하세요" required>
            <button type="button" class="myBtn" onclick="checkDuplicateId()">중복 확인</button>
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
            <label for="country">거주하는 나라</label>
            <select id="country" name="country" required>
              <option value="">선택하세요</option>
              <!-- 나라 목록은 필요에 따라 추가하세요 -->
              <option value="korea">한국</option>
              <option value="usa">미국</option>
              <!-- ... -->
            </select>
          </div>
          <div class="form-group">
            <label for="city">도시</label>
            <select id="city" name="city">
              <option value="">선택하세요</option>
              <!-- 도시 목록은 필요에 따라 추가하세요 -->
              <option value="seoul">서울</option>
              <option value="busan">부산</option>
              <!-- ... -->
            </select>
          </div>
          <div class="form-group">
            <label for="nativeLanguage">모국어</label>
            <select id="nativeLanguage" name="nativeLanguage" required>
              <option value="">선택하세요</option>
              <option value="korean">한국어</option>
              <option value="english">영어</option>
              <option value="spanish">스페인어</option>
              <option value="french">프랑스어</option>
              <option value="japanese">일본어</option>
              <option value="german">독일어</option>
              <option value="chinese">중국어</option>
              <option value="russian">러시아어</option>
            </select>
          </div>
          <div class="form-group">
            <label for="learningLanguage">학습할 언어</label>
            <select id="learningLanguage" name="learningLanguage" required>
              <option value="">선택하세요</option>
              <option value="korean">한국어</option>
              <option value="english">영어</option>
              <option value="spanish">스페인어</option>
              <option value="french">프랑스어</option>
              <option value="japanese">일본어</option>
              <option value="german">독일어</option>
              <option value="chinese">중국어</option>
              <option value="russian">러시아어</option>
            </select>
          </div>
          <div class="form-group">
            <label for="learningLevel">학습할 언어의 수준</label>
            <select id="learningLevel" name="learningLevel" required>
              <option value="">선택하세요</option>
              <option value="beginner">초급</option>
              <option value="intermediate">중급</option>
              <option value="advanced">고급</option>
            </select>
          </div>
          <div class="form-group">
            <label for="learningGoal">학습 목표</label>
            <input type="text" id="learningGoal" name="learningGoal" placeholder="학습 목표를 입력하세요" required>
          </div>
          <div class="form-group">
            <label for="profilePicture">프로필 사진</label>
            <input type="file" id="profilePicture" name="profilePicture">
          </div>
          <div class="form-group">
            <label for="bio">설명, 자기소개</label>
            <textarea id="bio" name="bio" rows="4" placeholder="자기소개를 입력하세요"></textarea>
          </div>
          <div class="form-group">
            <input type="submit" value="회원가입" class="myBtn">
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
