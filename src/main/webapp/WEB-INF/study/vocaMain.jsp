<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>단어장</title>
    <%@ include file="/include/bs4.jsp" %>
    <link href="css/styles.css" rel="stylesheet" />
    <style>
      @font-face {
        font-family: 'CWDangamAsac-Bold';
        src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/CWDangamAsac-Bold.woff') format('woff');
        font-weight: normal;
        font-style: normal;
      }
      body {
        font-family: 'NEXON Lv1 Gothic OTF';
        /* background-color: #f5f5f5; */
        color: #7a6856;
        min-height: 100vh; /* 화면 높이에 맞추기 위해 추가 */
        display: flex;
        flex-direction: column;
      }
      .container {
	      max-width: 800px;
	      margin: auto;
	      padding: 20px;
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
        background-color: #ffffff;
      }
      .card h3 {
        font-family: 'CWDangamAsac-Bold';
        color: #36b574;
        margin-bottom: 20px;
      }
      .word-list li {
        margin-bottom: 10px;
        color: #6f5340;
      }
      .btnContainer {
        display: flex;
        justify-content: space-between; /* 요소를 양 끝에 배치 */
      }
      .btn {
        padding: 10px 15px;
        background-color: #35ae5f;
        color: #fff;
        border: none;
        border-radius: 5px;
        text-decoration: none;
      }
      .btn:hover {
        background-color: #379866;
      }
      .vocab-list {
        list-style: none;
        padding: 0;
      }
      .vocab-item {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 10px;
        border-bottom: 1px solid #ddd;
      }
      .vocab-item:last-child {
        border-bottom: none;
      }
      .vocab-category {
        font-size: 16px;
        font-weight: bold;
        color: #35ae5f;
      }
      .vocab-details {
        flex: 1;
        margin-left: 20px;
      }
      .lock-icon {
        color: #888;
      }
      .no-vocab-msg {
        text-align: center;
        color: #7f776d;
        font-style: italic;
        font-family: 'NEXON Lv1 Gothic OTF';
        margin: 20px;
      }
      .action-btns {
        display: flex;
        gap: 5px;
      }
      .action-btns .btn {
        padding: 5px 10px;
        font-size: 0.9em;
        border: none;
        border-radius: 5px;
        text-decoration: none;
        color: #fff;
        cursor: pointer;
      }
      .action-btns .btn-edit {
        background-color: #ece8b6;
        color: #5e5c3f; /* 검은 글자 색상 */
      }
      .action-btns .btn-edit:hover {
        background-color: #e0ddb1;
      }
      .action-btns .btn-delete {
        background-color: #f8d7da;
        color: #721c24; /* 어두운 빨강 글자 색상 */
      }
      .action-btns .btn-delete:hover {
        background-color: #f1b0b7;
      }
      .highlight {
        background-color: #fdfad1;
        padding: 2px 4px;
      }
      .Abtn-delete {
        background-color: #39b766;
        color: #ffffff;  
        padding: 5px 10px;
        /* font-size: 0.9em; */
        border: none;
        border-radius: 3px; 
        text-decoration: none;
        cursor: pointer;
      }
      .Abtn-delete:hover {
        color: #ffffff;  
        background-color: #35a95e;
        text-decoration: none;
      }
      a {
        text-decoration: none;
        color: #5e503f;
      }
      a:hover {
        color: #333;
      }
      main.container {
        flex: 1;
      }
    </style>
    <script>
      'use strict';
      
      // 전체선택/취소
      function toggleAllCheckboxes(source) {
        const checkboxes = document.querySelectorAll('input[name="vocaCheckbox"]');
        checkboxes.forEach(checkbox => checkbox.checked = source.checked);
      }
      
      function vocasDeleteOk() {
        let selectVocaArray = '';
        const checkboxes = document.querySelectorAll('input[name="vocaCheckbox"]:checked');
        
        checkboxes.forEach(checkbox => {
          selectVocaArray += checkbox.value + "/";
        });
      
        if(selectVocaArray === '') {
          alert("삭제할 단어장을 한 개 이상 선택하세요");
          return false;
        }
      
        let ans = confirm("선택하신 단어장을 삭제하시겠습니까?");
        if(!ans) return false;
      
        selectVocaArray = selectVocaArray.slice(0, -1);
        let query = {
          selectVocaArray: selectVocaArray
        };
      
        $.ajax({
          url: "VocaDeleteOk.st",
          type: "post",
          data: query,
          success: function(res) {
            if(res !== "0") { 
              alert("선택하신 단어장이 삭제되었습니다");
              location.reload();
            } else {
              alert("단어장 삭제에 실패했습니다");
            }
          },
          error: function() {
            alert("전송 실패");
          }
        });
      }
      
      function vocaDeleteOk(category) {
        let ans = confirm("선택하신 단어장을 삭제하시겠습니까?");
        if(!ans) return false;
      
        $.ajax({
          url: "VocaDeleteOk.st",
          type: "post",
          data: {category : category},
          success: function(res) {
            if(res !== "0") { 
              alert("선택하신 단어장이 삭제되었습니다");
              location.reload();
            } else {
              alert("단어장 삭제에 실패했습니다");
            }
          },
          error: function() {
            alert("전송 실패");
          }
        });
      }
    </script>
  </head>
  <jsp:include page="/include/nav.jsp" />
  <body>
    <main class="container">
      <p><br/></p>
      <div class="dashboard-header">
        <c:if test="${empty memberMid}"><h1>단 어 장</h1></c:if>
        <c:if test="${!empty memberMid}"><h1>${memberMid}님의 단어장</h1></c:if>
      </div>
      <div class="btnContainer mb-2">
        <c:if test="${empty memberMid}">
          <a class="newVoca" href="VocaInput.st"><i class="fa-solid fa-plus"></i> 새 단어장 만들기</a>
          <div class="text-right">
            <input class="form-check-input" type="checkbox" id="selectAll" onclick="toggleAllCheckboxes(this)">
            <label class="form-check-label" for="selectAll">전체선택/취소</label>
            <a class="Abtn-delete ml-2" onclick="vocasDeleteOk()">선택 삭제</a>
          </div>
        </c:if>
      </div>
      <div class="card">
        <c:if test="${empty vos}">
          <c:if test="${empty memberMid}">
            <div class="no-vocab-msg">
              <p><br/></p>
              아직 단어장이 없습니다. '새 단어장 만들기'를 클릭하여 첫 번째 단어장을 만들어보세요 :)
              <p><br/></p>
            </div>
          </c:if>
          <c:if test="${!empty memberMid}">
            <div class="no-vocab-msg">
              <p><br/></p>
              생성한 단어장이 없습니다.
              <p><br/></p>
            </div>
          </c:if>
        </c:if>
        <c:if test="${! empty vos}">
          <ul class="vocab-list">
            <c:forEach var="vo" items="${vos}" varStatus="st">
              <li class="vocab-item">
                <c:if test="${empty memberMid}">
                  <input type="checkbox" name="vocaCheckbox" value="${vo.category}">
                  <div class="vocab-category">
                    <a href="VocaDetail.st?category=${vo.category}" class="highlight"> ${vo.category}</a>
                  </div>
                </c:if>
                <c:if test="${!empty memberMid}">
                  <div class="vocab-category">
                    <a href="VocaDetail.st?category=${vo.category}&memberMid=${memberMid}"  class="highlight"> ${vo.category}</a>
                  </div>
                </c:if>
                <div class="vocab-details">
                  <span>${vo.wordCnt} 단어</span>
                </div>
                <c:if test="${empty memberMid}">
                  <div class="action-btns">
                    <a class="btn btn-edit" href="VocaEdit.st?category=${vo.category}">수정</a>
                    <a class="btn btn-delete" onclick="vocaDeleteOk('${vo.category}')">삭제</a>
                  </div>
                </c:if>
              </li>
            </c:forEach>
          </ul>
        </c:if>
      </div>
      <p><br/></p>
    </main>
    <!-- Footer-->
    <jsp:include page="/include/footer.jsp" />
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
