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
  <link href="${ctp}/css/styles.css" rel="stylesheet" />
  <style>
    @font-face {
		  font-family: 'CWDangamAsac-Bold';
		  src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/CWDangamAsac-Bold.woff') format('woff');
		  font-weight: normal;
		  font-style: normal;
		}
    body {
      font-family: 'NEXON Lv1 Gothic OTF', sans-serif;
      background-color: #fefefe;
      font-size: 16px;
      margin: 0;
      padding: 0;
    }
    .container {
      max-width: 800px;
      margin: auto;
      padding: 20px;
    }
    .dashboard-header {
      text-align: center;
      margin-bottom: 30px;
      position: relative;
    }
    .dashboard-header h1 {
      display: inline-block;
      font-family: 'CWDangamAsac-Bold', sans-serif;
      color: #35ae5f;
      margin: 0;
    }
    .action-btns {
      position: absolute;
      top: 50%;
      right: 0;
     /* transform: translateY(-50%); */
    }
    .action-btns a {
      font-size: 14px;
      color: #fff;
      background-color: #35ae5f;
      padding: 5px 10px;
      border-radius: 3px;
      text-decoration: none;
      margin-left: 5px;
    }
    .action-btns a.btn-edit {
      background-color: #ece8b6;
      color: #5e5c3f;
    }
    .action-btns a.btn-delete {
      background-color: #f8d7da;
      color: #721c24; 
    }
    .action-btns .btn-edit:hover {
		  background-color: #e0ddb1;
		}
		.action-btns .btn-delete:hover {
		  background-color: #f1b0b7;
		}
    .card {
      padding: 20px;
      margin-bottom: 20px;
      border: 1px solid #ddd;
      border-radius: 8px;
      background-color: #fefefe;
      /* box-shadow: 0 4px 8px rgba(0,0,0,0.1); */
    }
    .word-list {
      list-style: none;
      padding: 0;
      font-size: 18px;
    }
    .word-list li {
      margin-bottom: 15px;
      padding: 10px;
      border-bottom: 1px solid #ddd;
      color: #6f5340;
    }
    .part-of-speech {
      display: inline-block;
      background-color: #d4edda;
      color: #155724;
      padding: 2px 6px;
      border-radius: 4px;
      font-size: 14px;
      margin-left: 5px;
    }
    .btnTest {
      padding: 13px 18px;
      background-color: #35ae5f;
      color: #fefef4;
      border: 1px solid #35ae5f;
      cursor: pointer;
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
    .test-section form {
      display: inline-block;
    }
    
  </style>
  <script>
  	'use strict';
  	
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
		        location.href = "VocaMain.st";
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
	<p><br/></p>
  <main class="container">
    <div class="dashboard-header">
      <h1>${category}</h1>
      <br/>
      <c:if test="${empty memberMid}">
	      <div class="action-btns">
	        <a class="btn btn-edit" href="${ctp}/VocaEdit.st?category=${category}">수정</a>
	      	<a class="btn btn-delete" onclick="vocaDeleteOk('${category}')">삭제</a>
	       <%--  <a class="btn btn-delete" href="${ctp}/VocaDelete.st?idx=${category}">삭제</a> --%>
	      </div>
      </c:if>
    </div>
    
    <div class="card mb-5">
      <ul class="word-list">
        <c:forEach var="vo" items="${vos}" varStatus="st">
          <li>
            <strong>${vo.word}</strong> : 
            <c:if test="${!empty vo.partOfSpeech}">
              <span class="part-of-speech">${vo.partOfSpeech}</span>
            </c:if>
            ${vo.meaning}
          </li>
        </c:forEach>
      </ul>
    </div>

    <div class="test-section">
      <form action="${ctp}/vocabTest.jsp" method="GET">
        <!-- <button class="btnTest" type="submit">단어 테스트</button> -->
      </form>
      <c:if test="${empty memberMid}">
        <a href="VocaTest.st?wordMid=${sMid}&category=${category}" class="btnTest mr-1">단어 테스트</a>
        <a href="VocaMain.st" class="btnBack">돌아가기</a>
      </c:if>
      <c:if test="${!empty memberMid}">
        <a href="VocaTest.st?wordMid=${memberMid}&category=${category}" class="btnTest mr-1">단어 테스트</a>
        <a href="VocaMain.st?memberMid=${memberMid}" class="btnBack">돌아가기</a>
      </c:if>
    </div>
  </main>
  <p><br/></p>
  <!-- Footer-->
  <jsp:include page="/include/footer.jsp" />
  <!-- Bootstrap core JS-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
