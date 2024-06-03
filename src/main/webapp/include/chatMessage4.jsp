<%@page import="chat.ChatVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="chat.ChatDAO"%>
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
  <title>채팅 메시지</title>
  <%@ include file="/include/bs4.jsp" %>
  <style>
    @charset "UTF-8";

    .chat-container {
      flex-grow: 1;
      display: flex;
      flex-direction: column;
      height: 100vh;
    }
/* 
    .chat-header {
      background-color: #35ae5f;
      color: #fff;
      padding: 20px;
      display: flex;
      align-items: center;
      justify-content: space-between;
    }

    .chat-header img {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      object-fit: cover;
      margin-right: 15px;
    }

    .profile-img {
      width: 25px;
      height: 25px;
      border-radius: 50%;
      object-fit: cover;
      margin-right: 15px;
    }

    .chat-header .user-info {
      display: flex;
      align-items: center;
    }

    .chat-header .user-info h3 {
      margin: 0;
      font-size: 18px;
    }

    .chat-header .actions {
      display: flex;
      gap: 10px;
    }

    .chat-header .actions i {
      font-size: 20px;
      cursor: pointer;
    } */
    .profile-img {
      width: 25px;
      height: 25px;
      border-radius: 50%;
      object-fit: cover;
      margin-right: 15px;
    }

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
/* 
    .translate-btn {
      display: block;
      margin-top: 5px;
    }

    .chat-footer {
      padding: 20px;
      background-color: #fff;
      display: flex;
      align-items: center;
    }

    .chat-footer input {
      flex-grow: 1;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 5px;
      margin-right: 10px;
      font-size: 14px;
    }

    .chat-footer button {
      padding: 10px 20px;
      background-color: #35ae5f;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    .chat-footer button:hover {
      background-color: #39b766;
    } */
  </style>
</head>
<body>
  <%-- <div class="chat-container">
    <div class="chat-header">
      <div class="user-info">
        <a href="MemberProfile.mem?mid=${sReceiverMid}">
        <h3>${sReceiverMid}</h3></a>
      </div>
      <div class="actions">
        <!-- <i class="fas fa-cog"></i> 
        <i class="fas fa-sign-out-alt"></i> -->
      </div>
    </div> --%>
    
    <div class="chat-body" id="chatBox">
    	<c:if test="empty ${chatVos}">
    		<div>좌측에서 아이디를 클릭하거나 회원 찾기에서 '메세지 보내기'를 클릭해 대화를 시작해보세요.</div>
    	</c:if>
      <c:forEach var="vo" items="${chatVos}" varStatus="st">
        <!-- 상대방이 보낸 메시지 -->
        <c:if test="${sMid != vo.receiverMid}">
          <div class="message received">
            <img src="${ctp}/images/member/${vo.photo}" alt="Sender Image" class="profile-img">
            <div class="content">
              ${vo.message}
              <div class="timestamp">${vo.chatDate}</div>
            </div>
          </div>
        </c:if>
        <!-- 내가 보낸 메시지 -->
        <c:if test="${sMid == vo.receiverMid}">
          <div class="message sent">
            <div class="content">
              ${vo.message}
              <div class="timestamp">${vo.chatDate}</div>
            </div>
            <%-- <img src="${ctp}/images/profile.jpg" alt="My Image" class="profile-img"> --%>
          </div>
        </c:if>
      </c:forEach>
    </div>
    
    <!-- <div class="chat-footer">
      <input type="text" id="message" name="message" placeholder="메시지를 입력하세요..." class="form-control">
      <button onclick="sendMessage()">전송</button>
    </div>
  </div> -->
</body>
</html>
