<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>단어장 수정</title>
  <%@ include file="/include/bs4.jsp" %>
  <link href="${ctp}/css/styles.css" rel="stylesheet" />
  <style>
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
    body {
      font-family: 'NEXON Lv1 Gothic OTF';
      /* background-color: #f3f4f6; */
    }
    .dashboard-header {
      text-align: center;
      margin-bottom: 30px;
    }
    h1, h3 {
      font-family: 'CWDangamAsac-Bold';
      color: #35ae5f;
    }
    .card {
      padding: 15px;
      margin-bottom: 20px;
      border: none; /* 카드에 선 제거 */
      /* background-color: #fefefe; */
    }
    .input-group {
      margin-bottom: 15px;
      /* display: flex; */
      align-items: center;
      font-size: 20px; /* 제목 입력란 크기 키움 */
    }
    .note {
      font-size: 0.9em;
      color: #7a6856;
      /* margin-top: -15px; */
    }
    .name-input {
      flex: 3; /* 75% */
      font-size: 1.3em; /* 제목 입력란 크기 키움 */
      padding: 25px; /* 내부 여백 추가 */
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
    .add-remove-buttons,
    .save-button {
      display: inline-block.
    }
    .buttons-container {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-top: 20px;
    }
    .button {
      display: flex;
      justify-content: left; /* 버튼을 왼쪽으로 정렬 */
      font-family: 'NEXON Lv1 Gothic OTF';
      border: 1.2px solid #6d5a46;
      border-radius: 30px;
      background-color: #fdfad1;
      color: #6d5a46;
      padding: 5px 15px;
      display: inline-block;
      font-size: 1.3em;
      cursor: pointer.
    }
    .button:hover {
      transform: scale(1.02);
      color: #6d5a46;
      background-color: #f0edca; /* 테두리 안의 배경색 */
    }
    a {
      text-decoration: none;
    }
    a:hover {
      text-decoration: none;
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
          <td class="count" style="color: #7a6856;">${count}</td>
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
    
  	function fCheck() {
		  const form = document.forms['myform'];
		  const category = form['category'].value;
		  const words = form['words[]'];
		  const meanings = form['meanings[]'];
		  let wordsStr = '';
		  let meaningsStr = '';
	
		  if (category.trim().length > 50) {
		    alert('단어장 이름은 50자 이하로 입력해주세요.');
		    form['category'].focus();
		    return false;
		  }
	
			for (let i = 0; i < words.length; i++) {
		    if (words[i].value.trim().length === 0) {
		      alert('단어를 입력해주세요.');
		      words[i].focus();
		      return false;
		    }
		    if (words[i].value.length > 100) {
		      alert('단어는 100자 이하로 입력해주세요.');
		      words[i].focus();
		      return false;
		    }
		    if (meanings[i].value.trim().length === 0) {
		      alert('뜻을 입력해주세요.');
		      meanings[i].focus();
		      return false;
		    }
		    if (meanings[i].value.length > 100) {
		      alert('뜻은 100자 이하로 입력해주세요.');
		      meanings[i].focus();
		      return false;
		    }
		    if ((meanings[i].value.match(/\)/g) || []).length > 1) {
		      alert('뜻에 괄호는 포함할 수 없습니다.');
		      meanings[i].focus();
		      return false;
		    }
		    if (meanings[i].value.includes('/')) {
		      alert('뜻에 슬래시(/)를 사용할 수 없습니다.');
		      meanings[i].focus();
		      return false;
		    }
		    wordsStr += words[i].value + '/';
		    meaningsStr += meanings[i].value + '/';
			}
			
			form['wordsStr'].value = wordsStr.slice(0, -1);
		  form['meaningsStr'].value = meaningsStr.slice(0, -1);
		  form.submit();
  	}
  </script>
</head>
<body>
  <jsp:include page="/include/nav.jsp" />
  <main class="container">
    <p><br/></p>
      <div class="dashboard-header">
      <h1>단어장 수정</h1>
    </div>
    <div class="card">
      <form name="myform" action="VocaUpdateOk.st" method="POST">
        <div class="input-group">
          <input type="text" value="${vo.category}" name="category" id="category" placeholder="단어장 이름을 입력하세요 (예: 여행 회화 필수 단어)" class="form-control name-input" required />
          <input type="hidden" name="mid" id="mid" value="${sMid}" />
          <input type="hidden" name="wordsStr" />
          <input type="hidden" name="meaningsStr" />
        </div>
        <div class="note mb-3 mt-1"> * 단어의 품사를 입력할 때는 뜻 앞에 품사를 입력 후 ')'를 써주시면 됩니다.</div>
        <div class="dynamic-inputs">
          <div class="word-input">
            <table>
            	<c:set var="wordCnt" value="${wordCnt}" />
				      <c:forEach var="vo" items="${vos}" varStatus="st">
	              <tr>
	                <td class="count" style="color: #7a6856;">${wordCnt}</td>
	                <td style="width: 30%;"><input type="text" name="words[]" placeholder="단어" value="${vo.word}"></td>
	                <td style="width: 60%;"><input type="text" name="meanings[]" placeholder="뜻" value="${vo.partOfSpeech})${vo.meaning}"></td>
	                <td style="width: 10%;"><input type="button" onclick="removeWordInput()" value="삭제"></td>
	              </tr>
              </c:forEach>
            </table>
          </div>
        </div>
        <div class="buttons-container mt-5">
          <div class="add-remove-buttons">
            <button type="button" class="btn btn-success" onclick="addWordInput()">+</button>
            <button type="button" class="btn btn-success" onclick="removeWordInput()">-</button>
          </div>
          <div class="save-button">
					<button class="btn btn-success" type="button" onclick="fCheck()">저장하기</button>  
          </div>
        </div>
      </form>
    </div>
    <p><br/></p>
  </main>
  <jsp:include page="/include/footer.jsp" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
	