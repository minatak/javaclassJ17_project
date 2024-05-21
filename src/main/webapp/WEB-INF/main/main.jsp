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
	  <title>LinguaLink</title>
	  <%@ include file = "/include/bs4.jsp" %>
	  <!-- Favicon-->
	  <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	  <!-- Bootstrap icons-->
	  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	  <!-- Core theme CSS (includes Bootstrap)-->
	  <link href="css/styles.css" rel="stylesheet" />
	  <style>
	   
	  	* {
				font-family: "Noto Sans KR", sans-serif;
				font-optical-sizing: auto;
				font-weight: <weight>;
				font-style: normal;
			}
			 
			.title{
				font-family: "Playfair Display", serif;
			  font-optical-sizing: auto;
			  font-weight: <weight>;
			  font-style: normal;
			}
	  </style>
	</head>
  <body class="d-flex flex-column h-100">
  	<main class="flex-shrink-0">
    	<jsp:include page="/include/nav.jsp" />
            <!-- Navigation
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container px-5">
                    <a class="navbar-brand" href="index.html">Start Bootstrap</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
                            <li class="nav-item"><a class="nav-link" href="about.html">About</a></li>
                            <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
                            <li class="nav-item"><a class="nav-link" href="pricing.html">Pricing</a></li>
                            <li class="nav-item"><a class="nav-link" href="faq.html">FAQ</a></li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Blog</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                    <li><a class="dropdown-item" href="blog-home.html">Blog Home</a></li>
                                    <li><a class="dropdown-item" href="blog-post.html">Blog Post</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Portfolio</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownPortfolio">
                                    <li><a class="dropdown-item" href="portfolio-overview.html">Portfolio Overview</a></li>
                                    <li><a class="dropdown-item" href="portfolio-item.html">Portfolio Item</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            -->
            <!-- Header-->
            <header class="bg-dark py-5">
                <div class="container px-5">
                    <div class="row gx-5 align-items-center justify-content-center">
                        <div class="col-lg-8 col-xl-7 col-xxl-6">
                            <div class="my-5 text-center text-xl-start">
                                <h1 class="display-5 fw-bolder text-white mb-2 title">LinguaLink : Bridging Cultures Through Language</h1>
                                <p class="lead fw-normal text-white-50 mb-4">'Lingua'는 라틴어로 ‘언어’를 의미하며, 'Link'는 '연결'을 의미합니다. 이 공간은 단순한 언어 교환을 넘어, 전 세계의 사람들을 서로 연결하는 다리 역할을 합니다.</p>
                                <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                                    <a class="btn btn-primary btn-lg px-4 me-sm-3 mr-3" href="Register.mem">지금 가입하기</a>
                                    <a class="btn btn-outline-light btn-lg px-4" href="Login.mem">로그인하기</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center"><img class="img-fluid rounded-3 my-5" src="https://dummyimage.com/600x400/343a40/6c757d" alt="..." /></div>
                    </div>
                </div>
            </header>
            <!-- Features section-->
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
            
            <!-- Features section-->
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="mb-5"><h5>어떤 언어를 공부하고 있나요?</h5></div>
                        <div class="col-lg-8">
                            <div class="row gx-5 row-cols-1 row-cols-md-2">
                                <div class="col mb-5 h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-collection"></i></div>
                                    <h2 class="h5">원어민과 연결</h2>
                                    <p class="mb-0">전 세계 원어민과 함께 연습할 수 있는 기회를 제공합니다. 실제 대화에 참여함으로써 교과서에서 얻을 수 없는 진정한 언어 능력과 문화적 통찰력을 얻을 수 있습니다. </p>
                                </div>
                                <div class="col mb-5 h-100">
                                    <div class="feature"><img src="https://i.namu.wiki/i/iomsCB4f3Vbrgrd5YxQ03Q9jq1ofFrtmLtqaot91nyII5LpGbtYgUCQyZ8VFGuKivrYi0NU2A2Z6qouVP0dlgQ.svg"width="100"></div>
                                    <h2 class="h5">한국어</h2>
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
            <!-- Blog preview section-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            <div class="text-center">
                                <h2 class="fw-bolder">바로가기 </h2>
                                <p class="lead fw-normal text-muted mb-5">아래 소개를 클릭 시 주요 기능 페이지로 바로 이동할 수 있습니다.</p>
                            </div>
                        </div>
                    </div>
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="https://dummyimage.com/600x350/ced4da/6c757d" alt="..." />
                                <div class="card-body p-4">
                                    <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">회원 조회하기</h5></a>
                                    <p class="card-text mb-0">전 세계 사용자들과 언어를 교환하며 학습할 수 있습니다. 나와 학습 목표, 관심사가 일치하는 사용자를 찾아보세요!</p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                            <div class="small">
                                                <div class="fw-bold">Kelly Rowan</div>
                                                <div class="text-muted">March 12, 2023 &middot; 6 min read</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="https://dummyimage.com/600x350/adb5bd/495057" alt="..." />
                                <div class="card-body p-4">
                                    <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">채팅하기</h5></a>
                                    <p class="card-text mb-0">원어민과 실시간으로 채팅하며 자연스러운 대화 연습을 해보세요. 텍스트, 음성, 영상 채팅을 통해 다양한 언어 스킬을 향상시킬 수 있습니다!</p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                            <div class="small">
                                                <div class="fw-bold">Josiah Barclay</div>
                                                <div class="text-muted">March 23, 2023 &middot; 4 min read</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <img class="card-img-top" src="https://dummyimage.com/600x350/6c757d/343a40" alt="..." />
                                <div class="card-body p-4">
                                    <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">학습하기</h5></a>
                                    <p class="card-text mb-0">나만의 단어장을 생성하고 암기 테스트 기능을 활용하여 효과적으로 단어를 학습하세요. 맞춤형 퀴즈와 플래시카드를 통해 기억을 강화하고 즐겁게 학습할 수 있습니다.</p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                                            <div class="small">
                                                <div class="fw-bold">Evelyn Martinez</div>
                                                <div class="text-muted">April 2, 2023 &middot; 10 min read</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
