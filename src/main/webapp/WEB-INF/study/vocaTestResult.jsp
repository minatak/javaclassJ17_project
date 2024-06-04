<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>단어 테스트 결과</title>
    <%@ include file="/include/bs4.jsp" %>
    <link href="${ctp}/css/styles.css" rel="stylesheet" />
    <style>
        @font-face {
            font-family: 'CWDangamAsac-Bold';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/CWDangamAsac-Bold.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        body {
            font-family: 'NEXON Lv1 Gothic OTF', sans-serif;
            background-color: #f9fafb;
            margin: 0;
            padding: 0;
        }
      /*   .con {
        
            min-height: 100vh;
        } */
        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
            /* background-color: #ffffff; */
            /* box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); */
            /* border-radius: 10px; */
        }
        h1 {
            font-family: 'CWDangamAsac-Bold';
            color: #36b574;
            text-align: center;
            margin-bottom: 40px;
        }
        p {
            font-family: 'NEXON Lv1 Gothic OTF';
            color: #333333;
            font-size: 18px;
            text-align: center;
        }
        .btn {
            display: block;
            width: 200px;
            margin: 30px auto;
            padding: 10px 20px;
            background-color: #35ae5f;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
            font-size: 16px;
            text-align: center;
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #2d8e51;
        }
    </style>
</head>
    <jsp:include page="/include/nav.jsp" />
<body>
	<div class="con">
		<p><br/></p>	<p><br/></p>
    <main class="container">
        <h1>단어 테스트 결과</h1>
        <p>맞힌 단어 수: ${score} / ${questionCnt}</p>
        <p>점수: ${score * (100 / questionCnt)}</p> <!-- 각 단어당 10점 -->
        <a href="VocaTest.st?category=${category}&wordMid=${wordMid}" class="btn">다시 테스트하기</a>
    </main>
    	<p><br/></p>	<p><br/></p>
    </div>
    <jsp:include page="/include/footer.jsp" />
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
