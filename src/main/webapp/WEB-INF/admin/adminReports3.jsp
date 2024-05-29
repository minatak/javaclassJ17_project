<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>신고 관리</title>
  <%@ include file="/include/bs4.jsp" %>
  <link href="${ctp}/css/styles.css" rel="stylesheet" />
  <link href="${ctp}/css/admin.css" rel="stylesheet" />
  <style>

@font-face {
    font-family: 'MapoGoldenPier';
    src: url('https://gcore.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoGoldenPierA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'NEXON Lv1 Gothic OTF';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'NEXON Lv2 Gothic';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv2 Gothic.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'RixInooAriDuriR';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2207-01@1.0/RixInooAriDuriR.woff2') format('woff2');
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
    font-family: 'NEXON Lv1 Gothic OTF', sans-serif;
    background-color: #fefefe;
    margin: 0;
    padding: 0;
}

.container {
    width: 80%;
    margin: 0 auto;
    padding: 20px;
}

h1, h2 {
    font-family: 'NEXON Lv1 Gothic OTF';
    color: #35ae5f;
}

.admin-section {
    margin-bottom: 30px;
}

.admin-section h2 {
    font-size: 1.5em;
}

a {
    text-decoration: none;
    color: #35ae5f;
    font-family: 'NEXON Lv1 Gothic OTF';
}

a:hover {
    color: #fefefe;
    background-color: #35ae5f;
    padding: 5px;
    border-radius: 5px;
}

.admin-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.admin-table th, .admin-table td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
    font-family: 'NEXON Lv1 Gothic OTF';
}

.admin-table th {
    background-color: #f2f2f2;
}

.admin-profile-photo {
    width: 50px;
    height: 50px;
    border-radius: 50%;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
    font-family: 'NEXON Lv1 Gothic OTF';
    color: #35ae5f;
}

.form-group input, .form-group textarea {
    width: 100%;
    padding: 8px;
    box-sizing: border-box;
    font-family: 'NEXON Lv1 Gothic OTF';
    border: 1px solid #ddd;
    border-radius: 5px;
}


header .btn {
    font-style: normal;
    border: 1.2px solid #39b766;
    border-radius: 30px;
    background-color: #fefefe;
    color: #39b766;
    padding: 7px 17px;
    display: inline-block;
    font-size: 1.3em;
    transition: transform 0.3s ease;
}

header .btn:hover {
    transform: scale(1.05);
    color: #fefefe;
    background-color: #35ae5f;
}
  	
  
  </style>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    'use strict';
    
    // 전체선택/취소
    function toggleAllCheckboxes(source) {
      const checkboxes = document.querySelectorAll('input[name="idxFlag"]');
      checkboxes.forEach(checkbox => checkbox.checked = source.checked);
    }
    /* 
    function reportCheck(part, partIdx, complaint) {
      $.ajax({
        url: "ReportCheck.ad",
        type: "post",
        data: {
          part: part,
          partIdx: partIdx,
          complaint: complaint
        },
        success: function() {
          location.reload();
        },
        error: function() {
          alert("전송오류!");
        }
      });
    }
     */
    function modalCheck(mid, nickName, name, email, gender, birthday, startDate) {
      $("#modalMid").text(mid);
      $("#modalNickName").text(nickName);
      $("#modalName").text(name);
      $("#modalEmail").text(email);
      $("#modalGender").text(gender);
      $("#modalBirthday").text(birthday);
      $("#modalStartDate").text(startDate);
    }
    
    function memberDeleteOk(mid) {
      let ans = confirm("선택하신 회원을 영구 삭제 하시겠습니까?");
      if(ans) {
        $.ajax({
          url: "MemberDeleteOk.ad",
          type: "post",
          data: { mid: mid },
          success: function(res) {
            if(res != "0") {
              alert("영구 삭제 되었습니다.");
              location.reload();
            } else {
              alert("회원 삭제에 실패했습니다.");
            }
          }
        });
      }
    }
  </script>
</head>
<body>
  <jsp:include page="/include/nav.jsp" />
  <div class="container mt-4">
    <h1>신 고 리 스 트</h1>
    <div class="form-check form-check-inline">
      <input class="form-check-input" type="checkbox" id="selectAll" onclick="toggleAllCheckboxes(this)">
      <label class="form-check-label" for="selectAll">전체선택/취소</label>
    </div>
    <table class="table table-striped table-hover mt-3">
      <thead class="table-dark">
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
            <td><input type="checkbox" name="idxFlag" id="idxFlag${vo.mid}" value="${vo.mid}"/> ${reportCnt}</td>
            <td>
              <a href="#" onclick="modalCheck('${vo.mid}', '${vo.nickName}', '${vo.name}', '${vo.email}', '${vo.gender}', '${fn:substring(vo.birthday, 0, 10)}', '${vo.startDate}')" data-toggle="modal" data-target="#myModal">${vo.mid}</a>
            </td>
            <td>${vo.reportedMid}</td>
            <td>${vo.reportingMid}</td>
            <td>${vo.reason}</td>
            <td>${vo.reportDate}</td>
            <td>
              <%-- <a href="javascript:reportCheck('${vo.part}', '${vo.partIdx}', '${vo.complaint}')" class="badge ${vo.complaint == 'NO' ? 'badge-success' : 'badge-warning'}">${vo.complaint == 'NO' ? '표시중' : '감춰짐'}</a> --%>
              <br/>
              <a href="javascript:memberDeleteOk(${vo.mid})" class="badge badge-danger">탈퇴처리</a>
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
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <!-- Modal body -->
        <div class="modal-body">
          아이디: <span id="modalMid"></span><hr/>
          이름: <span id="modalName"></span><br/>
          닉네임: <span id="modalNickName"></span><br/>
          성별: <span id="modalGender"></span><hr/>
          생년월일: <span id="modalBirthday"></span><hr/>
          가입일: <span id="modalStartDate"></span><hr/>
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  
  <jsp:include page="/include/footer.jsp" />
</body>
</html>
