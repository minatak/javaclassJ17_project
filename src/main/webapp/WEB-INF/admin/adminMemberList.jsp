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
    h1, h2, h3 {
      font-family: 'CWDangamAsac-Bold';
      color: #35ae5f; 
      text-align: center;
    }
    .admin-section {
      margin-bottom: 30px;
    }
 /*    .admin-section h2 {
      font-size: 1.5em;
    } */
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
  /*     padding: 2px 4px; */
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
     
     
		// 전체선택/취소
		function toggleAllCheckboxes(source) {
		 const checkboxes = document.querySelectorAll('input[name="midFlag"]');
		 checkboxes.forEach(checkbox => checkbox.checked = source.checked);
		}
    
    
    function memberDeleteOk() {
        let selectMemberArray = '';
    		
        for(let i=0; i<myform.midFlag.length; i++) {
          if(myform.midFlag[i].checked) selectMemberArray += myform.midFlag[i].value + "/";
        }
      	if(selectMemberArray == '') {
      		alert("삭제할 회원을 한 명 이상 선택하세요");
      		return false;
      	}
      	
      	let ans = confirm("선택하신 회원을 영구삭제하시겠습니까?");
      	if(!ans) return false;
      	
      	selectMemberArray = selectMemberArray.substring(0,selectMemberArray.lastIndexOf("/"));
        let query = {
      		  selectMemberArray : selectMemberArray
        }
        
        $.ajax({
      	  url  : "MemberDeleteOk.ad",
      	  type : "post",
      	  data : query,
      	  success:function(res) {
      		  if(res != "0") { 
      			  alert("선택하신 회원이 영구삭제되었습니다");
      			  location.reload();
      		  }
      		  else alert("회원 삭제에 실패했습니다");
      	  },
      	  error : function() {
      		  alert("전송 실패");
      	  }
        });
      }
      
      function memberHideOk() {
        let selectMemberArray = '';
    		
        for(let i=0; i<myform.midFlag.length; i++) {
          if(myform.midFlag[i].checked) selectMemberArray += myform.midFlag[i].value + "/";
        }
      	if(selectMemberArray == '') {
      		alert("숨김 처리할 회원을 한 명 이상 선택하세요");
      		return false;
      	}
      	
      	let ans = confirm("선택하신 회원을 회원 조회 리스트에서 감추시겠습니까?");
      	if(!ans) return false;
      	
      	selectMemberArray = selectMemberArray.substring(0,selectMemberArray.lastIndexOf("/"));
        let query = {
      		  selectMemberArray : selectMemberArray
        }
        
        $.ajax({
      	  url  : "MemberHideOk.ad",
      	  type : "post",
      	  data : query,
      	  success:function(res) {
      		  if(res != "0") { 
      			  alert("선택하신 회원이 숨김 처리되었습니다");
      			  location.reload();
      		  }
      		  else alert("회원 감추기에 실패했습니다");
      	  },
      	  error : function() {
      		  alert("전송 실패");
      	  }
        });
      }
      
      function memberShowOk() {
        let selectMemberArray = '';
    		
        for(let i=0; i<hideMyform.midFlag.length; i++) {
          if(hideMyform.midFlag[i].checked) selectMemberArray += hideMyform.midFlag[i].value + "/";
        }
      	if(selectMemberArray == '') {
      		alert("보임 처리할 회원을 한 명 이상 선택하세요");
      		return false;
      	}
      	
      	let ans = confirm("선택하신 회원을 회원 조회 리스트에서 공개하시겠습니까?");
      	if(!ans) return false;
      	
      	selectMemberArray = selectMemberArray.substring(0,selectMemberArray.lastIndexOf("/"));
        let query = {
      		  selectMemberArray : selectMemberArray
        }
        
        $.ajax({
      	  url  : "MemberShowOk.ad",
      	  type : "post",
      	  data : query,
      	  success:function(res) {
      		  if(res != "0") { 
      			  alert("선택하신 회원이 공개 처리되었습니다");
      			  location.reload();
      		  }
      		  else alert("회원 공개에 실패했습니다");
      	  },
      	  error : function() {
      		  alert("전송 실패");
      	  }
        });
      }
  </script>
</head>
  <jsp:include page="/include/nav.jsp" />
<body>
  <div class="container mt-4">
      <div class="form-check form-check-inline">
       <input class="form-check-input" type="checkbox" name="userInfor" id="userInfor" />
        <label class="form-check-label" for="userInfor">숨김처리 회원 모아보기 / 전체회원 보기</label> 
        <!-- <input type="button" id="hideMembers" value="숨김처리 회원 모아보기" class="btn btn-success" onclick="showAllMembers()"/>
        <input type="button" id="allMembers" value="전체회원 보기" class="btn btn-success" onclick="showHideMembers()" style="display:none;"/> -->
      </div>
      <hr/>
    <div id="totalList">
      <h1>전체 회원 리스트</h1>
      <div class="row mt-5 mb-2">
      <div class="col">
		    <div class="form-check form-check-inline">
		      <input class="form-check-input" type="checkbox" id="selectAll" onclick="toggleAllCheckboxes(this)"> 
		      <label class="form-check-label" for="selectAll">전체선택/취소</label>
		    </div>
	    </div>
      <div class="col text-right">
		    <span class="text-right">선택한 회원 
		    	<input type="button" value="숨기기" onclick="memberHideOk()" class="myBtn"/>
		    	<input type="button" value="회원삭제" onclick="memberDeleteOk()" class="myBtn"/>
		    </span>
	    </div>
    </div>
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
            <th>숨김여부</th>
          </tr>
        </thead>
        <tbody>
          <form name="myform">
          <c:forEach var="vo" items="${vos}" varStatus="st">
            <c:if test="${vo.level == 99}"><c:set var="active" value="탈퇴신청"/></c:if>
            <c:if test="${vo.level != 99}"><c:set var="active" value="활동중"/></c:if>
            <tr>
              <td><input type="checkbox" name="midFlag" id="midFlag${vo.mid}" value="${vo.mid}"/>${vo.idx}</td>
              <td><a href="#">${vo.mid}</a></td>
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
              <td>
                <c:if test="${vo.userDel == 'OK'}"><font color="red"><b>비공개</b></font></c:if>
                <c:if test="${vo.userDel == 'NO'}">공개</c:if>
              </td>
            </tr>
          </c:forEach>
          <tr><td colspan="10" class="m-0 p-0"></td></tr>
          </form>
        </tbody>
      </table>
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
    <div id="userDispaly">
      <h1>숨김 처리한 회원 리스트</h1>
      <div class="row mt-5 mb-2">
      <div class="col">
		    <div class="form-check form-check-inline">
		      <input class="form-check-input" type="checkbox" id="selectAll" onclick="toggleAllCheckboxes(this)">
		      <label class="form-check-label" for="selectAll">전체선택/취소</label>
		    </div>
	    </div>
	      <div class="col text-right">
			  	<span class="text-right">선택한 회원 
			    	<input type="button" value="보이기" onclick="memberShowOk()" class="myBtn"/>
			    	<input type="button" value="회원삭제" onclick="memberDeleteOk()" class="myBtn"/>
			    </span>
		    </div>
    	</div>
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
        <form name="hideMyform">
          <c:forEach var="vo" items="${vos}" varStatus="st">
           	<c:if test="${vo.level == 99}"><c:set var="active" value="탈퇴신청"/></c:if>
            <c:if test="${vo.level != 99}"><c:set var="active" value="활동중"/></c:if>
            <c:if test="${vo.userDel == 'OK'}">
              <tr>
                <td><input type="checkbox" name="midFlag" id="midFlag${vo.mid}" value="${vo.mid}"/>${vo.idx}</td>
                <td><a href="#">${vo.mid}</a></td>
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
          </form>
        </tbody>
      </table>
    </div>
    <p><br/></p>
   
    
  </div>
  <jsp:include page="/include/footer.jsp" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
