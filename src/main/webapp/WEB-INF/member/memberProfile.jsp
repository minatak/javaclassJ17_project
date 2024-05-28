<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${vo.name}의 프로필</title>
  <%@ include file="/include/bs4.jsp" %>
  <link href="${ctp}/css/styles.css" rel="stylesheet" />
  <link href="${ctp}/css/main.css?after" rel="stylesheet" />
  <style>
    .container {
      max-width: 900px;
      margin: 0 auto;
      padding: 20px;
      font-family: 'NEXON Lv1 Gothic OTF';
      color: #5e503f;
    }
    h1 {
      color: #35ae5f;
  		font-family: 'CWDangamAsac-Bold';
      text-align: center;
      padding: 30px;
    }
    .profile-card {
      display: flex;
      flex-direction: column;
     /*  border: 1px solid #fdfad1;
      border-radius: 8px; */
      padding: 20px;
      background-color: #fff;
    /*   box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); */
      position: relative;
    }
    .profile-photo {
      width: 125px;
      height: 125px;
      border-radius: 50%;
      object-fit: cover;
      margin: 0 auto 20px;
      border: 1px solid #ddd;
    }
    .profile-info {
      flex: 1;
      padding: 0 20px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 20px;
    }
    th, td {
      padding: 10px;
      text-align: left;
      border-bottom: 1px solid #e0dac3;
    }
    th {
      width: 30%;
      background-color: #f9f9f9;
    }
    .description {
      margin-top: 20px;
    }
    .description h3 {
      margin-bottom: 10px;
    }
    .description p {
      margin-bottom: 10px;
     /*  line-height: 1.6; */
     margin:10px;
    }
    .translate-button-container {
      position: absolute;
      bottom: -50px;
      right: 20px;
    }
    .translate-button-container button {
      padding: 10px 20px;
      border: none;
      background-color: #007bff;
      color: white;
      border-radius: 4px;
      cursor: pointer;
    }
    .message-section {
      margin-top: 60px; /* 공간을 더 주었습니다 */
      text-align: center;
    }
    .message-section button {
      padding: 10px 20px;
      border: none;
      background-color: #28a745;
      color: white;
      background-color: #39b766;
      cursor: pointer;
    }
    .highlight {
      background-color: #fdfad1;
      /* color: green; */
      padding: 2px 4px;
    }
  </style>
</head>
  <jsp:include page="/include/nav.jsp" />
<body>
  <div class="container">
    <h1><span class="highlight">${vo.nickName}</span>님의 프로필</h1>
    <div class="profile-card">
      <img src="${ctp}/images/member/${vo.photo}" alt="Profile Photo" class="profile-photo" />
      <div class="profile-info mt-2">
        <table>
           <tr>
            <th><span class="highlight">이름</span></th>
            <td>${vo.name}</td>
          </tr>
          <tr>
            <th><span class="highlight">도시</span></th>
            <td>${vo.city}</td>
          </tr>
          <tr>
            <th><span class="highlight">본국</span></th>
            <td>${vo.country}</td>
          </tr>
          <tr>
            <th><span class="highlight">현재 국가</span></th>
            <td>${vo.country}</td>
          </tr>
          <tr>
            <th><span class="highlight">연령</span></th>
            <td>${age}</td>
          </tr>
          <tr>
            <th><span class="highlight">성별</span></th>
            <td>${vo.gender}</td>
          </tr>
          <tr>
            <th><span class="highlight">모국어</span></th>
            <td>${vo.nativeLanguage}</td>
          </tr>
          <tr>
            <th><span class="highlight">학습할 언어</span></th>
            <td>${vo.learningLanguage}</td>
          </tr>
        </table>
        <div class="description">
          <h4>설명</h4>
          <p>${vo.content}</p>
        </div>
      </div>
      <div class="translate-button-container">
        <button id="translateBtn">번역하기</button>
      </div>
    </div>
    <div class="message-section mb-5">
      <button onclick="location.href='${ctp}/ChatList.chat?receiveId=${vo.mid}'">메세지 보내기</button>
      <button onclick="location.href='${ctp}/MemberList.mem'">돌아가기</button>
    </div>
  </div>
  <jsp:include page="/include/footer.jsp" />
  <!-- Bootstrap core JS-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
