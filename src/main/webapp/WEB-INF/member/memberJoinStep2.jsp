<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 (2/2)</title>
<%@ include file="/include/bs4.jsp" %>
<link href="css/styles.css" rel="stylesheet" />
<style>
    .join-container {
      font-family: 'NEXON Lv1 Gothic OTF';
      background-color: #fefefe;
      font-size: 14px;
    }
    
    .register-container {
      background-color: #fefefe;
      padding: 30px;
      max-width: 750px;
      text-align: center;
      margin: 20px auto;
    }
    
    .register-container h1 {
      color: #35ae5f;
      font-family: 'CWDangamAsac-Bold';
    }
    
    .form-group {
      margin-bottom: 15px;
      text-align: left;
    }
    
    .form-group label {
      margin-bottom: 5px;
      color: #35ae5f;
      font-size: 14px;
    }
    
    .form-group input[type="text"],
    .form-group input[type="file"],
    .form-group select,
    .form-group textarea {
      width: 100%;
      padding: 10px;
      border: 1px solid #ddd;
      background: #fefefe;
      font-size: 14px;
    }
    
    input,
    select,
    textarea {
      color: #6f5340;
    }
    
    .form-group input:focus,
    .form-group select:focus,
    .form-group textarea:focus {
      border-color: #35ae5f;
      outline: none;
      background: #fff;
    }

    .myBtn {
      border: 1.2px solid #39b766;
      color: #fefefe;
      background-color: #35ae5f;
      padding: 10px 20px;
      width: 100%;
      font-size: 14px;
      margin-bottom: 10px;
    }

    .myBtn:hover,
    .myBtn:active {
      background-color: #39b766;
    }

    .step {
      background-color: #c7e9c6;
      border-radius: 50px;
      color: #35ae5f;
      padding: 10px;
      font-family: 'Cafe24SsurroundAir';
    }
    .proceedingStep {
      background-color: #90bc8e;
      color: #ffffff;
    }
    
    @font-face {
      font-family: 'CWDangamAsac-Bold';
      src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/CWDangamAsac-Bold.woff') format('woff');
      font-weight: normal;
      font-style: normal;
    }
    
    @font-face {
      font-family: 'Cafe24SsurroundAir';
      src: url('https://gcore.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
      font-weight: normal;
      font-style: normal;
    }
</style>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/include/nav.jsp" />
    <div class="container join-container mt-5 mb-5">
      <div class="register-container">
        <h1>회원가입</h1>
        
        <div class="row gx-5 row-cols-2 row-cols-lg-3 py-5" style="color: #6f5340;">
          <div class="col">
            <p class="text-muted mb-0">step 1</p>
            <div class="step"><i class="fa-solid fa-user"></i></div>
            <div class="m-2">회원 정보 입력</div>
          </div>
          <div class="col">
            <p class="text-muted mb-0">step 2</p>
            <div class="proceedingStep step"><i class="fa-solid fa-earth-americas"></i></div>
            <div class="m-2">언어 / 목표 입력</div>
          </div>
          <div class="col">
            <p class="text-muted mb-0">step 3</p>
            <div class="step"><i class="fa-solid fa-check"></i></div>
            <div class="m-2">가입완료</div>
          </div>
        </div>
        
        <form name="registerForm2" method="post" action="${ctp}/MemberJoinComplete.mem" enctype="multipart/form-data">
          <div class="form-group">
            <label for="profilePicture">프로필 사진</label>
            <input type="file" id="profilePicture" name="profilePicture">
          </div>
          <div class="form-group">
            <label for="country">거주하는 나라</label>
            <select id="country" name="country" required>
              <option value="">선택하세요</option>
              <option value="korea">한국</option>
              <option value="usa">미국</option>
              <option>기타</option>
              <!-- 추가 나라 옵션 -->
            </select>
          </div>
          <div class="form-group">
            <label for="city">도시</label>
            <select id="city" name="city">
              <option value="">선택하세요</option>
              <option value="seoul">서울</option>
              <option value="busan">부산</option>
              <option>기타</option>
              <!-- 추가 도시 옵션 -->
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
              <option>기타</option>
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
            <label for="bio">자기소개</label>
            <textarea id="bio" name="bio" rows="4" placeholder="자기소개를 입력하세요"></textarea>
          </div>
          <div class="form-group text-center">
            <input type="submit" value="가입하기" class="myBtn">
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
