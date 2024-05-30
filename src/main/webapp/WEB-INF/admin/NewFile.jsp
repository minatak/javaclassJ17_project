<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>전체 회원 리스트</title>
  <%@ include file="/include/bs4.jsp" %>
  <style>
    @font-face {
      font-family: 'NEXON Lv1 Gothic OTF';
      src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
      font-weight: normal;
      font-style: normal;
    }
    @font-face {
      font-family: 'CWDangamAsac-Bold';
      src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/CWDangamAsac-Bold.woff') format('woff');
      font-weight: normal;
      font-style: normal;
    }
    body {
      font-family: 'NEXON Lv1 Gothic OTF';
      background-color: #fefefe;
      margin: 0;
      padding: 0;
    }
    .container {
      width: 80%;
      margin: 0 auto;
      padding: 20px;
      font-family: 'NEXON Lv1 Gothic OTF';
      color: #5e503f;
    }
    h1, h3 {
      font-family: 'CWDangamAsac-Bold';
      color: #35ae5f; 
      text-align: center;
    }
    .admin-section {
      margin-bottom: 30px;
    }
    .admin-section h2 {
      font-size: 1.5em;
    }
    a {
      text-decoration: none;
      color: #534737;
      font-family: 'NEXON Lv1 Gothic OTF';
      background-color: #fdfad1;
      padding: 2px 4px;
    }
    a:hover {
      color: #534737;
      background-color: #fdfad1;
      padding: 2px 4px;
    }
    .admin-table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 40px;
      color: #5e503f;
    }
    .admin-table th, .admin-table td {
      border: 1px solid #ddd;
      padding: 8px;
      text-align: center;
      font-family: 'NEXON Lv1 Gothic OTF';
    }
    .admin-table th {
      background-color: #fdfad1;
      color: #5e503f;
    }
    .myBadge {
      background-color: #39b766;
      color: #ffffff;
    }
    .myBadge:hover {
      background-color: #3ca963;
      color: #fefefe;
    }
    .myBtn {
      padding: 5px 13px;
      border: none;
      background-color: #e0dac3;
      font-size: 14px;
      color: #5e503f; /* 색상 앞에 # 추가 */
      border: 1px solid #5e503f;
      border-radius: 15px; 
      cursor: pointer;
      transition: background-color 0.3s, color 0.3s;
    }
    .myBtn:hover {
      background-color: #cec9b7;
      color: #322d27;
    }
  </style>
  <script>
    'use strict';
    
    $(function(){
      $("#userDispaly").hide();
      
      $("#userInfor").on("click", function(){
        if($("#userInfor").is(':checked')) {
          $("#totalList").hide();
          $("#userDispaly").show();
        }
        else {
          $("#totalList").show();
          $("#userDispaly").hide();
        }
      });
    });
  </script>
</head>
<body>
  <jsp:include page="/include/nav.jsp" />
  <div class="container mt-4">
    <c:if test="${sLevel == 0}">
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="checkbox" name="userInfor" id="userInfor" />
        <label class="form-check-label" for="userInfor">숨김처리 회원 모아보기 / 전체회원 보기</label>
      </div>
      <hr/>
    </c:if>
    <div id="totalList">
      <h3>전체 회원 리스트</h3>
      <table class="table table-striped table-hover mt-3 admin-table">
        <thead class="table-dark">
          <tr>
            <th>번호</th>
            <th>아이디</th>
            <th>닉네임</th>
            <th>성명</th>
            <th>생일</th>
            <th>성별</th>
            <th>거주국</th>
            <th>학습언어</th>
            <th>최종방문일</th>
            <th>활동여부</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="vo" items="${vos}" varStatus="st">
            <c:if test="${vo.level == 99}"><c:set var="active" value="탈퇴신청"/></c:if>
            <c:if test="${vo.level != 99}"><c:set var="active" value="활동중"/></c:if>
            <tr>
              <td>${vo.idx}</td>
              <td><a href="adminEditU.mem?mid=${vo.mid}">${vo.mid}</a></td>
              <td>${vo.nickName}</td>
              <td>${vo.name}</td>
              <td>${fn:substring(vo.birthday,0,10)}</td>
              <td>${vo.gender}</td>
              <td>${vo.country}</td>
              <td>${vo.learningLanguage}</td>
              <td>${fn:substring(vo.lastDate,0,10)}</td>
              <td>
                <c:if test="${vo.level == 99}"><font color="red"><b>${active}</b></font></c:if>
                <c:if test="${vo.level != 99}">${active}</c:if>
              </td>
            </tr>
          </c:forEach>
          <tr><td colspan="10" class="m-0 p-0"></td></tr>
        </tbody>
      </table>
    </div>
    <div id="userDispaly">
      <c:if test="${userDel == 'OK'}">
        <h3>숨김 처리한 회원 리스트</h3>
        <table class="table table-striped table-hover mt-3 admin-table">
          <thead class="table-dark">
            <tr>
              <th>번호</th>
              <th>아이디</th>
              <th>닉네임</th>
              <th>성명</th>
              <th>생일</th>
              <th>성별</th>
              <th>거주국</th>
              <th>모국어</th>
              <th>학습언어</th>
              <th>언어실력</th>
              <th>최종방문일</th>
              <th>활동여부</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="vo" items="${vos}" varStatus="st">
              <c:if test="${vo.userInfor == '비공개'}">
                <tr>
                  <td>${vo.idx}</td>
                  <td><a href="MemberSearch.mem?mid=${vo.mid}">${vo.mid}</a></td>
                  <td>${vo.nickName}</td>
                  <td>${vo.name}</td>
                  <td>${fn:substring(vo.birthday,0,10)}</td>
                  <td>${vo.gender}</td>
                  <td>${vo.country}</td>
                  <td>${vo.nativeLanguage}</td>
                  <td>${vo.learningLanguage}</td>
                  <td>${vo.languageLevel}</td>
                  <td>${fn:substring(vo.lastDate,0,10)}</td>
                  <td>
                    <c:if test="${vo.level == 99}"><font color="red"><b>${active}</b></font></c:if>
                    <c:if test="${vo.level != 99}">${active}</c:if>
                  </td>
                </tr>  
              </c:if>
            </c:forEach>
            <tr><td colspan="12" class="m-0 p-0"></td></tr>
          </tbody>
        </table>
      </c:if>
    </div>
    <!-- 블록페이지 시작 -->
    <div class="text-center">
      <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
          <li class="page-item"><a class="page-link" href="${ctp}/adminPage.mem?pag=1&pageSize=${pageSize}">첫페이지</a></li>
          <c:if test="${(pag - 1) > 0}">
            <li class="page-item"><a class="page-link" href="${ctp}/adminPage.mem?pag=${pag-1}&pageSize=${pageSize}">이전</a></li>
          </c:if>
          <c:forEach var="i" begin="${blockStart}" end="${blockEnd}">
            <c:choose>
              <c:when test="${i == pag}">
                <li class="page-item active" aria-current="page"><span class="page-link">${i}</span></li>
              </c:when>
              <c:otherwise>
                <li class="page-item"><a class="page-link" href="${ctp}/adminPage.mem?pag=${i}&pageSize=${pageSize}">${i}</a></li>
              </c:otherwise>
            </c:choose>
          </c:forEach>
          <c:if test="${(pag < totPage)}">
            <li class="page-item"><a class="page-link" href="${ctp}/adminPage.mem?pag=${pag+1}&pageSize=${pageSize}">다음</a></li>
          </c:if>
          <li class="page-item"><a class="page-link" href="${ctp}/adminPage.mem?pag=${totPage}&pageSize=${pageSize}">끝페이지</a></li>
        </ul>
      </nav>
    </div>
    <!-- 블록페이지 끝 -->
  </div>
  <jsp:include page="/include/footer.jsp" />
</body>
</html>
