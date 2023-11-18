<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en" data-bs-theme="auto">
  <head><script src="/docs/5.3/assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MainPage</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  </head>
  <body>
<!-- header -->
<div class="container">
  <header class="border-bottom lh-1 py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
     <!-- list icon -->
      <div class="col-4 pt-1">
        <a class="link-secondary" href="#">
        	<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
  			<path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
			</svg>
        </a>
      </div>
       <!-- logo -->
      <div class="col-4 text-center">
        <a class="h3 text-decoration-none" href="#">LangLearnHub</a>
      </div>
       <!-- mypage icon -->
      <div class="col-4 d-flex justify-content-end align-items-center">
        <a class="link-secondary" href="#" aria-label="Search">
        	<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
  			<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
  			<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
			</svg>
        </a>
      </div>
    </div>
  </header>
<!-- navigation -->
  <div class="nav-scroller py-1 mb-3 border-bottom">
    <nav class="nav nav-underline justify-content-between">
      <a class="nav-item nav-link link-body-emphasis" href="#"></a>
      <a class="nav-item nav-link link-body-emphasis" href="#">개인 단어장</a>
      <a class="nav-item nav-link link-body-emphasis" href="#">챗봇 학습 </a>
      <a class="nav-item nav-link link-body-emphasis" href="#">스터디 그룹 </a>
      <a class="nav-item nav-link link-body-emphasis" href="#">과외 모집 </a>
      <a class="nav-item nav-link link-body-emphasis" href="#"></a>
    </nav>
  </div>
</div>

<main class="container">
<!-- 슬라이드   -->

  <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="10000">
      <img src="images/voca.png" class="d-block w-100" alt="voca">
        <div class="carousel-caption d-none d-md-block">
        <h5>나만의 영어 단어장 만들기 </h5>
        <p>직접 만든 영어 단어장으로 시험을 볼 수 있으며 주차별로 분석할 수 있다. </p>
      </div>
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="images/study.png" class="d-block w-100" alt="study">
         <div class="carousel-caption d-none d-md-block">
        <h5>스터디-함께 공부하는 즐거움 </h5>
        <p>다른 사람의 단어장 공유와 학습 비법 공유 가능하다 .</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="images/chat.png" class="d-block w-100" alt="chat">
         <div class="carousel-caption d-none d-md-block">
        <h5>AI를 이용한 자기주도학습 </h5>
        <p>ai를 나만의 학습도우미로 지정 후 해석 및 문법 교정 가능하다. </p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div><br>
<!--오늘의 학습 단어 -->
  <div class="row mb-2">
    <div class="col-md-6">
      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-primary-emphasis">오늘의 학습 </strong>
          <h3 class="mb-0">look out for</h3>
          <div class="mb-1 text-body-secondary">1. ...을 찾다(=watch for)</div>
          <div class="mb-1 text-body-secondary">2. 망보다 </div><br>
          <p class="card-text mb-auto">ex) You should look out for yourself from now on. </p>
          <p class="card-text mb-auto">=> 이제부터는 당신 자신만을 생각해야 해요.</p><br>
          <p class="card-text mb-auto">ex) Please look out for us. </p>
          <p class="card-text mb-auto">=> 저희 많이 응원해주세요. </p>
          <br>
            <button type="button" class="btn btn-outline-dark">바로 가기 </button>
          
        </div>
      </div>
<!--나의 스터디  -->
    </div>
    <div class="col-md-6">
      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-success-emphasis">나의 스터디 그룹 </strong>
          <h3 class="mb-0">6주차 과제</h3>
          <div class="mb-1 text-body-secondary">기한 : 2023.11.27.</div>

			<ul class="list-group">
  			<li class="list-group-item">
    		<input class="form-check-input me-1" type="checkbox" value="" id="firstCheckboxStretched">
    		<label class="form-check-label stretched-link" for="firstCheckboxStretched">6주차 단어 50개 외우기</label>
  			</li>
  			<li class="list-group-item">
    		<input class="form-check-input me-1" type="checkbox" value="" id="secondCheckboxStretched">
    		<label class="form-check-label stretched-link" for="secondCheckboxStretched">스피킹 녹음한 파일 스터디에 올리기</label>
  			</li>
  			<li class="list-group-item">
    		<input class="form-check-input me-1" type="checkbox" value="" id="thirdCheckboxStretched">
    		<label class="form-check-label stretched-link" for="thirdCheckboxStretched">여행 회화 구문 연습하기</label>
  			</li>
  			<li class="list-group-item">
    		<input class="form-check-input me-1" type="checkbox" value="" id="thirdCheckboxStretched">
    		<label class="form-check-label stretched-link" for="thirdCheckboxStretched">뉴욕타임스 구문 분석 </label>
  			</li>
			</ul>
			<br>
            <button type="button" class="btn btn-outline-dark">바로 가기 </button>
      </div>
    </div>
  </div>
<hr>
  <div class="row g-5">
    <div class="col-md-8">
      <article class="blog-post">
        <h2>이번 주 단어장 학습 기록 </h2>
        <table class="table">
          <thead>
            <tr>
              <th>날짜 </th>
              <th>문제 갯수 </th>
              <th>오답 갯수 </th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>11/21</td>
              <td>15</td>
              <td>4</td>
            </tr>
            <tr>
              <td>11/22</td>
              <td>20</td>
              <td>8</td>
            </tr>
            <tr>
              <td>11/23</td>
              <td>5</td>
              <td>0</td>
            </tr>
          </tbody>
          <tfoot>
            <tr>
              <td>Totals</td>
              <td>40</td>
              <td>12</td>
            </tr>
          </tfoot>
        </table>
      </article><br>
<hr><br>
      <article class="blog-post">
        <h3 class="display-5 link-body-emphasis mb-1">튜터링 신청  </h3>
        <p class="blog-post-meta">2023년 11월 19일  <a href="#">Chris</a></p>

        <h5>튜터링 안내 수칙.</h5>
        <ul>
          <li>튜터와 튜티는 약속 시간을 철저히 지킨다. </li>
          <li>최소 주 1회 온/오프라인 미팅을 갖는다. </li>
          <li>서로에대한 비방이나 욕설 폭행 등을 할 경우, 즉각 탈퇴된다. </li>
        </ul>
        <p>위 수칙을 모두 숙지하셨다면 아래 버튼을 본인 해당 란에 맞춰 눌러주시길 바랍니다. </p>
      </article>

      <nav class="blog-pagination" aria-label="Pagination">
        <a class="btn btn-outline-primary rounded-pill" href="#">tutor</a>
        <a class="btn btn-outline-secondary rounded-pill disabled" aria-disabled="true">tutee</a>
      </nav>

    </div>

    <div class="col-md-4">
      <div class="position-sticky" style="top: 2rem;">
        <div class="p-4 mb-3 bg-body-tertiary rounded">
          <h4 class="fst-italic">챗봇 학습 </h4>
           <p class="mb-0">공부하는데 어려움이 생기셨나요? 저한테 물어보세요. </p>
           <br>
          <div class="input-group">
             <input class="form-control" id="chat-input">
             <button class="btn btn-secondary" id="send">전송</button>
           </div>
         
        </div>

        <div>
          <h4 class="fst-italic">지난 기록 보기 </h4>
          <ul class="list-unstyled">
            <li>
              <a class="d-flex flex-column flex-lg-row gap-3 align-items-start align-items-lg-center py-3 link-body-emphasis text-decoration-none border-top" href="#">
                <svg class="bd-placeholder-img" width="100%" height="96" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
                <div class="col-lg-8">
                  <h6 class="mb-0">틀린 문법 찾기 </h6>
                  <small class="text-body-secondary">2023년 11월 15일 </small>
                </div>
              </a>
            </li>
            <li>
              <a class="d-flex flex-column flex-lg-row gap-3 align-items-start align-items-lg-center py-3 link-body-emphasis text-decoration-none border-top" href="#">
                <svg class="bd-placeholder-img" width="100%" height="96" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
                <div class="col-lg-8">
                  <h6 class="mb-0">어려운 영어문장과 연습의 필요성과 공부법 </h6>
                  <small class="text-body-secondary">2023년 11월 3일 </small>
                </div>
              </a>
            </li>
          </ul>
        </div>
        </div>
      </div>
    </div>
  </div>

</main>

<div class="container">
  <footer class="row row-cols-1 row-cols-sm-2 row-cols-md-5 py-5 my-5 border-top">
    <div class="col mb-3">
      <div class="col-4 text-center">
        <a class="h3 text-decoration-none" href="#">LangLearnHub</a>
      </div><br>
      <p class="text-body-secondary">&copy; 2023</p>
    </div>

    <div class="col mb-3">

    </div>

    <div class="col mb-3">
      <h5>영어학습 </h5>
      <ul class="nav flex-column">
      	<li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">소개 </a></li>
        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">나의 단어장 </a></li>
        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">챗봇 학습 </a></li>
        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">자주 하는 질문 </a></li>
      </ul>
    </div>

    <div class="col mb-3">
      <h5>학습 커뮤니티 </h5>
      <ul class="nav flex-column">
      	<li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">소개 </a></li>
        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">스터디 </a></li>
        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">멘토링(유료/무료)</a></li>
      </ul>
    </div>
    <div class="col mb-3">
      <h5>게시판 </h5>
      <ul class="nav flex-column">
        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">자유 게시판 </a></li>
        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">질문 게시판 </a></li>
        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">홍보 게시판 </a></li>
        <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary">공지사항 </a></li>
      </ul>
    </div>
  </footer>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
  </body>
    </body>
</html>
    