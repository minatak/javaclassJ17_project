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
        /* justify-content: flex-end; */
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
	      color: #888;
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
			  background-color: #ccd5ae;
			  color: #333; /* 검은 글자 색상 */
			}
			
			.action-btns .btn-edit:hover {
			  background-color: #a3b18a;
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
	      a {
	      text-decoration: none;
	      color: #333;
	    }
	      a:hover {
	      /* text-decoration: none; */
	      color: #333;
	     /*  text-decoration: underline; */
	    }
    </style>
  </head>
  <jsp:include page="/include/nav.jsp" />
  <body>
    <main class="container">
      <p><br/></p>
      <div class="dashboard-header">
        <h1>단 어 장</h1>
      </div>
      <div class="btnContainer mb-2">
        <a class="newVoca" href="VocaInput.st"><i class="fa-solid fa-plus"></i> 새 단어장 만들기</a>
      </div>
      <div class="card">
      <c:if test="${empty vos}">
        <div class="no-vocab-msg">
          아직 단어장이 없습니다. '새 단어장 만들기'를 클릭하여 첫 번째 단어장을 만들어보세요 :)
        </div>
      </c:if>
      <c:if test="${! empty vos}">
        <ul class="vocab-list">
          <c:forEach var="vo" items="${vos}" varStatus="st">
            <li class="vocab-item">
              <input type="checkbox" name="vocaCheckbox" value="${vo.category}">
              <div class="vocab-category">
                <a href="VocaDetail.st?category=${vo.category}" class="highlight"> ${vo.category}</a>
              </div>
              <div class="vocab-details">
                <span>${vo.wordCnt} 단어</span>
              </div>
              <div class="action-btns">
							  <a class="btn btn-edit" href="VocaEdit.st?idx=${vo.idx}">수정</a>
							  <a class="btn btn-delete" href="VocaDelete.st?idx=${vo.idx}">삭제</a>
							</div>
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
