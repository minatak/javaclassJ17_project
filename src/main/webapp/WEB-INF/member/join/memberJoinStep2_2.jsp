<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<%@ include file="/include/bs4.jsp" %>
<script>
	'use strict';
	
	/*   // 선택된 사진 미리보기
    function imgCheck(e) {
    	if(e.files && e.files[0]) {
    		let reader = new FileReader();
    		reader.onload = function(e) {
    			document.getElementById("photoDemo").src = e.target.result;
    		}
    		reader.readAsDataURL(e.files[0]);
    	}
    } */

  function fCheck() {
    	
		// 전송전에 파일에 관련된 사항들을 체크해준다.
		let fName = document.getElementById("file").value;
		if(fName.trim() != "") {
			let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
			let maxSize = 1024 * 1024 * 5;
			let fileSize = document.getElementById("file").files[0].size;
			
			if(ext != 'jpg' && ext != 'gif' && ext != 'png') {
				alert("그림파일만 업로드 가능합니다.");
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
		
		if(nativeLanguage == learningLanguage) {
			alert("학습할 언어는 모국어와 달라야합니다.");
			return false;
		}
		
		myform.submit();
  }
	
</script>
<link href="css/styles.css" rel="stylesheet" />
<link href="${ctp}/css/join.css?after" rel="stylesheet" /> 
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/include/nav.jsp" />
    <div class="container join-container mt-5 mb-5">
      <div class="register-container">
        <h1>회원가입</h1>
        
        <div class="row gx-5 row-cols-2 row-cols-lg-3 py-5" style="color: #6f5340;">
          <div class="col">
            <p class="text-muted mb-0">step 1</p>
            <div class="step"><i class="fa-solid fa-user"></i></div>
            <div class="m-2">회원 정보 입력</div>
          </div>
          <div class="col">
            <p class="text-muted mb-0">step 2</p>
            <div class="proceedingStep step"><i class="fa-solid fa-earth-americas"></i></div>
            <div class="m-2">언어 / 목표 입력</div>
          </div>
          <div class="col">
            <p class="text-muted mb-0">step 3</p>
            <div class="step"><i class="fa-solid fa-check"></i></div>
            <div class="m-2">가입완료</div>
          </div>
        </div>
        <form name="registerForm2" method="post" action="${ctp}/MemberJoinOk2.mem">
          <div class="form-group">
            <label for="profilePicture">프로필 사진</label>
            <input type="file" id="fName" name="fName" onchange="imgCheck(this)"> 
          </div>
          <div class="form-group">
            <label for="country">거주하는 나라 *</label>
            <select id="country" name="country" required>
              <option value="">선택하세요</option>
              <option value="한국">한국</option>
              <option value="미국">미국</option>
              <option value="스페인">스페인</option>
              <option value="프랑스">프랑스</option>
              <option value="일본">일본</option>
              <option value="독일">독일</option>
              <option value="중국">중국</option>
              <option value="러시아">러시아</option>
              <!-- <option value="기타">기타</option> -->
              <!-- 추가 나라 옵션 -->
            </select>
          </div>
          <div class="form-group">
          	<label for="city">도시</label>
            <input type="text" id="city" name="city" placeholder="거주하는 도시를 입력하세요">
          </div>
          <div class="form-group">
            <label for="nativeLanguage">모국어 *</label>
            <select id="nativeLanguage" name="nativeLanguage" required>
              <option value="">선택하세요</option>
              <option value="한국어">한국어</option>
              <option value="영어">영어</option>
              <option value="스페인어">스페인어</option>
              <option value="프랑스어">프랑스어</option>
              <option value="일본어">일본어</option>
              <option value="독일어">독일어</option>
              <option value="중국어">중국어</option>
              <option value="러시아어">러시아어</option>
              <!-- <option value="기타">기타</option> -->
            </select>
          </div>
          <div class="form-group">
            <label for="learningLanguage">학습할 언어 *</label>
            <select id="learningLanguage" name="learningLanguage" required>
              <option value="">선택하세요</option>
              <option value="한국어">한국어</option>
              <option value="영어">영어</option>
              <option value="스페인어">스페인어</option>
              <option value="프랑스어">프랑스어</option>
              <option value="일본어">일본어</option>
              <option value="독일어">독일어</option>
              <option value="중국어">중국어</option>
              <option value="러시아어">러시아어</option>
              <!-- <option value="기타">기타</option> -->
            </select>
          </div>
          <div class="form-group">
            <label for="languageLevel">학습할 언어의 수준 *</label>
            <select id="languageLevel" name="languageLevel" required>
              <option value="">선택하세요</option>
              <option value="초급">초급</option>
              <option value="중급">중급</option>
              <option value="고급">고급</option>
            </select>
          </div>
          <div class="form-group">
            <label for="content">자기소개 *</label>
            <textarea id="content" name="content" rows="4" placeholder="자기소개를 입력하세요" required></textarea>
          </div>
          <div>
          	<input type="hidden" name="mid" value="${vo.mid}">
          	<input type="hidden" name="pwd" value="${vo.pwd}">
          	<input type="hidden" name="nickName" value="${vo.nickName}">
          	<input type="hidden" name="name" value="${vo.name}">
          	<input type="hidden" name="gender" value="${vo.gender}">
          	<input type="hidden" name="birthday" value="${vo.birthday}">
          	<input type="hidden" name="email" value="${vo.email}">
          </div>
          <div class="form-group text-center">
            <!-- <input type="submit" value="가입하기" class="myBtn"> -->
            <button type="button" class="myBtn" onclick="fCheck()">가입하기</button>  
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
