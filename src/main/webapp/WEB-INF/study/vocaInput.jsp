<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>단어장 등록</title>
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
      color: #5e503f;
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
      color: #5e503f;
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
      color: #5e503f;
    }
    .name-input::placeholder {color:#a2988b;}
    input::placeholder {color:#bbb4ad;}
    .dynamic-inputs .word-input input,
    .dynamic-inputs .word-input select {
      color: #5e503f;
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
      color: #5e503f;
    }
    .dynamic-inputs .word-input {
      display: flex;
      flex-direction: column;
      margin-bottom: 10px;
      color: #5e503f;
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
      /* color: #999; */
      color: #5e503f;
      margin-top: -5px;
    }
    .add-remove-buttons,
    .save-button {
      display: inline-block.
    }
    /* .buttons-container {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-top: 20px;
    }
    .button {
      display: flex;
      justify-content: left; /* 버튼을 왼쪽으로 정렬 
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
      background-color: #f0edca; /* 테두리 안의 배경색  
    } */
    a {
      text-decoration: none;
    }
    a:hover {
      text-decoration: none;
    }
    
    .buttons-container {
      display: flex;
      justify-content: center;
      align-items: center;
      margin-top: 20px;
    }
    .button {
      display: flex;
      justify-content: center;
      font-family: 'NEXON Lv1 Gothic OTF';
      border: 1.2px solid #6d5a46;
      border-radius: 30px;
      background-color: #fdfad1;
      color: #6d5a46;
      padding: 5px 15px;
      display: inline-block;
      font-size: 1.3em;
      cursor: pointer;
    }
    .button:hover {
      transform: scale(1.02);
      color: #6d5a46;
      background-color: #f0edca; /* 테두리 안의 배경색 */
    }
    .btnTest {
      padding: 13px 18px;
      background-color: #35ae5f;
      color: #fefef4;
      border: 1px solid #35ae5f;
      cursor: pointer;
      padding: 10px 20px;
      text-decoration: none;
    }
    .btnBack {
      padding: 13px 18px;
      background-color: #fefef4;
      color: #379b5b;
      border: 1px solid #35ae5f;
      text-decoration: none;
      cursor: pointer;
    }
    .btnBack:hover {
      color: #379b5b;
      text-decoration: none;
      background-color: #edede2;
    }
    .btnTest:hover {
      text-decoration: none;
      color: #fefef4;
      background-color: #379866;
    }
    .test-section {
      text-align: center;
      margin-bottom: 20px;
    }
    .add-remove-buttons {
    	 justify-content: left;
    }
    .add-remove-buttons a {
      font-family: 'NEXON Lv1 Gothic OTF';
      color: #35ae5f;
      cursor: pointer;
      font-size: 2em;
      margin-right: 10px;
    }
    .add-remove-buttons a:hover {
      color: #379866;
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
		  else if (category.trim() == "") {
		    alert('단어장 이름을 입력해주세요.');
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
      <h1>단어장 등록</h1>
    </div>
    <div class="card">
      <form name="myform" action="VocaInputOk.st" method="POST">
        <div class="input-group">
          <input type="text" name="category" id="category" placeholder="단어장 이름을 입력하세요 (예: 여행 회화 필수 단어)" class="form-control name-input" required />
          <input type="hidden" name="mid" id="mid" value="${sMid}" />
          <input type="hidden" name="wordsStr" />
          <input type="hidden" name="meaningsStr" />
        </div>
        <div class="note mb-4"> * 단어의 품사를 입력할 때는 뜻 앞에 품사를 입력 후 ')'를 써주시면 됩니다.</div>
        <div class="dynamic-inputs">
          <div class="word-input">
            <table>
              <tr>
                <td class="count" style="color: #7a6856;">1</td>
                <td style="width: 30%;"><input type="text" name="words[]" placeholder="friends" required></td>
                <td style="width: 70%;"><input type="text" name="meanings[]" placeholder="명사) 친구" required></td>
              </tr>
              <tr>
                <td class="count" style="color: #7a6856;">2</td>
                <td style="width: 30%;"><input type="text" name="words[]" placeholder="단어" required></td>
                <td style="width: 70%;"><input type="text" name="meanings[]" placeholder="뜻" required></td>
              </tr>
            	<tr>
                <td class="count" style="color: #7a6856;">3</td>
                <td style="width: 30%;"><input type="text" name="words[]" placeholder="단어" required></td>
                <td style="width: 70%;"><input type="text" name="meanings[]" placeholder="뜻" required></td>
              </tr>
              <tr>	
                <td class="count" style="color: #7a6856;">4</td>
                <td style="width: 30%;"><input type="text" name="words[]" placeholder="단어" required></td>
                <td style="width: 70%;"><input type="text" name="meanings[]" placeholder="뜻" required></td>
              </tr>
              <tr>
                <td class="count" style="color: #7a6856;">5</td>
                <td style="width: 30%;"><input type="text" name="words[]" placeholder="단어" required></td>
                <td style="width: 70%;"><input type="text" name="meanings[]" placeholder="뜻" required></td>
              </tr> 
            </table>
          </div>
        </div>
       <!--  <div class="buttons-container mt-5">
          <div class="add-remove-buttons">
            <button type="button" class="btn btn-success" onclick="addWordInput()"><i class="fa-solid fa-plus"></i></button>
            <button type="button" class="btn btn-success" onclick="removeWordInput()"><i class="fa-solid fa-minus"></i></button>
          </div>
          <div class="save-button">
					<button class="btn btn-success" type="button" onclick="fCheck()">저장하기</button>  
            <button class="btn btn-success" type="submit" >저장하기</button>
          </div>
        </div> -->
        <div class="add-remove-buttons">
          <a onclick="addWordInput()">+</a>
          <a onclick="removeWordInput()">-</a>
        </div>
      	<div class="buttons-container mt-5">
          <div class="test-section" style="text-align: center;">
            <a onclick="fCheck()" class="btnTest mr-1 ">저장하기</a>
            <!-- <a href="VocaMain.st" class="btnBack">돌아가기</a> -->
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
	