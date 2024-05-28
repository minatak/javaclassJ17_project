<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Report Management</title>
    <%@ include file="/include/bs4.jsp" %>
	<link href="${ctp}/css/styles.css" rel="stylesheet" />
	<link href="${ctp}/css/admin.css" rel="stylesheet" />
</head>
<body>
    <jsp:include page="/include/nav.jsp" />
    <div class="container">
        <h1>Report Management</h1>
        <table class="admin-table">
            <thead>
                <tr>
                    <th>Report ID</th>
                    <th>Reporter</th>
                    <th>Reported User</th>
                    <th>Reason</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="report" items="${reports}">
                    <tr>
                        <td>${report.id}</td>
                        <td>${report.reporter}</td>
                        <td>${report.reportedUser}</td>
                        <td>${report.reason}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/adminResolveReport.chat?id=${report.id}">Resolve</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
<!-- Footer-->
  <jsp:include page="/include/footer.jsp" />
  <!-- Bootstrap core JS-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
