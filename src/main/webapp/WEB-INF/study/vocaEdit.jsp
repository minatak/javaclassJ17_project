<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>단어 수정 페이지</title>
    <%@ include file="/include/bs4.jsp" %>
    <link href="css/styles.css" rel="stylesheet" />
</head>
  <jsp:include page="/include/nav.jsp" />
  <body>
    <main class="container">
    <h1>단어 수정 페이지</h1>

    <form action="updateVocab.do" method="POST">
        <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
       <%--  
        <label>단어장 이름(카테고리):</label>
        <input type="text" name="vocabName" value="<%= vocabName %>" required>
        <br>

        <label>단어:</label>
        <input type="text" name="word" value="<%= word %>" required>
        <br>

        <label>뜻:</label>
        <input type="text" name="meaning" value="<%= meaning %>" required>
        <br>

        <label>품사:</label>
        <input type="text" name="partOfSpeech" value="<%= partOfSpeech %>">
        <br>

        <label>예문:</label>
        <input type="text" name="example" value="<%= example %>">
        <br>
 --%>
        <button type="submit">수정</button>
        <button type="button" onclick="location.href='deleteVocab.do?id=<%= request.getParameter("id") %>'">삭제</button>
    </form>
 </main>
    <!-- Footer-->
    <jsp:include page="/include/footer.jsp" />
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
  </body>
</html>
</html>
