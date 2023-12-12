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
</style>
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
							</div>
							
							
								<div class="col-xl-6">
									<div class="card-body p-md-5 text-black">
										<form method="get" action="/LangLearnHubProject/sign.do">
										<h3 class="mb-5 text-uppercase">회원 가입</h3>
										<div class="row">
											<div class="col-md-6 mb-4">
												<div class="form-outline">
												<label class="form-label">아이디 </label>
													<input type="text" class="form-control form-control-lg border"
														   name="id" />
												</div>
											</div>
										</div>
										<div class="col-md-6 mb-4">
										<label class="form-label">비밀번호</label>
											<input type="text" class="form-control form-control-lg border" 
												name="password"/> 
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
										<div class="col-md-6 mb-4">
										<label class="form-label"> 이메일</label>
											<input type="text"class="form-control form-control-lg border" 
											name="email"/> 
										</div>
										<div
											class="d-md-flex justify-content-start align-items-center mb-4 py-2">
											<h6 class="mb-0 me-4">성별:</h6>
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
										<div class="d-flex justify-content-end pt-3">
											<a href="index.jsp"><button type=text class="btn btn-light btn-lg">뒤로가기 </button></a>
											<button type="reset" class="btn btn-light btn-lg">초기화</button>
											<button type="submit" class="btn btn-warning btn-lg ms-2">회원가입</button>
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