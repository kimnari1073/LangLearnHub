<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
      rel="stylesheet" />
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.0.0/mdb.min.css" rel="stylesheet" />
<title>loginForm</title>
<style>
.warning-message {
            display:none; /* 기본적으로 숨김 처리 */
            color: red;
            margin-top: 10px;
        }
.bg-image-vertical {
position: relative;
overflow: hidden;
background-repeat: no-repeat;
background-position: right center;
background-size: auto 100%;
}
@media (min-width: 1025px) {
.h-custom-2 {
height: 100%;
}
}
</style>
</head>
<body>

<section class="vh-100"  style="background-color:#F4FFFF;">
  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-6 text-black">

        <div class="px-5 ms-xl-4">
          <i class="fas fa-crow fa-2x me-3 pt-5 mt-xl-4" style="color: #709085;"></i>
          <span class="h1 fw-bold mb-0">LangLearnHub</span>
        </div>

        <div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-0 mt-xl-n5">

          <form style="width: 23rem;" method="get" action="/LangLearnHubProject/login.do">

            <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Login</h3>

	            <div class="form-outline mb-4">
	            	<label class="form-label">ID</label>
	              <input type="text" class="form-control form-control-lg border border-success p-2 border-opacity-25" name="id" />
	              
	            </div>
	
	            <div class="form-outline mb-4">
	            <label class="form-label">PASSWORD</label>
	              <input type="password" class="form-control form-control-lg border border-success p-2 border-opacity-25" name="password"/>
	            </div>
	            
				<!--  경고문 뚜둥! -->
				<div class="warning-message" id="loginWarning">
				<h7>아이디 비밀번호가 일치하지 않습니다.</h7>
				</div>
				 <script>
        			var isFailed = <%= request.getAttribute("isFailed") %>;
        			if (isFailed) {
            		document.getElementById("loginWarning").style.display = "flex";
        			}
    			</script>
    			
	            <div class="pt-1 mb-4">
	              <button class="btn btn-info btn-lg btn-block" type="submit">Login</button>
	            </div>
            <p>Don't have an account? <a href="signup.jsp" class="link-info">Register here</a></p>
          </form>

        </div>
      </div>
      <div class="col-sm-6 px-0 d-none d-sm-block">
        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/img3.webp"
          alt="Login image" class="w-100 vh-100" style="object-fit: cover; object-position: left;">
      </div>
    </div>
  </div>
</section>
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.0.0/mdb.min.js">
    </script>

</body>
</html>