<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>신고 관리</title>
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
		h1, h2 {
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
		.form-group label {
		  display: block;
		  margin-bottom: 5px;
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
    
    // 전체선택/취소
    function toggleAllCheckboxes(source) {
      const checkboxes = document.querySelectorAll('input[name="idxFlag"]');
      checkboxes.forEach(checkbox => checkbox.checked = source.checked);
    }
    
    function modalCheck(mid, nickName, name, email, gender, birthday, startDate) {
      $("#modalMid").text(mid);
      $("#modalNickName").text(nickName);
      $("#modalName").text(name);
      $("#modalEmail").text(email);
      $("#modalGender").text(gender);
      $("#modalBirthday").text(birthday);
      startDate = startDate.substring(0,10);
      $("#modalStartDate").text(startDate);
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
    
    function cancelReportOk() {
      let selectMemberArray = '';
  		
      for(let i=0; i<myform.midFlag.length; i++) {
        if(myform.midFlag[i].checked) selectMemberArray += myform.midFlag[i].value + "/";
      }
    	if(selectMemberArray == '') {
    		alert("신고 취소 처리하실 회원을 이상 선택하세요");
    		return false;
    	}
    	
    	let ans = confirm("선택하신 회원을 신고 취소 처리하시겠습니까?");
    	if(!ans) return false;
    	
    	selectMemberArray = selectMemberArray.substring(0,selectMemberArray.lastIndexOf("/"));
      let query = {
    		  selectMemberArray : selectMemberArray
      }
      
      $.ajax({
    	  url  : "CancelReportOk.ad",
    	  type : "post",
    	  data : query,
    	  success:function(res) {
    		  if(res != "0") { 
    			  alert("선택하신 회원의 신고가 취소되었습니다");
    			  location.reload();
    		  }
    		  else alert("회원 신고 취소에 실패했습니다");
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
    <h1>신고 회원 리스트</h1>
    <div class="row mt-5 mb-2">
      <div class="col">
		    <div class="form-check form-check-inline">
		      <input class="form-check-input" type="checkbox" id="selectAll" onclick="toggleAllCheckboxes(this)">
		      <label class="form-check-label" for="selectAll">전체선택/취소</label>
		    </div>
	    </div>
      <div class="col text-right">
		    <span class="text-right">선택한 회원 
		    	<input type="button" value="신고 취소" onclick="cancelReportOk()" class="myBtn"/>
		    	<input type="button" value="회원 감추기" onclick="memberHideOk()" class="myBtn"/>
		    	<input type="button" value="탈퇴처리" onclick="memberDeleteOk()" class="myBtn"/>
		    </span>
	    </div>
    </div>
    <table class="table table-striped table-hover mt-3 admin-table">
      <thead class="table-dark">
        <tr>
          <th style="width:75px; vertical-align: middle;">번호</th>
          <th style="width:160px; vertical-align: middle;">신고접수 회원</th>
          <th style="width:150px; vertical-align: middle;">신고한 회원</th>
          <th style="vertical-align: middle;">신고 사유</th>
          <th style="width:150px; vertical-align: middle;">신고날짜</th>
          <th style="width:150px; vertical-align: middle;">숨김여부</th>
          <!-- <th>기타 처리</th> -->
        </tr>
      </thead>
      <tbody>
        <c:set var="reportCnt" value="${reportCnt}" />
        <form name="myform">
	        <c:forEach var="vo" items="${vos}" varStatus="st">
	          <tr>
	            <td><input type="checkbox" name="midFlag" id="midFlag${vo.mid}" value="${vo.mid}"/> ${reportCnt}</td>
	            <td>
	              <a href="#" onclick="modalCheck('${vo.mid}', '${vo.nickName}', '${vo.name}', '${vo.email}', '${vo.gender}', '${fn:substring(vo.birthday, 0, 10)}', '${vo.startDate}')" data-toggle="modal" data-target="#myModal">${vo.mid}</a>
	            </td>
	            <td>${vo.reportingMid}</td>
	            <td>${vo.reason}</td>
	            <td>${fn:substring(vo.reportDate, 0, 10)}</td>
	            <c:if test="${vo.show == 'NO'}"><td>공개</td></c:if>
	            <c:if test="${vo.show == 'OK'}"><td>비공개</td></c:if>
	            <c:set var="reportCnt" value="${reportCnt - 1}" />
	          </tr>
	        </c:forEach>
        </form>
      </tbody>
    </table>
  </div>
  
  <!-- 모달에 회원정보 출력하기 -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title"><b>회원 정보</b></h4>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <!-- Modal body -->
        <div class="modal-body">
          아이디: <span id="modalMid"></span> 
          이름: <span id="modalName"></span><br/>
          닉네임: <span id="modalNickName"></span><br/>
          이메일: <span id="modalEmail"></span><br/>
          성별: <span id="modalGender"></span><br/>
          생년월일: <span id="modalBirthday"></span><br/>
          가입일: <span id="modalStartDate"></span><br/>
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="myModal">Close</button>
        </div>
      </div>
    </div>
  </div>
  
  <p><br/></p>
  <jsp:include page="/include/footer.jsp" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
