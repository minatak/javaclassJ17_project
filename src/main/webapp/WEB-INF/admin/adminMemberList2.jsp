<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>memberList.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
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
<p><br/></p>
<div class="container">
  <c:if test="${sLevel == 0}">
    <input type="checkbox" name="userInfor" id="userInfor" onclick="userCheck()" /> 숨김처리 회원 모아보기 / 전체회원 보기
    <hr/>
  </c:if>
	<div id="totalList">
	  <h3 class="text-center">전체 회원 리스트</h3>
	  <table class="table table-hover text-center">
	    <tr class="table-dark text-dark">
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
	    <tr><td colspan="8" class="m-0 p-0"></td></tr>
	  </table>
	</div>
  <div id="userDispaly">
    <c:if test="${userDel == 'OK'}">
		  <h3 class="text-center">숨김 처리한 회원 리스트</h3>
		  <table class="table table-hover text-center">
		    <tr class="table-dark text-dark">
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
		    <tr><td colspan="8" class="m-0 p-0"></td></tr>
		  </table>
	  </c:if>
  </div>
	<!-- 블록페이지 시작 -->
	<div class="text-center">
	  <ul class="pagination justify-content-center">
		  <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="AdminMemberList.ad?pag=1&pageSize=${pageSize}">첫페이지</a></li></c:if>
		  <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="AdminMemberList.ad?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}">이전블록</a></li></c:if>
		  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize) + blockSize}" varStatus="st">
		    <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="AdminMemberList.ad?pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
		    <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="AdminMemberList.ad?pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
		  </c:forEach>
		  <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="AdminMemberList.ad?pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}">다음블록</a></li></c:if>
		  <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="AdminMemberList.ad?pag=${totPage}&pageSize=${pageSize}">마지막페이지</a></li></c:if>
	  </ul>
	</div>
	<!-- 블록페이지 끝 -->
</div>
<p><br/></p>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<jsp:include page="/include/footer.jsp" />
</body>
</html>