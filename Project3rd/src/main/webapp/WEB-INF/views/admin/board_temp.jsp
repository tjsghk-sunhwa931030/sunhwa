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
      	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
          	<th>번호</th>
            <th>제목</th>
            <th>내용</th>
            <th>아이디</th>
            <th>이름</th>
            <th>파일</th>
            <th>조회수</th>
            <th>게시판 종류</th>
            <th>게시한 날짜</th>
            <th>관리</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${lists }" var="row" varStatus="status">
          <tr>
          	<td>${status.count}</td>
            <td>${row.title }</td>
            <td>${row.contents }</td>
            <td>${row.id }</td>
            <td>${row.name }</td>
            <td>${row.attachedfile }</td>
            <td>${row.visitcount }</td>
            <td>
            <c:choose>
				<c:when test="${row.bname eq 'group'}">
					<c:out value="소모임 구함" />
				</c:when>
				<c:when test="${row.bname eq 'free'}">
					<c:out value="공부꿀팁" />
				</c:when>
				<c:when test="${row.bname eq 'notice'}">
					<c:out value="공지사항" />
				</c:when>
				<c:when test="${row.bname eq 'unient'}">
					<c:out value="대입제도" />
				</c:when>
				<c:when test="${row.bname eq 'qna'}">
					<c:out value="질문있어요!" />
				</c:when>
			</c:choose>
            </td>
            <td>${row.postdate }</td>
            <td>
            	<button type="button" class="btn btn-primary" onclick = "location.href = 'admin_board_modify.do?idx=${row.idx }'">수정</button>
            </td>
          </tr>
         </c:forEach>
        </tbody>
      </table>
</body>
</html>