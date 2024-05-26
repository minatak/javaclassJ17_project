<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/admin/admin.css" rel="stylesheet" />
</head>
    <jsp:include page="/include/nav.jsp" />
<body>
    <div class="container">
        <h1>Admin Dashboard</h1>
        <div class="admin-section">
            <h2>User Management</h2>
            <a href="${pageContext.request.contextPath}/AdminUserManagement.ad">회원 관리</a>
        </div>
        <div class="admin-section">
            <h2>Report Management</h2>
            <a href="${pageContext.request.contextPath}/AdminReports.ad">신고 관리</a>
        </div>
    </div>
</body>
</html>
