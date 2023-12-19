<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload Example</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<style>
.question{
background-color: #c7eafc;
}
.answer{
background-color:#ffe6cb;
}

       .card::-webkit-scrollbar {
            display: none; 
      }

</style>
</head>

<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

     <%@ include file="../include/header.jsp" %>
     <h2 style="text-align:center; margin-top : 3.5vh; font-weight : bold;">AI 문제 풀이</h2>
    <div class="card" style=" margin-top : 1.5vh; width: 60%; margin-left: 20%; height : 80vh; overflow: scroll; text-align : center;">
      <div class="card-body">
      <div class="card-title" style="text-align : center;">
            <form id="uploadForm" action="/LangLearnHubProject/upload.do" method="post" enctype="multipart/form-data">
                <input class="folebox" value="" type="file" name="file" id="file"/>
                <input class="btn btn-primary" type="button" value="Submit" onclick="loadTextResults()">
            </form>
      </div>
        
        
        <div class="texts">
                <% if(request.getAttribute("textResult")!=null){ %>
               
                <p class="card-text" style="width : 60%; text-align : center; margin-left : 20%;"> 
                <h5>문제 </h5>
                 <div class="question">
                            
                    <%=request.getAttribute("textResult")%>
                    </div>
                </p>
                
                <% }else{ %>
                <p class="card-text">
                </p>
                <% } %>
                
                
                <% if(request.getAttribute("chatResult")!=null){ %>
                    <p class="card-text" style="width : 100%; text-align : center; ">
                    <h5>해답  </h5>
                    <div class="answer">
                    
                    <%=request.getAttribute("chatResult")%>
                    </div>
                    </p>
                <% }else{ %>
                    <p class="card-text" >
                    </p>
                <% } %>
        </div>
        
  </div>
</div>

<script>
    function loadTextResults() {
        document.querySelector('.texts').innerHTML = '<div style="margin-top : 25%;" class="spinner-border text-primary" role="status"><span class="visually-hidden">Loading...</span></div>';
        document.getElementById('uploadForm').submit();
    }
    function clearTextResults() {
        document.querySelector('.texts').innerHTML = '';
        document.getElementById('uploadForm').submit();
    }
</script>

</body>
</html>
