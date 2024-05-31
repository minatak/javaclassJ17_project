<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>단어 인풋 페이지</title>
    <%@ include file="/include/bs4.jsp" %>
    <link href="${ctp}/css/styles.css" rel="stylesheet" />
    <style>
        body {
            font-family: 'NEXON Lv1 Gothic OTF'';
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
            font-family: 'CWDangamAsac-Bold';
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
        .input-group input,
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
        .btn {
            padding: 10px 15px;
            background-color: #35ae5f;
            color: #fff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
        }
      
        .dynamic-inputs .word-input {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        .dynamic-inputs .word-input input,
        .dynamic-inputs .word-input select {
            flex: 1;
            padding: 10px;
            margin: 0 5px;
            border: none;
            border-bottom: 2px solid #ddd;
            border-radius: 0;
            box-shadow: none;
            outline: none;
        }
        .dynamic-inputs .word-input input:focus,
        .dynamic-inputs .word-input select:focus {
            border-bottom: 2px solid #35ae5f;
        }
        .dynamic-inputs .word-input img,
        .dynamic-inputs .word-input .search-icon {
            width: 25px;
            height: 25px;
            cursor: pointer;
            margin: 0 5px;
        }
        .add-remove-buttons {
            text-align: center;
        }
        .add-remove-buttons button {
            padding: 10px 15px;
            margin: 5px;
            background-color: #35ae5f;
            color: white;
            border: none;
            border-radius: 5px;
        }
        .add-remove-buttons button:hover {
            background-color: #379866;
        }
        .meanings,
        .examples {
            width: 300px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
    </style>
    <script>
        function addWordInput() {
            const container = document.querySelector('.dynamic-inputs');
            const newInput = document.createElement('div');
            newInput.className = 'word-input';
            newInput.innerHTML = `
                
                <table border="1" style="border: none;">
							      <tr><td rowspan="2"><input type="text" name="words[]" placeholder="단어" required></td>
							      <td><input type="text" name="meanings[]" placeholder="뜻" required></td></tr>
							      <tr><th><input type="text" name="examples[]" placeholder="예문"></th></tr>
							  </table>
            `;
            container.appendChild(newInput);
        }

        function removeWordInput() {
            const container = document.querySelector('.dynamic-inputs');
            if (container.children.length > 1) {
                container.removeChild(container.lastElementChild);
            }
        }
    </script>
</head>
<body>
    <jsp:include page="/include/nav.jsp" />
    <p><br/></p>
    <main class="container">
        <div class="dashboard-header">
            <h1>단어장 등록</h1>
        </div>
        <div class="card">
            <form action="${ctp}/saveVocab.do" method="POST">
                <div class="input-group">
                    <label for="name">세트명</label><select name="language[]" required>
                            <option value="English">English</option>
                            <option value="Korean">Korean</option>
                            <option value="Japanese">Japanese</option>
                            <option value="Chinese">Chinese</option>
                            <option value="Russian">Russian</option>
                            <option value="Spanish">Spanish</option>
                            <option value="French">French</option>
                            <option value="German">German</option>
                        </select>
                    <input type="text" name="name" id="name" placeholder="세트명을 입력하세요. (예: 중1 영어 천재교과서 1과)" required />
                </div>
                <div class="dynamic-inputs">
                    <div class="word-input">
                        
                        <!-- <input type="text" name="words[]" placeholder="단어" required>
                        <input type="text" name="meanings[]" placeholder="뜻" required>
                        <input type="text" name="examples[]" placeholder="예문"> -->
                        
                <table border="1" style="border: none;">
							      <tr>1<td rowspan="2"><input type="text" name="words[]" placeholder="단어" required></td> 
							      <td><input type="text" name="meanings[]" placeholder="뜻" required></td></tr>
							      <tr><th><input type="text" name="examples[]" placeholder="예문"></th></tr>
							  </table>
                    </div>
                </div>
               
            		<button class="btn text-right" type="submit">저장</button>
            </form>
        </div>
    </main>
    <p><br/></p>
    <jsp:include page="/include/footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
