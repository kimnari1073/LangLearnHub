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
  //const bookList = [];
  const bookList = [];
  function bookMarkInsert(){
      <% int i=0;
      	for(String[] arr : bookList){
    		%>var jsonObject = {"idx":"<%= ++i %>", "title": "<%= arr[0] %>","Q":"<%= arr[1] %>",
    				"A":"<%= arr[2]%>"};
    		bookList.push(jsonObject);<%
      }%>
      
	  //var jsonObject ={"idx":"1","title":"test","Q":"testQ","A":"testA"};
      //bookList.push(jsonObject);

      for(var i=0; i<bookList.length; i++){
        var json = JSON.parse(JSON.stringify(bookList[i]));
        var idx=json.idx;
        var title=json.title;
        var q=json.Q;
        var a=json.A;
        console.log("Json: "+idx);
        var insertTr;
        insertTr = 
        '<form>'+
          '<div class="col">'+
            '<div class="card border-dark mb-3" style="max-width: 18rem;">'+
              '<div class="card-header">'+
                '<form>'+
                  '<input type="hidden" name="bookIdx" value="'+idx+'">'+
                  '<button><img src="pics/star.png"></button>'+title+
                '</form>'+
              '</div>'+
              '<div class="card-body text-dark">'+
                '<h5 class="card-title">Question</h5>'+
                '<p class="card-text">'+q+'</p>'+
                '<h5 class="card-title">Answer</h5>'+
                '<p class="card-text">'+a+'</p>'+
              '</div>'+
            '</div>'+
          '</div>'+
        '</form>';
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
<body>
  <!-- <button><img src="../pics/star.png"></button> -->
    <div class="container">
        <div class="row row-cols-3">
          
          <!-- inset -->
          <!-- 
          <div class="col">
            <div class="card border-dark mb-3" style="max-width: 18rem;">
                <div class="card-header">
                  <form>
                    <input type="hidden" name="" value="">
                    <button><img src="../pics/star.png"></button>
                    Header
                  </form>
                </div>
                <div class="card-body text-dark">
                  <h5 class="card-title">Question</h5>
                  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                  <h5 class="card-title">Question</h5>
                
                </div>
              </div>
          </div>
           -->
          
        </div>
      </div>
</body>
</html>