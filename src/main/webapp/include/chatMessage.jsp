<%@page import="chat.ChatVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="chat.ChatDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
    
    @font-face {
      font-family: 'NEXON Lv1 Gothic OTF';
      src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
      font-weight: normal;
      font-style: normal;
    }

    .chat-container {
      font-family: 'NEXON Lv1 Gothic OTF', sans-serif;
      flex-grow: 1;
      display: flex;
      flex-direction: column;
      height: 100vh;
      background-color: #f5f5f5;
    }
    .newMessage-con	 {
      font-family: 'NEXON Lv1 Gothic OTF', sans-serif;
      flex-grow: 1;
      display: flex;
      flex-direction: column;
      height: 90vh;
      background-color: #f5f5f5;
      color: #36a65e;
      font-size:18px;
    }

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

    .newMessage-con {
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
    }

    .newMessage {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100%;
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
      background-color: #fdfad1;
      border-radius: 15px;
      padding: 10px 15px;
      max-width: 60%;
      color: #947c60;
      font-size: 14px;
      position: relative;
      font-family: 'NEXON Lv1 Gothic OTF';
    }

    .message.sent .content {
      background-color: #39b766;
      border-radius: 15px;
      padding: 10px 15px;
      max-width: 60%;
      color: #faf8df;
      font-size: 14px;
      position: relative;
      font-family: 'NEXON Lv1 Gothic OTF';
    }

    .message .timestamp {
      font-size: 12px;
      color: #cecccc;
      margin-top: 5px;
      font-family: 'NEXON Lv1 Gothic OTF';
    }

    .message.received {
      display: flex;
      align-items: flex-start;
    }

    .content {
      margin-right: 10px;
    }
  </style>
  <script>
    'use strict';
    
    setTimeout("location.reload()", 1000*5);
    
    $(document).ready(function(){
    	document.body.scrollIntoView(false);
    })
  </script>
</head>
<body>
  <div class="chat-body" id="chatBox">
    <c:if test="${fn:length(chatVos) == 0}">
      <div class="newMessage-con">
        <div class="newMessage">좌측에서 아이디를 클릭하거나 회원 찾기에서 '메세지 보내기'를 클릭해 대화를 시작해보세요 :)</div>
      </div>
    </c:if>
    <c:forEach var="vo" items="${chatVos}" varStatus="st">
      <!-- 상대방이 보낸 메시지 -->
      <c:if test="${sMid != vo.senderMid}">
        <div class="message received">
          <img src="${ctp}/images/member/${vo.photo}" alt="Sender Image" class="profile-img">
          <div class="content">
            ${vo.message}
            <div class="timestamp">
              ${vo.date_diff == 0 ? fn:substring(vo.chatDate,11,16) : fn:substring(vo.chatDate,0,10)}
            </div>
          </div>
        </div>
      </c:if>
      <!-- 내가 보낸 메시지 -->
      <c:if test="${sMid == vo.senderMid}">
        <div class="message sent">
          <div class="content">
            ${vo.message}
            <div class="timestamp">
              ${vo.date_diff == 0 ? fn:substring(vo.chatDate,11,16) : fn:substring(vo.chatDate,0,10)}
            </div>
          </div>
          <%-- <img src="${ctp}/images/profile.jpg" alt="My Image" class="profile-img"> --%>
        </div>
      </c:if>
    </c:forEach>
  </div>
</body>
</html>
