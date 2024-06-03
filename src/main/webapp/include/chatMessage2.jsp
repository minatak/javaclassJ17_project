<%@page import="chat.ChatVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="chat.ChatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
  request.setCharacterEncoding("utf-8");
  String mid = (String) session.getAttribute("sMid");
  String receiverMid = (String) session.getAttribute("sReceiverMid");
  ChatDAO dao = new ChatDAO();
  ArrayList<ChatVO> chatVos = dao.getChatList(mid, receiverMid);
  pageContext.setAttribute("chatVos", chatVos);
%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Chat Messages</title>
  <link href="${ctp}/css/styles.css" rel="stylesheet" />
  <style>
    @charset "UTF-8";
    .chat-body {
      flex-grow: 1;
      padding: 20px;
      overflow-y: auto;
      background-color: #f5f5f5;
    }
    .message {
      display: flex;
      align-items: flex-end;
      margin-bottom: 20px;
    }
    .message.sent {
      justify-content: flex-end;
    }
    .message.received .content {
      background-color: #fff;
      border-radius: 15px;
      padding: 10px 15px;
      max-width: 60%;
      color: #000;
      font-size: 14px;
      position: relative;
    }
    .message.sent .content {
      background-color: #35ae5f;
      border-radius: 15px;
      padding: 10px 15px;
      max-width: 60%;
      color: #fff;
      font-size: 14px;
      position: relative;
    }
    .message .timestamp {
      font-size: 12px;
      color: #aaa;
      margin-top: 5px;
    }
    .message .translate-btn {
      font-size: 12px;
      color: #39b766;
      cursor: pointer;
      margin-left: 10px;
    }
    .message.sent .translate-btn {
      margin-left: 0;
      margin-right: 10px;
    }
    .message.received {
      display: flex;
      align-items: flex-start;
    }
    .content {
      margin-right: 10px;
    }
    .translate-btn {
      display: block;
      margin-top: 5px;
    }
  </style>
  <script>
    function handleTranslate(button) {
      const messageContent = button.closest('.content');
      const textToTranslate = messageContent.textContent.trim();
      translateText(textToTranslate, 'en', 'ko', (translatedText) => {
        alert(`Translated Text: ${translatedText}`);
      });
    }
  </script>
</head>
<body>
  <div class="chat-body" id="chatBox">
    <c:forEach var="vo" items="${chatVos}" varStatus="st">
      <div class="message ${sMid == vo.senderId ? 'sent' : 'received'}">
        <div class="content">${vo.message}</div>
        <div class="timestamp">${vo.sendDate}</div>
        <span class="translate-btn" onclick="handleTranslate(this)">번역하기</span>
      </div>
    </c:forEach>
  </div>
</body>
</html>
