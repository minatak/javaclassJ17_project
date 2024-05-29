<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${vo.name}님의 프로필</title>
  <%@ include file="/include/bs4.jsp" %>
  <link href="${ctp}/css/styles.css" rel="stylesheet" />
  <link href="${ctp}/css/main.css?after" rel="stylesheet" />
  <style>
    .container {
      max-width: 900px;
      margin: 0 auto;
      padding: 20px;
      font-family: 'NEXON Lv1 Gothic OTF';
      color: #5e503f;
    }
    .modal, modal-header, modal-body, modal-footer {
      font-family: 'NEXON Lv1 Gothic OTF';
      color: #5e503f;
    }
    modal-body .button {
      font-family: 'NEXON Lv1 Gothic OTF';
      background-color: #39b766;
      color: white;
    }
    h1 {
      color: #35ae5f;
      font-family: 'CWDangamAsac-Bold';
      text-align: center;
      padding: 30px;
    }
    .profile-card {
      display: flex;
      flex-direction: column;
      padding: 20px;
      background-color: #fff;
      position: relative;
    }
    .profile-photo {
      width: 125px;
      height: 125px;
      border-radius: 50%;
      object-fit: cover;
      margin: 0 auto 20px;
      border: 1px solid #ddd;
    }
    .profile-info {
      flex: 1;
      padding: 0 20px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 20px;
    }
    th, td {
      padding: 10px;
      text-align: left;
      border-bottom: 1px solid #e0dac3;
    }
    th {
      width: 30%;
      background-color: #f9f9f9;
    }
    .description {
      margin-top: 20px;
    }
    .description h3 {
      margin-bottom: 10px;
    }
    .description p {
      margin-bottom: 10px;
      margin:10px;
    }
    .translate-button-container {
      display: flex;
      justify-content: space-between;
      margin: 20px 0; /* 상하 여백 추가 */
    }
    .translate-button-container button, .button input[type="button"] {
      padding: 7px 16px;
      border: none;
      background-color: #e0dac3;
      font-size: 12px;
      color: #5e503f; /* 색상 앞에 # 추가 */
      border: 1px solid #5e503f;
      border-radius: 15px; 
      cursor: pointer;
      transition: background-color 0.3s, color 0.3s;
    }
    .translate-button-container button:hover, .button input[type="button"]:hover {
      background-color: #a88c6a;
      color: #322d27;
    }
    .message-section {
      margin-top: 60px;
      text-align: center;
    }
    .message-section button {
      padding: 10px 20px;
      border: none;
      background-color: #39b766;
      color: white;
      cursor: pointer;
    }
    .highlight {
      background-color: #fdfad1;
      padding: 2px 4px;
    }
  </style>
  <script>
  	'use strict';
  	
  	 // 신고시 '기타'항목 선택시에 textarea 보여주기
    function etcShow() {
    	$("#complaintTxt").show();
    }
    
    // 신고화면 선택후 신고사항 전송하기
    function complaintCheck() {
    	if (!$("input[type=radio][name=complaint]:checked").is(':checked')) {
    		alert("신고항목을 선택하세요");
    		return false;
    	}
    	if($("input[type=radio]:checked").val() == '기타' && $("#complaintTxt").val() == "") {
    		alert("기타 사유를 입력해 주세요.");
    		return false;
    	}
    	
    	let cpContent = modalForm.complaint.value;
    	if(cpContent == '기타') cpContent += '/' + $("#complaintTxt").val();
    	
    	//alert("신고내용 : " + cpContent);
    	let query = {
    			reportingMid  : '${sMid}',
    			reportedMid  : '${vo.mid}',
    			reason : cpContent
    	}
    	
    	$.ajax({
    		url  : "MemberReportInput.ad",
    		type : "post",
    		data : query,
    		success:function(res) {
    			if(res != "0") {
    				alert("신고되었습니다.");
    				location.reload();
    			}
    			else alert("회원 신고에 실패했습니다.");
    		},
    		error : function() {
    			alert("전송 오류!");
    		}
   		});
    }
    
  
  </script>
</head>
  <jsp:include page="/include/nav.jsp" />
<body>
  <div class="container">
    <h1><span class="highlight">${vo.nickName}</span>님의 프로필</h1>
    
    <div class="profile-card">
      <img src="${ctp}/images/member/${vo.photo}" alt="Profile Photo" class="profile-photo" />
      <div class="profile-info mt-2">
        <table>
          <tr>
            <th><span class="highlight">이름</span></th>
            <td>${vo.name}</td>
          </tr>
          <tr>
            <th><span class="highlight">도시</span></th>
            <td>${vo.city}</td>
          </tr>
          <tr>
            <th><span class="highlight">본국</span></th>
            <td>${vo.country}</td>
          </tr>
          <tr>
            <th><span class="highlight">현재 국가</span></th>
            <td>${vo.country}</td>
          </tr>
          <tr>
            <th><span class="highlight">연령</span></th>
            <td>${age}</td>
          </tr>
          <tr>
            <th><span class="highlight">성별</span></th>
            <td>${vo.gender}</td>
          </tr>
          <tr>
            <th><span class="highlight">모국어</span></th>
            <td>${vo.nativeLanguage}</td>
          </tr>
          <tr>
            <th><span class="highlight">학습할 언어</span></th>
            <td>${vo.learningLanguage}</td>
          </tr>
        </table>
        <div class="description">
          <h4>설명</h4>
          <p>${vo.content}</p>
        </div>
    		 <div class="translate-button-container">
          <c:if test="${sNickName != vo.nickName}">
            <div class="button">
              <c:if test="${report == 'OK'}"><font color='red'><b>현재 신고가 접수된 회원입니다.</b></font></c:if>
              <c:if test="${report != 'OK'}"><input type="button" value="신고하기" data-toggle="modal" data-target="#myModal" /></c:if>
            </div>
          </c:if>
          <button id="translateBtn">번역하기</button>
        </div>
      </div>
    </div>
    <div class="message-section mb-5">
      <button onclick="location.href='${ctp}/ChatList.chat?receiveId=${vo.mid}'">메세지 보내기</button>
      <button onclick="location.href='${ctp}/MemberList.mem'">돌아가기</button>
    </div>
  </div>
  
  <!-- 신고하기 폼 모달창 -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">현재 회원을 신고합니다.</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <b>신고사유 선택</b>
          <hr/>
          <form name="modalForm">
            <div><input type="radio" name="complaint" id="complaint1" value="광고,홍보,영리목적"/> 광고,홍보,영리목적</div>
            <div><input type="radio" name="complaint" id="complaint2" value="욕설,비방,차별,혐오"/> 욕설,비방,차별,혐오</div>
            <div><input type="radio" name="complaint" id="complaint3" value="불법정보"/> 불법정보</div>
            <div><input type="radio" name="complaint" id="complaint4" value="음란,청소년유해"/> 음란,청소년유해</div>
            <div><input type="radio" name="complaint" id="complaint5" value="개인정보노출,유포,거래"/> 개인정보노출,유포,거래</div>
            <div><input type="radio" name="complaint" id="complaint6" value="도배,스팸"/> 도배,스팸</div>
            <div><input type="radio" name="complaint" id="complaint7" value="기타" onclick="etcShow()"/> 기타</div>
            <div id="etc"><textarea rows="2" id="complaintTxt" class="form-control" style="display:none"></textarea></div>
            <hr/>
            <input type="button" value="확인" onclick="complaintCheck()" class="form-control btn btn-success" />
          </form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
  
  <jsp:include page="/include/footer.jsp" />
  <!-- Bootstrap core JS-->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
