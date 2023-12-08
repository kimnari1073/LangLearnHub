<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>MDBootstrap demo</title>
<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet" />
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
	rel="stylesheet" />
<!-- MDB -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.0.0/mdb.min.css"
	rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<title>loginForm</title>
<style>
h1{
text-align:center;
}
.text{
padding-top:8px;
padding-right:550px;
}
</style>
</head>
<body>
<%@include file="header.jsp" %>
<br><br><br><br>
<h1>마이페이지 </h1>
<div class="d-flex flex-column flex-md-row p-4 gap-4 py-md-5 align-items-center justify-content-center">
  <div class="list-group">
    <a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
      <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
      <div class="d-flex gap-2 w-100 justify-content-between" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">
        <div class="text">
          <h6 class="mb-0">나의 프로필 보기 / 수정  </h6>
        </div>
        <small class="opacity-50 text-nowrap">></small>
      </div>
    </a>
    <!-- modal -->
    <%
    
    String uid =(String)session.getAttribute("id");
 	String password=(String)session.getAttribute("password");
 	String name =(String)session.getAttribute("name");
 	String uemail =(String)session.getAttribute("email");
 	String ubirth =(String)session.getAttribute("birth");
 	String ugender =(String)session.getAttribute("gender");
 	
    %>
    <form action="/LangLearnHubProject/update.do" method="get">
    <%-- <c:if test="%{not empty member}"> --%>
    <c:set var="memberId" value="<%=uid %>" />
    
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="fs-5" ><%=uid %>님의 회원 정보 </h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">아이디:</label>
            <input type="text" class="form-control" id="recipient-name" value=${member.id }>
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">비밀번호:</label>
            <input type="text" class="form-control" id="recipient-name" value=${member.password } >
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">이름:</label>
            <input type="text" class="form-control" id="recipient-name" value=${member.name }>
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">이메일:</label>
            <input type="text" class="form-control" id="recipient-name" value=${member.email }>
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">생년월일:</label>
            <input type="text" class="form-control" id="recipient-name" value=${member.birth } >
          </div>
          <div class="mb-3">
            <label for="recipient-name" class="col-form-label">성별:</label>
            <input type="text" class="form-control" id="recipient-name" value=${member.gender}>
          </div>
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소 </button>
        <button type="submit" class="btn btn-primary">수정하기 </button>
      </div>
    </div>
  </div>
</div> 
<%-- </c:if> --%>
</form>
<script>
const exampleModal = document.getElementById('exampleModal')
if (exampleModal) {
  exampleModal.addEventListener('show.bs.modal', event => {
    // Button that triggered the modal
    const button = event.relatedTarget
    // Extract info from data-bs-* attributes
    const recipient = button.getAttribute('data-bs-whatever')
    // If necessary, you could initiate an Ajax request here
    // and then do the updating in a callback.

    // Update the modal's content.
    const modalTitle = exampleModal.querySelector('.modal-title')
    const modalBodyInput = exampleModal.querySelector('.modal-body input')

    modalTitle.textContent = `New message to ${recipient}`
    modalBodyInput.value = recipient
  })
}
</script>
    
    <a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
      <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
      <div class="d-flex gap-2 w-100 justify-content-between">
        <div class="text">
          <h6 class="mb-0">나의 단어장  </h6>
        </div>
        <small class="opacity-50 text-nowrap">></small>
      </div>
    </a>
    <a href="#" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
      <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
      <div class="d-flex gap-2 w-100 justify-content-between">
        <div class="text">
          <h6 class="mb-0">관리자 신청  </h6>
        </div>
        <small class="opacity-50 text-nowrap">></small>
      </div>
    </a>
    <a href="/LangLearnHubProject/logout.do" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
      <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
      <div class="d-flex gap-2 w-100 justify-content-between">
        <div class="text">
          <h6 class="mb-0">로그아웃  </h6>
        </div>
        <small class="opacity-50 text-nowrap">></small>
      </div>
    </a>
    <a href="/LangLearnHubProject/deleteMember.do" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
      <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
      <div class="d-flex gap-2 w-100 justify-content-between">
        <div class="text">
          <h6 class="mb-0">회원 탈퇴  </h6>
        </div>
        <small class="opacity-50 text-nowrap">></small>
      </div>
    </a>
  </div>
</div>
<%@include file="footer.jsp" %>
    
	<script type="text/javascript" src="/js/bootstrap.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>