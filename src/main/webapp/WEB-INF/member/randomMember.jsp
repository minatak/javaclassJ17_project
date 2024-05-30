<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>랜덤 회원 추천</title>
  <%@ include file="/include/bs4.jsp" %>
  <link href="${ctp}/css/styles.css" rel="stylesheet" />
  <link href="${ctp}/css/join.css" rel="stylesheet" />
  <style>
    .container {
      max-width: 900px;
      margin: 0 auto;
      padding: 20px;
      font-family: 'NEXON Lv1 Gothic OTF';
      color: #7a6856;
    }
    .member-card {
      display: flex;
      border: 1px solid #d0c2b0;
      border-radius: 8px;
      padding: 20px;
      margin: 20px;
      background-color: #fff;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      transition: transform 0.2s;
    }
    .member-card:hover {
      transform: scale(1.02);
    }
    .profile-photo {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      margin-right: 20px;
      object-fit: cover;
    }
    .member-info p {
      margin: 5px 0;
    }
    .languages {
      display: flex;
      align-items: center;
    }
    .languages span {
      border: 1px solid #ddd;
      border-radius: 4px;
      padding: 5px;
    }
    .languages img {
      width: 30px;
      height: auto;
      border-radius: 4px;
      margin: 0 5px;
    }
    .member-info > p, .languages {
      margin-bottom: 10px;
    }
    .refresh-button {
      padding: 10px 20px;
      border: none;
      /* border-radius: 4px; */
      cursor: pointer;
      color: white;
    }
    .refresh-button {
      background-color: #35ae5f;
      display: block;
      margin: 20px auto;
    }
     h1 {
      text-align: center;
      /* margin-bottom: 30px; */
      font-family: 'CWDangamAsac-Bold';
      color: #35ae5f;
    }
     h5 {
      color: #6d5a46;
    }
    .message-button {
      padding: 7px 16px;
      border: none;
      background-color: #e0dac3;
      font-size: 14px; 
      color: #5e503f; /* 색상 앞에 # 추가 */
      border: 1px solid #d0c2b0;
      border-radius: 10px; 
      cursor: pointer;
      transition: background-color 0.3s, color 0.3s;
    }
     p img {
      width: 25px;
      height: auto; /* 원본 비율 유지 */
      /* border-radius: 4px; */
     /*  margin: 0 5px; */
    }
    .message-button:hover {
      background-color: #d7d1b9;
      color: #322d27;
    }
    .refresh-button:hover {
      background-color: #3ba661;
      color: #fefef4;
    }
    .highlight {
    	background-color: #fdfad1;
      padding: 2px 4px;
    }
    a {
    	 text-decoration: none;
    }
  </style>
</head>
<jsp:include page="/include/nav.jsp" />
<body>
  <main class="container">
    <div class="container">
      <h1>랜덤 회원 추천</h1>
      <h5 style="text-align: center;">랜덤으로 추천된 회원입니다 :)</h5>
        <div class="member-card" onclick="location.href='${ctp}/MemberProfile.mem?mid=${vo.mid}'">
          <img src="${ctp}/images/member/${vo.photo}" class="profile-photo" />
          <div class="member-info">
            <a href="${ctp}/MemberProfile.mem?mid=${vo.mid}">  
              <h5><b class="highlight">${vo.nickName}</b></h5>
            </a>
            <p><img src="${ctp}/images/flag/${vo.myFlag}">
              <c:if test="${!empty vo.city}">${vo.city}, ${vo.country}</c:if>
              <c:if test="${empty vo.city}">${vo.country}</c:if>
            </p>
            <div class="languages">
              <p>
                <span>모국어: ${vo.nativeLanguage} <img src="${ctp}/images/flag/${vo.myLangFlag}" alt="Native Language Flag" /></span>
                ↔
                <span>학습할 언어: ${vo.learningLanguage} <img src="${ctp}/images/flag/${vo.wantLangFlag}" alt="Learning Language Flag" /></span>
              </p>
            </div>
            <p>${vo.content}</p>
            <button class="message-button" onclick="location.href='${ctp}/ChatList.chat?to=${vo.mid}'">메시지 보내기</button>
          </div>
        </div>

      <button class="refresh-button" onclick="location.href='${ctp}/RandomMember.mem'">다시 뽑기</button>
    </div>
  </main>
  <p><br/></p>
  <!-- Footer-->
  <jsp:include page="/include/footer.jsp" />
  <!-- Bootstrap core JS-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
