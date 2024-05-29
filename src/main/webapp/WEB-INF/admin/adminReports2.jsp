<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>신고 관리</title>
  <%@ include file="/include/bs4.jsp" %>
	<link href="${ctp}/css/styles.css" rel="stylesheet" />
	<link href="${ctp}/css/admin.css" rel="stylesheet" />
	<script>
    'use strict';
    
    // 전체선택
    function allCheck() {
      for(let i=0; i<myform.idxFlag.length; i++) {
        myform.idxFlag[i].checked = true;
      }
    }

    // 전체취소
    function allReset() {
      for(let i=0; i<myform.idxFlag.length; i++) {
        myform.idxFlag[i].checked = false;
      }
    }
    
    function reportCheck(part,partIdx, complaint) {
    	$.ajax({
    		url  : "ReportCheck.ad",
    		type : "post",
    		data : {
    			part     : part,
    			partIdx  : partIdx,
    			complaint:complaint
    		},
    		success:function() {
    			location.reload();
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
    
  	function modalCheck(mid, nickName, name, email, gender, birthday, startDate) {
  		$("#myModal #modalMid").text(mid);
  		$("#myModal #modalNickName").text(nickName);
  		$("#myModal #modalName").text(name);
  		$("#myModal #modalEmail").text(email);
  		$("#myModal #modalGender").text(gender);
  		$("#myModal #modalBirthday").text(birthday);
  		$("#myModal #modalStartDate").text(startDate);
  	}
  	
    function memberDeleteOk(idx) {
    	let ans = confirm("선택하신 회원을 영구 삭제 하시겠습니까?");
    	if(ans) {
    		$.ajax({
    			url  : "MemberDeleteOk.ad",
    			type : "post",
    			data : {idx : idx},
    			success:function(res) {
    				if(res != "0") {
    					alert("영구 삭제 되었습니다.");
    					location.reload();
    				}
    				else alert("삭제 실패~~");
    			}
    		});
    	}
    }
    
  </script>
</head>
<body>
    <jsp:include page="/include/nav.jsp" />
    <div class="container">
        <h1>신 고 리 스 트</h1>
        <input type="radio" value="전체선택/취소" onclick="allCheck()" />
        <table class="admin-table">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>신고당한 사용자 아이디</th>
                    <th>신고한 회원 아이디</th>
                    <th>신고 사유</th>
                    <th>신고날짜</th>
                    <th>회원리스트에 표시여부</th>
                </tr>
            </thead>
            <tbody>
                <c:set var="reportCnt" value="${reportCnt}" />
    						<c:forEach var="vo" items="${vos}" varStatus="st">
                    <tr>
                        <td><input type="checkbox" name="idxFlag" id="idxFlag${vo.idx}" value="${vo.idx}"/>${reportCnt}</td>
                        <td><a href="#" onclick="modalCheck('${vo.mid}','${vo.nickName}','${vo.name}','${vo.email}','${vo.gender}','${fn:substring(vo.birthday,0,10)}','${vo.startDate}')" data-toggle="modal" data-target="#myModal">${vo.mid}</a></td>
                        <td>${vo.reportedMid}</td>
                        <td>${vo.reportingMid}</td>
                        <td>${vo.reason}</td>
                        <td>${vo.reportDate}</td>
                        <td>
									        <a href="javascript:complaintCheck('${vo.part}','${vo.partIdx}','${vo.complaint}')" class="badge badge-warning">${vo.complaint == 'NO' ? '표시중' : '<font color=white>감춰짐</font>'}</a><br/>
									        <a href="javascript:memberDeleteOk(${vo.idx})" class="badge badge-danger">탈퇴처리</a>
									      </td>
                        <c:set var="reportCnt" value="${reportCnt - 1}" />
											  </tr>
									    </c:forEach>
            </tbody>
        </table>
    </div>
    
    <!-- 모달에 회원정보 출력하기 -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">신고당한 회원 정보</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          아이디 : <span id="modalMid"></span><hr/>
          이름 : <span id="modalName"></span><br/>
          닉네임 : <span id="modalNickName"></span><br/>
          성별 : <span id="modalGender"></span><hr/>
          생년월일 : <span id="modalBirthday"></span><hr/>
          가입일 : <span id="modalStartDate"></span><hr/>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
    
<!-- Footer-->
  <jsp:include page="/include/footer.jsp" />
  <!-- Bootstrap core JS-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
