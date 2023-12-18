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
		body {background-color: #f5f5f5; } 
		.containerBody { 
		max-width: 600px; 
		margin: 50px auto; 
		padding: 10px; 
		background: #fff; 
		border-radius: 8px; 
		box-shadow: 0 0 10px rgba(0,0,0,0.1);
		} 
	</style>
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
					insertTr += "<td><button type='button' onclick='deleteRow("+i+")' class='btn btn-outline-danger'>delete</button>";
					insertTr += "<button type='button' onclick='editRow("+i+")'  class='btn btn-outline-info'>revise</button></td>";
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

		    var form = $("<form>")
		        .attr("action", "/LangLearnHubProject/vocarevise")
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

	</script>
</head>
<header>
	<%@include file="../include/header.jsp" %>
</header>
<body class="containerBody">
	<table class="table table-hover text-center">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Index</th>
				<th scope="col">Title</th>
				<th scope="col">Total Voca</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody id="dyn_tbody">
			<!-- insert -->
		</tbody>
	</table>
</body>
</html>
