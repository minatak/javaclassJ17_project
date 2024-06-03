<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 메인 페이지</title>
    <%@ include file="/include/bs4.jsp" %>
    <link href="css/styles.css" rel="stylesheet" />
    <link href="${ctp}/css/join.css?after" rel="stylesheet" />  
    <style>
    body {
        background-color: #f3f4f6;    
        font-family: 'NEXON Lv1 Gothic OTF';
        margin: 0;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }
    main {
        flex: 1;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    main .container {
        padding-top: 50px;
        padding-bottom: 50px;
        width: 100%;
        max-width: 1200px; /* 최대 폭을 지정하여 가로 폭을 줄임 */
    }
    main .dashboard-header {
        text-align: center;
        margin-bottom: 30px;
    }
    main h1 {
        font-family: 'CWDangamAsac-Bold';
        color: #35ae5f;
    }
    .card-container {
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 100%;
    }
    .card {
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #ddd;
        border-radius: 8px;
        background-color: #fefefe;
        width: 100%;
        max-width: 600px; /* 각 카드의 최대 폭을 지정하여 가로 폭을 줄임 */
    }
    .card h3 {
        font-family: 'CWDangamAsac-Bold';
        color: #36b574;
        margin-bottom: 20px;
    }
    .profile-card {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .profile-card img {
        border-radius: 50%;
        width: 100px;
        height: 100px;
        margin-bottom: 20px;
    }
    .profile-info p {
        margin: 5px 0;
        color: #6f5340;
    }
    .card ul {
        list-style: none;
        padding: 0;
    }
    .card li {
        margin-bottom: 10px;
        color: #6f5340;
    }
    .card a {
        color: #35ae5f;
    }
    .card a:hover {
        color: #379866;
        text-decoration: none;
    }
    </style>
  </head>
  <jsp:include page="/include/nav.jsp" />
  <body>
    <main class="container">
      <div class="dashboard-header mt-5">
        <h1>Dashboard</h1>
      </div>
      <div class="card-container">
        <div class="card profile-card">
          <!-- <h3>프로필 정보</h3> -->
          <img src="${ctp}/images/member/${vo.photo}">
          <div class="profile-info">
            <p>이름 : ${vo.name}</p>
            <p>이메일 : ${vo.email}</p>
            <p>성별 : ${vo.gender}</p>
            <p>생년월일 : ${fn:substring(vo.birthday,0,10)}</p>
          </div>
        </div>
        <div class="card language-exchange">
          <h3>언어 교환</h3>
          <ul>
            <li>언어 교환 파트너 찾기: <a href="MemberList.mem">파트너 검색</a></li>
            <li>언어 학습 자료: <a href="VocaMain.st">단어장 보기</a></li>
          </ul>
        </div>
        <div class="card notifications">
          <h3>알림</h3>
          <ul>
            <li>새로운 메시지가 도착했습니다: <a href="ChatMain.chat">받은 메시지함</a></li>
          </ul>
        </div>
      </div>
    </main>
    <jsp:include page="/include/footer.jsp" />
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
