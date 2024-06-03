<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>단어장</title>
    <%@ include file="/include/bs4.jsp" %>
    <link href="css/styles.css" rel="stylesheet" />
    <style>
    		@font-face {
		      font-family: 'CWDangamAsac-Bold';
		      src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/CWDangamAsac-Bold.woff') format('woff');
		      font-weight: normal;
		      font-style: normal;
		    }
		    @font-face {
		      font-family: 'Cafe24SsurroundAir';
		      src: url('https://gcore.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
		      font-weight: normal;
		      font-style: normal;
		    }
        body {
            font-family: 'NEXON Lv1 Gothic OTF';
        }
        .dashboard-header {
            text-align: center;
            margin-bottom: 30px;
        }
        h1 {
            font-family: 'CWDangamAsac-Bold';
            color: #35ae5f;
        }
        .card {
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #fefefe;
        }
        .card h3 {
            font-family: 'CWDangamAsac-Bold';
            color: #36b574;
            margin-bottom: 20px;
        }
        .word-list li {
            margin-bottom: 10px;
            color: #6f5340;
        }
        .btn {
            padding: 10px 15px;
            background-color: #35ae5f;
            color: #fff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
        }
        .btn:hover {
            background-color: #379866;
        }
    </style>
 </head>
  <jsp:include page="/include/nav.jsp" />
  <body>
    <main class="container">
     <p><br/></p>
    <div class="dashboard-header">
        <h1>단 어 장</h1>
    </div>

    <!-- <div class="card">
        <h3>새 단어장 만들기</h3>
        <form action="VocaInput.st" method="GET">
            <button class="btn" type="submit">단어장 만들기</button>
        </form>
    </div> -->

    <div class="card">
       <a class="newVocaBtn" href="VocaInput.st">새 단어장 만들기</a>
       <h3>기존 단어장</h3>
      <c:forEach var="vo" items="${vos}" varStatus="st">
        <div class="form-group">
            <label for="category">${vo.category}</label>
        </div>
      </c:forEach>
    </div>
     <p><br/></p>
 </main>
    <!-- Footer-->
    <jsp:include page="/include/footer.jsp" />
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>


