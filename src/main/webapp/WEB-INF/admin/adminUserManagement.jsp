<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin User Management</title>
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/admin/admin.css" rel="stylesheet" />
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
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td><img src="${user.photo}" alt="Profile Photo" class="admin-profile-photo" /></td>
                        <td>${user.name}</td>
                        <td>${user.country}</td>
                        <td>${user.city}</td>
                        <td>${user.nativeLanguage}</td>
                        <td>${user.practicingLanguage}</td>
                        <td>${user.description}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/adminEditUser.chat?id=${user.id}">Edit</a>
                            <a href="${pageContext.request.contextPath}/adminDeleteUser.chat?id=${user.id}" onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
