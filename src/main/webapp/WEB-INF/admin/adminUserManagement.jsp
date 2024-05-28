<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin User Management</title>
        <%@ include file="/include/bs4.jsp" %>
	<link href="${ctp}/css/styles.css" rel="stylesheet" />
	<link href="${ctp}/css/admin.css" rel="stylesheet" />
</head>
<body>
    <jsp:include page="/include/nav.jsp" />
    <div class="container">
        <h1>User Management</h1>
        <table class="admin-table">
            <thead>
                <tr>
                    <th>Photo</th>
                    <th>Name</th>
                    <th>Country</th>
                    <th>City</th>
                    <th>Native Language</th>
                    <th>Practicing Language</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="vo" items="${vos}">
                    <tr>
                        <td><img src="${vo.photo}" alt="Profile Photo" class="admin-profile-photo" /></td>
                        <td>${vo.name}</td>
                        <td>${vo.country}</td>
                        <td>${vo.city}</td>
                        <td>${vo.nativeLanguage}</td>
                        <td>${vo.practicingLanguage}</td>
                        <td>${vo.content}</td>
                        <td>
                            <a href="${ctp}/adminEditUser.chat?id=${vo.id}">Edit</a>
                            <a href="${ctp}/adminDeleteUser.chat?id=${vo.id}" onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>
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
