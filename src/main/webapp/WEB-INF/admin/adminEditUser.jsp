<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User</title>
    <%@ include file="/include/bs4.jsp" %>
		<link href="${ctp}/css/styles.css" rel="stylesheet" />
		<link href="${ctp}/css/admin.css" rel="stylesheet" />
</head>
<body>
    <jsp:include page="/include/nav.jsp" />
    <div class="container">
        <h1>Edit User</h1>
        <form action="${pageContext.request.contextPath}/adminUpdateUser.chat" method="post">
            <input type="hidden" name="id" value="${user.id}" />
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="${user.name}" required />
            </div>
            <div class="form-group">
                <label for="country">Country:</label>
                <input type="text" id="country" name="country" value="${user.country}" required />
            </div>
            <div class="form-group">
                <label for="city">City:</label>
                <input type="text" id="city" name="city" value="${user.city}" required />
            </div>
            <div class="form-group">
                <label for="nativeLanguage">Native Language:</label>
                <input type="text" id="nativeLanguage" name="nativeLanguage" value="${user.nativeLanguage}" required />
            </div>
            <div class="form-group">
                <label for="practicingLanguage">Practicing Language:</label>
                <input type="text" id="practicingLanguage" name="practicingLanguage" value="${user.practicingLanguage}" required />
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" required>${user.description}</textarea>
            </div>
            <button type="submit">Update</button>
        </form>
    </div>
<!-- Footer-->
  <jsp:include page="/include/footer.jsp" />
  <!-- Bootstrap core JS-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
