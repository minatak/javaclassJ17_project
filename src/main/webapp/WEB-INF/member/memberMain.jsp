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
        font-family: 'NEXON Lv1 Gothic OTF';
        background-color: #f3f4f6;
        font-size: 14px;
      }
      .dashboard-header {
        text-align: center;
        margin-bottom: 30px;
      }
      h1 {
        font-family: 'CWDangamAsac-Bold';
        color: #35ae5f;
      }
      profile-card {
      	display: flex;
        justify-content: center;
        text-align: center;
        margin-bottom: 20px;
      }
      
      .profile-card,
      .recent-activities,
      .quick-links,
      .notifications {
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #ddd; 
        border-radius: 8px;
        background-color: #fefefe;
      }
      .profile-card h3,
      .recent-activities h3,
      .quick-links h3,
      .notifications h3 {
        font-family: 'CWDangamAsac-Bold';
        color: #36b574;
        margin-bottom: 20px;
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
      .recent-activities ul,
      .quick-links ul,
      .notifications ul {
        list-style: none;
        padding: 0;
      }
      .recent-activities li,
      .quick-links li,
      .notifications li {
        margin-bottom: 10px;
        color: #6f5340;
      }
      .quick-links a {
        color: #35ae5f;
      }
      /* .quick-links a:hover {
        color: #379866;
        text-decoration: none;
      } */
    </style>
  </head>
  <jsp:include page="/include/nav.jsp" />
  <body>
    <main class="container">
      <div class="dashboard-header mt-5">
        <h1>Dashboard</h1>
      </div>
      <div class="row">
        <div class="col-md-4">
          <div class="profile-card" style="text-align:center;">
            <h3>프로필 정보</h3>
            <img src="${ctp}/images/member/${vo.photo}">
            <div class="profile-info">
              <p>이름 : ${vo.name}</p>
              <p>이메일 : ${vo.email}</p>
              <p>성별 : ${vo.gender}</p>
              <p>생년월일 : ${fn:substring(vo.birthday,0,10)}</p>
            </div>
          </div>
        </div>
        <div class="col-md-8">
          <div class="recent-activities">
            <h3>최근 활동</h3>
            <ul>
              <li>2024-05-01: 새로운 게시물을 작성했습니다.</li>
              <li>2024-04-28: 댓글을 남겼습니다.</li>
              <li>2024-04-25: 프로필 정보를 업데이트했습니다.</li>
            </ul>
          </div>
          <div class="quick-links">
            <h3>빠른 링크</h3>
            <ul>
              <li><a href="#">내 프로필 편집</a></li>
              <li><a href="#">새 게시물 작성</a></li>
              <li><a href="#">메시지 확인</a></li>
              <li><a href="#">설정</a></li>
            </ul>
          </div>
          <div class="notifications">
            <h3>알림</h3>
            <ul>
              <li>새로운 친구 요청: <a href="#">김철수</a></li>
              <li>새로운 메시지가 도착했습니다: <a href="#">받은 메시지함</a></li>
              <li>사이트 업데이트 알림: <a href="#">업데이트 내용 확인</a></li>
            </ul>
          </div>
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
