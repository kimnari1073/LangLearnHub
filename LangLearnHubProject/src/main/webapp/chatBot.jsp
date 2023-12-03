<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>

<%
	ArrayList<String> chatList = new ArrayList<>();
    chatList = (ArrayList<String>)session.getAttribute("chatList");
    String s= chatList.get(1);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR:wght@800&display=swap');
        @import url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@500&display=swap');
    </style>
    <link rel="stylesheet" href="css/chatBot.css"/>
</head>
<body>
<%@ include file="header.jsp" %>
    <div style="text-align: center;">
        <div class="chatbot">
            <div class="chatbot_header">
                Chat-Bot
            </div>
            <div class="chatbot_text">
            <%
            	for(int i = 0; i < chatList.size(); i++){
            		out.println(chatList.get(i)+"<br>");
            	}
            %>
            
            </div>
	        <div class="chatbot_submit" >
	            <form method="post" action="/LangLearnHubProject/chat.do" style="width : 100%; height : 100%;">
	                <input type="text" placeholder="입력하세요" class="chatbot_input" name="req" value="">
	                <img src="pics/send.png" class="chatbot_send_img"  >
	                <input type="submit" class="invisible_btn" value="">
	            </form>
            </div>
        </div>
    </div>
<%@ include file="footer.jsp" %>
</body>
</html>
