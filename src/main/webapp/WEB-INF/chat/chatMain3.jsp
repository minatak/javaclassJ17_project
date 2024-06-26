<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>메시지 보기</title>
  <%@ include file="/include/bs4.jsp" %>
  <link href="${ctp}/css/styles.css" rel="stylesheet" />
  <style>
    @charset "UTF-8";

    body {
      font-family: 'NEXON Lv1 Gothic OTF';
      background-color: #fefefe;
     /*  font-size: 14px; */
      margin: 0;
      padding: 0;
      /* display: flex; */
      height: 100vh;
    }
    
    .chatBody {
      display: flex;     
       font-size: 14px;
      height: 87%;
    }

    .sidebar {
      width: 80px;
      background-color: #2e2e2e;
      color: #fff;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 20px 0;
    }

    .sidebar img {
      width: 50px;
      height: 50px;
      border-radius: 50%;
      object-fit: cover;
      margin-bottom: 20px;
    }

    .sidebar .logout {
      margin-top: auto;
      margin-bottom: 20px;
      font-size: 24px;
      cursor: pointer;
    }

    .friends-list {
      width: 250px;
      background-color: #76bc8f;
      color: #fff;
      display: flex;
      flex-direction: column;
      padding: 20px;
    }

    .friends-list .search {
      margin-bottom: 20px;
    }

    /* .friends-list .search input {
      width: 100%;
      padding: 10px;
      border: none;
      border-radius: 5px;
      font-size: 14px;
    } */

    .friends-list .friend {
      display: flex;
      align-items: center;
      margin-bottom: 15px;
      cursor: pointer;
    }

    .friends-list .friend img {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      object-fit: cover;
      margin-right: 10px;
    }

    .friends-list .friend .name {
      font-size: 16px;
    }

    .chat-container {
      flex-grow: 1;
      display: flex;
      flex-direction: column;
    }

    .chat-body {
      flex-grow: 1;
      padding: 0;
      overflow-y: hidden;
      background-color: #f5f5f5;
    }
    .chat-header {
      background-color: #ffffff;
      border: 1.2px solid #dbe7df; /*  글자 색과 같은 얇은 테두리 */
      border-top: none; 
      border-left: none;
      border-right: none;
      color: #39b766;
      padding: 20px;
      display: flex;
      align-items: center;
      justify-content: space-between;
    }
    .chat-header a {
      text-decoration: none;
      color: #39b766;
    }
    .chat-header a:hover {
      text-decoration: none;
      color: #37aa60;
    }

    .profile-img {
      width: 25px;
      height: 25px;
      border-radius: 50%;
      object-fit: cover;
      margin-right: 15px;
    }

    .chat-header .user-info {
      display: flex;
      align-items: center;
    }

    .chat-header .user-info h3 {
      margin: 0;
      font-size: 18px;
    }

    .chat-header .actions {
      display: flex;
      gap: 10px;
    }

    .chat-header .actions i {
      font-size: 20px;
      cursor: pointer;
    }
     .chat-footer {
      padding: 20px;
      background-color: #fff;
      display: flex;
      align-items: center;
    }

    .chat-footer input {
      flex-grow: 1;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 5px;
      margin-right: 10px;
      font-size: 16px;
    }

    .chat-footer button {
      padding: 10px 20px;
      background-color: #35ae5f;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    .chat-footer button:hover {
      background-color: #39b766;
    }
    
    a {
      text-decoration: none;
      color: #fdfad1;
    }
    a:hover {
      text-decoration: none;
      color: #ece9c1;
    }
    
  </style>
  <script>
    'use strict';
    

/*     function sendMessage() {
      var message = document.getElementById("message").value;
      var senderMid = "${sMid}";
      var receiverMid = "${sReceiverMid}";
      // Add AJAX call to send the message
    } */
    
    
    function sendMessage() {
    	let message = $("#message").val();
    	let senderMid = "${sMid}";
      let receiverMid = "${sReceiverMid}";
    	
    	if(message.trim() == "") {
    		alert("전송하실 메세지를 입력하세요");
    		return false;
    	}
    	else if(message.length >= 200) {
    		alert("메세지는 200자 이내만 입력 가능합니다.");
    		return false;
    	}
    	else if(message.trim() != "") {
    		$.ajax({
    			url  : "ChatInput.chat",
    			type : "post",
    			data : {message : message, senderMid : senderMid, receiverMid : receiverMid},
    			success:function() {
      			location.reload();
      		},
    			error: function() {
    				alert("전송오류!!");
    			}
    		});
    	}
    	
    }
    
    $(function() {
			$("#message").on("keydown", function(e) {
				if(e.keyCode == 13) sendMessage();
			});
	});
    
    
    
  </script>
</head>
<body>
  <jsp:include page="/include/nav.jsp" />
  <div class="chatBody">
  <%-- 
	  <div class="sidebar">
	    <a href="MemberInfo.mem"><img src="${ctp}/images/member/noimage.png" alt="Profile Image"></a>
	    <a href="Main.com" class="logout"><i class="fas fa-sign-out-alt"></i></a>
	  </div>
	   --%>
	  <div class="friends-list">
	    <form name="myform" method="post" action="ChatMain.chat">
		    <div class="search input-group">
		      <input type="text" name="searchStr" placeholder="검색..." class="form-control">
		      <button onclick="submit" class="btn btn-success input-group-append"><i class="fa-solid fa-magnifying-glass"></i></button>
		    </div>
	    </form>
	    
	    
	    <c:forEach var="v" items="${midVos}" varStatus="st">
	      <c:set var="vo" value="${fn:split(v,'/')}"/>
	      <c:if test="${vo[0] != sMid}">
		      <div class="friend">
		        <%-- <img src="${ctp}/images/member/${vo.photo}" alt="Friend Image"> --%>
		        <img src="${ctp}/images/member/${vo[1]}" alt="Friend Image">
		        <div>
		          <%-- <div class="name"><a href="ChatMain.chat?receiverMid=${vo.receiverMid}">${vo.receiverMid}</a></div> --%>
		          <div class="name"><a href="ChatMain.chat?receiverMid=${vo[0]}">${vo[0]}</a></div>
		        </div>
		      </div>
	      </c:if>
	    </c:forEach>
	    
	  </div>
	  
	  <div class="chat-container">
	    <div class="chat-header">
	      <div class="user-info">
	        <a href="MemberProfile.mem?mid=${sReceiverMid}">
	        <h3>${sReceiverMid}</h3></a>
	      </div>
	      <hr/>
	    </div>
	  
		  <div class="chat-container">
		    <div class="chat-body" id="chatBox">
		      <iframe src="${ctp}/include/chatMessage.jsp" style="width:100%; height:100%; border:none;"></iframe>
		    </div>
		  </div>
	  
	  	<div class="chat-footer">
	      <input type="text" id="message" name="message" placeholder="메시지를 입력하세요..." class="form-control">
	      <button onclick="sendMessage()">전송</button>
	    </div>
	  </div>
  </div>
  <jsp:include page="/include/footer.jsp" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
