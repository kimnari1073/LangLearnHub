<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList" %>
<%
request.setCharacterEncoding("utf-8");
ArrayList<String[]> bookList = (ArrayList<String[]>)request.getAttribute("bookList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
</head>
<script>
  window.onload = function(){bookMarkInsert();}
  const bookList = [];
  function bookMarkInsert(){
      <%
      	for(String[] arr : bookList){
    		%>var jsonObject = {"idx":"<%=arr[0] %>", "title": "<%= arr[1] %>","Q":"<%= arr[2] %>",
    				"A":"<%= arr[3]%>"};
    		bookList.push(jsonObject);<%
      }%>
     

      for(var i=0; i<bookList.length; i++){
        var json = JSON.parse(JSON.stringify(bookList[i]));
        var idx=json.idx;
        var title=json.title;
        var q=json.Q;
        var a=json.A;
        console.log("Json: "+idx);
        var insertTr;
        insertTr = 
          '<div class="col">'+
            '<div class="card border-dark mb-3" style="max-width: 18rem;">'+
              '<div class="card-header">'+
                '<form action="/LangLearnHubProject/deletechat" method="post" >'+
                  '<input type="hidden" name="bookmark_index" value="'+idx+'">'+
                  '<button type="submit"><img src="pics/star.png"></button>'+title+
                '</form>'+
              '</div>'+
              '<div class="card-body text-dark">'+
                '<h5 class="card-title">Question</h5>'+
                '<p class="card-text">'+q+'</p>'+
                '<h5 class="card-title">Answer</h5>'+
                '<p class="card-text">'+a+'</p>'+
              '</div>'+
            '</div>'+
          '</div>';
        console.log(insertTr);
        $(".row").append(insertTr);
      }
  }
</script>
<style>
  button{
    border:0px;
    background-color: transparent;
  }
  button img{
    /* border: 1px solid black; */
    width: 20px;
  }
  .card-header{
    /* border: 1px solid black; */
    padding-left: 10px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }
</style>
<header>
	<%@include file="../include/header.jsp" %>
</header>
<body>
    <div class="container">
        <div class="row row-cols-3">
          
          <!-- insetTr -->
          
        </div>
      </div>
</body>
</html>