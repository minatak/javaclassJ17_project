<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원 검색 리스트</title>
  <%@ include file="/include/bs4.jsp" %>
  <link href="${ctp}/css/styles.css" rel="stylesheet" />
  <link href="${ctp}/css/join.css" rel="stylesheet" />
  <style>
    .container {
      max-width: 900px;
      margin: 0 auto;
      padding: 20px;
      font-family: 'NEXON Lv1 Gothic OTF';
      color:#7a6856;
    }
    .container member-card {
      max-width: 900px;
      margin: 0 auto;
      padding: 20px;
      font-family: 'NEXON Lv1 Gothic OTF';
      font-size: 14px;
    }
    h1 {
      text-align: center;
      margin-bottom: 30px;
      font-family: 'CWDangamAsac-Bold';
      color: #35ae5f;
    }
    h5 {
      color: #6d5a46;
    }
    .highlight {
    	background-color: #fdfad1;
      padding: 2px 4px;
    }
    .search-bar {
      text-align: center;
      margin-bottom: 20px;
    }
    .search-bar input[type="text"] {
      width: 70%;
      padding: 10px;
      margin-right: 10px;
      border: 1px solid #35ae5f;
      border-radius: 4px;
    }
    .searchButton {
      padding: 5px 15px;
      border: none;
      background-color: #35ae5f;
      color: white;
      border-radius: 4px;
      cursor: pointer;
    }
    .search-bar select {
	    width: 13%;
	    padding: 5px;
	   /*  margin-right: 5px; */
	    border: 1px solid #35ae5f;
	    border-radius: 4px;
	   /*  appearance: none; /* 기본 셀렉트 박스 스타일을 없앰 */ */
	    -webkit-appearance: none;
	    -moz-appearance: none;
	    text-align: center;
	  }
    .search-bar span {
	    color: #8f7252;
	  }
    .member-card {
      display: flex;
      border: 1px solid #ddd;
      border-radius: 8px;
      padding: 20px;
      margin: 20px;
      /* margin-bottom: 20px; */
      background-color: #fff;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      cursor: pointer;
      transition: transform 0.2s;
    }
    .member-card:hover {
      transform: scale(1.02);
    }
    .profile-photo {
      width: 100px;
      height: 100px;
      border-radius: 50%;
      margin-right: 20px;
      object-fit: cover;
    }
   /*  .member-info {
      flex: 1;
    } */
    .member-info p {
      margin: 5px 0;
    }
    .member-info a {
      text-decoration: none;
      color: #333;
    }
    .member-info a:hover {
      text-decoration: underline;
    }
    .languages {
      display: flex;
      align-items: center;
     /*  margin-bottom: 10px; */
    }
    .languages span {
      border: 1px solid #ddd;
      border-radius: 4px;
      padding: 5px;
    }
     p img {
      width: 25px;
      height: auto; /* 원본 비율 유지 */
      /* border-radius: 4px; */
     /*  margin: 0 5px; */
    }
    .languages img {
      width: 30px;
      height: auto; /* 원본 비율 유지 */
      /* border: 1px solid #ddd; /* 테두리 추가 */ */
      border-radius: 4px;
      margin: 0 5px;
    }
    .member-info > p, .languages {
      margin-bottom: 10px; /* 태그 간 여백 추가 */
    }
  </style>
  <script>
    'use strict';
    
    function pageSizeCheck() {
    	let pageSize = $("#pageSize").val();
    	location.href = "MemberList.mem?pageSize="+pageSize;
    }
    
    // 회원 선택 조회
    function updateSearchBox() {
      var searchType = document.getElementById("search").value;
      var languageSelect = document.getElementById("languageSelect");
      var countrySelect = document.getElementById("countrySelect");

      if (searchType === "nativeLanguage" || searchType === "learningLanguage") {
        languageSelect.style.display = "inline";
        countrySelect.style.display = "none";
      } else if (searchType === "country") {
        languageSelect.style.display = "none";
        countrySelect.style.display = "inline";
      }
    }
    
	</script> 
</head>
<jsp:include page="/include/nav.jsp" />
<body>
  <main class="container">
    <div class="container">
      <h1>회원 검색 리스트</h1>
      <c:if test="${!empty sMid}"><font color="blue">${search}</font>가 <font color="blue">${select}</font>인 값을 검색한 결과 <font color="red"><b>${searchCnt}</b></font> 건의 게시글이 검색되었습니다.</c:if>
      <c:forEach var="vo" items="${vos}" varStatus="st">
        <div class="member-card" onclick="location.href='${ctp}/MemberProfile.mem?mid=${vo.mid}'">
          <img src="${ctp}/images/member/${vo.photo}" class="profile-photo" />
          <div class="member-info">
            <a href="${ctp}/MemberProfile.mem?mid=${vo.mid}">  
              <h5><b class="highlight">${vo.nickName}</b></h5>
            </a>
            <p><img src="${ctp}/images/flag/${vo.myFlag}">
	            <c:if test="${!empty vo.city}">${vo.city}, ${vo.country}</c:if>
	            <c:if test="${empty vo.city}">${vo.country}</c:if>
            </p>
            <div class="languages">
              <p>
              	<span>모국어: ${vo.nativeLanguage} <img src="${ctp}/images/flag/${vo.myLangFlag}" alt="Native Language Flag" /></span>
              	 ↔ 
              	<span>학습할 언어: ${vo.learningLanguage} <img src="${ctp}/images/flag/${vo.wantLangFlag}" alt="Learning Language Flag" /></span>
            	</p>
            </div>
            <p>${vo.content}</p>
          </div>
        </div>
      </c:forEach>
      <input type="button" value="돌아가기" onclick="location.href='MemberList.mem';" class="btn searchButton"/>
     	<!-- 블록페이지 시작 -->
			<div class="text-center">
			  <ul class="pagination justify-content-center">
				  <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/MemberList.mem?pag=1&pageSize=${pageSize}">첫페이지</a></li></c:if>
				  <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/MemberList.mem?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}">이전블록</a></li></c:if>
				  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize) + blockSize}" varStatus="st">
				    <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/MemberList.mem?pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
				    <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/MemberList.mem?pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
				  </c:forEach>
				  <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/MemberList.mem?pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}">다음블록</a></li></c:if>
				  <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/MemberList.mem?pag=${totPage}&pageSize=${pageSize}">마지막페이지</a></li></c:if>
			  </ul>
			</div>
			<!-- 블록페이지 끝 -->
	    
	    
	    
	  </div> <!-- container -->
  </main>
  <p><br/></p>
  <!-- Footer-->
  <jsp:include page="/include/footer.jsp" />
  <!-- Bootstrap core JS-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
