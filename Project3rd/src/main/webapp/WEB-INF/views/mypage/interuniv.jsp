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
<link rel="stylesheet" href="style/interuniv.css" />
<link rel="stylesheet" href="style/leftmenustyle.css" />
<link rel="stylesheet" href="style/basic.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
function deleteRow(idx,id){
	if(confirm('삭제하시겠습니까?')){
		location.href="./deleteinteruniv.do?idx="+idx+"&id="+id;
	}
}
</script>
</head>
<body>
	<form action="./junggrade.do"> 
	<%@include file="../main/head.jsp" %> 
	<div class="topcontents">
		<div class="lefttop">
			<div class="lefttoptext">마이페이지</div>
		</div>
		<div class="righttop">
			<div class="righttoptext">관심대학</div>
		</div>
	</div>
	<div class="contents">
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
			<div class="university">
				<h5 style="margin-left:20px;margin-top:10px;text-align:left;">일반대학</h5>
				<table class="table" style="margin-left:20px;font-size:15px;">
				  <thead>
				    <tr>
				      <th>대학</th>
				      <th>지역</th>
				      <th>입학정원</th>
				      <th>설치학과</th>
				      <th>전형정보</th>
				      <th>관리</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:forEach items="${lists1}" var="row1">
					    <!-- <tr>
					      <td>서울대학교[본교]</td>
					      <td>서울</td>
					      <td>3,238</td>
					      <td>88</td>
					      <td>8</td>
					      <td>
					      	<button type="button" class="btn btn-secondary btn-sm" style="border:0px;">삭제</button>&nbsp;&nbsp;<button type="button" class="btn btn-info btn-sm" style="background-color:#783712;border:0px;">비교</button>
					      </td>
					    </tr> -->
					    <tr>
					      <td>${row1.uname}</td>
					      <td>${row1.locations}</td>
					      <td>${row1.totalman}</td>
					      <td>${row1.major_num}</td>
					      <td>${row1.enter_num}</td>
					      <td>
					      	<button type="button" class="btn btn-secondary btn-sm" style="border:0px;" onclick="javascript:deleteRow(${row1.idx},${row1.id });">삭제</button>&nbsp;&nbsp;<button type="button" class="btn btn-info btn-sm" style="background-color:#783712;border:0px;">비교</button>
					      </td>
					    </tr>
				    </c:forEach>
				  </tbody>
				</table>
			</div>
			<div class="college">
				<h5 style="margin-left:20px;margin-top:10px;text-align:left;">전문대학</h5>
				<table class="table" style="margin-left:20px;font-size:15px;">
				  <thead>
				    <tr>
				      <th>대학</th>
				      <th>지역</th>
				      <th>입학정원</th>
				      <th>설치학과</th>
				      <th>전형정보</th>
				      <th>관리</th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:forEach items="${lists2}" var="row2">
					    <!-- <tr>
					      <td>동양미래대학교[본교]</td>
					      <td>서울</td>
					      <td>3,238</td>
					      <td>88</td>
					      <td>8</td>
					      <td>
					      	<button type="button" class="btn btn-secondary btn-sm" style="border:0px;">삭제</button>&nbsp;&nbsp;<button type="button" class="btn btn-info btn-sm" style="background-color:#783712;border:0px;">비교</button>
					      </td>
					    </tr> -->
					    <tr>
					      <td>${row2.uname}</td>
					      <td>${row2.locations}</td>
					      <td>${row2.totalman}</td>
					      <td>${row2.major_num}</td>
					      <td>${row2.enter_num}</td>
					      <td>
					      	<button type="button" class="btn btn-secondary btn-sm" style="border:0px;" onclick="javascript:deleteRow(${row2.idx},${row2.id });">삭제</button>&nbsp;&nbsp;<button type="button" class="btn btn-info btn-sm" style="background-color:#783712;border:0px;">비교</button>
					      </td>
					    </tr>
				    </c:forEach>
				  </tbody>
				</table>
			</div>
		</div>
	</div>
	
	<%@include file="../main/bottom.jsp" %>
	</form>
</body>
</html>