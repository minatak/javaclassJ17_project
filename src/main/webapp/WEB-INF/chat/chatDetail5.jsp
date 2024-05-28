<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>메시지 보기</title>
  <%@ include file="/include/bs4.jsp" %>
  <link href="${ctp}/css/styles.css" rel="stylesheet" />
  <link href="${ctp}/css/join.css" rel="stylesheet" />
  <style>
    @charset "UTF-8";

    body {
      font-family: 'NEXON Lv1 Gothic OTF', sans-serif;
      background-color: #fefefe;
      font-size: 14px;
      margin: 0;
      padding: 0;
      display: flex;
      height: 100vh;
    }

    .sidebar {
      width: 80px;
      background-color: #2e2e2e;
      color: #fff;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 20px 0;
    }

    .sidebar img {
      width: 50px;
      height: 50px;
      border-radius: 50%;
      object-fit: cover;
      margin-bottom: 20px;
    }

    .sidebar .logout {
      margin-top: auto;
      margin-bottom: 20px;
      font-size: 24px;
      cursor: pointer;
    }

    .friends-list {
      width: 250px;
      background-color: #3e3e3e;
      color: #fff;
      display: flex;
      flex-direction: column;
      padding: 20px;
    }

    .friends-list .search {
      margin-bottom: 20px;
    }

    .friends-list .search input {
      width: 100%;
      padding: 10px;
      border: none;
      border-radius: 5px;
      font-size: 14px;
    }

    .friends-list .friend {
      display: flex;
      align-items: center;
      margin-bottom: 15px;
    }

    .friends-list .friend img {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      object-fit: cover;
      margin-right: 10px;
    }

    .friends-list .friend .name {
      font-size: 16px;
    }

    .friends-list .friend .status {
      font-size: 12px;
      color: #aaa;
    }

    .chat-container {
      flex-grow: 1;
      display: flex;
      flex-direction: column;
    }

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

    .chat-header .user-info .status {
      font-size: 12px;
      color: #fff;
      margin-left: 10px;
    }

    .chat-header .actions {
      display: flex;
      gap: 10px;
    }

    .chat-header .actions i {
      font-size: 20px;
      cursor: pointer;
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

    .message.sent .content { /* 내가 보낸 메세지 */
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
    }
  </style>
  <script>
    'use strict';

    async function translateText(text, sourceLang, targetLang, callback) {
      const requestData = {
        q: text,
        source: sourceLang,
        target: targetLang,
        format: "text"
      };

      const response = await fetch('https://libretranslate.com/translate', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(requestData)
      });

      const data = await response.json();
      callback(data.translatedText);
    }

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
  <%-- <jsp:include page="/include/nav.jsp" /> --%>
  <!-- 맨 왼쪽 슬라이더 (프로필 사진, 나가기 아이콘 있음) -->
  <div class="sidebar">
    <a href="MemberInfo.mem"><img src="${ctp}/images/member/noimage.png" alt="Profile Image"></a>
    <a href="Main.com" class="logout"><i class="fas fa-sign-out-alt"></i></a>
  </div>
  <!-- 왼쪽의 채팅 목록 창 -->
  <div class="friends-list">
    <div class="search" style="display:inline-block">
      <i class="fa-solid fa-magnifying-glass"></i>
      <input type="text" placeholder="검색...">
      <span><i class="fa-solid fa-plus"></i></span>
    </div>
    
    <c:forEach var="vo" items="${vos}" varStatus="st">
      <div class="friend">
        <img src="${ctp}/images/member/${vo.photo}" alt="Friend Image">
        <div>
          <div class="name">${vo.receiveId}</div>
        </div>
      </div>
    </c:forEach>
    
    <!-- 예시 화면 -->
    <div class="friend">
      <img src="${ctp}/images/member/noimage.png" alt="Friend Image">
      <div>
        <div class="name">Alina Judy</div>
      </div>
    </div>
    <div class="friend">
      <img src="${ctp}/images/member/noimage.png" alt="Friend Image">
      <div>
        <div class="name">Sara Moira</div>
      </div>
    </div>
    <div class="friend">
      <img src="${ctp}/images/member/noimage.png" alt="Friend Image">
      <div>
        <div class="name">Christina Lynn</div>
      </div>
    </div>
    <div class="friend">
      <img src="${ctp}/images/member/noimage.png" alt="Friend Image">
      <div>
        <div class="name">Chris Marina</div>
      </div>
    </div>
  </div>
  
  <!-- 채팅 창 -->
  <div class="chat-container">
    <!-- 채팅창 해더 -->
    <div class="chat-header">
      <div class="user-info">
        <img src="${ctp}/images/${receiveId.photo}" alt="Sender Image">
        <div>
          <h3>${receiveId.name}</h3>
        </div>
      </div>
      <div class="actions">
        <i class="fas fa-phone"></i>
        <i class="fas fa-video"></i>
        <i class="fas fa-ellipsis-h"></i>
      </div>
    </div>
    <div class="chat-body">
      <c:forEach var="chat" items="${chatting}" varStatus="st">
        <!-- 상대방 채팅(내 기준으로 이부분이 receiveId -->
        <c:if test="${chat.receiveId == receiveId}">
          <div class="message received">
            <img src="${ctp}/images/${receiveId.photo}" alt="Sender Image" class="profile-img">
            <div class="content">
              ${chat.content}
              <div class="timestamp">${chat.sendDate}</div>
              <span class="translate-btn" onclick="handleTranslate(this)">번역하기</span>
              <c:if test="${chat.receiveSw == 'n'}">
                <span>1</span>
              </c:if>
            </div>
          </div>
        </c:if>
        <!-- 내가 보낸 채팅 부분(sendId. 내가 보낸 거니까 !) -->
        <c:if test="${chat.sendId == sMid}">
          <div class="message sent">
            <div class="content">
              ${chat.content}
              <span class="translate-btn" onclick="handleTranslate(this)">번역하기</span> <!-- '번역하기'가 메세지 바로밑에 오게 바꾸기! -->
              <div class="timestamp">${chat.sendDate}</div>
            </div>
            <img src="${ctp}/images/profile.jpg" alt="My Image" class="profile-img">
          </div>
        </c:if>
      </c:forEach>
      
      <!-- 내용 예시. 이런식으로 시간 순으로 정렬되어야 함. -->
      <div class="message received">
        <img src="${ctp}/images/member/noimage.png" alt="Sender Image" class="profile-img">
        <div class="content">
          Hey, I want show you some amazing photos.
        </div>
          <span class="translate-btn" onclick="handleTranslate(this)">번역하기</span>
          <div class="timestamp">06-10 10:26 AM</div>
      </div>
          
      <div class="message sent">
          <div class="timestamp">10:27 AM</div>
        <div class="content">
          Nice! Show me
        </div>
        <img src="${ctp}/images/member/noimage.png" alt="My Image" class="profile-img">
      </div>
          <span class="translate-btn" onclick="handleTranslate(this)">번역하기</span>
    </div>
    
    <div class="chat-footer">
      <input type="text" placeholder="메시지를 입력하세요...">
      <button>전송</button>
    </div>
  </div>
</body>
</html>
