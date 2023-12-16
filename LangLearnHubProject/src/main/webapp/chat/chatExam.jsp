<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="com.servlet.chat.*" %>
<!DOCTYPE html>
<html lang="en">
<%
    ArrayList<ChatExamDTO> eDTO = (ArrayList<ChatExamDTO>)session.getAttribute("quesList");
    String chatExamRes = (String)request.getAttribute("chatExamRes");
    if(chatExamRes == null) { chatExamRes = "hi"; }
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <style>
        body {
            margin: auto;
            width: 100vw;
        }

        .chat_exams {
            width: 66.5vw;
            margin-left: 16.75vw;
            padding: 1rem;
            background-color: rgb(244, 244, 244);
            margin-top: 10vh;
            height: 80vh;
            overflow: scroll;
        }

        .title {
            font-size: 2vw;
            text-align: center;
            background-color: skyblue;
            margin: -1rem;
            margin-bottom: 0px;
            padding: 10px;


        }

        .chat_exams::-webkit-scrollbar {
            display: none; /* Chrome, Safari, Opera*/
        }

        .card::-webkit-scrollbar {
            display: none; /* Chrome, Safari, Opera*/
        }

        /* custom.css */
        .modal-title.text-center {
            text-align: center !important;
        }
    </style>

</head>
<body >
    <%@ include file="../include/header.jsp" %>

        <div class="title"> 문제 풀기 <%=chatExamRes %></div>
    <div class="chat_exams" style="float: left;">
        <%
            for(int i = 0; i < eDTO.size(); i++){
        %>
        <form method="post" action="/LangLearnHubProject/chatexamsend.do">
            <div class="card" style="width: 15rem; height: 14rem; background-color : skyblue; float: left; margin: 1.5%; text-align: center; box-shadow: 0px 0px 3px; position: relative; overflow: scroll; ">
                <div class="card-body" style="height: 7rem;">
                    <h5 class="card-title" style=" padding : -5px;"><%=eDTO.get(i).getTitle() %></h5>
                    <p class="card-text"><%=eDTO.get(i).getQues() %></p>
                </div>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal_<%=i%>" data-bs-whatever="@mdo" style="position: sticky; bottom: 5%; width: 45%; margin-left: 27.5%;">문제풀기</button>
                
                <div class="modal fade" id="exampleModal_<%=i%>" tabindex="-1" aria-labelledby="exampleModalLabel_<%=i%>" aria-hidden="true" >
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel_<%=i%>" ><%=eDTO.get(i).getTitle() %></h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label for="recipient-name" class="col-form-label" style="font-size: 20px; font-weight: bold;">문제</label><br>
                                    <div><%=eDTO.get(i).getQues() %></div>
                                </div>
                                <div class="mb-3">
                                    <label for="message-text" class="col-form-label" style="font-size: 20px; font-weight: bold;">답안</label>
                                    <textarea class="form-control" id="message-text" name="ans"></textarea>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                <button type="submit" class="btn btn-primary">확인</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <%
            }
        %>
    </div>
</body>
</html>
