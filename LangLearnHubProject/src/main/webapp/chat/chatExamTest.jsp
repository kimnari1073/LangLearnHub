<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>모달 테스트</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">문제 생성</button>

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <form method="post" action="/LangLearnHubProject/chatExamSave.do">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">문제 생성</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="recipient-name" class="col-form-label">제목:</label>
                            <input type="text" class="form-control" id="recipient-name" name="title">
                        </div>
                        <div class="mb-3">
                            <label for="message-text" class="col-form-label">문제로 만들 내용 :</label>
                            <textarea class="form-control" id="message-text" name="ques"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="message-text" class="col-form-label">문제 생성 방식 :</label><br>
                            <input type="radio" name="examparse" id="chat" checked="checked" value="chat" onclick="toggleExamTypeSection('show')"> 챗봇 생성 
                            <input type="radio" name="examparse" id="human" value="human" onclick="toggleExamTypeSection('hide')"> 내용 그대로 생성
                        </div>
                        <div class="mb-3" id="examtypeSection">
                            <label for="message-text" class="col-form-label">문제 유형 :</label><br>
                            <input type="radio" name="examtype" id="sub" checked="checked" value="sub"> 주관식
                            <span>
                                <input type="radio" name="examtype" id="multi" value="multi"> 객관식
                                <input type="radio" name="examtype" id="short" value="short"> 단답형
                            </span>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">문제 저장</button>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <script>
        function toggleExamTypeSection(action) {
            var examtypeSection = document.getElementById('examtypeSection');
            if (action === 'hide') {
                examtypeSection.style.display = 'none';
            } else {
                examtypeSection.style.display = 'block';
            }
        }
    </script>
</body>
</html>
