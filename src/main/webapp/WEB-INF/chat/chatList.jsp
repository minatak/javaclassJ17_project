<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메시지 목록</title>
    <%@ include file="/include/bs4.jsp" %>
    <link href="${ctp}/css/styles.css" rel="stylesheet" />
    <link href="${ctp}/css/join.css" rel="stylesheet" />
    <style>
        @charset "UTF-8";

        body {
            font-family: 'NEXON Lv1 Gothic OTF', sans-serif;
            background-color: #fefefe;
            font-size: 14px;
        }

        .message-container {
            max-width: 750px;
            background: #fefefe;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
        }

        .message-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .message-header h1 {
            color: #35ae5f;
            font-family: 'CWDangamAsac-Bold';
        }

        .message-list {
            list-style: none;
            padding: 0;
        }

        .message-item {
            display: flex;
            align-items: center;
            background: #f9f9f9;
            margin-bottom: 10px;
            padding: 15px;
            border-radius: 8px;
            border: 1px solid #ddd;
        }

        .message-item img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 15px;
        }

        .message-item .message-info {
            flex-grow: 1;
        }

        .message-item .message-info .sender-name {
            font-weight: bold;
            font-size: 16px;
            margin-bottom: 5px;
            color: #35ae5f;
        }

        .message-item .message-info .message-preview {
            color: #6f5340;
            font-size: 14px;
        }

        .message-item .message-info .message-time {
            color: #aaa;
            font-size: 12px;
        }

        .myBtn {
            border: 1.2px solid #39b766;
            color: #fefefe;
            background-color: #35ae5f;
            padding: 10px 20px;
            font-size: 14px;
            margin: 10px;
            display: inline-block;
            text-decoration: none;
            cursor: pointer;
        }

        .myBtn:hover,
        .myBtn:active {
            background-color: #39b766;
        }

        a:hover,
        a:focus,
        a:active,
        a:visited {
            color: #fefefe;
            text-decoration: none;
        }

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
    </style>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/include/nav.jsp" />
    <div class="container message-container mt-5 mb-5">
        <div class="message-header">
            <h1>메시지 목록</h1>
        </div>
        <ul class="message-list">
            <c:forEach var="message" items="${messages}">
                <li class="message-item">
                    <img src="${ctp}/images/${message.senderProfileImage}" alt="Sender Image" />
                    <div class="message-info">
                        <div class="sender-name">${message.senderName}</div>
                        <div class="message-preview">${message.preview}</div>
                        <div class="message-time">${message.time}</div>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
</main>
<jsp:include page="/include/footer.jsp" />
<script src="${ctp}/js/scripts.js"></script>
</body>
</html>
