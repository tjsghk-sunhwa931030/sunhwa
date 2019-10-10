<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<c:if test="${count == 0 }">
		<h4>성적을 추천할 수 없습니다.</h4>
	</c:if>
	<c:if test="${count != 0 }">
	<table class="table table-hover">
		<tr>
			<th>대학교 이름</th>
			<th>전형 이름</th>
			<th>전공</th>
		</tr>
		<c:forEach items="${lists2 }" var="row">
		<tr>
			<td>${row.univ_uname }</td>
			<td>${row.enter_name }</td>
			<td>${row.major }</td>
		</tr>
		</c:forEach>
	</table>
	</c:if>
</body>
</html>