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
<link rel="stylesheet" href="style/headstyle.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="head">
		<div class="header">
			<!-- 탑메뉴 -->
			<div class="header1">  
				<ul>
					<li><a href="" class="top_link">로그인</a></li>
					<li><a href="" class="top_link">회원가입</a></li>
					<li><a href="" class="top_link">사이트맵</a></li>
				</ul>
				<!-- 로그인했을때 -->
				<!-- 
				<ul>
					<li><%-- 프로필이미지들어갈곳 --%></li>
					<li><a href="" class="top_link">로그아웃</a></li>
					<li><a href="" class="top_link">사이트맵</a></li>
				</ul>
				 -->
			</div>
			<div class="logo">
				<a href="./main.do"><img src="images/coconut.PNG" alt="나만따코코넛" width="235px" /></a>
			</div>
		</div>
	</div>
	<div class="menubar">
		<div class="menubar_menu" >
			<ul>
				<li>
					<a href="./info.do" class="menu_link">대학간다</a>
				</li>
				<li>
					<a href="" class="menu_link">성적분석</a>
				</li>
				<li>
					<a href="./board.do" class="menu_link">끄적끄적</a>
				</li>
				<li>
					<a href="" class="menu_link">알리미</a>
				</li>
				<li>
					<a href="./interuniv.do" class="menu_link">마이페이지</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- 슬라이드로 내려올 목록 -->
	<div class="slide" >
		<div class="slide_menu1">
			<ul>
				<li>대학정보</li>
				<li>학과정보</li>
				<li>전형정보</li>
			</ul>
		</div>
		<div class="slide_menu2">
			<ul>
				<li>학생부성적분석</li>
				<li>수능성적분석</li>
				<li>대학별성적분석</li>
			</ul>
		</div>
		<div class="slide_menu3">	
			<ul>
				<li>공부꿀팁</li>
				<li>질문있어요!</li>
				<li>소모임구함</li>
				<li>독서실추천</li>
			</ul>
		</div>
		<div class="slide_menu4">
			<ul>
				<li>공지사항</li>
				<li>대입제도안내</li>
			</ul>
		</div>
		<div class="slide_menu5">
			<ul>
				<li><a href="./interuniv.do">관심대학</a></li>
				<li><a href="./schedule.do">일정관리</a></li>
				<li><a href="./sugrade.do">수시성적</a></li>
				<li><a href="./junggrade.do">모의고사성적</a></li>
				<li><a href="./attendence.do">출결사항</a></li>
				<li><a href="./voluntary.do">봉사활동</a></li>
				<li><a href="./mylist.do">나의글</a></li>
				<li><a href="./personaldata.do">개인정보수정</a></li>
				<li><a href="./chpassword.do">비밀번호수정</a></li>
			</ul>
		</div>
	</div>

</body>
</html>