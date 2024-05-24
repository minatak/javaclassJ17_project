<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원가입</title>
	<%@ include file = "/include/bs4.jsp" %>
	<script>
		'use strict';
		
		let idCheckSw = 0;
		let nickCheckSw = 0;
		/* 
		// 정규식을 이용한 유효성검사처리.....
    let regMid = /^[a-zA-Z0-9_]{4,20}$/;    // 아이디는 4~20의 영문 대/소문자와 숫자와 밑줄 가능
    let regPwd = /^[a-zA-Z!@#$%^*+=-]{8,16}$/   // 비밀번호 8~16의 영문 대/소문자와 특수문자 숫자와 밑줄 가능
    let regNickName = /^[가-힣0-9]+$/;                    // 닉네임은 한글, 숫자 만 가능
    let regName = /^[가-힣a-zA-Z]+$/;                // 이름은 한글/영문 가능
    let regEmail = /^[a-zA-Z0-9_]{4,20}$/; // 4~20의 영문 대/소문자와 숫자와 밑줄 가능
        
    // 검사를 끝내고 필요한 내역들을 변수에 담아 회원가입처리한다.
    let mid = myform.mid.value.trim();
    let pwd = myform.pwd.value.trim();
    let nickName = myform.nickName.value;
    let name = myform.name.value;
    
    if(!regMid.test(mid)) {
      alert("아이디는 4~20자리의 영문 소/대문자와 숫자, 언더바(_)만 사용가능합니다.");
      myform.mid.focus();
      return false;
    }
    else if(!regPwd.test(pwd)) {
	    alert("비밀번호는 8~16자리의 영문/특수문자만 가능합니다.");
	    myform.pwd.focus();
    	return false;
    }
    else if(!regNickName.test(nickName)) {
	    alert("닉네임은 한글과 숫자만 사용가능합니다.");
	    myform.nickName.focus();
	    return false;
    }
    else if(!regName.test(name)) {
      alert("성명은 한글과 영문대소문자만 사용가능합니다.");
      myform.name.focus();
      return false;
    }
    else if(!regEmail.test(email1)) {
      alert("4~20의 영문 대/소문자와 숫자와 밑줄 가능");
      myform.email1.focus();
      return false;
    } */
            
    if(idCheckSw == 0) {
      alert("아이디 중복체크버튼을 눌러주세요");
      document.getElementById("midBtn").focus();
    }
    else if(nickCheckSw == 0) {
      alert("닉네임 중복체크버튼을 눌러주세요");
      document.getElementById("nickNameBtn").focus();
    }
    else {
        myform.submit();
    	}
		}	
    /* 
    // 아이디 중복체크
    function idCheck() {
	    let mid = myform.mid.value;
	    
	    if(mid.trim() == "") {
	      alert("아이디를 입력하세요!");
	      myform.mid.focus();
	    }
	    else {
	      idCheckSw = 1;
	        
	     		$.ajax({
	          url  : "${ctp}/MemberIdCheck.mem",
	          type : "get",
	          data : {mid : mid},
	          success:function(res) {
	            if(res != '0') {
	              alert("이미 사용중인 아이디 입니다. 다시 입력하세요.");
	              myform.mid.focus();
	            }
	            else alert("사용 가능한 아이디 입니다.");
	          },
	          error : function() {
	            alert("전송 오류!");
	          }
	      	});
	    }
	  }	
    
    // 닉네임 중복체크
    function nickCheck() {
      let nickName = myform.nickName.value;
      
      if(nickName.trim() == "") {
        alert("닉네임을 입력하세요!");
        myform.nickName.focus();
      }
      else {
        nickCheckSw = 1;
        
        $.ajax({
          url  : "${ctp}/MemberNickCheck.mem",
          type : "get",
          data : {nickName : nickName},
          success:function(res) {
            if(res != '0') {
              alert("이미 사용중인 닉네임 입니다. 다시 입력하세요.");
              myform.nickName.focus();
            }
            else alert("사용 가능한 닉네임 입니다.");
          },
          error : function() {
            alert("전송 오류!");
          }
        });
     	}
    }
    
    $(function(){
      $("#mid").on("blur", () => {
        idCheckSw = 0;
      });
      $("#nickName").on("blur", () => {
     		nickCheckSw = 0;
      });
    });
		
		 */
	</script>
<link href="css/styles.css" rel="stylesheet" />
<link href="${ctp}/css/join.css" rel="stylesheet" />
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/include/nav.jsp" />
    <div class="container join-container mt-5 mb-5">
      <div class="register-container">
        <h1 style="font-family: 'CWDangamAsac-Bold';">회원가입</h1>
        
        <div class="row gx-5 row-cols-2 row-cols-lg-3 py-5" style="color: #6f5340;">
	        <div class="col">
         		<p class="text-muted mb-0">step 1</p>
            <div class="proceedingStep step"><i class="fa-solid fa-user"></i></div>
            <div class="m-2">회원 정보 입력</div>
	        </div>
	        <div class="col">
         		<p class="text-muted mb-0">step 2</p>
            <div class="step"><i class="fa-solid fa-earth-americas"></i></div>
            <div class="m-2">언어 / 목표 입력</div>
	        </div>
	        <div class="col">
         		<p class="text-muted mb-0">step 3</p>
            <div class="step"><i class="fa-solid fa-check"></i></div>
            <div class="m-2">가입완료</div>
	        </div>
        </div>
        
        <form name="registerForm1" method="post" action="${ctp}/MemberJoinOk1.mem">
          <div class="form-group ">
            	<label for="mid">ID *&nbsp; &nbsp;<input type="button" value="아이디 중복체크" id="midBtn" class="btn checkBtn" onclick="idCheck()"/></label>
	            <input type="text" id="mid" name="mid" placeholder="아이디를 입력하세요" required>
          </div>
          <div class="form-group">
            <label for="name">Name *</label>
            <input type="text" id="name" name="name" placeholder="이름을 입력하세요" required>
          </div>
          <div class="form-group">
          	<label for="nickName">Nickname *&nbsp; &nbsp;<input type="button" value="닉네임 중복체크" id="midBtn" class="checkBtn" onclick="idCheck()"/></label>
            <input type="text" id="nickName" name="nickName" placeholder="닉네임을 입력하세요" required>
          </div>
          <div class="form-group">
            <label for="password">Password *</label>
            <input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요" required>
          </div>
          <div class="form-group">
            <label for="email">Email *</label>
            <input type="email" id="email" name="email" placeholder="이메일을 입력하세요" required>
          </div>
          <div class="form-group">
			      <div class="form-check-inline">
			        <label for="gender">Gender *</label> &nbsp; &nbsp;
			        <label class="form-check-label">
			          <input type="radio" style="color: #6f5340;" class="form-check-input" name="gender" value="남자" checked><span style="color: #6f5340;">남자</span>
			        </label>
			      </div>
			      <div class="form-check-inline">
			        <label class="form-check-label">
			          <input type="radio" class="form-check-input" name="gender" value="여자"><span style="color: #6f5340;">여자</span>
			        </label>
			      </div>
			    </div>
          
          <div class="form-group">
            <label for="birthday">Birthday *</label>
            <input type="date" id="birthday" name="birthday" class="mb-2" required>
          </div>
          <div class="form-group text-center ">
            <input type="submit" value="다음" class="myBtn">
          </div>
          
        </form>
      </div>
    </div>
    
</main>
<!-- Footer-->
<jsp:include page="/include/footer.jsp" />
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>
