<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ page isErrorPage="true" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>페이지를 찾을 수 없습니다</title>
  <%@ include file = "/include/bs4.jsp" %>
   <style>
        @font-face {
            font-family: 'CWDangamAsac-Bold';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/CWDangamAsac-Bold.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        @font-face {
				    font-family: 'NEXON Lv1 Gothic OTF';
				    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
				    font-weight: normal;
				    font-style: normal;
				}
        @font-face {
            font-family: 'NEXON Lv1 Gothic OTF';
            src: url('https://cdn.jsdelivr.net/gh/webfontworld/nexonlv1gothic/NEXONLv1Gothic-OTF.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        body {
            background-color: #fdfad1;
            color: #39b766;
            font-family: 'NEXON Lv1 Gothic OTF';
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }

        .container {
            max-width: 600px;
            padding: 20px;
        }

        h1 {
            font-family: 'CWDangamAsac-Bold', sans-serif;
            font-size: 120px;
            color: #39b766;
            margin: 0;
        }

        p {
        font-family: 'NEXON Lv1 Gothic OTF';
            font-size: 18px;
            color: #39b766;
            margin: 10px 0;
        }

        .buttons {
            margin-top: 20px;
        }

        .buttons a {
            display: inline-block;
            margin: 0 10px;
            padding: 10px 20px;
            font-size: 18px;
            color: #fff;
            background-color: #39b766;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .buttons a:hover {
            background-color: #2e9951;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>404</h1>
        <p><b>죄송합니다. 현재 찾을 수 없는 페이지를 요청하셨습니다.</b></p>
        <p>페이지의 주소가 잘못 입력되었거나, 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.</p>
        <div class="buttons">
            <a href="Main.com">메인으로</a>
            <a href="javascript:history.back()">이전으로</a>
        </div>
    </div>
</body>
</html>
