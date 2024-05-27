<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 정보 수정</title>
<%@ include file="/include/bs4.jsp"%>
<link href="css/styles.css" rel="stylesheet" />
<link href="${ctp}/css/join.css" rel="stylesheet" />
<style>
/* Custom styles for spacing and alignment */
.myBtn {
		border: 1.2px solid #39b766;
		color: #fefefe;
		background-color: #35ae5f;
		padding: 10px 20px;
		font-size: 14px;
		margin: 10px 5px;
		display: inline-block;
		text-decoration: none;
		cursor: pointer;
}

.myBtn:disabled {
		background-color: #d3d3d3;
		border-color: #d3d3d3;
		cursor: not-allowed;
}

.form-group.text-center {
		margin-top: 20px;
}
</style>
<script>
		'use strict';
		
	/* 
		function infoUpdate() {
			location.href = "${ctp}/MemberInfoUpdate.mem";
		}
		 */

	    function pwdReCheck() {
	    	let pwd = $("#pwd").val().trim();
	    	if(pwd == "") {
	    		alert("현재 비밀번호를 입력하세요!");
	    		$("#pwd").focus();
	    		return false;
	    	}
	    	
	    	$.ajax({
	    		url  : "MemberPwdCheckAjax.mem",
	    		type : "post",
	    		data : {pwd : pwd},
	    		success:function(res) {
	    			if(res != "0") {
	    				document.querySelectorAll('.optionBtn').forEach(button => button.disabled = false);
	    			}
	    			else alert("비밀번호가 일치하지 않습니다.");
	    		},
	    		error : function() {
	    			alert("전송오류!");
	    		}
	    	});
	    }
	    
			function pwdChangeCheck() {
	    	let pwdCheck = $("#pwdCheck").val();
	    	let pwdCheckRe = $("#pwdCheckRe").val();
	    	
	    	if(pwdCheck.trim() == "" || pwdCheckRe.trim() == "") {
	    		alert("변경할 비밀번호를 입력하세요");
	    		$("#pwdCheck").focus();
	    		return false;
	    	}
	    	else if(pwdCheck.trim() != pwdCheckRe.trim()) {
	    		alert("새로 입력한 비밀번호가 틀립니다. 확인하세요");
	    		$("#pwdCheck").focus();
	    		return false;
	    	}
	    	else {
	    		pwdForm.submit();
	    	}
	    } 
		
	</script>
</head>
<body class="d-flex flex-column h-100">
		<main class="flex-shrink-0">
				<jsp:include page="/include/nav.jsp" />
				<div class="container join-container mt-5 mb-5">
						<div class="register-container">
								<h1 style="font-family: 'CWDangamAsac-Bold';">회원정보 수정</h1>
								<h4 class="text-muted">회원정보 수정을 위해서는 비밀번호를 확인해야 합니다.</h4>

								<form name="checkPwdForm" method="post"
										action="javascript:pwdReCheck();">
										<div class="form-group">
												<label for="password">Password</label> <input
														type="password" id="pwd" name="pwd"
														placeholder="비밀번호를 입력하세요" required class="form-control">
										</div>
										<div class="form-group text-center">
												<input type="submit" value="확인" class="myBtn">
										</div>
								</form>

								<div class="row text-center" style="color: #6f5340;">
										<div class="col">
												<!-- <button type="button" class="myBtn optionBtn pwd" onclick="submitCheck('pwd')" disabled>비밀번호 변경</button> -->
												<input type="button" value="비밀번호 변경"
														class="myBtn optionBtn pwd" data-toggle="modal"
														data-target="#myModal" disabled /> <input type="button"
														value="비밀번호 변경" class="myBtn optionBtn pwd"
														data-toggle="modal" data-target="#myModal" disabled />
												<button type="button" class="myBtn optionBtn"
														onclick="location.href='${ctp}/MemberInfoUpdate.mem'"
														disabled>회원정보 수정</button>
										</div>
								</div>
								<!-- 
       	<div id="pwdDemo">
			    <form name="pwdForm" method="post" action="MemberPwdChangeCheck.mem">
			      <table>
			        <tr>
			          <td>변경할 비밀번호를 입력하세요</td>
			          <td><input type="password" name="pwdCheck" id="pwdCheck" class="form-control"/></td>
			        </tr>
			        <tr>
			          <td>비밀번호 확인</td>
			          <td><input type="password" name="pwdCheckRe" id="pwdCheckRe" class="form-control"/></td>
			        </tr>
			        <tr>
			          <td colspan="2" class="text-center">
			            <input type="button" value="비밀번호변경하기" onclick="pwdChangeCheck()" class="btn btn-secondary"/>
			          </td>
			        </tr>
			      </table>
			    </form>
			  </div>
         -->
								<div class="modal fade" id="myModal">
										<div class="modal-dialog modal-dialog-centered">
												<div class="modal-content">

														<!-- Modal Header -->
														<div class="modal-header">
																<h4 class="modal-title">비밀번호 변경</h4>
																<button type="button" class="close" data-dismiss="modal">&times;</button>
														</div>

														<!-- Modal body -->
														<div class="modal-body">
																<form name="pwdForm" method="post"
																		action="MemberPwdChangeCheck.mem">
																		<table>
																				<tr>
																						<td>변경할 비밀번호를 입력하세요</td>
																						<td><input type="password" name="pwdCheck"
																								id="pwdCheck" class="form-control" /></td>
																				</tr>
																				<tr>
																						<td>비밀번호 확인</td>
																						<td><input type="password" name="pwdCheckRe"
																								id="pwdCheckRe" class="form-control" /></td>
																				</tr>
																				<tr>
																						<td colspan="2" class="text-center"><input
																								type="button" value="비밀번호변경하기"
																								onclick="pwdChangeCheck()"
																								class="btn btn-secondary" /></td>
																				</tr>
																		</table>
																</form>
														</div>

														<!-- Modal footer -->
														<div class="modal-footer">
																<button type="button" class="btn btn-secondary"
																		data-dismiss="modal">Close</button>
														</div>

												</div>
										</div>
								</div>



						</div>
				</div>
		</main>
		<!-- Footer-->
		<jsp:include page="/include/footer.jsp" />
		<!-- Bootstrap core JS-->
		<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<!-- Core theme JS-->
</body>
</html>
