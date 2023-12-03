<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
form { max-width: 600px; margin: 40px auto; padding: 20px; background: #fff; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); } 
.input_wrap { margin-bottom: 20px; } 
.input_list { display: flex; align-items: center; margin-bottom: 10px; } 
.input_list input[type="text"] { padding:0 10px; height: 45px; border: 1px solid #ddd; border-radius: 4px; flex-grow: 1; } 
/* .add_field { width: 100%; height: 45px; padding: 0 15px; background-color: #007bff; border: none; border-radius: 4px; color: white; cursor: pointer; transition: background-color 0.3s ease; } 
.add_field:hover { background-color: #0056b3; }  */
.remove_field { display: flex; align-items: center; height: 45px; margin-left: 6px; padding:0 15px; background: #ff4d4d; border-radius:4px; color: #fff; cursor: pointer; text-decoration: none; } 
.remove_field:hover { background: #ff3333; } 
</style>

</head>
<body>
<header>
<%@include file="header.jsp" %>
</header>

<form>
    <div class="input_wrap">
        <div class="input_list">
            <input type="text" name="voca" placeholder="입력해주세요." />
            <input type="text" name="voca" placeholder="입력해주세요." />
            <a href="javascript:void(0);" class="remove_field" tabindex="-1">삭제</a>
        </div>
    </div>
    <button id="add_field" class="btn btn-primary">추가하기</button>
    <button type="submit" class="btn btn-success">저장하기</button>
</form>
     
<script>
const wrapper = $('.input_wrap'); // 입력 필드를 포함하는 컨테이너 선택
const addButton = $('#add_field'); // 추가 버튼 선택
const maxFields = 10; // 최대 입력 필드 수 설정
let fieldCount = 1; // 현재 입력 필드 수

// '추가하기' 버튼 클릭 시 이벤트
addButton.click(function(e) {
    e.preventDefault(); // 페이지 리로드 방지
    if (fieldCount < maxFields) { // 최대 필드 수 체크
        fieldCount++; // 필드 수 증가
        // 새 입력 필드 추가
        wrapper.append(`
            <div class="input_list">
                <input type="text" name="voca" placeholder="입력해주세요." />
                <input type="text" name="voca" placeholder="입력해주세요." />
                <a href="javascript:void(0);" class="remove_field" tabindex="-1">삭제</a>
            </div>
        `);
    }
});

// '삭제' 링크 클릭 시 이벤트
wrapper.on('click', '.remove_field', function(e) {
    e.preventDefault(); // 페이지 리로드 방지
    $(this).parent('.input_list').remove(); // 필드 제거
    fieldCount--; // 필드 수 감소
});
</script>
</body>
</html>