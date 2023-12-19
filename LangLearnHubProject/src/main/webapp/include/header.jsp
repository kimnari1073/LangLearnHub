<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<style>
/* *{
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 16px;
	font-weight: 400;
} */
header .container{
    width: 1000px;
    min-width: 900px;
    font-size: 17px;
}

.hidden{
	height: 70px;
}
</style>
</head>
<body>
<div class='hidden'></div>
<%
	String id =(String)session.getAttribute("id");
	String log="";
%>
<header class="navbar fixed-top navbar-light bg-light">
   <div class="container">
      <div class="col-md-3 mb-2 mb-md-0">
      <%if(id==null){ %>
        <a href="/LangLearnHubProject/index.jsp" class="d-inline-flex link-body-emphasis text-decoration-none">
        <h2>LangLearnHub</h2>
        </a><%	
			}else{
			%>
				<a href="/LangLearnHubProject/mainPage.jsp" class="d-inline-flex link-body-emphasis text-decoration-none">
		        <h2>LangLearnHub</h2>
			<%
			}
		%>
      </div>

    <nav class="nav nav-underline justify-content-between">
      <a class="nav-item nav-link link-body-emphasis" href="/LangLearnHubProject/voca/VocaPage.jsp">개인 단어장</a>
      <a class="nav-item nav-link link-body-emphasis" href="/LangLearnHubProject/chat/chatBot.jsp">챗봇 학습</a>
      <a class="nav-item nav-link link-body-emphasis" href="/LangLearnHubProject/chatExamList.do">AI 문제  </a>
      <a class="nav-item nav-link link-body-emphasis" href="/LangLearnHubProject/chat/Ocr.jsp">AI 풀이   </a>
      
    </nav>
      <div class="col-md-3 text-end">
	     <%
			if(id==null){
		%>
	
		<a href="/LangLearnHubProject/user/login.jsp"><button class="btn btn-outline-dark">LOGIN</button></a>
    	<a href="/LangLearnHubProject/user/signup.jsp"><button class="btn btn-outline-dark">SIGN UP</button></a>	
		<%	
			}else{
		%>
		<a href="/LangLearnHubProject/logout.do"><button type="button" class="btn btn-outline-dark">LOGOUT</button></a>
    	<a href="/LangLearnHubProject/memselect.do"><button type="button" class="btn btn-outline-dark">MYPAGE</button></a>
		<%
			}
		%>
      </div>
  </div>
</header>
</body>
</html>