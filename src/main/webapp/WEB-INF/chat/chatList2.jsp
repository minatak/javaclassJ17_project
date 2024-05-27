<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채팅 목록</title>
    <%@ include file="/include/bs4.jsp" %>
    <link href="css/styles.css" rel="stylesheet" />
    <link href="${ctp}/css/chat.css" rel="stylesheet" />
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/include/nav.jsp" />
    <div class="container chat-container mt-5 mb-5">
        <h1>채팅 목록</h1>
        <c:forEach var="chat" items="${chatList}">
            <div class="message-item">
                <p><a href="${ctp}/chatDetail.mem?chatId=${chat.id}">${chat.title}</a></p>
                <p class="text-muted">${chat.lastMessage}</p>
            </div>
        </c:forEach>
    </div>
</main>
<jsp:include page="/include/footer.jsp" />
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>
