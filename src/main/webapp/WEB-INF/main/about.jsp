<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>about</title>
        <%@ include file = "/include/bs4.jsp" %>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <style>
    body {
        font-family: 'NEXON Lv1 Gothic OTF';
       /*  background-color: #f3f4f6; */
    }
 		h1 {
		  margin-bottom: 20px;
		  color: #35ae5f;
		  font-family: 'CWDangamAsac-Bold';
		}
    .about-container {
        background-color: #ffffff;
        padding: 30px;
        max-width: 800px;
        margin: 20px auto;
    }

    .about-container h1 {
        margin-bottom: 20px;
        color: #35ae5f;
        font-family: 'CWDangamAsac-Bold';
        text-align: center;
    }

    .about-container h2 {
        color: #36b574;
        margin-top: 20px;
        font-size: 1.5em;
    }

    .about-container h3 {
        color: #36b574;
        margin-top: 15px;
        font-size: 1.2em;
    }

    .about-container p {
        color: #6f5340;
        line-height: 1.6;
        margin-bottom: 15px;
    }

    .about-container ul {
        color: #6f5340;
        margin-bottom: 15px;
    }

    .about-container li {
        margin-bottom: 10px;
    }
    
    @font-face {
	    font-family: 'CWDangamAsac-Bold';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/CWDangamAsac-Bold.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
		}
</style>
    </head>
    <body class="d-flex flex-column h-100">
		<main class="flex-shrink-0">
    <jsp:include page="/include/nav.jsp" />
    <div class="container mt-5 mb-5">
        <div class="about-container">
            <h1>About LinguaLink</h1><br/>
            <h2>Through Language</h2>
            <p><strong>LinguaLink</strong>는 'Lingua'와 'Link'의 결합으로, 각각 '언어'와 '연결'을 의미합니다. 이 이름은 단순히 언어 교환을 넘어, 전 세계의 사람들이 서로의 문화를 이해하고, 다리 역할을 하는 플랫폼을 지향합니다. LinguaLink는 사용자들이 새로운 언어를 배우는 동시에, 다양한 문화적 배경을 가진 친구들을 만나고 소통할 수 있는 공간을 제공합니다.</p>
						<br/>
            <h2>왜 LinguaLink인가?</h2>
            <ul>
                <li><strong>글로벌 커뮤니케이션 허브</strong>: LinguaLink는 전 세계 사람들이 언어를 통해 서로 연결되는 커뮤니케이션 허브입니다. 여기서 사용자는 자신이 배우고자 하는 언어를 모국어로 하는 사람들과 직접 대화하고 교류할 수 있습니다.</li>
                <li><strong>문화적 연결</strong>: 언어는 단순한 의사소통 도구를 넘어, 문화와 사고방식을 담고 있습니다. LinguaLink는 언어를 통해 다양한 문화적 경험과 인사이트를 나눌 수 있는 기회를 제공합니다.</li>
                <li><strong>맞춤형 학습 경험</strong>: LinguaLink는 사용자의 언어 학습 목표와 필요에 맞춰, 가장 적합한 언어 파트너를 연결해줍니다. 이를 통해 보다 효과적이고 즐거운 학습 경험을 제공합니다.</li>
                <li><strong>커뮤니티 중심</strong>: LinguaLink는 단순한 언어 교환을 넘어서, 사용자들이 서로 돕고 배우는 커뮤니티를 형성합니다. 각종 이벤트와 그룹 활동을 통해 더욱 풍부한 언어 학습 환경을 조성합니다.</li>
            </ul>
						<br/>
            <p>LinguaLink와 함께라면, 여러분은 언어의 장벽을 넘어 전 세계의 친구들과 소통하며, 진정한 글로벌 시민으로 성장할 수 있습니다. 지금 바로 LinguaLink에 가입하여 새로운 언어의 세계로 첫 발을 내딛어 보세요!</p>

            <h2>주요 기능</h2>
            <h3>1. 사용자 기능</h3>
            <ul>
                <li><strong>회원가입 및 로그인</strong>: 이메일, 비밀번호, 프로필 정보(사용 언어, 배우고 싶은 언어, 관심사 등)를 입력하여 가입하고, 쉽게 로그인할 수 있습니다.</li>
                <li><strong>프로필 관리</strong>: 프로필 사진, 자기소개, 언어 능력 수준을 설정하여 자신을 표현할 수 있습니다.</li>
                <li><strong>언어 파트너 찾기</strong>: 필터(언어, 지역, 관심사 등)를 사용하여 적절한 파트너를 쉽게 검색할 수 있습니다.</li>
                <li><strong>채팅 기능</strong>: 텍스트 채팅, 음성/영상 통화를 통해 원어민과 실시간으로 소통하며 언어를 연습할 수 있습니다.</li>
                <li><strong>학습 도구</strong>: 언어 학습을 돕기 위한 퀴즈, 플래시 카드, 메모장을 활용하여 재미있게 공부할 수 있습니다.</li>
                <li><strong>리뷰 및 평가</strong>: 사용자 간의 리뷰와 평가 시스템을 통해 신뢰할 수 있는 파트너를 찾을 수 있습니다.</li>
            </ul>

            <h3>2. 관리자 기능</h3>
            <ul>
                <li><strong>사용자 관리</strong>: 사용자 정보를 조회하고 관리할 수 있습니다.</li>
                <li><strong>신고 관리</strong>: 사용자 신고를 처리하여 안전하고 쾌적한 학습 환경을 유지합니다.</li>
            </ul>
						<br/>
            <h2>기능 소개</h2>
            <h3>회원 조회하기</h3>
            <p>전 세계 사용자들과 언어를 교환하며 학습할 수 있습니다 :) 나와 학습 목표, 관심사가 일치하는 사용자를 찾아보세요!</p>

            <h3>채팅하기</h3>
            <p>원어민과 실시간으로 채팅하며 자연스러운 대화 연습을 해보세요. 텍스트, 음성, 영상 채팅을 통해 다양한 언어 스킬을 향상시킬 수 있습니다!</p>

            <h3>학습하기</h3>
            <p>나만의 단어장을 생성하고, 암기/테스트 기능을 활용하여 효과적으로 단어를 학습하세요. 맞춤형 퀴즈와 플래시카드를 통해 기억을 강화하고, 즐겁게 학습할 수 있습니다!</p>
						<br/>
            <h2>LinguaLink의 주요 특징</h2>
            <h3>1. 원어민과 연결</h3>
            <p>LinguaLink는 전 세계 원어민과 함께 연습할 수 있는 기회를 제공합니다. 실제 대화에 참여함으로써 교과서에서는 얻을 수 없는 진정한 언어 능력과 문화적 통찰력을 얻을 수 있습니다.</p>

            <h3>2. 맞춤형 학습 경로</h3>
            <p>LinguaLink의 언어 학습 여정은 여러분의 필요와 목표에 맞게 맞춤화되어 있습니다. 초급자부터 실력을 향상시키고자 하는 분까지, 여러분의 레벨에 맞는 파트너와 리소스를 연결해 드립니다.</p>

            <h3>3. 문화 교류</h3>
            <p>언어는 단순한 단어가 아니라 서로 다른 문화를 이해하는 관문입니다. LinguaLink는 문화 교류를 장려하여 다양한 관점과 전통을 탐구할 수 있도록 합니다.</p>

            <h3>4. 인터랙티브 학습 도구</h3>
            <p>LinguaLink는 언어 학습 경험을 향상시킬 수 있는 다양한 대화형 도구를 제공합니다. 라이브 채팅, 어휘 게임, 단어 퀴즈 등을 통해 학습을 재미있고 효과적으로 만들어줍니다.</p>

            <h3>5. 지원 live 커뮤니티</h3>
            <p>LinguaLink는 언어에 열정을 가진 학습자들과 선생님들이 모인 활기찬 커뮤니티를 제공합니다. 팁을 공유하고, 질문하고, 성과를 함께 축하하며 상호 지원과 격려를 받을 수 있습니다.</p>

            <p>LinguaLink와 함께 새로운 언어의 세계로 여행을 떠나보세요. 지금 바로 가입하여 글로벌 커뮤니티의 일원이 되세요!</p>
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
