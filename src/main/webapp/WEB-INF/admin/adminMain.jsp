<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
     <%@ include file="/include/bs4.jsp" %>
	<link href="${ctp}/css/styles.css" rel="stylesheet" />
	<link href="${ctp}/css/admin.css" rel="stylesheet" />
</head>
    <jsp:include page="/include/nav.jsp" />
<body>
    <div class="container">
        <h1>Admin Dashboard</h1>
        <div>
				  <p>신고회원 (최근1주일) : ?건</p>
				  <p>신규등록회원 : <a href="MemberList.ad?level=1"><b>${mCount}</b></a>건</p>
				  <p>탈퇴신청회원 : <a href=""><b>${m99Count}</b></a>건</p>
        </div>
        <div class="admin-section">
            <h2>User Management</h2>
            <a href="${ctp}/AdminUserManagement.ad">회원 관리</a>
        </div>
        <div class="admin-section">
            <h2>Report Management</h2>
            <a href="${ctp}/AdminReports.ad">신고 관리</a>
        </div>
    </div>
 <!-- Footer-->
  <jsp:include page="/include/footer.jsp" />
  <!-- Bootstrap core JS-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
