<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 게시판</title>
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/user.css" rel="stylesheet" />
  </head>
  <jsp:include page="/include/nav.jsp" />
  <body>
    <main class="container">
	    <div class="container">
	        <h1>회원 정보 게시판</h1>
	        <c:forEach var="member" items="${members}">
	            <div class="member-card">
	                <img src="${member.photo}" alt="Profile Photo" class="profile-photo" />
	                <div class="member-info">
	                    <a href="${pageContext.request.contextPath}/MemberProfile.mem">
	                   <%--  <a href="${pageContext.request.contextPath}/memberProfile.chat?name=${member.name}"> --%>
	                        <h2>${member.name}</h2>
	                    </a>
	                    <p>${member.city}, ${member.country}</p>
	                    <p>모국어: ${member.nativeLanguage}</p>
	                    <p>학습할 언어: ${member.practicingLanguage}</p>
	                    <p>${member.description}</p>
	                </div>
	            </div>
	        </c:forEach>
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