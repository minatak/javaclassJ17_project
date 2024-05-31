<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>단어장 만들기</title>
    <%@ include file="/include/bs4.jsp" %>
    <link href="${ctp}/css/styles.css" rel="stylesheet" />
    <style>
        body {
            font-family: 'NEXON Lv1 Gothic OTF', sans-serif;
            background-color: #f3f4f6;
            font-size: 14px;
        }
        .dashboard-header {
            text-align: center;
            margin-bottom: 30px;
        }
        h1 {
            font-family: 'CWDangamAsac-Bold';
            color: #35ae5f;
        }
        .card {
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #fefefe;
        }
        .card h3 {
            font-family: 'CWDangamAsac-Bold', sans-serif;
            color: #36b574;
            margin-bottom: 20px;
        }
        .input-group {
            margin-bottom: 15px;
        }
        .input-group label {
            display: block;
            margin-bottom: 5px;
            color: #6f5340;
        }
        
        .dynamic-inputs .word-input input,
        .dynamic-inputs .word-input select {
            width: 100%;
            padding: 10px;
            border: none;
            border-bottom: 2px solid #ddd;
            border-radius: 0;
            box-shadow: none;
            outline: none;
        }
        .input-group input:focus,
        .dynamic-inputs .word-input input:focus,
        .dynamic-inputs .word-input select:focus {
            border-bottom: 2px solid #35ae5f;
        }
        .dynamic-inputs .word-input {
            display: flex;
            flex-direction: column;
            margin-bottom: 10px;
        }
        .dynamic-inputs .word-input table {
            width: 100%;
            border-collapse: collapse;
        }
        .dynamic-inputs .word-input table td {
            padding: 5px;
        }
        .dynamic-inputs .word-input table input {
            width: 100%;
            margin: 0;
            padding: 10px;
            box-sizing: border-box;
        }
        .dynamic-inputs .word-input .example-input {
            font-size: 12px;
            color: #999;
            margin-top: -5px;
        }
        .add-remove-buttons {
            text-align: center;
            margin-top: 10px;
        }
        .add-remove-buttons button {
            padding: 10px 15px;
            margin: 5px;
            background-color: #35ae5f;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .add-remove-buttons button:hover {
            background-color: #2e944e;
        }
        .input-group {
            display: flex;
            align-items: center;
        }
        .name-input {
            flex: 3; /* 75% */
        }
        .language-select {
            flex: 1; /* 25% */
        }
    </style>
    <script>
        'use strict';
        
        let count = 5; // 초기 카운트 값
        
        function updateCount() {
            const countElements = document.querySelectorAll('.word-input .count');
            countElements.forEach((element, index) => {
                element.innerText = index + 1;
            });
        }
        
        function addWordInput() {
            count++; // 카운트 증가
            const container = document.querySelector('.dynamic-inputs');
            const newInput = document.createElement('div');
            
            newInput.className = 'word-input';
            newInput.innerHTML = `
                <table>
                    <tr>
                        <td class="count">${count}</td>
                        <td style="width: 30%;"><input type="text" name="words[]" placeholder="단어" required></td>
                        <td style="width: 70%;"><input type="text" name="meanings[]" placeholder="뜻" required></td>
                    </tr>
                </table>
            `;
            container.appendChild(newInput);
            updateCount();
        }
        
        function removeWordInput() {
            const container = document.querySelector('.dynamic-inputs');
            if (container.children.length > 1) {
                container.removeChild(container.lastElementChild);
                count--; // 카운트 감소
                updateCount();
            }
        }
    </script>

</head>
<body>
    <jsp:include page="/include/nav.jsp" />
    <main class="container">
        <div class="dashboard-header">
            <h1>단어장 등록</h1>
        </div>
        <div class="card">
            <form action="${ctp}/saveVocab.do" method="POST">
                <div class="input-group">
                    <input type="text" name="name" id="name" placeholder="단어장 이름을 입력하세요. (예: 여행 회화 필수 단어)" class="form-control name-input" required />
                    <select name="language[]" class="form-select language-select" required>
                        <option value="English">English</option>
                        <option value="Korean">한국어</option>
                        <option value="Japanese">日本語</option>
                        <option value="Chinese">中国人</option>
                        <option value="Russian">Русский</option>
                        <option value="Spanish">Español</option>
                        <option value="French">Français</option>
                        <option value="German">Allemand</option>
                    </select>
                </div>
                <div class="dynamic-inputs">
                    <div class="word-input">
                        <table>
                            <tr>
                                <td class="count">1</td>
                                <td style="width: 30%;"><input type="text" name="words[]" placeholder="단어) friends" required></td>
                                <td style="width: 70%;"><input type="text" name="meanings[]" placeholder="뜻) 친구" required></td>
                            </tr>
                            <tr>
                                <td class="count">2</td>
                                <td style="width: 30%;"><input type="text" name="words[]" placeholder="단어" required></td>
                                <td style="width: 70%;"><input type="text" name="meanings[]" placeholder="뜻" required></td>
                            </tr>
                            <tr>
                                <td class="count">3</td>
                                <td style="width: 30%;"><input type="text" name="words[]" placeholder="단어" required></td>
                                <td style="width: 70%;"><input type="text" name="meanings[]" placeholder="뜻" required></td>
                            </tr>
                            <tr>
                                <td class="count">4</td>
                                <td style="width: 30%;"><input type="text" name="words[]" placeholder="단어" required></td>
                                <td style="width: 70%;"><input type="text" name="meanings[]" placeholder="뜻" required></td>
                            </tr>
                            <tr>
                                <td class="count">5</td>
                                <td style="width: 30%;"><input type="text" name="words[]" placeholder="단어" required></td>
                                <td style="width: 70%;"><input type="text" name="meanings[]" placeholder="뜻" required></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="add-remove-buttons">
                    <button type="button" onclick="addWordInput()">+</button>
                    <button type="button" onclick="removeWordInput()">-</button>
                </div>
                <button class="btn" type="submit">저장</button>
            </form>
        </div>
    </main>
    <jsp:include page="/include/footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
