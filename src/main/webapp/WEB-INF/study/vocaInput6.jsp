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
            font-family: 'NEXON Lv1 Gothic OTF', sans-serif;
            background-color: #f3f4f6;
            font-size: 14px;
        }
        .dashboard-header {
            text-align: center;
            margin-bottom: 30px;
        }
        h1 {
            font-family: 'CWDangamAsac-Bold', sans-serif;
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
        .input-group input {
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
            cursor: pointer;
        }
        .btn:hover {
            background-color: #2e944e;
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
    </style>
    <script>
        function addWordInput() {
            const container = document.querySelector('.dynamic-inputs');
            const newInput = document.createElement('div');
            newInput.className = 'word-input';
            newInput.innerHTML = `
                <table>
                    <tr>
                        <td style="width: 30%;"><input type="text" name="words[]" placeholder="단어" required></td>
                        <td style="width: 70%;"><input type="text" name="meanings[]" placeholder="뜻" required></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="text" name="examples[]" class="example-input" placeholder="예문"></td>
                    </tr>
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
    <main class="container">
        <div class="dashboard-header">
            <h1>단어장 등록</h1>
        </div>
        <div class="card">
            <form action="${ctp}/saveVocab.do" method="POST">
                <div class="input-group">
                    <label for="name">세트명</label>
                    <input type="text" name="name" id="name" placeholder="세트명을 입력하세요. (예: 중1 영어 천재교과서 1과)" required />
                </div>
                <div>
                </div>
                <div class="dynamic-inputs">
	                <div class="word-input">
	                  <table class="table">
                            <tr>
                                <td colspan="2">
                                    <button type="button" class="btn btn-outline-primary btn-sm" onclick="addWordInput()">+</button>
                                    <button type="button" class="btn btn-outline-danger btn-sm" onclick="removeWordInput()">-</button>
                                </td>
                                <td style="width: 30%;">
                                    <label for="language" class="form-label">단어</label>
                                    <select name="language[]" class="form-select" required>
                                        <option value="English">English</option>
                                        <option value="Korean">Korean</option>
                                        <option value="Japanese">Japanese</option>
                                        <option value="Chinese">Chinese</option>
                                        <option value="Russian">Russian</option>
                                        <option value="Spanish">Spanish</option>
                                        <option value="French">French</option>
                                        <option value="German">German</option>
                                    </select>
                                    <input type="text" name="words[]" class="form-control mt-2" placeholder="단어" required>
                                </td>
                                <td style="width: 60%;">
                                    <label for="meanings" class="form-label">의미</label>
                                    <input type="text" name="meanings[]" class="form-control mb-2" placeholder="뜻" required>
                                    <label for="examples" class="form-label">예문</label>
                                    <input type="text" name="examples[]" class="form-control" placeholder="예문">
                                </td>
                            </tr>
                        </table>
                 	</div>
                </div>
                
                <table>
								  <tr>
								    <td>&nbsp;</td>
								    <td style="width: 25%;">
								    	<label for="language" class="form-label">단어</label>
                      <select name="language[]" class="form-select" required>
                          <option value="English">English</option>
                          <option value="Korean">Korean</option>
                          <option value="Japanese">Japanese</option>
                          <option value="Chinese">Chinese</option>
                          <option value="Russian">Russian</option>
                          <option value="Spanish">Spanish</option>
                          <option value="French">French</option>
                          <option value="German">German</option>
                      </select>
								    </td>
								    <td style="width: 60%;">
                    	<label for="meanings" class="form-label">의미</label>
                    </td>
								  </tr>
								  <tr>
								    <td> 
								    	<button type="button" class="btn btn-outline-primary btn-sm" onclick="addWordInput()">+</button>
                    	<button type="button" class="btn btn-outline-danger btn-sm" onclick="removeWordInput()">-</button>
								    </td>
								    <td>
								    	<input type="text" name="words[]" class="form-control mt-2" placeholder="단어" required>
								    </td>
								    <td>
								    	<input type="text" name="meanings[]" class="form-control mb-2" placeholder="뜻" required>
								    </td>
								  </tr>
								  <tr>
								    <td>&nbsp;</td>
								    <td>&nbsp;</td>
								    <td>
								    	<input type="text" name="examples[]" class="form-control" placeholder="예문">
								    </td>
								  </tr>
								</table>
                
                <button class="btn" type="submit">저장</button>
            </form>
        </div>
    </main>
    <jsp:include page="/include/footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
