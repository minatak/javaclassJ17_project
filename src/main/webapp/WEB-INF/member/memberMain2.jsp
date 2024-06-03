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
    }
     main body {
        font-family: 'NEXON Lv1 Gothic OTF';
        font-size: 14px;
      }
      main .dashboard-header {
        text-align: center;
        margin-bottom: 30px;
      }
      main h1 {
        font-family: 'CWDangamAsac-Bold';
        color: #35ae5f;
      }
      main profile-card {
      	display: flex;
        justify-content: center;
        text-align: center;
        margin-bottom: 20px;
      }
      
      main .profile-card,
      main .recent-activities,
      main .quick-links,
      main .notifications {
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #ddd; 
        border-radius: 8px;
        background-color: #fefefe;
      }
      main h3 {
        font-family: 'CWDangamAsac-Bold';
        color: #36b574;
        margin-bottom: 20px;
      }
      main .profile-card img {
        border-radius: 50%;
        width: 100px;
        height: 100px;
        margin-bottom: 20px;
      }
      main .profile-info p {
        margin: 5px 0;
        color: #6f5340;
      }
      main .recent-activities ul,
      main .quick-links ul,
      main .notifications ul {
        list-style: none;
        padding: 0;
      }
     	main li {
        margin-bottom: 10px;
        color: #6f5340;
      }
      main .quick-links a {
        color: #35ae5f;
      }
      .quick-links a:hover {
        color: #379866;
        text-decoration: none;
      } 
    </style>
  </head>
  <jsp:include page="/include/nav.jsp" />
  <body>
    <main class="container">
    <p><br/></p>
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
          <div class="language-exchange">
            <h3>언어 교환</h3>
            <ul>
              <li>언어 교환 파트너 찾기: <a href="MemberList.mem">파트너 검색</a></li>
              <li>언어 교환 일정 확인: <a href="Schedule.lang">일정 보기</a></li>
              <li>언어 학습 자료: <a href="VocaMain.st">자료 보기</a></li>
            </ul>
          </div>
          <div class="quick-links">
            <h3>알림</h3>
            <ul>
              <li>새로운 메시지가 도착했습니다: <a href="ChatMain.chat">받은 메시지함</a></li>
            </ul>
          </div>
        </div>
      </div>
      <p><br/></p>
    </main>
    <!-- Footer-->
    <jsp:include page="/include/footer.jsp" />
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
