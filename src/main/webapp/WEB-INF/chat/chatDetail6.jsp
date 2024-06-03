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
      cursor: pointer;
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
    
      .message.received {
        display: flex;
        align-items: flex-start; /* 세로 정렬을 위해 */
    }

    .content {
        margin-right: 10px; /* 버튼과의 간격을 조정 */
    }

    .translate-btn {
        display: block; /* 버튼을 블록 요소로 만들어 줌으로써 한 줄에 하나씩 표시되도록 함 */
        margin-top: 5px; /* 텍스트 아래에 간격을 조정 */
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
    
    .search {
	    display: flex;
	    align-items: center;
    }

    .search input[type="text"] {
     	margin: 5px; /* 아이콘과의 간격 조정 */
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

        var lastMessageId = 0;

        function getMessages() {
            var receiveId = "${sMid}"; // 현재 사용자 ID

            var xhr = new XMLHttpRequest();
            xhr.open("GET", "get_messages.php?lastId=" + lastMessageId + "&receiveId=" + encodeURIComponent(receiveId), true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var messages = JSON.parse(xhr.responseText);
                    var chatBox = document.getElementById("chatBox");

                    messages.forEach(function (message) {
                        var messageElement = document.createElement("div");
                        messageElement.className = message.sendId === "user1" ? "message sent" : "message received";
                        messageElement.innerHTML = `
                            <div class="content">${message.content}</div>
                            <div class="timestamp">${message.sendDate}</div>
                            <span class="translate-btn" onclick="handleTranslate(this)">번역하기</span>
                        `;
                        chatBox.appendChild(messageElement);

                        // 마지막 메시지 ID 갱신
                        lastMessageId = message.idx;
                    });

                    // 스크롤을 최신 메시지로 이동
                    chatBox.scrollTop = chatBox.scrollHeight;
                }
            };
            xhr.send();
        }

        function sendMessage() {
          var message = document.getElementById("message").value;
          var senderMid = "${sMid}"; // 현재 사용자 ID
          var receiverMid = " "; // 상대방 사용자 ID

					
            
        }

        // 주기적으로 메시지 가져오기 (폴링)
        //setInterval(getMessages, 3000); // 3초마다 메시지 확인
    </script>
</head>
<body>
    <!-- 맨 왼쪽 슬라이더 (프로필 사진, 나가기 아이콘 있음) -->
    <div class="sidebar">
        <a href="MemberInfo.mem"><img src="${ctp}/images/member/noimage.png" alt="Profile Image"></a>
        <a href="Main.com" class="logout"><i class="fas fa-sign-out-alt"></i></a>
    </div>
    <!-- 왼쪽의 채팅 목록 창 -->
    <div class="friends-list">
        <div class="search">
            <i class="fa-solid fa-magnifying-glass"></i>
            <input type="text" placeholder="검색...">
            <span><i class="fa-solid fa-plus"></i></span>
        </div>
        
        <c:forEach var="vo" items="${vos}" varStatus="st">
            <div class="friend">
                <img src="${ctp}/images/member/${vo.photo}" alt="Friend Image">
                <div>
                  <div class="name"><a href="ChatDetail.chat?receiverMid=${vo.receiverMid}">${vo.receiverMid}</a></div>
                </div>
            </div>
        </c:forEach>
        <%-- 
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
    </div> --%>
    
    <!-- 채팅 창 -->
    <div>
      <iframe src="${ctp}/include/chatMessage.jsp" style="width:100%; height:600px;"></iframe>
    </div>
    <div class="chat-footer">
        <div class="input-group">
	        <input type="text" id="message" name="message" placeholder="메시지를 입력하세요..." class="form-control">
	        <div class="input-group-append"><button onclick="sendMessage()">전송</button></div>
        </div>
    </div>
    
</body>
</html>
