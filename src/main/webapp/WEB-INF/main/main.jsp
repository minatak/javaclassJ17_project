<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>LinguaLink</title>
	  <%@ include file = "/include/bs4.jsp" %>
	  <!-- Favicon-->
	  <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	  <!-- Bootstrap icons-->
	<!--   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" /> -->
	  <!-- Core theme CSS (includes Bootstrap)-->
	  <link href="css/styles.css" rel="stylesheet" />
	  <style>
	   
	  	* {
				font-family: "Noto Sans KR", sans-serif;
				font-optical-sizing: auto;
				font-weight: <weight>;
				font-style: normal;
			}
			
			@font-face {
		    font-family: 'NEXON Lv1 Gothic OTF';
		    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv1 Gothic OTF.woff') format('woff');
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
		    font-family: 'ChosunGu';
		    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
			}
			
			@font-face {
		    font-family: 'IM_Hyemin-Bold';
		    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2106@1.1/IM_Hyemin-Bold.woff2') format('woff');
		    font-weight: normal;
		    font-style: normal;
			}
				 
			@font-face {
		    font-family: 'CWDangamAsac-Bold';
		    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/CWDangamAsac-Bold.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
			}
			
			@font-face {
		    font-family: 'SBAggroB';
		    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
			}
			
			@font-face {
		    font-family: 'Pretendard-Regular';
		    src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
		    font-weight: 400;
		    font-style: normal;
			}
			
			.languageSelect .flagGroup {
		    display: flex;
		    justify-content: center;
		    flex-wrap: wrap;
		    gap: 50px; /* 아이콘 간의 간격을 조절합니다 */
		    padding: 20px;
			}
			.flag {
		    width: 100%;
		    max-width: 150px;  /* 각 아이콘의 최대 너비를 조절합니다 */
		    height: auto;
		    text-align: center; /* 텍스트를 가운데 정렬합니다 */
			}
			.flag img {
		    width: 100%;
		    height: auto;
		    border-radius: 10px;
		    overflow: hidden;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
		    transition: transform 0.2s;
		    display: block; /* 이미지를 블록 요소로 만듭니다 */
		    /* border: 0.5px solid black; /* 검정색 테두리를 추가합니다 */ */
			}
			.flag:hover img {
		    transform: scale(1.05);
			}
			.country {
		    margin-top: 10px;
		    font-size: 18px;
			}

			.serviceCard {
		  	border-radius: 20px;
			}

			.serviceCard:hover {
		    border: 1px solid skyblue; /* 마우스 올릴 때 파란색 테두리 */
			}

			.icon-container {
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    width: 50px;
		    height: 50px;
		    transition: transform 0.2s;
			}
			
			.icon-container i {
	   		font-size: 24px; /* 아이콘 크기 */
			}
			
				
	  </style>
	</head>
  <body class="d-flex flex-column h-100">
  	<main class="flex-shrink-0">
    	<jsp:include page="/include/nav.jsp" />
            <!-- Header-->
            <header class="bg-dark py-5">
                <div class="container px-5">
                    <div class="row gx-5 ">
                        <div class="col-lg-8 col-xl-7 col-xxl-6">
                            <div class="my-5 text-xl-start">
                                <h1 class="display-5 text-white mb-2" style="font-family: 'CWDangamAsac-Bold';">LinguaLink</h1>
                                <h4 class="text-white" style="font-family: 'SBAggroB';">: Language Exchange Program</h4>
                                <p class="lead fw-normal text-white-50 mb-4" style="font-family: 'NEXON Lv1 Gothic OTF';">'Lingua'는 라틴어로 ‘언어’를 의미하며, 'Link'는 '연결'을 의미합니다. 이 공간은 단순한 언어 교환을 넘어, 전 세계의 사람들을 서로 연결하는 다리 역할을 합니다.</p>
                                <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start"  >
                                    <a class="btn btn-primary btn-lg px-4 me-sm-3 mr-3" href="Register.mem" style="font-family: 'NEXON Lv1 Gothic OTF';">지금 가입하기</a>
                                    <a class="btn btn-outline-light btn-lg px-4" href="Login.mem" style="font-family: 'NEXON Lv1 Gothic OTF';">로그인하기</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center"><img class="img-fluid rounded-3 my-5" src="https://dummyimage.com/600x400/343a40/6c757d" alt="..." /></div>
                    </div>
                </div>
            </header>
            <!-- 
            Features section
            <section class="py-5" id="features">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5 mb-lg-0"><h2 class="fw-bolder mb-0">A better way to start building.</h2></div>
                        <div class="col-lg-8">
                            <div class="row gx-5 row-cols-1 row-cols-md-2">
                                <div class="col mb-5 h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-collection"></i></div>
                                    <h2 class="h5">원어민과 연결</h2>
                                    <p class="mb-0">전 세계 원어민과 함께 연습할 수 있는 기회를 제공합니다. 실제 대화에 참여함으로써 교과서에서 얻을 수 없는 진정한 언어 능력과 문화적 통찰력을 얻을 수 있습니다. </p>
                                </div>
                                <div class="col mb-5 h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-building"></i></div>
                                    <h2 class="h5">맞춤형 학습 경로</h2>
                                    <p class="mb-0">이곳에서의 언어 학습 여정은 사용자의 필요와 목표에 맞게 맞춤화됩니다. 초급자부터 실력을 향상시키고자 하는 분까지, 당신의 레벨에 맞는 파트너와 리소스를 연결해 드립니다.</p>
                                </div>
                                <div class="col mb-5 mb-md-0 h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-toggles2"></i></div>
                                    <h2 class="h5">문화 교류</h2>
                                    <p class="mb-0">언어는 단순한 단어가 아니라 서로 다른 문화를 이해하는 관문입니다. LinguaLink를 통해 문화 교류를 통해 다양한 관점과 전통을 탐구할 수 있습니다.</p>
                                </div>
                                <div class="col h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-toggles2"></i></div>
                                    <h2 class="h5">인터렉티브 학습 환경</h2>
                                    <p class="mb-0">언어 학습 경험을 향상시킬 수 있는 다양한 대화형 도구를 제공합니다. 라이브 채팅부터 어휘 게임과 단어 퀴즈까지, 학습을 재미있고 효과적으로 만들어줍니다.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
             -->
       

		<!-- 공부하는 언어 선택 아이콘 -->                
			<div class="container languageSelect mt-5">
				<h2 style="text-align: center;" class="py-5">어떤 언어를 공부하고 있나요?</h2><br/>
				<div class="flagGroup mr-5 ml-5" >
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
	            <a href="#"><img src="${ctp}/images/flag/CN.gif" alt="Japanese Flag"></a>
	            <div class="country">중국어</div>
	        </div>
	        <div class="flag">
	            <a href="#"><img src="${ctp}/images/flag/RU.gif" alt="German Flag"></a>
	            <div class="country">러시아어</div>
	        </div>
        </div>
    </div>
    
            <!-- Testimonial section-->
            <div class="py-5 bg-light">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-10 col-xl-7">
                            <div class="text-center">
                                <div class="fs-4 mb-4 fst-italic">"새로운 언어를 배우는 것은 새로운 삶을 얻는 것이다.<br/>두 개의 언어를 알고 있으면 두 개의 삶을 산다."</div>
                                <div class="d-flex align-items-center justify-content-center">
                                    <img class="rounded-circle me-3" src="${ctp}/images/man.jpg" /> <!-- 40 x 40 픽셀로 사이즈 변경하기 -->
                                    <div class="fw-bold">
                                        Ludwig Wittgenstein
                                        <span class="fw-bold text-primary mx-1">/</span>
                                        영국 철학자, cambridge 대학교 철학과 전공 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- service preview section-->
						<section class="py-5">
						  <div class="container px-5 my-5">
						    <div class="row gx-5 justify-content-center">
						      <div class="col-lg-8 col-xl-6">
						        <div class="text-center">
						          <h2 class="fw-bolder">바로가기</h2>
						          <p class="lead fw-normal text-muted mb-5">아래 소개를 클릭 시 주요 기능 페이지로 바로 이동할 수 있습니다.</p>
						        </div>
						      </div>
						    </div>
						    
						    <div class="row gx-5">
						      <div class="col-lg-4 mb-5">
						        <div class="serviceCard">
						          <img class="card-img-top" src="https://dummyimage.com/600x350/ced4da/6c757d" alt="..." />
						          <div class="card-body p-4 text-center">
						            <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">회원 조회하기</h5></a>
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
						          <img class="card-img-top" src="https://dummyimage.com/600x350/adb5bd/495057" alt="..." />
						          <div class="card-body p-4 text-center">
						            <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">채팅하기</h5></a>
						            <p class="card-text mb-0">원어민과 실시간으로 채팅하며 자연스러운 대화 연습을 해보세요. 텍스트, 음성, 영상 채팅을 통해 다양한 언어 스킬을 향상시킬 수 있습니다!</p>
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
						          <img class="card-img-top" src="https://dummyimage.com/600x350/6c757d/343a40" alt="..." />
						          <div class="card-body p-4 text-center">
						            <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">학습하기</h5></a>
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
                    
                    
                    
                    <!-- 
                    Call to action
                    <aside class="bg-primary bg-gradient rounded-3 p-4 p-sm-5 mt-5">
                        <div class="d-flex align-items-center justify-content-between flex-column flex-xl-row text-center text-xl-start">
                            <div class="mb-4 mb-xl-0">
                                <div class="fs-3 fw-bold text-white">New products, delivered to you.</div>
                                <div class="text-white-50">Sign up for our newsletter for the latest updates.</div>
                            </div>
                            <div class="ms-xl-4">
                                <div class="input-group mb-2">
                                    <input class="form-control" type="text" placeholder="Email address..." aria-label="Email address..." aria-describedby="button-newsletter" />
                                    <button class="btn btn-outline-light" id="button-newsletter" type="button">Sign up</button>
                                </div>
                                <div class="small text-white-50">We care about privacy, and will never share your data.</div>
                            </div>
                        </div>	
                    </aside>
                     -->
                </div>
            </section>
        </main>
        <!-- Footer-->
        <jsp:include page="/include/footer.jsp" />
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
