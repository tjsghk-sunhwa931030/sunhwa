<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
li { list-style: none }
.login_box_new{

}
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="style/interuniv.css" />
<link rel="stylesheet" href="style/style.css" />
<link rel="stylesheet" href="style/leftmenustyle.css" />
<link rel="stylesheet" href="style/basic.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%@include file="../main/head.jsp" %> 
	<div class="topcontents">
		<div class="lefttop">
			<div class="lefttoptext">회원서비스</div>
		</div>
		<div class="righttop">
			 <div class="righttoptext">회원가입</div>
		</div>
	</div>
	<div class="contents">
		<div class="leftmenu">
			<nav class="left1" >
				<ul class="navbar-nav1  bg-light">
					<li class="nav-item1"><a class="nav-link" href="login.do">로그인<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="join01.do">회원가입<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="find_id.do">아이디찾기<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="find_pw.do">비밀번호찾기<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="map.do">사이트맵<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
				</ul>
			</nav>
		</div>
		<div class="rightcontents">
		
			<div class="con_box">
		<ul class="tab_member">
			<li>1.약관동의</li>
			<li>2.회원정보입력</li>
			<li class="on">3.회원가입완료</li>
		</ul>
			</div>
		<script>
		function go_login()
		{
			location.href="login.do";
		}
		function go_main()
		{
			location.href="./main.do";
		}

		</script>
		<div class="s_member_hr2">
			<ul>
				<li><img src="images/coconut.PNG" width="235px" alt="나만따코코넛" /></li>
				<li>
					<div class="txt-mem1">축하합니다!</div>
					<div class="txt-mem2">대학정보포털 어디가 <span class="font_w t_cr02">회원가입이 완료</span>되었습니다.</div>
					<button type="button" class="btnc_member1" onclick="go_login()">로그인</button>
					<button type="button" class="btnc_member2" onclick="go_main()">첫화면</button>
				</li>
			</ul>
			
		</div>	
		
		
		</div>
	</div>
	
	<%@include file="../main/bottom.jsp" %>
</body>
</html>