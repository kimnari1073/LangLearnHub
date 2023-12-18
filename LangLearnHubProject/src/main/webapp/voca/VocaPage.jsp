<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.util.ArrayList"%>
<%
	request.setCharacterEncoding("utf-8");
	boolean revise = false;
	ArrayList<String[]> reviseList = new ArrayList<>();
	String[] tem = {"0","0","0"};
	reviseList.add(0, tem);	
	Object test =request.getAttribute("clickRevise");
	if(test!=null){
		revise = (boolean)request.getAttribute("clickRevise");
		reviseList = (ArrayList)request.getAttribute("reviseList");
	}
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<link rel="shortcut icon" href="https://ctrlcccv.github.io/favicon.png">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&amp;display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
	<style>
		* {margin: 0;padding: 0;font-family: 'Noto Sans KR', sans-serif;font-size: 16px;font-weight: 400;box-sizing: border-box;box-sizing: border-box;}
		body { padding: 20px; background-color: #f5f5f5; } 
		form { max-width: 1000px; min-width: 700px; margin: 50px auto; padding: 50px; background: #fff; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); } 
		.input_wrap { margin-bottom: 20px; } 
		.input_list { display: flex; align-items: center; margin-bottom: 10px; } 
		.input_list input[type="text"] { padding:0 10px; height: 45px; border: 1px solid #ddd; border-radius: 4px; flex-grow: 1; } 
		.input_title{padding:0 10px; height: 90px; border: 1px solid #ddd; border-radius: 4px; flex-grow: 1;width: 100%; margin: 20px 0px;font-size:30px;}
		.remove_field { display: flex; align-items: center; height: 45px; margin-left: 6px; padding:0 15px; background: #ff4d4d; border-radius:4px; color: #fff; cursor: pointer; text-decoration: none; } 
		.remove_field:hover { background: #ff3333; } 
	</style>
</head>

<body>
<header><%@include file="../include/header.jsp" %></header>
<form method="get" action="/LangLearnHubProject/vocasave.do">
	<input class="input_title" type="text" name="title" placeholder="단어장 이름">
    <div class="input_wrap">
		<!-- insert -->
    </div>
    <div class="btn-group" role="group" aria-label="Basic example">
    	<button id="add_field" class="btn btn-secondary">Add</button>
    	<button type="submit" class="btn btn-secondary">Save</button>
    	<button type="button" id="reset" class="btn btn-secondary">Reset</button>
</form>
  	 	<button type="button" onclick="location.href='/LangLearnHubProject/vocaselect'" class="btn btn-secondary">List</button>
	</div>
</body>
<script>
	const wrapper = $('.input_wrap'); // 입력 필드를 포함하는 컨테이너 선택
	const addButton = $('#add_field'); // 추가 버튼 선택
	const title = $('.input_title');
	let fieldCount = 1; // 현재 필드 수
	// add button
	addButton.click(function(e) {
	    e.preventDefault(); // 페이지 리로드 방지
	    fieldCount++; // 필드 수 증가
	    // 새 입력 필드 추가
	    wrapper.append(`
	        <div class="input_list">
	            <input type="text" name="voca1" placeholder="입력해주세요." />
	            <input type="text" name="voca2" placeholder="입력해주세요." />
	            <a href="javascript:void(0);" class="remove_field" tabindex="-1">삭제</a>
	        </div>
	    `);
	});
	
	// delete button
	wrapper.on('click', '.remove_field', function(e) {
	    e.preventDefault(); // 페이지 리로드 방지
	    $(this).parent('.input_list').remove(); // 필드 제거
	    fieldCount--; // 필드 수 감소
	});
	
	// revise link
	if (<%= revise %>) {
	    title.val("<%= reviseList.get(0)[0] %>");
	    const vocaList = [];
	    <% for (String[] arr : reviseList) { %>
	        var jsonObject = { "voca_key": "<%= arr[1] %>", "voca_val": "<%= arr[2] %>" };
	        vocaList.push(jsonObject);
	    <% } %>
	    for (var i = 0; i < vocaList.length; i++) {
	        var jsonObject = JSON.parse(JSON.stringify(vocaList[i]));
	        var key = jsonObject.voca_key;
	        var val = jsonObject.voca_val;
	        wrapper.append(`
	            <div class="input_list">
	                <input type="text" class="key" name="voca1" placeholder="입력해주세요." value="` + key + `" />
	                <input type="text" id="val" name="voca2" placeholder="입력해주세요." value="` + val + `" />
	                <a href="javascript:void(0);" class="remove_field" tabindex="-1">삭제</a>
	            </div>
	        `);
	    }
	}
	//reset button
	$('#reset').click(function() {
	    title.val(""); // .input_title 리셋
	    $('.input_list input').val("");
	});
</script>
</html>
