<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.servlet.*" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<style>
body{
	margin-left:200px;
	margin-right:200px;
	background-color:#e6e6e6;
}
</style>
</head>
<body>

<br>
<h1> 관리자 페이지  </h1>

로그인 여부 : ${loginCheck}
<c:if test="${loginCheck == null }">
	<a href=login.jsp> 로그인 </a>
</c:if>
<c:if test="${loginCheck != null }">
	<a href=logout.do> 로그아웃 </a>
</c:if><br>
<table>
<br>
	 <h2>회원 관리 </h2>
      <div class="table-responsive small">
        <table class="table table-striped table-sm">
     	<thead>
            <tr>
              <th scope="col">ID</th>
              <th scope="col">PW</th>
              <th scope="col">Name</th>
              <th scope="col">Email</th>
              <th scope="col">Gender</th>
              <th scope="col">Role</th>
              <th scope="col">Del</th>
              <th scope="col">Accept</th>
            </tr>
          </thead>
          <tbody>
          <c:forEach items="${vlist }" var="memberList">
			<tr>
			<td>${memberList.id }</td>
			<td>${memberList.password }</td>
			<td>${memberList.name }</td>
			<td>${memberList.email }</td>
			<td><c:if test="${memberList.gender eq '0'}">남자  </c:if><c:if test="${memberList.gender eq '1'}">여자 </c:if></td>
			<td><c:if test="${memberList.role eq '0'}">일반회원   </c:if><c:if test="${memberList.role eq '1'}">관리자  </c:if></td>
			   <td>
                    <form action="/LangLearnHubProject/adminDelete.do" method="get">
                        <input type="hidden" name="id" value="${memberList.id}">
                        <input type="submit" name="action" value="delete">
                    </form>
                </td>
			<td>
			<form action="/LangLearnHubProject/adminDelete.do" method="get">
                        <input type="hidden" name="id" value="${memberList.id}">
                        <input type="submit" name="action" value="approve">
                    </form>
			</td>
			</tr>
			</c:forEach>
			<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        성공적으로 삭제되었습니다. 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기 </button>
      </div>
    </div>
  </div>
</div>
	 	</tbody>
        </table>
      </div>
    </main>
</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>