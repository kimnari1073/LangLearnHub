<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Member</title>
</head>
<body>
    <form action="/LangLearnHub/memberDelete.do" method="get">
        <label for="memberId">Member ID:</label>
        <input type="text" id="memberId" name="memberId" required>
        <input type="submit" value="Delete">
    </form>
</body>
</html>
