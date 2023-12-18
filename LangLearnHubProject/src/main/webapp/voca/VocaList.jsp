<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<% 
request.setCharacterEncoding("utf-8");
ArrayList<String[]> vocaList =(ArrayList)request.getAttribute("vocaList");

%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
    <title>HTML TEST</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">  

    <!-- Jquery CDN 로드: 항상 최신 버전 사용 -->    
    <script src="https://code.jquery.com/jquery-latest.min.js"></script> 

    <!-- 부트스트랩 CDN 로드: 항상 최신 버전 사용: maxcdn -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
    <style>
		* {margin: 0;padding: 0;font-family: 'Noto Sans KR', sans-serif;font-size: 16px;font-weight: 400;box-sizing: border-box;box-sizing: border-box;}
		body { padding: 20px; background-color: #f5f5f5; } 
		form { max-width: 1000px; min-width: 500px; 
		margin: 50px auto; padding: 50px; background: #fff; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); } 
		  #editForm {
    display: flex;
    flex-direction: column;
    align-items: center;
  }
  .button-container{
	margin-left: auto;
	margin-bottom:5px;
 }
  .table {
    width: 80%;
  }
   
  
	</style>

</head>
<header>
	<%@include file="../include/header.jsp" %>
</header>
<body>

<form id="editForm">
  <div>
    <h1 class="vocaListTitle">Voca List</h1>
  </div>
  <div class="button-container">
    <button id="createBtn" class="btn btn-outline-success" type="button">Create</button>
  </div>


	<table class="table table-hover text-center">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Index</th>
				<th scope="col">Title</th>
				<th scope="col">Total Voca</th>
				<th scope="col">Delete</th>
				<th scope="col">Revise</th>
			</tr>
		</thead>
		<tbody id="dyn_tbody">
			<!-- insert -->
		</tbody>
	</table>
</form>
</body>
</html>
	<script>
    	window.onload = function() { tableInsert(); };
    	const tableList = [];
    	function tableInsert() {
			<%if(vocaList !=null){
				for(String[] arr: vocaList) {
					%>var jsonObject = {"idx": "<%= arr[0] %>", "title":"<%= arr[1] %>", "total": "<%= arr[2] %>"};
					tableList.push(jsonObject);
					<%
				}
			}
			%>

    		for(var i = 0; i < tableList.length; i++) {
					var jsonObject = JSON.parse(JSON.stringify(tableList[i])); // 각 배열에 있는 jsonObject 참조
					var idx = jsonObject.idx;
					var title = jsonObject.title;
					var total = jsonObject.total;

					var insertTr = "";
					insertTr += "<tr><form>";
					insertTr += "<th scope='row'>" + idx + "</th>";
					insertTr += "<td><input type='hidden' name='tableTitle' value='" + title + "'>" + title + "</td>";
					insertTr += "<td>" + total + "</td>";
					insertTr += "<td><button type='button' onclick='deleteRow("+i+")' class='btn btn-outline-danger'>delete</button></td>";
					insertTr += "<td><button type='button' onclick='editRow("+i+")'  class='btn btn-outline-info'>revise</button></td>";
					insertTr += "</form></tr>";    

					$("#dyn_tbody").append(insertTr); 		
				}
    	}

		function deleteRow(index) {
		    var formData = {
			        tableTitle: tableList[index].title
			    };

			    var form = $("<form>")
			        .attr("action", "/LangLearnHubProject/vocadelete")
			        .attr("method", "post")
			        .appendTo("body");

			    for (var key in formData) {
			        $("<input>")
			            .attr("type", "hidden")
			            .attr("name", key)
			            .attr("value", formData[key])
			            .appendTo(form);
			    }

			    form.submit();
		}
		function editRow(index) {
		    var formData = {
		        tableTitle: tableList[index].title
		    };

		    // 기존에 존재하는 폼이 있는지 확인
		    var form = $("form#editForm");
		    if (form.length === 0) {
		        // 존재하지 않는다면 새로운 폼 생성
		        form = $("<form>")
		            .attr("id", "editForm")
		            .attr("method", "post")
		            .appendTo("body");
		    } else {
		        // 존재한다면 기존 폼을 초기화
		        form.empty();
		    }

		    // 폼에 데이터 추가
		    for (var key in formData) {
		        $("<input>")
		            .attr("type", "hidden")
		            .attr("name", key)
		            .attr("value", formData[key])
		            .appendTo(form);
		    }

		    // 폼 제출
		    form.attr("action", "/LangLearnHubProject/vocarevise").submit();
		}
		var createBtn = document.getElementById('createBtn');

        // 버튼이 클릭되었을 때 실행될 함수를 정의합니다.
        function redirectToAnotherPage() {
            // 여기에 이동하고 싶은 페이지의 URL을 설정합니다.
            var destinationPage = 'voca/VocaPage.jsp';
            
            // 다른 페이지로 이동합니다.
            window.location.href = destinationPage;
        }

        // 버튼에 클릭 이벤트를 추가하고 클릭되었을 때 위에서 정의한 함수를 호출합니다.
        createBtn.addEventListener('click', redirectToAnotherPage);
	</script>
