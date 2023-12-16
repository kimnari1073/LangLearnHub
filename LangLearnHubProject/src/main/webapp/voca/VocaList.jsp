<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap,java.util.Map.Entry" %>
<% 
request.setCharacterEncoding("utf-8");
HashMap<String,Integer> vocaList =(HashMap)request.getAttribute("vocaList");
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
		.container { max-width: 600px; margin: 50px auto; padding: 20px; background: #fff; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); } 
	</style>
	<script>
    	window.onload = function() { tableInsert(); };
    	const tableList = [];
    	function tableInsert() {
			<%	int i =0;
				for(Entry<String, Integer> entry: vocaList.entrySet()) {
					%>var jsonObject = {"idx": "<%= ++i %>", "title":"<%= entry.getKey() %>", "total": "<%= entry.getValue()%>"};
					tableList.push(jsonObject);
					<%
				}
			%>
    	// for (var i = 1; i <= 30; i++) {
    	// 		var jsonObject = {"idx": i, "title": String(i) + " 이름", "total": String(i) + " 나이"};
    	// 		tableList.push(jsonObject);
    	// 	}

    		for(var i = 0; i < tableList.length; i++) {
					var jsonObject = JSON.parse(JSON.stringify(tableList[i])); // 각 배열에 있는 jsonObject 참조
					var idx = jsonObject.idx;
					var title = jsonObject.title;
					var total = jsonObject.total;

					var insertTr = "";
					insertTr += "<tr><form>";
					insertTr += "<th scope='row'><input type='hidden' name='tableIndex' value='" + idx + "'>" + idx + "</th>";
					insertTr += "<td><input type='hidden' name='tableTitle' value='" + title + "'>" + title + "</td>";
					insertTr += "<td><input type='hidden' name='tableTotalVoca' value='"  + total + "'>" + total + "</td>";
					insertTr += "<td><button type='button' onclick='deleteRow()' class='btn btn-outline-danger'>delete</button>";
					insertTr += "<button type='button' onclick='editRow()'  class='btn btn-outline-info'>amend</button></td>";
					insertTr += "</form></tr>";    

					$("#dyn_tbody").append(insertTr); 		
				}
    	}

		function deleteRow() {
			$("form").attr("action", "");
			$("form").submit();
		}
		function editRow() {
			$("form").attr("action", "");
			$("form").submit();
		}
	</script>
</head>
<body class="container">
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
