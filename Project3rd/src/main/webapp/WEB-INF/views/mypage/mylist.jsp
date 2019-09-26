<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="style/mylist.css" />
<link rel="stylesheet" href="style/leftmenustyle.css" />
<link rel="stylesheet" href="style/basic.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
function deleteRow4(idx){
	if(confirm('삭제하시겠습니까?')){
		location.href="./deleteqna.do?idx="+idx+"&id="+document.getElementById("id").value;
	}
}

function deleteRow3(idx){
	if(confirm('삭제하시겠습니까?')){
		location.href="./deleteqnareply.do?idx="+idx+"&id="+document.getElementById("id").value;
	}
}

function deleteRow2(idx){
	if(confirm('삭제하시겠습니까?')){
		location.href="./deletereply.do?idx="+idx+"&id="+document.getElementById("id").value;
	}
}

function deleteRow1(idx){
	if(confirm('삭제하시겠습니까?')){
		location.href="./deletewrite.do?idx="+idx+"&id="+document.getElementById("id").value;
	}
}
</script>
</head>
<body>
	<%@include file="../main/head.jsp" %> 
	<div class="topcontents">
		<div class="lefttop">
			<div class="lefttoptext">마이페이지</div>
		</div>
		<div class="righttop">
			<div class="righttoptext">나의글</div>
		</div>
	</div>
	<div class="contents" style="height:1500px;">
		<div class="leftmenu">
			<nav class="left1" >
				<ul class="navbar-nav1  bg-light ">
					<li class="nav-item1"><a class="nav-link" href="./interuniv.do?id=${sessionScope.siteUserInfo }">관심대학<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="./sugrade.do?id=${sessionScope.siteUserInfo }">수시성적<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="./junggrade.do?id=${sessionScope.siteUserInfo }&years=2019&dates=2019-11-20&year=1year">모의고사성적<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="./attenvolun.do?id=${sessionScope.siteUserInfo }">출결사항/봉사활동<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="./mylist.do?id=${sessionScope.siteUserInfo }">나의글<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="./personaldata.do?id=${sessionScope.siteUserInfo }">개인정보수정<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="./chpassword.do?id=${sessionScope.siteUserInfo }">비밀번호수정<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
				</ul>
			</nav>
		</div>
		<div class="rightcontents">
			<div class="writing">
				<h5 style="margin-left:20px;margin-top:10px;text-align:left;">내가 한 질문</h5>
				<form name="qnaFrm">
					<input type="hidden" value="${sessionScope.siteUserInfo }" id="id"/>
					<table class="table" style="margin-left:20px;font-size:14px;">
					  <colgroup>
					  	<col width="*"/>
					  	<col width="10%"/>
					  	<col width="10%"/>
					  	<col width="20%"/>
					  	<col width="10%"/>
					  </colgroup>
					  <thead>
					    <tr>
					      <th>제목</th>
					      <th>과목</th>
					      <th>학년</th>
					      <th>등록일</th>
					      <th>관리</th>
					    </tr>
					  </thead>
					  <tbody>
					  <c:forEach items="${lists4 }" var="row4">
					    <tr>
					      <td>${row4.title }</td>
					      <td>${row4.subject }</td>
					      <td>${row4.grade }</td>
					      <td>${row4.postdate }</td>
					      <td><button type="button" class="btn btn-secondary btn-sm" onclick="javascript:deleteRow4(${row4.idx})">삭제</button></td>
					    </tr>
					   </c:forEach>
					  </tbody>
					</table>
				</form>
			</div>
			<div class="writing" style="padding-top:30px">
				<h5 style="margin-left:20px;margin-top:10px;text-align:left;">내가 쓴 질문댓글</h5>
				<form name="qnaFrm">
					<input type="hidden" value="${sessionScope.siteUserInfo }" id="id"/>
					<table class="table" style="margin-left:20px;font-size:14px;">
					  <colgroup>
					  	<col width="*"/>
					  	<col width="20%"/>
					  	<col width="10%"/>
					  </colgroup>
					  <thead>
					    <tr>
					      <th>내용</th>
					      <th>등록일</th>
			              <th>관리</th>
					    </tr>
					  </thead>
					  <tbody>
					  <c:forEach items="${lists3 }" var="row3">
					    <tr>
					      <td>${row3.contents }</td>
					      <td>${row3.replydate }</td>
					      <td><button type="button" class="btn btn-secondary btn-sm" onclick="javascript:deleteRow3(${row3.re_idx})">삭제</button></td>
					    </tr>
					   </c:forEach>
					  </tbody>
					</table>
				</form>
			</div>
			<div class="reply" style="padding-top:30px">
				<h5 style="margin-left:20px;margin-top:10px;text-align:left;">내가 쓴 글</h5>
				<form name="writeFrm">
					<input type="hidden" value="${sessionScope.siteUserInfo }" id="id"/>
					<table class="table" style="margin-left:20px;font-size:14px;">
					  <colgroup>
					  	<col width="*"/>
					  	<col width="20%"/>
					  	<col width="20%"/>
					  	<col width="10%"/>
					  	<col width="10%"/>
					  </colgroup>
					  <thead>
					    <tr>
					      <th>제목</th>
					      <th>게시판종류</th>
					      <th>등록일</th>
					      <th>조회수</th>
			              <th>관리</th>
					    </tr>
					  </thead>
					  <tbody>
					  <c:forEach items="${lists1 }" var="row1">
					    <tr>
					      <td>${row1.title }</td>
					      <td>
					      	<c:choose>
					      		<c:when test="${row1.bname eq 'free' }">
					      			꿀팁
					      		</c:when>
					      		<c:when test="${row1.bname eq 'group' }">
					      			소모임
					      		</c:when>
					      	</c:choose>
				      	  </td>
					      <td>${row1.postdate }</td>
					      <td>${row1.visitcount }</td>
					      <td><button type="button" class="btn btn-secondary btn-sm" onclick="javascript:deleteRow1(${row1.idx})">삭제</button></td>
					    </tr>
					   </c:forEach>
					  </tbody>
					</table>
				</form>
			</div>
			<div class="reply" style="padding-top:30px">
				<h5 style="margin-left:20px;margin-top:10px;text-align:left;">내가 쓴 댓글</h5>
				<form name="replyFrm">
					<input type="hidden" value="${sessionScope.siteUserInfo }" id="id"/>
					<table class="table" style="margin-left:20px;font-size:14px;">
					  <colgroup>
					  	<col width="*"/>
					  	<col width="20%"/>
					  	<col width="10%"/>
					  </colgroup>
					  <thead>
					    <tr>
					      <th>내용</th>
					      <th>등록일</th>
			              <th>관리</th>
					    </tr>
					  </thead>
					  <tbody>
					  <c:forEach items="${lists2 }" var="row2">
					    <tr>
					      <td>${row2.contents }</td>
					      <td>${row2.replydate }</td>
					      <td><button type="button" class="btn btn-secondary btn-sm" onclick="javascript:deleteRow2(${row2.re_idx})">삭제</button></td>
					    </tr>
					   </c:forEach>
					  </tbody>
					</table>
				</form>
			</div>
			
		</div>
	</div>
	
	<%@include file="../main/bottom.jsp" %>
</body>
</html>