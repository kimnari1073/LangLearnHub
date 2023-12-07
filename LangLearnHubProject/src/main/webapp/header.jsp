<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

<style>
*{
font-family: 'Noto Sans KR', sans-serif;font-size: 16px;font-weight: 400;}
header .container{
    width: 1000px;
    min-width: 800px;

}
</style>
</head>

<body>

<header class="navbar fixed-top navbar-light bg-light">
   <div class="container">
      <div class="col-md-3 mb-2 mb-md-0">
        <a href="index.jsp" class="d-inline-flex link-body-emphasis text-decoration-none">
        <h2>LangLearnHub</h2>
        </a>
      </div>

    <nav class="nav nav-underline justify-content-between">
      <a class="nav-item nav-link link-body-emphasis" href="#"></a>
      <a class="nav-item nav-link link-body-emphasis" href="VocaPage.jsp">개인 단어장</a>
      <a class="nav-item nav-link link-body-emphasis" href="#">챗봇 학습 </a>
      <a class="nav-item nav-link link-body-emphasis" href="#">스터디 그룹 </a>
      <a class="nav-item nav-link link-body-emphasis" href="#">과외 모집 </a>
    </nav>
      <div class="col-md-3 text-end">
      <%
	       	String id =(String)session.getAttribute("id");
	     	String log="";
	  
		

			if(id==null){
		%>
	
		<a href="login.jsp"><button class="btn btn-outline-dark">Login</button></a>
    	<a href="signup.jsp"><button class="btn btn-outline-dark">Sign-up</button></a>	
		<%	
			}else{
		%>

		<a href="/LangLearnHubProject/logout.do">
        <button type="button" class="btn btn-outline-dark">Logout</button></a>
    	<a href="/LangLearnHubProject/select.do"><button type="button" class="btn btn-outline-dark">mypage</button></a>


		<%
			}
		%>
      </div>
  </div>
  </header>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>