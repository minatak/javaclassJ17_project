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
            width: 300px;
            background-color: #2e2e2e;
            color: #fff;
            padding: 20px;
            display: flex;
            flex-direction: column;
        }

        .sidebar img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 15px;
        }

        .sidebar .profile {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .sidebar .profile h2 {
            font-size: 18px;
        }

        .sidebar .search {
            margin-bottom: 20px;
        }

        .sidebar .search input {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
        }

        .sidebar .menu {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .sidebar .menu a {
            color: #fff;
            text-decoration: none;
            font-size: 16px;
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
        }

        .message.sent .content {
            background-color: #35ae5f;
            color: #fff;
        }

        .message .timestamp {
            font-size: 12px;
            color: #aaa;
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
        }
    </style>
</head>
<body>
<div class="sidebar">
    <div class="profile">
        <img src="${ctp}/images/member/${vo.photo}" alt="Profile Image">
        <h2>사용자 이름</h2>
    </div>
    <div class="search">
        <input type="text" placeholder="검색...">
    </div>
    <div class="menu">
        <a href="#">메시지</a>
        <a href="#">친구</a>
        <a href="#">설정</a>
    </div>
</div>
<div class="chat-container">
    <div class="chat-header">
        <div class="user-info">
            <img src="${ctp}/images/member/${vo.photo}" alt="Sender Image">
            <div>
                <h3>Chris Marina</h3>
                <span class="status">온라인</span>
            </div>
        </div>
        <div class="actions">
            <i class="fas fa-phone"></i>
            <i class="fas fa-video"></i>
            <i class="fas fa-ellipsis-h"></i>
        </div>
    </div>
    <div class="chat-body">
        <div class="message received">
            <img src="${ctp}/images/sender.jpg" alt="Sender Image" class="profile-img">
            <div class="content">
                Where are you?
                <div class="timestamp">06-09 14:24 PM</div>
            </div>
        </div>
        <div class="message sent">
            <div class="content">
                Living room...
                <div class="timestamp">06-09 14:24 PM</div>
            </div>
            <img src="${ctp}/images/profile.jpg" alt="My Image" class="profile-img">
        </div>
        <div class="message received">
            <img src="${ctp}/images/sender.jpg" alt="Sender Image" class="profile-img">
            <div class="content">
		            Hey, I want show you some amazing photos.
		            <div class="timestamp">06-10 10:26 AM</div>
            </div>
        </div>
        <div class="message received">
            <img src="${ctp}/images/sender.jpg" alt="Sender Image" class="profile-img">
            <div class="content">
                <img src="${ctp}/images/photo1.jpg" alt="Photo 1" style="width: 100%; border-radius: 10px;">
                <img src="${ctp}/images/photo2.jpg" alt="Photo 2" style="width: 100%; border-radius: 10px;">
                <div class="timestamp">06-10 10:26 AM</div>
            </div>
        </div>
        <div class="message sent">
            <div class="content">
                Nice! Show me
                <div class="timestamp">06-10 10:27 AM</div>
            </div>
            <img src="${ctp}/images/profile.jpg" alt="My Image" class="profile-img">
        </div>
    </div>
    <div class="chat-footer">
        <input type="text" placeholder="메시지를 입력하세요...">
        <button>전송</button>
    </div>
</div>
</body>
</html>
