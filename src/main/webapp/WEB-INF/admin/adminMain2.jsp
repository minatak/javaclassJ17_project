<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <%@ include file="/include/bs4.jsp" %>
    <link href="${ctp}/css/styles.css" rel="stylesheet" />
    <link href="${ctp}/css/admin.css?after" rel="stylesheet" />
    <style>
        body {	
            background-color: #f3f4f6;
            font-family: 'NEXON Lv1 Gothic OTF';
        }
        main body {
            font-family: 'NEXON Lv1 Gothic OTF';
            font-size: 14px;
        }
        main .dashboard-header {
            text-align: center;
            margin-bottom: 30px;
        }
        main h1 {
            font-family: 'CWDangamAsac-Bold';
            color: #35ae5f;
        }
        main .admin-section,
        main .report-section {
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #fefefe;
        }
        main h2 {
            font-family: 'CWDangamAsac-Bold';
            color: #36b574;
            margin-bottom: 20px;
        }
        main .quick-links a {
            color: #35ae5f;
        }
        .quick-links a:hover {
            color: #379866;
            text-decoration: none;
        }
    </style>
</head>
<jsp:include page="/include/nav.jsp" />
<body>
    <main class="container">
        <div class="dashboard-header mt-5">
            <h1>Admin Dashboard</h1>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="admin-section">
                    <h2>회원 관리</h2>
                    <ul class="quick-links">
                        <li><a href="AdminMemberList.ad">회원 관리</a></li>
                        <li>신고회원 (최근1주일) : <b>?</b>건</li>
                        <li>신규등록회원 : <a href="MemberList.ad?level=1"><b>${mCount}</b></a>건</li>
                        <li>탈퇴신청회원 : <a href=""><b>${m99Count}</b></a>건</li>
                    </ul>
                </div>
            </div>
            <div class="col-md-8">
                <div class="report-section">
                    <h2>신고 관리</h2>
                    <ul class="quick-links">
                        <li><a href="${ctp}/AdminReports.ad">신고 관리</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </main>
    <!-- Footer-->
    <jsp:include page="/include/footer.jsp" />
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
