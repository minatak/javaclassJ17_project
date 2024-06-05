<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ page isErrorPage="true" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>서버 내부 오류</title>
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
            max-width: 800px;
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
        <h1>500</h1>
        <p><b>죄송합니다. 서버 내부 오류로 인해 요청하신 페이지를 표시할 수 없습니다.</b></p>
        <p>잠시 후 다시 시도하시거나<br/>문제가 계속될 경우 관리자에게 문의하십시오.</p>
        <div class="buttons">
            <a href="Main.com">메인으로</a>
            <a href="javascript:history.back()">이전으로</a>
        </div>
    </div>
</body>
</html>
