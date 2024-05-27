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
		
		/* .myBtn:disabled {
			background-color: #d3d3d3;
			border-color: #d3d3d3;
			cursor: not-allowed;
		}
		 */
		.form-group.text-center {
			margin-top: 20px;
		}
		
		h4, h5 {
			color: #6f5340;
			font-family: 'NEXON Lv1 Gothic OTF';
		}
		
		.optionBtn {
			visibility : hidden;
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
	  				alert("비밀번호가 확인되었습니다");
	  				document.querySelectorAll('.optionBtn').forEach(button => button.style.visibility = 'visible');
	  				document.querySelectorAll('.confirmBtn').forEach(button => button.style.display = 'none');
	  			}
	  			else {
	  				alert("비밀번호가 일치하지 않습니다");
	  			}
	  		},
	  		error : function() {
	  			alert("전송오류!");
	  		}
	  	});
	  }
	  
		function pwdChangeCheck() {
	  	let pwdCheck = $("#pwdCheck").val();
	  	let pwdCheckRe = $("#pwdCheckRe").val();
	  	let regPwd = /^[a-zA-Z0-9!@#$%^*+=-_]{4,16}$/   // 비밀번호 8~16의 영문 대/소문자와 특수문자 숫자와 밑줄 가능
		  	
	  	if(pwdCheck.trim() == "" || pwdCheckRe.trim() == "") {
	  		alert("변경할 비밀번호를 입력하세요");
	  		$("#pwdCheck").focus();
	  		return false;
	  	}
	  	else if(!regPwd.test(pwdCheck)) {
		    alert("비밀번호는 4~16자리의 영문/특수문자만 입력 가능합니다.");
		    pwdForm.pwd.focus();
	    	return false;
	    }
	  	else if(pwdCheck.trim() != pwdCheckRe.trim()) {
	  		alert("비밀번호 확인이 일치하지 않습니다");
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
						<div class="register-container mt-5">
								<h1 style="font-family: 'CWDangamAsac-Bold';">회원정보 수정</h1>
								<h5 class="m-3">회원정보 수정을 위해 비밀번호를 확인해주세요</h5>

								<form name="checkPwdForm" method="post"
										action="javascript:pwdReCheck();">
										<div class="form-group">
												<label for="password">Password</label> <input
														type="password" id="pwd" name="pwd"
														placeholder="비밀번호를 입력하세요" required class="form-control">
										</div>
										<div class="form-group text-center">
												<input type="submit" value="확인" class="myBtn confirmBtn">
										</div>
								</form>

								<div class="row text-center" style="color: #6f5340;">
										<div class="col">
												<!-- <button type="button" class="myBtn optionBtn pwd" onclick="submitCheck('pwd')" disabled>비밀번호 변경</button> -->
												<input type="button" value="비밀번호 변경" class="myBtn optionBtn pwd" data-toggle="modal" data-target="#myModal" />
												<button type="button" class="myBtn optionBtn" onclick="location.href='${ctp}/MemberInfoUpdate.mem'">회원정보 수정</button>
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
<!-- 
														Modal body
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
 -->
														<!-- Modal body -->
														<div class="modal-body">
																<form name="pwdForm" method="post" action="MemberPwdChangeCheck.mem">
																	<div class="form-group">
												            <label for="currentPassword">New Password *</label>
												            <input type="password" id="pwdCheck" name="pwdCheck" placeholder="변경할 비밀번호를 입력하세요" required>
												          </div>
												          <div class="form-group">
												            <label for="newPassword">Confirm New Password *</label>
												            <input type="password" id="pwdCheckRe" name="pwdCheckRe" placeholder="변경할 비밀번호를 다시 입력하세요" required>
												          </div>
												          <div class="form-group text-center">
												            <input type="button" value="비밀번호 변경" onclick="pwdChangeCheck()" class="myBtn">
												          </div>
																</form>
														</div>

														<!-- Modal footer -->
														<div class="modal-footer">
																<button type="button" class="btn btn-secondary "
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
