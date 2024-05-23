<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%
	// 로그인창에 아이디 체크 유무에 대한 처리
	// 쿠키를 검색해서 cMid가 있을때 가져와서 아이디입력창에 뿌릴수 있게 한다.
	Cookie[] cookies = request.getCookies();

	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")) {
				pageContext.setAttribute("mid", cookies[i].getValue());
				break;
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>
<%@ include file = "/include/bs4.jsp" %>
<link href="css/styles.css" rel="stylesheet" />  
  <style>
		body {
		  font-family: 'NEXON Lv1 Gothic OTF';
		  background-color: #f3f4f6;
		  /* justify-content: center !important; */
		  /* align-items: center; */
		}
		
		/* .container {
			margin-top:50px;
		} */
		
		.login-container {
		  background-color: #ffffff;
		  padding: 30px;
		  /* width: 800px; */
		  max-width: 400px;
		  text-align: center;
		  margin: 20px;
		}
		
		.login-container h1 {
		  margin-bottom: 20px;
		  color: #35ae5f;
		  font-family: 'CWDangamAsac-Bold';
		}
		
		.form-group {
		  margin-bottom: 15px;
		  text-align: left;
		}
		
		.form-group label {
		  margin-bottom: 5px;
		  color: #36b574;
		}
		
		.form-group input[type="text"],
		.form-group input[type="password"] {
		  width: 100%;
		  padding: 10px;
		  border: 1px solid #ddd;
		  background: #fefefe;
		  font-size: 16px;
		  /* color: #36b574; */
		}
		
		input {
			color:#6f5340;
		}
		
		.form-group input:focus {
		  border-color: #36b574;
		  outline: none;
		  background: #fff;
		}
		
		.myBtn {
		  border: 1.2px #39b766;
		  color: #fefefe;
		  background-color: #35ae5f;
		  padding: 10px 20px;
		 	width: 100%;
		}
		
		.myBtn:hover {
			background-color: #39b766;
		}
		
		.form-group input[type="checkbox"] {
		  margin-right: 5px;
		  vertical-align: middle;
		    
		}
		
		.otherLink {
			color: #35ae5f;
		}
		
		@font-face {
		  font-family: 'CWDangamAsac-Bold';
		  src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/CWDangamAsac-Bold.woff') format('woff');
		  font-weight: normal;
		  font-style: normal;
		}
		
		a {
			color: #35ae5f; /* 기본 색상 */
		}
		
		a:hover,
		a:focus,
		a:active,
		a:visited {
			color: #379866; /* 링크의 상태별로 색상 변경 */
			text-decoration: none;
		}
       
	</style>
</head>
 <body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<jsp:include page="/include/nav.jsp" />
		
		 <header class="py-5" style="background-color:#fdfad1;">
                <div class="container px-5">
                    <div class="row gx-5 ">
                        <div class="col-lg-8 col-xl-7 col-xxl-6">
                            <div class="my-5 ">
                            </div>
                        </div>
                    </div>
                </div>
            </header>
		
		<div class="container mt-5 mb-5">
		  <div class="login-container text-center" style="margin:0 auto;width:400px; height:500px;">
		    <h1>Login</h1>
		    <form name="loginForm" method="post" action="${ctp}/MemberLoginOk.mem">
		      <div class="form-group">
		        <label for="username">Username</label>
		        <input type="text" id="mid" name="mid" value="${mid}" placeholder="아이디를 입력하세요" required autofocus>
		      </div>
		      <div class="form-group">
		        <label for="password">Password</label>
		        <input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요" required>    
		      </div>
		      <div class="form-group">
		      	<input type="submit" value="Login" class="myBtn">
		      </div>
		      <div class="form-group otherLink">
		        <input type="checkbox" name="idSave" checked />아이디 저장 |
		        <a class="custom-btn" href="${ctp}/MemberJoin.mem">회원가입</a> |
		        <a class="custom-btn" href="${ctp}/MemberJoin.mem'">아이디/비밀번호 찾기</a>
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
