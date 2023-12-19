<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="com.servlet.chat.*" %>
<!DOCTYPE html>
<html lang="en">
<%
	ArrayList<ChatExamDTO> eDTO = (ArrayList<ChatExamDTO>)session.getAttribute("quesList");

    String answer = (String)request.getAttribute("answer");
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"></script>
	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <style>
        body {
            margin: auto;
            width: 100vw;
        }

        .chat_exams {
            width: 87vw;
            margin-left: 6.75vw;
            padding: 1rem;
            padding-left : 1rem;
            background-color: rgb(244, 244, 244);
            height: 80vh;
            overflow: scroll;
        }

        .title {
            font-size: 2vw;
            text-align: center;
            background-color: skyblue;
            margin: -1rem;
            margin-bottom: 0px;
            padding: 10px;


        }

        .chat_exams::-webkit-scrollbar {
            display: none; /* Chrome, Safari, Opera*/
        }
        .card-text::-webkit-scrollbar {
            display: none; /* Chrome, Safari, Opera*/
        }

        .modal-title.text-center {
            text-align: center !important;
        }
    </style>
	<script>
	  document.addEventListener("DOMContentLoaded", function () {

	    var chatExamRes = "<%= answer %>";
	    if (chatExamRes !== "null") {
	    	showAnswerModal();
	    }
	  });
	

	  function showAnswerModal() {
		    var modal = new bootstrap.Modal(document.getElementById('staticBackdrop'));
		    modal.show();
		  }
	  function hideAnswerModal() {
		    
		    var modal = new bootstrap.Modal(document.getElementById('staticBackdrop'));
		    modal.hide();
		}

	</script>
</head>
<body >
    <%@ include file="../include/header.jsp" %>


<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">답안</h1>
        	<form method="post" action="/LangLearnHubProject/chatExamList.do">
	        <button type="submit" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	        </form>
      </div>
	      <div class="modal-body">

	          <div >
	          <%
	          	if(answer != null && answer.equals("O")){
	          %>
	          <img src="pics/right.png" width="50%" style="margin-left : 25%;" />
	          <%
	          	}else if(answer != null && !answer.equals("O")){
	          %>
	          <img src="pics/wrong.png" width="50%" style="margin-left : 25%;" />
	          <%} %>
	          </div>
	          <div class="mb-3">
	          <%
	          	if(answer != null && answer.equals("O")){
	          %>
	          <h1 style="text-align : center; font-weight : bold;"> 정답입니다! </h1>
	          <%
	          	}else if(answer != null&& !answer.equals("O")){
	          %>
	          <h1 style="text-align : center; font-weight : bold;"> 틀렸습니다! </h1>
	          <%} %>
	          </div>
	      	</div>
      		<div class="modal-footer">
        	      <form method="post" action="/LangLearnHubProject/chatExamList.do">
	        <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal" >Close</button>
		  </form>
      </div>
    </div>
  </div>
</div>
    <div class="chat_exams" style="float: left;">
    <div class="title"> 문제 풀기 
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">문제 생성</button>
	    <input type="radio" name="sortcolor" value="all" onclick="filterCards('all')"> 전체
	    <input type="radio" name="sortcolor" value="lightgrey" onclick="filterCards('lightgrey')"> 안품
	    <input type="radio" name="sortcolor" value="tomato" onclick="filterCards('tomato')"> 틀림
	    <input type="radio" name="sortcolor" value="aqua" onclick="filterCards('aqua')"> 맞음
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <form method="post" action="/LangLearnHubProject/chatExamSave.do">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">문제 생성</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="recipient-name" class="col-form-label">제목</label>
                            <input type="text" class="form-control" id="recipient-name" name="title">
                        </div>
                        <div class="mb-3">
                            <label for="message-text" class="col-form-label">문제로 만들 내용 </label>
                            <textarea class="form-control" id="message-text" name="ques"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="message-text" class="col-form-label">문제 생성 방식 </label><br>
                            <input type="radio" name="examparse" id="chat" checked="checked" value="chat" onclick="toggleExamTypeSection('show')"> 챗봇 생성 
                            <input type="radio" name="examparse" id="human" value="human" onclick="toggleExamTypeSection('hide')"> 내용 그대로 생성
                        </div>
                        <div class="mb-3" id="examtypeSection">
                            <label for="message-text" class="col-form-label">문제 유형 </label><br>
                            <input type="radio" name="examtype" id="sub" checked="checked" value="sub"> 주관식
                            <span>
                                <input type="radio" name="examtype" id="multi" value="multi"> 객관식
                                <input type="radio" name="examtype" id="short" value="short"> 단답형
                            </span>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">문제 저장</button>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <script>
    $(document).ready(function () {
        $('#exampleModalAnswer').modal('show');
    });
	    function filterCards(color) {
	        console.log('Filtering cards by color:', color);
	        var cards = document.querySelectorAll('.card');
	        
	        for (var i = 0; i < cards.length; i++) {
	            var cardColor = cards[i].getAttribute('data-color');
	            if (color === 'all' || cardColor === color) {
	                cards[i].style.display = 'block';
	                var cardText = cards[i].querySelector('.card-body .card-text');
	                if (cardText) {
	                    cardText.style.height = '665%';
	                    
	                }
	            } else {
	                cards[i].style.display = 'none';
	            }
	        }
	    }

        function toggleExamTypeSection(action) {
            var examtypeSection = document.getElementById('examtypeSection');
            if (action === 'hide') {
                examtypeSection.style.display = 'none';
            } else {
                examtypeSection.style.display = 'block';
            }
        }
    </script>
    </div>
        <%
            for(int i = 0; i < eDTO.size(); i++){
        %>
        
            <div class="card" data-color="<%=eDTO.get(i).getColor() %>" style="width: 26rem; height: 28rem; background-color: <%=eDTO.get(i).getColor() %>; float: left; margin: 1.5%; margin-left: 2.5%; text-align: left; box-shadow: 0px 0px 3px; position: relative; overflow: hidden;">
                <div class="card-body" style="height: 7rem; padding : 8%; position : realative;">
                    <h3 class="card-title" style="text-align : center; padding : -5px;"><b style="font-size : 90%;"><%=eDTO.get(i).getTitle() %></b></h3>
                    <p class="card-text" style=" height : 80%; overflow : scroll; margin-bottom : 25%;"><%=eDTO.get(i).getQues() %></p>
                    <form method="post" action="/LangLearnHubProject/examdelete.do">
                    	<input type="text" name="num" value="<%=eDTO.get(i).getNum() %>" style="display : none;">
                    	<img src="pics/close_btn.png" style="position : absolute; top : 5%; right : 5%; width : 2vw;">
                    	<input type="submit" style="position : absolute; top : 5%; right : 5%; width : 2vw; background-color : #0000; border : 0px;" value="">
                    </form>
                </div>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal_<%=i%>" data-bs-whatever="@mdo" style="position: absolute; bottom: 5%; width: 45%; margin-left: 27.5%;">문제풀기</button>
                <form method="post" action="/LangLearnHubProject/examupdate.do">
                <div class="modal fade" id="exampleModal_<%=i%>" tabindex="-1" aria-labelledby="exampleModalLabel_<%=i%>" aria-hidden="true" >
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                            	<input type="text" value="<%=eDTO.get(i).getNum() %>" name="num" style="display : none;">
                            	<input type="text" value="<%=eDTO.get(i).getQues().replace("<br>", " ").replace("\"","") %>" name="ques" style="display : none;">
                                <h1 class="modal-title fs-5" id="exampleModalLabel_<%=i%>"  ><%=eDTO.get(i).getTitle() %></h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="recipient-name" class="col-form-label" style="font-size: 20px; font-weight: bold;">문제</label><br>
                                    <div><%=eDTO.get(i).getQues() %></div>
                                </div>
                                <div class="mb-3">
                                    <label for="message-text" class="col-form-label" style="font-size: 20px; font-weight: bold;">답안</label>
                                    <textarea class="form-control" id="message-text" name="ans"></textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                <button type="submit" class="btn btn-primary">확인</button>
                            </div>
                        </div> 
                    </div>   
                </div>
                </form>
            </div>
        
        <%
            }
        %>
    </div>
    
</body>
</html>
