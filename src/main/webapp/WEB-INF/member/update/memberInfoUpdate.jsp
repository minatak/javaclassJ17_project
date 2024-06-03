<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원 정보 수정</title>
	<%@ include file="/include/bs4.jsp" %>
	<link href="css/styles.css" rel="stylesheet" />
	<link href="${ctp}/css/join.css" rel="stylesheet" />
	<style>
		.dangerButton {
			border: 1.2px solid #cf5a5a;
			color: #fefefe;
			background-color: #cf5a5a;
			/* padding: 10px 20px; */
			/* font-size: 14px; */
			text-decoration: none;
			cursor: pointer;
		}
	</style>
	<script>
		'use strict';

		function deleteAccount() {
  		let ans = confirm("회원 탈퇴를 신청하시겠습니까?");
  		if(ans) {
  			ans = confirm("탈퇴하시면 한달간 같은 아이디로 가입하실수 없습니다.\n계속 진행하시겠습니까?");
  			if(ans) location.href='MemberDeleteCheckOk.mem';
  		}
    }
	  
		function fCheck() {
	    	
	    	// 전송전에 파일에 관련된 사항들을 체크해준다.
			let fName = document.getElementById("file").value;
			if(fName.trim() != "") {
				let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
				let maxSize = 1024 * 1024 * 5;
				let fileSize = document.getElementById("file").files[0].size;
				
				if(ext != 'jpg' && ext != 'gif' && ext != 'png' && ext != 'jfif') {
					alert("업로드 가능한 파일 형식이 아닙니다.");
					return false;
				}
				else if(fileSize > maxSize) {
					alert("업로드할 파일의 최대용량은 5MByte입니다.");
					return false;
				}
			}
			else return false;	
	
	    let nativeLanguage = document.getElementById("nativeLanguage").value;
	    let learningLanguage = document.getElementById("learningLanguage").value;
	
	    if (nativeLanguage == learningLanguage) {
	        alert("학습할 언어는 모국어와 달라야합니다.");
	        return false;
	    }
	
	    document.registerForm1.submit();
	    
		}
		
	</script>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/include/nav.jsp" />
    <div class="container join-container mt-5 mb-5">
      <div class="register-container">
        <h1 style="font-family: 'CWDangamAsac-Bold';">회원 정보 수정</h1>
        <form name="registerForm1" method="post" action="${ctp}/MemberInfoUpdateOk.mem" enctype="multipart/form-data">
          <div class="form-group ">
            <label for="mid">ID (수정 불가)</label>
            <input type="text" id="mid" name="mid" value="${vo.mid}" readonly>
          </div>
          <div class="form-group">
            <label for="nickName">Nickname *</label>
            <input type="text" id="nickName" name="nickName" value="${vo.nickName}" required>
          </div>
          <div class="form-group">
            <label for="name">Name *</label>
            <input type="text" id="name" name="name" value="${vo.name}" required>
          </div>
          <div class="form-group">
            <label for="email">Email *</label>
            <input type="email" id="email" name="email" value="${vo.email}" required>
          </div>
          <div class="form-group">
			      <div class="form-check-inline">
			        <label for="gender">Gender *</label> &nbsp; &nbsp;
			        <label class="form-check-label">
			          <input type="radio" style="color: #6f5340;" class="form-check-input" name="gender" value="남자" ${vo.gender == '남자' ? 'checked' : ''}><span style="color: #6f5340;">남자</span>
			        </label>
			      </div>
			      <div class="form-check-inline">
			        <label class="form-check-label">
			          <input type="radio" class="form-check-input" name="gender" value="여자" ${vo.gender == '여자' ? 'checked' : ''}><span style="color: #6f5340;">여자</span>
			        </label>
			      </div>
			    </div>
          <div class="form-group">
            <label for="birthday">Birthday *</label>
            <input type="date" id="birthday" name="birthday" value="${birthday}" class="mb-2" required>
          </div>
          <div class="form-group">
            <label for="profilePicture">프로필 사진</label>
            <input type="file" id="file" name="fName"> 
          </div>
          <div class="form-group">
            <label for="country">Country *</label>
            <input type="text" id="country" name="country" value="${vo.country}" required>
          </div>
          <div class="form-group">
            <label for="city">City</label>
            <input type="text" id="city" name="city" value="${vo.city}">
          </div>
          <div class="form-group">
            <label for="nativeLanguage">Native Language *</label>
            <input type="text" id="nativeLanguage" name="nativeLanguage" value="${vo.nativeLanguage}" required>
          </div>
          <div class="form-group">
            <label for="learningLanguage">Learning Language *</label>
            <input type="text" id="learningLanguage" name="learningLanguage" value="${vo.learningLanguage}" required>
          </div>
          <div class="form-group">
            <label for="languageLevel">Language Level *</label>
            <select id="languageLevel" name="languageLevel" required>
              <option value="초급" ${vo.languageLevel == '초급' ? 'selected' : ''}>초급</option>
              <option value="중급" ${vo.languageLevel == '중급' ? 'selected' : ''}>중급</option>
              <option value="고급" ${vo.languageLevel == '고급' ? 'selected' : ''}>고급</option>
            </select>
          </div>
          <div class="form-group">
            <label for="content">Self Introduction</label>
            <textarea id="content" name="content" rows="5" required>${vo.content}</textarea>
          </div>
          <span style="float: right;"class="mb-3"><input type="button" value="회원 탈퇴" onclick="deleteAccount()" class="dangerButton"></span>
          <div class="form-group text-center mt-5">
            <!-- <input type="submit" value="수정하기" class="myBtn"> -->
            <button type="button" class="myBtn" onclick="fCheck()">수정하기</button>  
          </div>
          
        </form>
      </div>
    </div>
</main>
<!-- Footer-->
<jsp:include page="/include/footer.jsp" />
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
