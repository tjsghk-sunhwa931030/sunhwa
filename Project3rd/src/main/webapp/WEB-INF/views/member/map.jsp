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
<script>
	function alertcall(){
		alert("로그인후 이용해주세요.");
		location.href="./login.do";
	}
</script>

  


</head>


<body>
	<%@include file="../main/head.jsp" %> 
	<div class="topcontents">
		<div class="lefttop">
			<div class="lefttoptext">회원서비스</div>
		</div>
		<div class="righttop">
			<div class="righttoptext">사이트맵</div>
		</div>
	</div>
	<div class="contents">
		<div class="leftmenu">
		<c:choose>
					<c:when test="${not empty sessionScope.siteUserInfo }">
			<nav class="left1" >
				<ul class="navbar-nav1  bg-light">
				<li class="nav-item1"><a class="nav-link" href="find_id.do">아이디찾기<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="find_pw.do">비밀번호찾기<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="map.do">사이트맵<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>			
					
				</ul>
			</nav>
					</c:when>
					<c:otherwise>
							<li class="nav-item1"><a class="nav-link" href="login.do">로그인<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="join01.do">회원가입<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="find_id.do">아이디찾기<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="find_pw.do">비밀번호찾기<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="map.do">사이트맵<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
			
					</c:otherwise>
		</c:choose>
		</div>
	<div class="rightcontents">
		
		
		
		
		<div class="con_box">
					<!-- 첫번째 줄 -->
					<ul class="maplist_li mgt35">
						<li class="map_icon01">대학간다</li>
						
						<li style="border-top:none">
							<dl>
								<dt><a href="info.do">대학정보</a></dt>
								<dt><a href="hsearch.do">학과정보</a></dt>
								<dt><a href="jsearch.do">전형검색</a></dt>
							</dl>
						</li>
						
					</ul> 
					<!-- //첫번째 줄 -->
					<!-- 두번째 줄 -->
					<ul class="maplist_li mgt10">
						<li class="map_icon02">성적분석</li>
						<c:choose>
							<c:when test="${not empty sessionScope.siteUserInfo }">
						<li>
							<dl>
				                <dt><a href="s_grade.do?id=${sessionScope.siteUserInfo }">학생부 성적 분석</a></dt>
								<dt><a href="j_grade.do?id=${sessionScope.siteUserInfo }">수능 성적 분석</a></dt>	
				                <dt><a href="u_grade.do?id=${sessionScope.siteUserInfo }">대학별 성적 분석</a></dt>
							</dl>
						</li>
						</c:when>
						<c:otherwise>
						<li>
							<dl>
				                <dt><a href="">학생부 성적 분석</a></dt>
								<dt><a href="">수능 성적 분석</a></dt>	
				                <dt><a href="">대학별 성적 분석</a></dt>
							</dl>
						</li>
						</c:otherwise>
						</c:choose>
						
					</ul>
					<!-- //두번째 줄 -->					
					<!-- 세번째 줄 -->
					<ul class="maplist_li mgt10">
						<li class="map_icon03">끄적끄적</li>
						<c:choose>
							<c:when test="${not empty sessionScope.siteUserInfo }">						
						<li>
							<dl>
								<dt><a href="board.do?bname=free">공부꿀팁</a></dt>
								<dt><a href="qna.do">질문있어요!</a></dt>
								<dt><a href="board.do?bname=group">소모임구함</a></dt>
								<dt><a href="library.do">내 주변 독서실</a></dt>
							</dl>
						</li>
							</c:when>
							<c:otherwise>
						<li>
							<dl>
								<dt><a href="">공부꿀팁</a></dt>
								<dt><a href="">질문있어요!</a></dt>
								<dt><a href="">소모임구함</a></dt>
								<dt><a href="">내 주변 독서실</a></dt>
							</dl>
						</li>
							</c:otherwise>
						</c:choose>
					</ul>
					<!-- //세번째 줄 -->
					<!-- 네번째 줄 -->
					<ul class="maplist_li">
						<li class="map_icon04">알리미</li>
						<c:choose>
							<c:when test="${not empty sessionScope.siteUserInfo }">		
						<li>
							<dl>
								<dt class="w102"><a href="board.do?bname=notice">공지사항</a></dt>		
								<dt class="w102"><a href="board.do?bname=unient">대입제도안내</a></dt>	
							</dl>
						</li>
						</c:when>
						<c:otherwise>
						<li>
							<dl>
								<dt class="w102"><a href="">공지사항</a></dt>		
								<dt class="w102"><a href="">대입제도안내</a></dt>	
							</dl>
						</li>
						</c:otherwise>
						</c:choose>
					</ul>
					
					<ul class="maplist_li">
						<li class="map_icon08">마이페이지</li>
						<c:choose>
							<c:when test="${not empty sessionScope.siteUserInfo }">		
						<li>
							<dl>
								<dt><a href="interuniv.do?id=${sessionScope.siteUserInfo }">관심대학</a></dt>
								<dt><a href="sugrade.do?id=${sessionScope.siteUserInfo }">수시성적</a></dt>
								<dt><a href="junggrade.do?id=${sessionScope.siteUserInfo }&years=2019&dates=2019-11-20&year=1year"">모의고사성적</a></dt>
							</dl>							
							<dl>
								
								<dt><a href="attenvolun.do?id=${sessionScope.siteUserInfo }">출결사항/봉사활동</a></dt>
								<dt><a href="mylist.do?id=${sessionScope.siteUserInfo }">나의글</a></dt>
								<dt><a href="personaldata.do?id=${sessionScope.siteUserInfo }">개인정보수정</a></dt>							
								<dt><a href="chpassword.do?id=${sessionScope.siteUserInfo }">비밀번호수정</a></dt>
							</dl>			
						
						</li>
							</c:when>
							<c:otherwise>
						<li>
							<dl>
								<dt><a href="">관심대학</a></dt>
								<dt><a href="">수시성적</a></dt>
								<dt><a href="">모의고사성적</a></dt>
							</dl>							
							<dl>
								
								<dt><a href="">출결사항/봉사활동</a></dt>
								<dt><a href="">나의글</a></dt>
								<dt><a href="">개인정보수정</a></dt>							
								<dt><a href="">비밀번호수정</a></dt>
							</dl>			
						</li>		
							</c:otherwise>
						</c:choose>
						
					</ul>
					<!-- //여덟번째 줄 -->
					
				</div>
		
			<!-- //본문내용 -->
	
		
			
			
			
			
		
		</div>
	</div>
	
	<%@include file="../main/bottom.jsp" %>
</body>
</html>