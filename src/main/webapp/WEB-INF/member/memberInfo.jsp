<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보</title>
    <%@ include file="/include/bs4.jsp" %>
    <link href="${ctp}/css/styles.css" rel="stylesheet" />
    <link href="${ctp}/css/join.css" rel="stylesheet" />
    <style>
        @charset "UTF-8";

        body main {
            font-family: 'NEXON Lv1 Gothic OTF';
            background-color: #fefefe;
            /* font-size: 14px; */
            color: #6f5340;
        }

        .join-container {
            max-width: 750px;
            background: #fefefe;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
        }

        .register-container {
            text-align: center;
        }

        .register-container h1 {
            color: #35ae5f;
            font-family: 'CWDangamAsac-Bold';
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
            font-size: 16px; /* 텍스트 크기를 키움 */ 
            color: #6f5340;
        }

        .form-group label {
            margin-bottom: 5px;
            color: #35ae5f;
            font-size: 14px;
        }

        .form-group input[type="text"],
        .form-group input[type="file"],
        .form-group input[type="email"],
        .form-group input[type="date"],
        .form-group input[type="password"],
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            background: #fefefe;
            font-size: 14px;
            color: #6f5340;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            border-color: #35ae5f;
            outline: none;
            background: #fff;
        }

        .profile-image {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 20px;
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
<jsp:include page="/include/nav.jsp" />
<main class="flex-shrink-0">
    <div class="container join-container mt-5 mb-5">
        <div class="register-container">
            <h1 class="mb-4">회원 정보</h1>
            <img src="${ctp}/images/member/${vo.photo}" alt="Profile Image" class="profile-image" />
            <form name="registerForm1" method="post" action="${ctp}/MemberInfoUpdate.mem">
                <div class="form-group mt-2">
                    <div><strong>Id:</strong> ${vo.mid}</div>
                </div>
                <div class="form-group">
                    <div><strong>Nickname:</strong> ${vo.nickName}</div>
                </div>
                <div class="form-group">
                    <div><strong>Name:</strong> ${vo.name}</div>
                </div>
                <div class="form-group">
                    <div><strong>Email:</strong> ${vo.email}</div>
                </div>
                <div class="form-group">
                    <div><strong>Gender:</strong> ${vo.gender}</div>
                </div>
                <div class="form-group">
                    <div><strong>Birthday:</strong> ${vo.birthday}</div>
                </div>
                <div class="form-group">
                    <div><strong>Country:</strong> ${vo.country}</div>
                </div>
                <div class="form-group">
                    <c:if test="${empty vo.city}">
                        <div><strong>City:</strong> 미공개</div>
                    </c:if>
                    <c:if test="${!empty vo.city}">
                        <div><strong>City:</strong> ${vo.city}</div>
                    </c:if>
                </div>
                <div class="form-group">
                    <div><strong>Native Language:</strong> ${vo.nativeLanguage}</div>
                </div>
                <div class="form-group">
                    <div><strong>Learning Language:</strong> ${vo.learningLanguage}</div>
                </div>
                <div class="form-group">
                    <div><strong>Learning Language Level:</strong> ${vo.languageLevel}</div>
                </div>
                <div class="form-group">
                    <div><strong>Self Introduction:</strong> ${vo.content}</div>
                </div>
                <div class=" text-center mt-3">
                    <a class="myBtn" href="MemberMain.mem" style="font-family: 'NEXON Lv1 Gothic OTF';">대시보드</a>
                </div>
            </form>
        </div>
    </div>
</main>
<jsp:include page="/include/footer.jsp" />
<script src="${ctp}/js/scripts.js"></script>
</body>
</html>
