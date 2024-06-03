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

  </style>
  <script>
    'use strict';


    function sendMessage() {
      var message = document.getElementById("message").value;
      var senderMid = "${sMid}";
      var receiverMid = " ";
    }

    // setInterval(getMessages, 3000);
  </script>
</head>
<body>
  <div class="sidebar">
    <a href="MemberInfo.mem"><img src="${ctp}/images/member/noimage.png" alt="Profile Image"></a>
    <a href="Main.com" class="logout"><i class="fas fa-sign-out-alt"></i></a>
  </div>
  
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
  </div>
  
  <div class="chat-container">
    <%-- <div class="chat-header">
    
      <div class="user-info">
        <img src="${ctp}/images/member/${vo.photo}" alt="Profile Image" class="profile-img">
        <h3>${vo.receiverMid}</h3>
      </div>
      <div class="actions">
        <i class="fas fa-cog"></i>
        <i class="fas fa-sign-out-alt"></i>
      </div>
    </div>
    
    <div class="chat-body" id="chatBox"> --%>
      <iframe src="${ctp}/include/chatMessage.jsp" style="width:100%; height:100%; border:none;"></iframe>
   <!--  </div>
    
    <div class="chat-footer">
      <div class="input-group">
        <input type="text" id="message" name="message" placeholder="메시지를 입력하세요..." class="form-control">
        <div class="input-group-append"><button onclick="sendMessage()">전송</button></div>
      </div>
    </div> -->
  </div>
</body>
</html>
