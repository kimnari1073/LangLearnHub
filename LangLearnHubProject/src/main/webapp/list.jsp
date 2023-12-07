<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.servlet.*" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<h1> 회원목록2 </h1>
로그인 여부 : ${loginCheck}
<c:if test="${loginCheck == null }">
	<a href=Login.jsp> 로그인 </a>
</c:if>
<c:if test="${loginCheck != null }">
	<a href=logout.do> 로그아웃 </a>
</c:if>
<table>
<c:forEach items="${vlist }" var="memberList"> <!-- for문 JSTL -->
	<tr>
		<td>${memberList.id }</td>
		<td>${memberList.password }</td>
		<td>${memberList.name }</td>
		<td>${memberList.email }</td>
		<td>${memberList.gender }</td>
	</tr>
</c:forEach>


</table>
</body>
</html>