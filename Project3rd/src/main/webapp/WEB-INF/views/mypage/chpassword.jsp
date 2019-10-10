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
<link rel="stylesheet" href="style/chpassword.css" />
<link rel="stylesheet" href="style/leftmenustyle.css" />
<link rel="stylesheet" href="style/basic.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
	function chpassValidate(f) {
		if(!f.nowpass.value){
			alert("현재비밀번호를 입력하세요.");
			return false;
		}
		if(!f.chpass.value){
			alert("바꿀 비밀번호를 입력하세요.");
			return false;
		}
		if(!f.chpass2.value){
			alert("비밀번호 확인을 입력하세요.");
			return false;
		}
		
		if(f.chpass.value!=f.chpass2.value){
			alert("비밀번호를 다시 확인해주세요.");
			f.chpass.value="";
			f.chpass2.value="";
			f.chpass.focus();
			return false;
		}
		
		if(document.getElementById("whatnowpass").value!=f.nowpass.value){
			alert("현재비밀번호가 일치하지 않습니다.");
			f.nowpass.value="";
			f.chpass.value="";
			f.chpass2.value="";
			return false;
		}
		
		if(document.getElementById("whatnowpass").value==f.chpass.value){
			alert("현재비밀번호입니다.");
			f.nowpass.value="";
			f.chpass.value="";
			f.chpass2.value="";
			return false;
		}
		
		
		if(!(f.chpass.value.length>=4 && f.chpass.value.length<=12)){
			alert("비밀번호 4자 이상 12자로 구성하세요");
			f.chpass.focus();
			return false;
		}
		
		for(var i=0 ; i<f.chpass.value.length ; i++){	
			if(!((f.chpass.value[i].charCodeAt(0)>=97 && f.chpass.value[i].charCodeAt(0)<=122) 
					|| (f.chpass.value[i].charCodeAt(0)>=65 && f.chpass.value[i].charCodeAt(0)<=90)
					|| (f.chpass.value[i].charCodeAt(0)>=48 && f.chpass.value[i].charCodeAt(0)<=57))){
				alert("영문/숫자 조합으로 구성하세요");
				return false;	
			}
		}
		function CheckPass(str){
			 var reg1 = /^[a-z0-9]{4,8}$/; 
			 var reg2 = /[a-z]/g;
			var reg3 = /[0-9]/g;
			return(reg1.test(str)&&reg2.test(str)&&reg3.test(str));
			
		}
		
		if(CheckPass(f.chpass.value)==false){
			alert("비밀번호영문숫자조합");
			return false;
		}
		
	}
	
	function alertcall(){
		alert("로그인후 이용해주세요.");
		location.href="./login.do";
	}
</script>
</head>
<body>
	<form name="chpassFrm" method="post" onsubmit="return chpassValidate(this);" action="<c:url value="./chpassAction.do?id=${sessionScope.siteUserInfo }"/>">
		<%@include file="../main/head.jsp" %> 
		<input type="hidden" id="id" name="id" value="${sessionScope.siteUserInfo }" />
		<div class="topcontents">
			<div class="lefttop">
				<div class="lefttoptext">마이페이지</div>
			</div>
			<div class="righttop">
				<div class="righttoptext">비밀번호수정</div>
			</div>
		</div>
		<div class="contents">
			<div class="leftmenu">
				<nav class="left1" >
					<ul class="navbar-nav1  bg-light ">
						<c:choose>
						<c:when test="${not empty sessionScope.siteUserInfo }">
							<li class="nav-item1"><a class="nav-link" href="./interuniv.do?id=${sessionScope.siteUserInfo }">관심대학<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
							<li class="nav-item1"><a class="nav-link" href="./sugrade.do?id=${sessionScope.siteUserInfo }">수시성적<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
							<li class="nav-item1"><a class="nav-link" href="./junggrade.do?id=${sessionScope.siteUserInfo }&years=2019&dates=2019-11-20&year=1year">모의고사성적<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
							<li class="nav-item1"><a class="nav-link" href="./attenvolun.do?id=${sessionScope.siteUserInfo }">출결사항/봉사활동<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
							<li class="nav-item1"><a class="nav-link" href="./mylist.do?id=${sessionScope.siteUserInfo }">나의글<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
							<li class="nav-item1"><a class="nav-link" href="./personaldata.do?id=${sessionScope.siteUserInfo }">개인정보수정<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
							<li class="nav-item1"><a class="nav-link" href="./chpassword.do?id=${sessionScope.siteUserInfo }">비밀번호수정<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item1"><a class="nav-link" href="javascript:void(0);" class="menu_link" onclick="alertcall();">관심대학<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
							<li class="nav-item1"><a class="nav-link" href="javascript:void(0);" class="menu_link" onclick="alertcall();">수시성적<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
							<li class="nav-item1"><a class="nav-link" href="javascript:void(0);" class="menu_link" onclick="alertcall();">모의고사성적<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
							<li class="nav-item1"><a class="nav-link" href="javascript:void(0);" class="menu_link" onclick="alertcall();">출결사항/봉사활동<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
							<li class="nav-item1"><a class="nav-link" href="javascript:void(0);" class="menu_link" onclick="alertcall();">나의글<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
							<li class="nav-item1"><a class="nav-link" href="javascript:void(0);" class="menu_link" onclick="alertcall();">개인정보수정<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
							<li class="nav-item1"><a class="nav-link" href="javascript:void(0);" class="menu_link" onclick="alertcall();">비밀번호수정<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
						</c:otherwise>
					</c:choose>
					</ul>
				</nav>
			</div>
			<div class="rightcontents">
				<div class="passtop">
					<h2>비밀번호변경</h2>
					<span class="comment">소중한 개인정보를 보호하기 위해 <span style="color:red">비밀번호</span>를 <span style="color:red;">변경</span>해 주세요.</span>
				</div>
				<div class="password">
					<table class="table table-bordered" style="margin-left:20px;font-size:14px;margin-top:25px;">
					  <tbody>
					    <tr>
					      <td>현재비밀번호</td>
					      <td>
					      	<input type="hidden" value="${whatnowpass }" id="whatnowpass" />
					      	<input type="password" name="nowpass" id="nowpass"/>
					      </td>
					    </tr>
				    <tr>
				      <td>변경할비밀번호</td>
				      <td>
				      	<input type="password" name="chpass" id="chpass"/><span style="font-size:13px;margin-left:15px;">※현재 비밀번호와 다른 비밀번호를 입력해 주세요.</span>
				      </td>
				    </tr>
				    <tr>
				      <td>변경 비밀번호 확인</td>
				      <td>
				      	<input type="password" name="chpass2" id="chpass2"/>
				      </td>
				    </tr>
				  </tbody>
				</table>
			</div>
			<div class="button">
				<button type="submit" class="btn btn-dark btn-sm">변경</button>
			</div>
			<div class="attention">
				<table class="table table-bordered" style="margin-left:20px;font-size:13px;margin-top:25px;">
				    <tr>
				      <td>
				      	※ 비밀번호는 8~12자의 영문 대소문자,숫자,특수기호만 사용할 수 있습니다.(공백입력불가) <br />
						※ 사용 가능한 특수기호 : !@#$%^&*()-_+=|[]{}'";:/?.>,< <br />
						※ 3자 이상 연속 영문/숫자 조합은 불가합니다. <br />
						※ 아이디에 포함된 문자/숫자와 연속 3자 이상 동일한 비밀번호는 설정이 불가합니다. <br />
				      </td>
				    </tr>
				  </tbody>
				</table>
			</div>
		</div>
	</div>
	
	<%@include file="../main/bottom.jsp" %>
</form>
</body>
</html>