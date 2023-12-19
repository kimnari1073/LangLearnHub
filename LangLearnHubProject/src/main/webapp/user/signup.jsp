<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>loginForm</title>
<style>
.card-registration .select-input.form-control[readonly]:not([disabled])
	{
	font-size: 1rem;
	line-height: 2.15;
	padding-left: .75em;
	padding-right: .75em;
}

.card-registration .select-arrow {
	top: 13px;
}
.warning-message {
            display:none; /* 기본적으로 숨김 처리 */
            color: #d9991a;
            margin-top: 10px;
        }
</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

</head>
<body>
	<section class="h-100 bg-dark">
		<div class="container py-5 h-100">
			<div class="row d-flex justify-content-center align-items-center h-100">
				<div class="col">
					<div class="card card-registration my-4">
						<div class="row g-0">
							<div class="col-xl-6 d-none d-xl-block">
								<img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/img4.webp"
									 alt="Sample photo" class="img-fluid"
									 style="border-top-left-radius: .25rem; border-bottom-left-radius: .25rem;" />
									 <form method="get" action="/LangLearnHubProject/sign.do">
							</div>
							
								<div class="col-xl-6">
									<div class="card-body p-md-5 text-black">
										
										<h3 class="mb-5 text-uppercase">회원 가입</h3>
										<div class="row">
											<div class="col-md-6 mb-4">
												<div class="form-outline">
												<% 
													String idcheck1=(String)request.getAttribute("idcheck");
													String zid =(String)request.getAttribute("id");
													if(zid==null) {
														zid = "";
													}
													System.out.println(idcheck1);
													%>
												<label class="form-label">아이디 </label>
													<input type="text" class="form-control form-control-lg border" name="id" value="<%=zid %>" />
													<!--  경고문 뚜둥! -->
													<div class="warning-message" id="loginWarning">
													이미 사용 중인 아이디입니다. 다른 아이디를 입력해주세요.
													</div>
													<div class="warning-message" id="loginsafe">
													사용 가능한 아이디입니다.
													</div>
													 <script>
        												var idcheck = "<%=idcheck1%>";
        												if(idcheck==="warning") {
        													document.getElementById("loginWarning").style.display = "flex";
        												}else if(idcheck==="success"){
        													document.getElementById("loginsafe").style.display = "flex";
        												}
    												</script>
											</div>
										</div>
										<div class="col-md-6 mb-4">
												<div class="form-outline">
												<br>
													<button type="submit" name="action" value="idcheck" class="btn btn-light btn-lg" onclick="checkUsername()" style="margin-top:10px;">아이디 중복 확인</button>
													
												</div>
											</div>
										</div>
										
											<div class="row">
											<div class="col-md-6 mb-4">
												<div class="form-outline">
												<label class="form-label">비밀번호  </label>
													<input type="text" id="pw1" oninput="pwCheck()" class="form-control form-control-lg border" name="password"/> 
													<span id="pwConfirm"></span>
													<script type="text/javascript">
													function pwCheck(){
													    if($('#pw1').val() == $('#pw2').val()){
													        $('#pwConfirm').text('비밀번호 일치').css('color', 'green')
													    }else{
													        $('#pwConfirm').text('비밀번호 불일치').css('color', 'red')
													    }
													}
													</script>
												</div>
											</div>
											<div class="col-md-6 mb-4">
												<div class="form-outline">
												<label class="form-label">비밀번호 확인 </label>
													<input type="text" id="pw2" oninput="pwCheck()" class="form-control form-control-lg border" name="confirmPassowrd"/> 
												
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6 mb-4">
												<div class="form-outline">
												<label class="form-label">이름 </label>
													<input type="text" class="form-control form-control-lg border"
													name="name"/> 
												</div>
											</div>
											<div class="col-md-6 mb-4">
												<div class="form-outline">
												<label class="form-label">생년월일</label>
													<input type="text" class="form-control form-control-lg border"
														name="birth"/> 
												</div>
											</div>
										</div>
										<div class="row">
										<div class="col-md-6 mb-4">
										<label class="form-label"> 이메일</label>
											<input type="text"class="form-control form-control-lg border" 
											name="email"/> 
										</div>
										</div>
										<div
											class="d-md-flex justify-content-start align-items-center mb-4 py-2">
											<div class="form-outline">
												<label class="form-label">성별 </label><br>
											<div class="form-check form-check-inline mb-0 me-4">
												<input class="form-check-input" type="radio"
													name="gender" id="femaleGender" value="1" />
												<label class="form-check-label" for="femaleGender">여자</label>
											</div>
											<div class="form-check form-check-inline mb-0 me-4">
												<input class="form-check-input" type="radio"
													name="gender" id="maleGender" value="0" />
												<label class="form-check-label" for="maleGender">남자</label>
											</div>
											</div>
										</div>
										<div class="d-flex justify-content-end pt-3">
											<a href="../index.jsp"><button type="button" class="btn btn-light btn-lg" style="margin-left:-30px">뒤로가기</button></a>
											<button type="reset" class="btn btn-light btn-lg">초기화</button>
											<button type="submit" name="action" value="sign" class="btn btn-warning btn-lg ms-2">회원가입</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.0.0/mdb.min.js">
    </script>
</body>
</html>