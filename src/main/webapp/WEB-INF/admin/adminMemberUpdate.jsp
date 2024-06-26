<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
    <%@ include file="/include/bs4.jsp" %>
		<link href="${ctp}/css/styles.css" rel="stylesheet" />
		<link href="${ctp}/css/admin.css" rel="stylesheet" />
</head>
<body>
    <jsp:include page="/include/nav.jsp" />
    <div class="container">
        <h1>회원 정보 수정</h1>
        <form action="AdminMemberUpdate.ad" method="post">
            <input type="hidden" name="mid" value="${vo.mid}" />
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="${vo.name}" required />
            </div>
            <div class="form-group">
                <label for="country">Country:</label>
                <input type="text" id="country" name="country" value="${vo.country}" required />
            </div>
            <div class="form-group">
                <label for="city">City:</label>
                <input type="text" id="city" name="city" value="${vo.city}" required />
            </div>
            <div class="form-group">
                <label for="nativeLanguage">Native Language:</label>
                <input type="text" id="nativeLanguage" name="nativeLanguage" value="${vo.nativeLanguage}" required />
            </div>
            <div class="form-group">
                <label for="practicingLanguage">Learning Language:</label>
                <input type="text" id="practicingLanguage" name="learningLanguage" value="${vo.learningLanguage}" required />
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
            </div>
            <button type="submit">수정하기</button>
        </form>
    </div>
<!-- Footer-->
  <jsp:include page="/include/footer.jsp" />
  <!-- Bootstrap core JS-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
