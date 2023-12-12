<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap" %>
<html lang="en">
<head>
  	<meta charset="UTF-8">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&amp;display=swap" rel="stylesheet">
	<link rel="stylesheet" href="css/index.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

</head>
<body>
	<header><%@include file="../include/header.jsp" %></header>
	<main>    
    <div class="main_image_division">
      <div class="main_image_text">
        AI 학습, 다양한 학습 커뮤니티까지<br>
        함께 성장하는 학습의 시작.<br>
        LangLearnHub<br>
        <button class="btn btn-outline-light btn-lg btn-block"
        				onclick="location.href='user/signup.jsp'" >
          Let's Start
        </button>
      </div>
    </div>
    <div class="main_function_division">
        <div class="main_function1_small_text">수백명의 전문가와 함께 </div>
        <div class="main_function1_text">영어 개고수들의 <br> 꿀팁 나눔
        </div>
        <div class="main_function1_box" style="top : 10%; left: 50%;">
            <img src="pics/user_profile.png" class="main_function1_box_img">
            <div class="main_function1_box_name">
                english teacher<br>
                <div style="font-size:14px ; font-family: 'IBM Plex Sans KR', sans-serif;">gildong Hong</div>
            </div>
            <div class="main_function1_box_title">
                영어 잘하는 방법
            </div>
            <div class="main_function1_box_text">
                영어를 잘하는 법은 다양한 실전 경험을 쌓고, 일상에서 영어를 적극적으로 활용하며, 독해와 듣기, 말하기, 쓰기 ...
            </div>
        </div>
        <div class="main_function1_box" style="top : 40%; left: 50%;">
            <img src="pics/user_profile.png" class="main_function1_box_img">
            <div class="main_function1_box_name">
                english teacher<br>
                <div style="font-size:14px ; font-family: 'IBM Plex Sans KR', sans-serif;">gildong Hong</div>
            </div>
            <div class="main_function1_box_title">
                영어 잘하는 방법
            </div>
            <div class="main_function1_box_text">
                영어를 잘하는 법은 다양한 실전 경험을 쌓고, 일상에서 영어를 적극적으로 활용하며, 독해와 듣기, 말하기, 쓰기 ...
            </div>
        </div>
        <div class="main_function1_box" style="top : 20%; left: 71%;">
            <img src="pics/user_profile.png" class="main_function1_box_img">
            <div class="main_function1_box_name">
                english teacher<br>
                <div style="font-size:14px ; font-family: 'IBM Plex Sans KR', sans-serif;">gildong Hong</div>
            </div>
            <div class="main_function1_box_title">
                영어 잘하는 방법
            </div>
            <div class="main_function1_box_text">
                영어를 잘하는 법은 다양한 실전 경험을 쌓고, 일상에서 영어를 적극적으로 활용하며, 독해와 듣기, 말하기, 쓰기 ...
            </div>
        </div>
        <div class="main_function1_box" style="top : 50%; left: 71%;">
            <img src="pics/user_profile.png" class="main_function1_box_img">
            <div class="main_function1_box_name">
                english teacher<br>
                <div style="font-size:14px ; font-family: 'IBM Plex Sans KR', sans-serif;">gildong Hong</div>
            </div>
            <div class="main_function1_box_title">
                영어 잘하는 방법
            </div>
            <div class="main_function1_box_text">
                영어를 잘하는 법은 다양한 실전 경험을 쌓고, 일상에서 영어를 적극적으로 활용하며, 독해와 듣기, 말하기, 쓰기 ...
            </div>
        </div>
    </div>
    <div class="main_function_division">
        <div class="main_function2_box">
            <div class="main_function2_title">
                <img src="pics/book.png" style="width : 48px; margin : 5px 0px 0px 15px;">
                <div class="main_function2_title_text">
                    Study Helper
                </div>
                <div class="main_function2_message_left">
                    안녕하세요, 무엇이 궁금하신가요 ?
                </div>
                <div class="main_function2_message_right">
                    영어 문장의 5형식에 대해 알려줘!
                </div>
                <div class="main_function2_message_left" style="padding-top : 15px;line-height : 30px; height : 140px">
                    네, 알겠습니다. 문장의 형식은 총 5개로 각각의 형식은 다른 형태를 띄고 있습니다. 먼저 1형식은 "주어(S) + 동사(V)"의 형태를 띄고 있으며 특징은 ...
                </div>
                <div class="main_function2_message_right">
                    고마워 ! 많은 도움이 되었어 :)
                </div>
                <div class="main_function2_message_left">
                    다음에도 궁금한게 있다면 물어보세요.
                </div>
                <div class="main_function2_message_input">
                    <img src="pics/send.png" class="main_function2_message_send"></img>
                </div>
            </div>
        </div>
        <div class="main_function2_small_text">
            ChatGPT turbo 3.5 API
        </div>
        <div class="main_function2_text">
            AI의 도움을 통한<br>
            자기주도 학습
        </div>
    </div>
    <div class="main_function_division" style="background-color: rgb(250, 250, 255);">
        <div class="main_function1_small_text">단어장 커스텀하기 </div>
        <div class="main_function1_text">
            원하는 단어들만 <br>
            나의 단어장 생성
        </div>
        <div class="main_function3_small_text" style="top: 51%;">
            <img src="pics/cellphone.png" class="main_function3_small_img">
            <div style="margin-left : 45px;">
                내가 만든 단어장들을<br>
                모바일에서도 확인 가능
            </div>
        </div>
        <div class="main_function3_small_text" style="top: 58%;">
            <img src="pics/note.png" class="main_function3_small_img">
            <div style="margin-left : 45px;">
                여러 단어들을 조합하여<br>
                나만의 단어장 생성하기
            </div>
        </div>
        <div class="main_function3_small_text" style="top: 65%;">
            <img src="pics/exam.png" class="main_function3_small_img">
            <div style="margin-left : 45px;">
                잘 모르는 단어들을 모아<br>
                테스트 할 수 있는 기능 포함
            </div>
        </div>
        <div class="main_function3_box">
            <div class="main_function3_title">
                <img src="pics/verb.png" style="width : 48px; margin : 8px 0px 0px 20px;">
                <div class="main_function3_title_text">
                    verb
                </div>
                <div class="main_function3_word" style="top : 12%; left : 2.5%;">
                    <input type="checkbox" style="width : 20px; height : 20px; margin : 15px 0px 0px 265px" >
                    <div class="main_function3_word_title">
                        register<br>
                        <div style="font-size : 20px; font-family: 'IBM Plex Sans KR', sans-serif;"> [ˈredʒɪstə(r)']</div>
                    </div>
                    <div class="main_function3_word_kor">
                        1.등록하다 2.기록부 3.음역
                    </div>
                    <div class="main_function3_word_example">
                        The ship was registered in Panama.<br>
                        그 선박은 파나마에 등록이 되었다.
                    </div>
                    <div class="main_function3_word_example">
                        Can I register this, please?<br>
                        이거 등기로 좀 보내주시겠어요?
                    </div>
                </div>
                <div class="main_function3_word" style="top : 12%; left : 52.5%;">
                    <input type="checkbox" style="width : 20px; height : 20px; margin : 15px 0px 0px 265px" >
                    <div class="main_function3_word_title">
                        register<br>
                        <div style="font-size : 20px; font-family: 'IBM Plex Sans KR', sans-serif;"> [ˈredʒɪstə(r)']</div>
                    </div>
                    <div class="main_function3_word_kor">
                        1.등록하다 2.기록부 3.음역
                    </div>
                    <div class="main_function3_word_example">
                        The ship was registered in Panama.<br>
                        그 선박은 파나마에 등록이 되었다.
                    </div>
                    <div class="main_function3_word_example">
                        Cann I register this, please?<br>
                        이거 등기로 좀 보내주시겠어요?
                    </div>
                </div>
                <div class="main_function3_word" style="top : 52%; left : 2.5%;">
                    <input type="checkbox" style="width : 20px; height : 20px; margin : 15px 0px 0px 265px" >
                    <div class="main_function3_word_title">
                        register<br>
                        <div style="font-size : 20px; font-family: 'IBM Plex Sans KR', sans-serif;"> [ˈredʒɪstə(r)']</div>
                    </div>
                    <div class="main_function3_word_kor">
                        1.등록하다 2.기록부 3.음역
                    </div>
                    <div class="main_function3_word_example">
                        The ship was registered in Panama.<br>
                        그 선박은 파나마에 등록이 되었다.
                    </div>
                    <div class="main_function3_word_example">
                        Cann I register this, please?<br>
                        이거 등기로 좀 보내주시겠어요?
                    </div>
                </div>
                <div class="main_function3_word" style="top : 52%; left : 52.5%;">
                    <input type="checkbox" style="width : 20px; height : 20px; margin : 15px 0px 0px 265px" >
                    <div class="main_function3_word_title">
                        register<br>
                        <div style="font-size : 20px; font-family: 'IBM Plex Sans KR', sans-serif;"> [ˈredʒɪstə(r)']</div>
                    </div>
                    <div class="main_function3_word_kor">
                        1.등록하다 2.기록부 3.음역
                    </div>
                    <div class="main_function3_word_example">
                        The ship was registered in Panama.<br>
                        그 선박은 파나마에 등록이 되었다.
                    </div>
                    <div class="main_function3_word_example">
                        Cann I register this, please?<br>
                        이거 등기로 좀 보내주시겠어요?
                    </div>
                </div>
                <div class="main_function3_word_extra" style="top : 92%; left : 2.5%;">
                    <input type="checkbox" style="width : 20px; height : 20px; margin : 20px 0px 0px 265px" >
                </div>
                <div class="main_function3_word_extra" style="top : 92%; left : 52.5%;">
                    <input type="checkbox" style="width : 20px; height : 20px; margin : 20px 0px 0px 265px" >
                </div>
            </div>
        </div>
    </div>
    <div class="main_function_division">
        <div class="main_function4_title_text">
            많은 영어전문가들의 추천사이트<br>
            LangLearnHub.
        </div>
        <div>
            <div class="main_function4_img_star">
                <img src="pics/star.png" class="img_star">
                <img src="pics/star.png" class="img_star">
                <img src="pics/star.png" class="img_star">
                <img src="pics/star.png" class="img_star">
                <img src="pics/star.png" class="img_star">
            </div>
        </div>
        <div class="main_function4_box_all">
            <div class="main_function4_box">
                <div>
                    <img src="pics/user_profile.png" class="main_function4_box_img">
                    <div class="main_function4_box_name">gildong Hong</div>
                    <div class="main_function4_box_title">공부하기에 좋은 웹사이트</div>
                    <div class="main_function4_box_text">이 웹사이트에서는 AI 학습 도구, 단어장 커스텀, 다양한 학습 커뮤니티를 통해 영어 학습을 촉진시킬 수 있는 아주 좋은 사이트입니다. 추천합니다.
                        너무너무 좋아요 계속계속 쓸게요
                    </div>
                </div>
            </div>
            <div class="main_function4_box">
                <div>
                    <img src="pics/user_profile.png" class="main_function4_box_img">
                    <div class="main_function4_box_name">gildong Hong</div>
                    <div class="main_function4_box_title">공부하기에 좋은 웹사이트</div>
                    <div class="main_function4_box_text">이 웹사이트에서는 AI 학습 도구, 단어장 커스텀, 다양한 학습 커뮤니티를 통해 영어 학습을 촉진시킬 수 있는 아주 좋은 사이트입니다. 추천합니다.
                        너무너무 좋아요 계속계속 쓸게요
                    </div>
                </div>
            </div>
            <div class="main_function4_box">
                <div>
                    <img src="pics/user_profile.png" class="main_function4_box_img">
                    <div class="main_function4_box_name">gildong Hong</div>
                    <div class="main_function4_box_title">공부하기에 좋은 웹사이트</div>
                    <div class="main_function4_box_text">이 웹사이트에서는 AI 학습 도구, 단어장 커스텀, 다양한 학습 커뮤니티를 통해 영어 학습을 촉진시킬 수 있는 아주 좋은 사이트입니다. 추천합니다.
                        너무너무 좋아요 계속계속 쓸게요
                    </div>
                </div>
            </div>
            <div class="main_function4_box">
                <div>
                    <img src="pics/user_profile.png" class="main_function4_box_img">
                    <div class="main_function4_box_name">gildong Hong</div>
                    <div class="main_function4_box_title">공부하기에 좋은 웹사이트</div>
                    <div class="main_function4_box_text">이 웹사이트에서는 AI 학습 도구, 단어장 커스텀, 다양한 학습 커뮤니티를 통해 영어 학습을 촉진시킬 수 있는 아주 좋은 사이트입니다. 추천합니다.
                        너무너무 좋아요 계속계속 쓸게요
                    </div>
                </div>
            </div>
        </div>
    </div>
    </main>
    <footer class="footer">
        <%@include file="../include/footer.jsp" %>
    </footer>
</body>



</html>