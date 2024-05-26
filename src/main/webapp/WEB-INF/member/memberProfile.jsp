<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${member.name}의 프로필</title>
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/user.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <h1>${member.name}의 프로필</h1>
        <div class="profile-card">
            <img src="${member.photo}" alt="Profile Photo" class="profile-photo" />
            <div class="profile-info">
                <table>
                    <tr>
                        <th>이름</th>
                        <td>${member.name}</td>
                    </tr>
                    <tr>
                        <th>도시</th>
                        <td>${member.city}</td>
                    </tr>
                    <tr>
                        <th>본국</th>
                        <td>${member.country}</td>
                    </tr>
                    <tr>
                        <th>현재 국가</th>
                        <td>${member.currentCountry}</td>
                    </tr>
                    <tr>
                        <th>연령</th>
                        <td>${member.age}</td>
                    </tr>
                    <tr>
                        <th>성별</th>
                        <td>${member.gender}</td>
                    </tr>
                    <tr>
                        <th>모국어</th>
                        <td>${member.nativeLanguage}</td>
                    </tr>
                    <tr>
                        <th>학습할 언어</th>
                        <td>${member.practicingLanguage}</td>
                    </tr>
                </table>
                <div class="description">
                    <h3>설명</h3>
                    <p>${member.description}</p>
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
