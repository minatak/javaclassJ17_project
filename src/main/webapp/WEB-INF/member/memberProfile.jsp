<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${vo.name}의 프로필</title>
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/user.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <h1>${vo.name}의 프로필</h1>
        <div class="profile-card">
            <img src="${vo.photo}" alt="Profile Photo" class="profile-photo" />
            <div class="profile-info">
                <table>
                    <tr>
                        <th>이름</th>
                        <td>${vo.name}</td>
                    </tr>
                    <tr>
                        <th>도시</th>
                        <td>${vo.city}</td>
                    </tr>
                    <tr>
                        <th>본국</th>
                        <td>${vo.country}</td>
                    </tr>
                    <tr>
                        <th>현재 국가</th>
                        <td>${vo.currentCountry}</td>
                    </tr>
                    <tr>
                        <th>연령</th>
                        <td>${vo.age}</td>
                    </tr>
                    <tr>
                        <th>성별</th>
                        <td>${vo.gender}</td>
                    </tr>
                    <tr>
                        <th>모국어</th>
                        <td>${vo.nativeLanguage}</td>
                    </tr>
                    <tr>
                        <th>학습할 언어</th>
                        <td>${vo.practicingLanguage}</td>
                    </tr>
                </table>
                <div class="description">
                    <h3>설명</h3>
                    <p>${vo.content}</p>
                    <button id="translateBtn">번역하기</button>
                </div>
            </div>
        </div>
        <div class="message-section">
            <h3>새 메시지</h3>
            <textarea placeholder="메시지 쓰기..."></textarea>
            <button>보내기</button>
        </div>
    </div>
</body>
</html>
