<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 메인</title>
    <%@ include file="/include/bs4.jsp" %>
    <link href="${ctp}/css/styles.css" rel="stylesheet" />
    <link href="${ctp}/css/admin.css?after1" rel="stylesheet" />
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
          /*   margin-bottom: 30px; */
        }
        main h1 {
            font-family: 'CWDangamAsac-Bold';
            color: #35ae5f;
        }
        main .admin-section,
        main .report-section {
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #fefefe;
            text-align: center;
        }
         h2 {
            font-family: 'CWDangamAsac-Bold';
            color: #36b574;
            margin-bottom: 20px;
            font-size: 1.7rem; /* 모든 h2 태그의 글씨 크기를 동일하게 설정 */
        }
        main .quick-links a {
          padding: 7px 16px;
		      border: none;
		      background-color: #fdfad1;
		      font-size: 14px; 
		      color: #5e503f; /* 색상 앞에 # 추가 */
		      border: 1px solid #d0c2b0;
		      border-radius: 10px; 
		      cursor: pointer;
		      transition: background-color 0.3s, color 0.3s;
		      text-decoration: none;
		      display: flex;
          justify-content:center;
        }
        .quick-links a:hover {
            background-color: #d7d1b9;
      			color: #322d27;
            text-decoration: none;
        }
        .quick-links {
            list-style: none;
            padding: 0;
        }
        .quick-links li {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
  <jsp:include page="/include/nav.jsp" />
  <main class="container">
    <div class="dashboard-header">
      <h1>Admin Dashboard</h1>
    </div>
    <div class="row justify-content-center">
    <div class="col-md-8">
      <div class="admin-section">
        <h2>회원관리</h2>
        <div>
          <p>최근 일주일 내 신고회원 : <b>${rCount}</b>건</p>
          <p>신규 등록회원 : <b>${mCount}</b>건</p>
          <p>탈퇴 신청회원 : <b>${m99Count}</b>건</p>
        </div>
      </div>
      </div>
      <div class="col-md-8">
        <div class="report-section">
          <h2>바로가기</h2>
          <div class="quick-links col-span-2">
            <p><a href="AdminMemberList.ad">회원 관리</a></p>
            <p><a href="AdminReports.ad">신고 관리</a></p>
          </div>
        </div>
      </div>
    </div>
  </main>
  <jsp:include page="/include/footer.jsp" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
