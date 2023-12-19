<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%
	ArrayList<String> chatList = new ArrayList<>();

	chatList = (ArrayList<String>)session.getAttribute("chatList");
	int i =0;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>   
        <script src="
https://cdn.jsdelivr.net/npm/sweetalert2@11.10.0/dist/sweetalert2.all.min.js
"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../css/chatBotTest.css">
  </head>
<body>
<header><%@ include file="../include/header.jsp" %></header>

<div class="chat_window">
        <div class="top_menu">
            <div class="title">English ChatBot</div>
        </div>
        <ul class="messages">
          
        </ul>
        <div class="bottom_wrapper clearfix">
          <form method="post" action="/LangLearnHubProject/chat.do" id='chat'>
            <div class="message_input_wrapper">
              <input class="message_input" placeholder="Type your message here..." name="req"/>

            </div>
            <button type="button" class="send_message">
              <div class="icon"></div>
              <div class="text">Send</div>
            </button>
           </form>
        </div>
    </div>
    <div class="message_template">
      <li class="message">
        <div class="avatar"></div>
          <div class="text_wrapper">
            <button type="button" class="bookmark" style="border:0;background-color:transparent">
              <div class="text"></div>
            </button>
            </div>
        </li>
  </div>
    <!-- <script type="text/javascript" src="../js/chatbot.js"></script> -->
</body>

</html>
<script>
  var output_text = "테스트입니다";
  var Message;
  var $messages = $('.messages');
  var message_side = 'right';
  var $message_input = $('.message_input');

  function Message(arg){
    this.text = arg.text // 텍스트
    this.message_side = arg.message_side; //왼쪽, 오른쪽
    this.before = arg.before;
    this.after = arg.after;
    this.idx = arg.idx;

    this.draw = function (_this) {
      return function () {
        var $message;
        $message = $($('.message_template').clone().html());
        //북마크 
        $message.find('.bookmark').click(function(){
          console.log("bookmark");  
          var swal_textQ,swal_textA,idx;
          idx = arg.idx;
          if(arg.idx%2==0){
			      swal_textQ=arg.text;		
			      swal_textA=sessionStorage.getItem(idx+1); //index+1
		      }else{
			      swal_textQ=sessionStorage.getItem(idx-1); //index-1
			      swal_textA=arg.text;
		      } 
          Swal.fire({
          title: "해당 내용을 저장 할까요?",
          html:
          '<form action="/LangLearnHubProject/chatsave">' +
          '  <label>Q: '+swal_textQ+'</label><br>' +
          '  <input type="hidden" name="Q" value="'+swal_textQ+'"'+
          '  <label>A: '+swal_textA+'</label><br>' +
          '  <input type="hidden" name="A" value="'+swal_textA+'"><br>'+
          '  <input type="text" name="bookMarkTitle" class="form-control form-control-lg" placeholder="Untitled"><br>'+
          '  <button class="btn btn-outline-success">save</button>'+
          '</form>'+
          '  <input type="button" class="btn btn-outline-danger" value="cancel" onClick="window.location.reload()"></input>',
          showConfirmButton: false
          });
        });
        $message.addClass(_this.message_side).find('.text').html(_this.text);
        $('.messages').append($message);
        return setTimeout(function () {
          return $message.addClass('appeared');
        },100);
      };
    }(this);
  return this;
};



function sendMessage(text,index){
  $('.message_input').val('');
  var message = 
    new Message({
      text: text,
      message_side: message_side,
      idx: index //chatList 인덱스
    });  
  console.log("i"+<%=i%>);
    message_side = (message_side === 'left') ? 'right' : 'left';
    message.draw();
    return $messages.scrollTop($messages.prop('scrollHeight'));
}
window.onload = function(){
  console.log("onload");
  var index = 0;
  //jsp반복문 chatList 에 있는 값 만큼
  <% 
  if(chatList!=null){
  for(String text: chatList){
  	%>text = "<%= text %>";
  	  index = <%=i %>;
  	  sessionStorage.setItem(index,text);
  	  sendMessage(text,index);
  	  <%i=i+1;
  }}%>
 	
}

$message_input.keyup(function (e) {
  if (e.which === 13) { // 13 == 엔터
    if($message_input.val()!='') { //입력 돼 있으면
      input_message = $message_input.val(); 
    }
    return sendMessage(input_message,0);
  }
});

$('.send_message').click(function () {
	if($message_input.val()!='') { //입력 돼 있으면
	      input_message = $message_input.val(); 
	    }
	$('#chat').submit(); 
	 return sendMessage(input_message,0);
});
</script>