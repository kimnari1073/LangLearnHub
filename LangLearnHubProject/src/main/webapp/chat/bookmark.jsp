<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList" %>
<%
request.setCharacterEncoding("utf-8");
ArrayList<String[]> bookList = (ArrayList)request.getAttribute("bookList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   	<link rel="stylesheet" href="../css/bookmark.css">
</head>

<%@include file="../include/header.jsp" %>
<body>
    <div>
        <div class="row row-cols-3">
          <!-- insetTr -->
        </div>
    </div>
</body>
</html>
<script>
  window.onload = function(){
	  bookMarkInsert();
  }
  const bookList = [];
  function bookMarkInsert(){
      <%
      	for(String[] arr : bookList){
    		%>var jsonObject = {"idx":"<%=arr[0] %>", "title": "<%= arr[1] %>","Q":"<%= arr[2] %>",
    				"A":"<%= arr[3]%>"};
    		bookList.push(jsonObject);<%
      }
      %>
      
     

      for(var i=0; i<bookList.length; i++){
        var json = JSON.parse(JSON.stringify(bookList[i]));
        var idx=json.idx;
        var title=json.title;
        var q=json.Q;
        var a=json.A;
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
        $(".row").append(insertTr);
      }
  }
</script>
<style>
  body{
    width: 1100px;
    margin : auto;
    
  }
  .card{
    width: 350px;
  }
  .card-body{
    /* border:10px solid black; */
    height: 200px;
    overflow: hidden;
  
    overflow-y: auto;
  }
  .card-body::-webkit-scrollbar {
    width: 10px;  /* 스크롤바의 너비 */
  }
  
  .card-body::-webkit-scrollbar-thumb {
    height: 30%;
    background: #b8b8b6;
    border-radius: 10px;
  }
  
  .card-body::-webkit-scrollbar-track {
    background: rgba(33, 122, 244, .1);
  }
  .card-header{
    position: sticky;
    top: 0;
      /* z-index: 1000; */
      padding-left: 10px;
      white-space: nowrap;
      text-overflow: ellipsis;
      background-color: rgb(238, 238, 238);
  }
    button{
      border:0px;
      background-color: transparent;
    }
    button img{
      /* border: 1px solid ; */
      width: 20px;
    }
  </style>