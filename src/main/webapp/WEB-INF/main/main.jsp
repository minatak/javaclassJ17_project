<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>LinguaLink</title>
  <%@ include file="/include/bs4.jsp" %>
  <%@ include file="/include/bs4.jsp" %>
	<link href="css/styles.css" rel="stylesheet" />
	<link href="${ctp}/css/main.css" rel="stylesheet" />
  <!-- Favicon-->
  <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
</head>
<body class="d-flex flex-column h-100">
  <main class="flex-shrink-0">
    <jsp:include page="/include/nav.jsp" />
    <!-- Header-->
    <header class="py-5" style="background-color:#fdfad1;">
      <div class="container px-5">
        <div class="row gx-5">
          <div class="col-lg-8 col-xl-7 col-xxl-6">
            <div class="my-5">
              <c:choose>
                <c:when test="${not empty user}">
                  <h4 class="header_sub" style="font-family: 'Pretendard-Regular'; color:#39b766;">${user.name}님 환영합니다 :)</h4>
                </c:when>
                <c:otherwise>
                  <h4 class="header_sub" style="font-family: 'Pretendard-Regular'; color:#39b766;">Language Exchange</h4>
                </c:otherwise>
              </c:choose>
              <h1 class="mb-3" style="font-family: 'CWDangamAsac-Bold'; font-size: 3em; color:#35ae5f;">LinguaLink</h1>
              <div class="header_des">
                <p class="lead fw-normal mb-4">Lingua는 라틴어로 <b>언어</b>를 의미하며, Link는 <b>연결</b>을 의미합니다. 실용적 언어를 배우는 동시에, 다양한 문화적 배경을 가진 친구들을 만나고 소통할 수 있는 공간을 제공합니다.</p>
              </div>
              <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                <c:if test="${empty user}">
                  <a class="btn btn-lg px-4 me-sm-3 mr-4" href="Register.mem" style="font-family: 'NEXON Lv1 Gothic OTF';">지금 가입하기</a>
                  <a class="btn btn-lg px-4" href="Login.mem" style="font-family: 'NEXON Lv1 Gothic OTF';">로그인하기</a>
                </c:if>
                <c:if test="${not empty user}">
                  <a class="btn btn-lg px-4 me-sm-3 mr-4" href="Profile.mem" style="font-family: 'NEXON Lv1 Gothic OTF';">프로필 관리</a>
                  <a class="btn btn-lg px-4" href="Logout.mem" style="font-family: 'NEXON Lv1 Gothic OTF';">로그아웃</a>
                </c:if>
              </div>
            </div>
          </div>
          <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center">
            <img class="img-fluid rounded-3 my-5" src="https://dummyimage.com/600x400/343a40/6c757d" alt="..." />
          </div>
        </div>
      </div>
    </header>
    <!-- 공부하는 언어 선택 아이콘. 로그인 상태일 경우 이 부분이 보이지 않음 ! -->
    <c:if test="${empty user}">
      <div class="container languageSelect mt-5 mb-5" style="background-color:#fefefe; font-family: 'NEXON Lv1 Gothic OTF' !important;">
        <div class="row gx-5 justify-content-center">
          <div class="col-lg-8 col-xl-6">
            <div class="text-center mt-5">
              <h1 class="fw-bolder" style="font-family: 'CWDangamAsac-Bold'; color:#35ae5f;">어떤 언어를 공부하고 있나요?</h1>
              <p class="lead fw-normal text-muted mb-5">선호하는 국가 혹은 언어를 선택하세요</p>
            </div>
          </div>
        </div>
        <div class="flagGroup mr-5 ml-5">
          <div class="flag">
            <a href="#"><img src="${ctp}/images/flag/KR.jpg" alt="Korean Flag"></a>
            <div class="country">한국어</div>
          </div>
          <div class="flag">
            <a href="#"><img src="${ctp}/images/flag/US.gif" alt="US Flag"></a>
            <div class="country">영어</div>
          </div>
          <div class="flag">
            <a href="#"><img src="${ctp}/images/flag/ES.gif" alt="Spanish Flag"></a>
            <div class="country">스페인어</div>
          </div>
          <div class="flag">
            <a href="#"><img src="${ctp}/images/flag/FR.gif" alt="French Flag"></a>
            <div class="country">프랑스어</div>
          </div>
          <div class="flag">
            <a href="#"><img src="${ctp}/images/flag/JP.gif" alt="Japanese Flag"></a>
            <div class="country">일본어</div>
          </div>
          <div class="flag">
            <a href="#"><img src="${ctp}/images/flag/DE.gif" alt="German Flag"></a>
            <div class="country">독일어</div>
          </div>
          <div class="flag">
            <a href="#"><img src="${ctp}/images/flag/CN.gif" alt="Chinese Flag"></a>
            <div class="country">중국어</div>
          </div>
          <div class="flag">
            <a href="#"><img src="${ctp}/images/flag/RU.gif" alt="Russian Flag"></a>
            <div class="country">러시아어</div>
          </div>
        </div>
      </div>
    </c:if>
    <!-- service preview section-->
    <section class="pb-1 pt-5" style="background-color:#fbfbf1;">
      <div class="container px-5 my-5">
        <div class="row gx-5 justify-content-center">
          <div class="col-lg-8 col-xl-6">
            <div class="text-center">
              <!-- 이 설명도 로그아웃 상태일 때만 보임. -->
              <c:if test="${empty user}">
                <h1 class="fw-bolder" style="font-family: 'CWDangamAsac-Bold';">주요 기능 페이지 바로가기</h1>
                <p class="lead fw-normal mb-5">아래 소개를 클릭 시 주요 기능 페이지로 바로 이동할 수 있습니다.</p>
              </c:if>
            </div>
          </div>
        </div>
        <div class="row gx-5">
          <div class="col-lg-4 mb-5">
            <div class="serviceCard">
              <img class="card-img-top" src="https://dummyimage.com/600x350/ced4da/6c757d" alt="..." />
              <div class="card-body p-4 text-center">
                <h4><a class="card-title mb-3" href="#!">회원 조회하기</a></h4>
                <p class="card-text mb-0">전 세계 사용자들과 언어를 교환하며 학습할 수 있습니다. 나와 학습 목표, 관심사가 일치하는 사용자를 찾아보세요!</p>
              </div>
              <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                <div class="d-flex justify-content-center">
                  <div class="icon-container">
                    <i class="fa-solid fa-arrow-right"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-4 mb-5">
            <div class="serviceCard">
              <img class="card-img-top padded-img" src="${ctp}/images/logo/chat.png" alt="Chat Logo" />
              <div class="card-body p-4 text-center">
                <h4><a class="card-title mb-3" href="#!">채팅하기</a></h4>
                <p class="card-text mb-0">원어민과 실시간으로 채팅하며 자연스러운 대화 연습을 해보세요. 텍스트, 음성, 영상 채팅을 통해 다양한 언어 스킬을 향상시킬 수 있습니다!</p>
              </div>
              <div class="card-footer p-3 pt-0 bg-transparent border-top-0">
                <div class="d-flex justify-content-center">
                  <div class="icon-container">
                    <i class="fa-solid fa-arrow-right"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-4 mb-5">
            <div class="serviceCard">
              <img class="card-img-top" src="https://dummyimage.com/600x350/ced4da/6c757d" alt="..." />
              <div class="card-body p-3 text-center">
                <h4><a class="card-title mb-3" href="#!">학습하기</a></h4>
                <p class="card-text mb-0">나만의 단어장을 생성하고 암기 테스트 기능을 활용하여 효과적으로 단어를 학습하세요. 맞춤형 퀴즈와 플래시카드를 통해 기억을 강화하고 즐겁게 학습할 수 있습니다.</p>
              </div>
              <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                <div class="d-flex justify-content-center">
                  <div class="icon-container">
                    <i class="fa-solid fa-arrow-right"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Testimonial section-->
    <div class="py-2" style="background-color:#fbfbf1;">
      <div class="container px-5 my-5">
        <div class="row gx-5 justify-content-center">
          <div class="col-lg-10 col-xl-7">
            <div class="text-center">
              <div class="fs-4 mb-4 quote_main">"새로운 언어를 배우는 것은 새로운 삶을 얻는 것이다. 두 개의 언어를 알고 있으면 두 개의 삶을 산다."</div>
              <div class="d-flex align-items-center justify-content-center">
                <img class="rounded-circle me-3 mr-2" style="border: 1.5px solid #39b766;" src="${ctp}/images/man.jpg" />
                <div class="fw-bold quote mb-2">
                  Ludwig Wittgenstein
                  <span class="fw-bold mx-1">/</span>
                  영국 철학자
                </div>
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
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Core theme JS-->
  <script src="js/scripts.js"></script>
</body>
</html>
