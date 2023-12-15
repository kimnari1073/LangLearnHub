<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%
	ArrayList<String> chatList = new ArrayList<>();
	chatList = (ArrayList<String>)session.getAttribute("chatList");
  	String s="";
	if(chatList != null){ //처음 실행할 때는 패스
		s = chatList.get(chatList.size()-1);
		System.out.println("layout chatList:"+s);
	}
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
<%@ include file="../include/header.jsp" %> 

<div class="chat_window">
        <div class="top_menu">
            <div class="title">English ChatBot</div>
        </div>
        <ul class="messages">
          
        </ul>
        <div class="bottom_wrapper clearfix">
          <form method="post" action="/LangLearnHubProject/chat.do">
            <div class="message_input_wrapper">
              <input class="message_input" placeholder="Type your message here..." name="req"/>
              <input class="message_output" type="hidden" value= "<%= s %>" >
            </div>
            <div class="send_message">
              <div class="icon"></div>
              <div class="text">Send</div>
            </div>
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
    <script type="text/javascript" src="../js/chatbot.js"></script>
</body>
</html>