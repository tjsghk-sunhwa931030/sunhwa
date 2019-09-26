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
<link rel="stylesheet" href="style/attenvolun.css" />
<link rel="stylesheet" href="style/leftmenustyle.css" />
<link rel="stylesheet" href="style/basic.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
	//페이지출력하자마자 계산 및 계산결과보여주기
	window.onload = function() {
		var absence1 = parseInt(document.getElementById("absence1").value);
		var late1 = parseInt(document.getElementById("late1").value);
		var leave1 = parseInt(document.getElementById("leave1").value);
		var outcome1 = parseInt(document.getElementById("outcome1").value);
		var absence2 = parseInt(document.getElementById("absence2").value);
		var late2 = parseInt(document.getElementById("late2").value);
		var leave2 = parseInt(document.getElementById("leave2").value);
		var outcome2 = parseInt(document.getElementById("outcome2").value);
		var absence3 = parseInt(document.getElementById("absence3").value);
		var late3 = parseInt(document.getElementById("late3").value);
		var leave3 = parseInt(document.getElementById("leave3").value);
		var outcome3 = parseInt(document.getElementById("outcome3").value);
		
		var onesum = eval(absence1 + late1 + leave1 + outcome1);
		var twosum = absence2 + late2 + leave2 + outcome2;
		var threesum = absence3 + late3 + leave3 + outcome3;
		var absencesum = absence1 + absence2 + absence3;
		var latesum = late1 + late2 + late3;
		var leavesum = leave1 + leave2 + leave3;
		var outcomesum = outcome1 + outcome2 + outcome3;
		var total = absencesum + latesum + leavesum + outcomesum;
		
		if(isNaN(onesum)==true){
			document.getElementById("onesum").innerHTML = 0;
		}
		else{
			document.getElementById("onesum").innerHTML = onesum;
		}
		if(isNaN(twosum)==true){
			document.getElementById("twosum").innerHTML=0;
		}
		else{
			document.getElementById("twosum").innerHTML = twosum;
		}
		if(isNaN(threesum)==true){
			document.getElementById("threesum").innerHTML = 0;
		}
		else{
			document.getElementById("threesum").innerHTML = threesum;
		}
		if(isNaN(absencesum)==true){
			document.getElementById("absencesum").innerHTML = 0;
		}
		else{
			document.getElementById("absencesum").innerHTML = absencesum;
		}
		if(isNaN(latesum)==true){
			document.getElementById("latesum").innerHTML = 0;
		}
		else{
			document.getElementById("latesum").innerHTML = latesum;
		}
		if(isNaN(leavesum)==true){
			document.getElementById("leavesum").innerHTML = 0;
		}
		else{
			document.getElementById("leavesum").innerHTML = leavesum;
		}
		if(isNaN(outcomesum)==true){
			document.getElementById("outcomesum").innerHTML = 0;
		}
		else{
			document.getElementById("outcomesum").innerHTML = outcomesum;
		}
		if(isNaN(total)==true){
			document.getElementById("total").innerHTML = 0;
		}
		else{
			document.getElementById("total").innerHTML = total;
		}
		
		
		var hour1 = parseInt(document.getElementById("hour1").value);
		var hour2 = parseInt(document.getElementById("hour2").value);
		var hour3 = parseInt(document.getElementById("hour3").value);
		var total2 = hour1 + hour2 + hour3;
		
		
		if(isNaN(total2)==true){
			document.getElementById("total2").innerHTML = 0;
		}
		else{
			document.getElementById("total2").innerHTML = total2;
		}
	}
	
	//특수부호인지 여부
	var special_pattern = /[`~!@#$%^&*|\\\";:\/?]/gi; 
	//한글인지 여부
	var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	//문자인지 여부
	var pattern_eng = /[a-zA-Z]/;
	//출결사항폼값검증
	function attenValidate(f){
		var absence1 = f.absence1.value;
		var late1 = f.late1.value;
		var leave1 = f.leave1.value;
		var outcome1 = f.outcome1.value;
		var absence2 = f.absence2.value;
		var late2 = f.late2.value;
		var leave2 = f.leave2.value;
		var outcome2 = f.outcome2.value;
		var absence3 = f.absence3.value;
		var late3 = f.late3.value;
		var leave3 = f.leave3.value;
		var outcome3 = f.outcome3.value;
		
		if(special_pattern.test(absence1)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_kor.test(absence1)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_eng.test(absence1)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		
		if(special_pattern.test(late1)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_kor.test(late1)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_eng.test(late1)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		
		if(special_pattern.test(leave1)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_kor.test(leave1)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_eng.test(leave1)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		
		if(special_pattern.test(outcome1)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_kor.test(outcome1)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_eng.test(outcome1)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		//----------------------------------------
		if(special_pattern.test(absence2)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_kor.test(absence2)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_eng.test(absence2)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		
		if(special_pattern.test(late2)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_kor.test(late2)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_eng.test(late2)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		
		if(special_pattern.test(leave2)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_kor.test(leave2)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_eng.test(leave2)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		
		if(special_pattern.test(outcome2)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_kor.test(outcome2)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_eng.test(outcome2)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		//-------------------------------------
		if(special_pattern.test(absence3)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_kor.test(absence3)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_eng.test(absence3)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		
		if(special_pattern.test(late3)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_kor.test(late3)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_eng.test(late3)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		
		if(special_pattern.test(leave3)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_kor.test(leave3)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_eng.test(leave3)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		
		if(special_pattern.test(outcome3)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_kor.test(outcome3)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_eng.test(outcome3)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
	}
	//봉사활동폼값검증
	function volunValidate(f){
		var hour1 = f.hour1.value;
		var hour2 = f.hour2.value;
		var hour3 = f.hour3.value;
		
		if(special_pattern.test(hour1)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_kor.test(hour1)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_eng.test(hour1)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		
		if(special_pattern.test(hour2)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_kor.test(hour2)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_eng.test(hour2)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		
		if(special_pattern.test(hour3)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_kor.test(hour3)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		if(pattern_eng.test(hour3)==true){
			alert("숫자만 입력가능합니다.");
			return false;
		}
		
	}
	
	//키를누를때마다 계산
	function keyupcal(){
		var absence1 = parseInt(document.getElementById("absence1").value);
		var late1 = parseInt(document.getElementById("late1").value);
		var leave1 = parseInt(document.getElementById("leave1").value);
		var outcome1 = parseInt(document.getElementById("outcome1").value);
		var absence2 = parseInt(document.getElementById("absence2").value);
		var late2 = parseInt(document.getElementById("late2").value);
		var leave2 = parseInt(document.getElementById("leave2").value);
		var outcome2 = parseInt(document.getElementById("outcome2").value);
		var absence3 = parseInt(document.getElementById("absence3").value);
		var late3 = parseInt(document.getElementById("late3").value);
		var leave3 = parseInt(document.getElementById("leave3").value);
		var outcome3 = parseInt(document.getElementById("outcome3").value);
		
		var onesum = eval(absence1 + late1 + leave1 + outcome1);
		var twosum = absence2 + late2 + leave2 + outcome2;
		var threesum = absence3 + late3 + leave3 + outcome3;
		var absencesum = absence1 + absence2 + absence3;
		var latesum = late1 + late2 + late3;
		var leavesum = leave1 + leave2 + leave3;
		var outcomesum = outcome1 + outcome2 + outcome3;
		var total = absencesum + latesum + leavesum + outcomesum;
		
		
		if(isNaN(onesum)==true){
			document.getElementById("onesum").innerHTML = 0;
		}
		else{
			document.getElementById("onesum").innerHTML = onesum;
		}
		if(isNaN(twosum)==true){
			document.getElementById("twosum").innerHTML=0;
		}
		else{
			document.getElementById("twosum").innerHTML = twosum;
		}
		if(isNaN(threesum)==true){
			document.getElementById("threesum").innerHTML = 0;
		}
		else{
			document.getElementById("threesum").innerHTML = threesum;
		}
		if(isNaN(absencesum)==true){
			document.getElementById("absencesum").innerHTML = 0;
		}
		else{
			document.getElementById("absencesum").innerHTML = absencesum;
		}
		if(isNaN(latesum)==true){
			document.getElementById("latesum").innerHTML = 0;
		}
		else{
			document.getElementById("latesum").innerHTML = latesum;
		}
		if(isNaN(leavesum)==true){
			document.getElementById("leavesum").innerHTML = 0;
		}
		else{
			document.getElementById("leavesum").innerHTML = leavesum;
		}
		if(isNaN(outcomesum)==true){
			document.getElementById("outcomesum").innerHTML = 0;
		}
		else{
			document.getElementById("outcomesum").innerHTML = outcomesum;
		}
		if(isNaN(total)==true){
			document.getElementById("total").innerHTML = 0;
		}
		else{
			document.getElementById("total").innerHTML = total;
		}
		
		
		var hour1 = parseInt(document.getElementById("hour1").value);
		var hour2 = parseInt(document.getElementById("hour2").value);
		var hour3 = parseInt(document.getElementById("hour3").value);
		var total2 = hour1 + hour2 + hour3;
		
		if(isNaN(total2)==true){
			document.getElementById("total2").innerHTML = 0;
		}
		else{
			document.getElementById("total2").innerHTML = total2;
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
			<div class="righttoptext">출결사항/봉사활동</div>
		</div>
	</div>
	<div class="contents">
		<div class="leftmenu">
			<nav class="left1" >
				<ul class="navbar-nav1  bg-light ">
					<li class="nav-item1"><a class="nav-link" href="./interuniv.do?id=${sessionScope.siteUserInfo }">관심대학<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="./sugrade.do?id=${sessionScope.siteUserInfo }&">수시성적<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="./junggrade.do?id=${sessionScope.siteUserInfo }&years=2019&dates=2019-11-20&year=1year">모의고사성적<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="./attenvolun.do?id=${sessionScope.siteUserInfo }">출결사항/봉사활동<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="./mylist.do?id=${sessionScope.siteUserInfo }">나의글<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="./personaldata.do?id=${sessionScope.siteUserInfo }">개인정보수정<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="./chpassword.do?id=${sessionScope.siteUserInfo }">비밀번호수정<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
				</ul>
			</nav>
		</div>
		<div class="rightcontents">
			<div class="attendence">
				<form name="attendenceFrm"  method="post" onsubmit="return attenValidate(this);" action="<c:url value="./attenAction.do"/>">
				<h5 style="margin-left:20px;margin-top:10px;text-align:left;">출결사항&nbsp;&nbsp;<button type="submit" class="btn btn-dark btn-sm">저장</button></h5>
					<input type="hidden" value="${sessionScope.siteUserInfo }" name="id" />
					<c:choose>
						<c:when test="${count1 != 1}">
							<table class="table table-bordered" style="margin-left:20px;font-size:14px;">
							  <thead>
							    <tr>
							      <th>학년</th>
							      <th>무단_결석</th>
							      <th>무단_지각</th>
							      <th>무단_조퇴</th>
							      <th>무단_결과</th>
							      <th>합계</th>
							    </tr>
							  </thead>
							  <tbody>
							    <tr>
							      <td>1</td>
							      <td>
							      	<input type="text" name="absence1" value="" id="absence1" onkeyup="keyupcal();"/>
							      </td>
							      <td>
							      	<input type="text" name="late1" value="" id="late1" onkeyup="keyupcal();"/>
							      </td>
							      <td>
							      	<input type="text" name="leave1" value="" id="leave1" onkeyup="keyupcal();"/>
							      </td>
							      <td>
							      	<input type="text" name="outcome1" value="" id="outcome1" onkeyup="keyupcal();"/>
							      </td>
							      <td><span id="onesum">0</span></td>
							    </tr>
							    <tr>
							      <td>2</td>
							      <td>
							      	<input type="text" name="absence2" value="" id="absence2"  onkeyup="keyupcal();"/>
							      </td>
							      <td>
							      	<input type="text" name="late2" value="" id="late2" onkeyup="keyupcal();"/>
							      </td>
							      <td>
							      	<input type="text" name="leave2" value="" id="leave2" onkeyup="keyupcal();"/>
							      </td>
							      <td>
							      	<input type="text" name="outcome2" value="" id="outcome2" onkeyup="keyupcal();"/>
							      </td>
							      <td><span id="twosum">0</span></td>
							    </tr>
							    <tr>
							      <td>3</td>
							      <td>
							      	<input type="text" name="absence3" value="" id="absence3" onkeyup="keyupcal();"/>
							      </td>
							      <td>
							      	<input type="text" name="late3" value="" id="late3" onkeyup="keyupcal();"/>
							      </td>
							      <td>
							      	<input type="text" name="leave3" value="" id="leave3" onkeyup="keyupcal();"/>
							      </td>
							      <td>
							      	<input type="text" name="outcome3" value="" id="outcome3" onkeyup="keyupcal();"/>
							      </td>
							      <td><span id="threesum">0</span></td>
							    </tr>
								<tr>
							      <td>전학년</td>
							      <td><span id="absencesum">0</span></td>
							      <td><span id="latesum">0</span></td>
							      <td><span id="leavesum">0</span></td>
							      <td><span id="outcomesum">0</span></td>
							      <td><span id="total">0</span></td>
							    </tr>
							  </tbody>
							</table>
						</c:when>
						<c:otherwise>
							<table class="table table-bordered" style="margin-left:20px;font-size:14px;">
							  <thead>
							    <tr>
							      <th>학년</th>
							      <th>무단_결석</th>
							      <th>무단_지각</th>
							      <th>무단_조퇴</th>
							      <th>무단_결과</th>
							      <th>합계</th>
							    </tr>
							  </thead>
							  <tbody>
							  <c:forEach items="${lists1}" var="row1">
							    <tr>
							      <td>1</td>
							      <td>
							      	<input type="text" name="absence1" value="${row1.absence1}" id="absence1" onkeyup="keyupcal();"/>
							      </td>
							      <td>
							      	<input type="text" name="late1" value="${row1.late1 }" id="late1" onkeyup="keyupcal();"/>
							      </td>
							      <td>
							      	<input type="text" name="leave1" value="${row1.leave1 }" id="leave1" onkeyup="keyupcal();"/>
							      </td>
							      <td>
							      	<input type="text" name="outcome1" value="${row1.outcome1 }" id="outcome1" onkeyup="keyupcal();"/>
							      </td>
							      <td><span id="onesum">0</span></td>
							    </tr>
							    <tr>
							      <td>2</td>
							      <td>
							      	<input type="text" name="absence2" value="${row1.absence2 }" id="absence2"  onkeyup="keyupcal();"/>
							      </td>
							      <td>
							      	<input type="text" name="late2" value="${row1.late2 }" id="late2" onkeyup="keyupcal();"/>
							      </td>
							      <td>
							      	<input type="text" name="leave2" value="${row1.leave2 }" id="leave2" onkeyup="keyupcal();"/>
							      </td>
							      <td>
							      	<input type="text" name="outcome2" value="${row1.outcome2 }" id="outcome2" onkeyup="keyupcal();"/>
							      </td>
							      <td><span id="twosum">0</span></td>
							    </tr>
							    <tr>
							      <td>3</td>
							      <td>
							      	<input type="text" name="absence3" value="${row1.absence3 }" id="absence3" onkeyup="keyupcal();"/>
							      </td>
							      <td>
							      	<input type="text" name="late3" value="${row1.late3 }" id="late3" onkeyup="keyupcal();"/>
							      </td>
							      <td>
							      	<input type="text" name="leave3" value="${row1.leave3 }" id="leave3" onkeyup="keyupcal();"/>
							      </td>
							      <td>
							      	<input type="text" name="outcome3" value="${row1.outcome3 }" id="outcome3" onkeyup="keyupcal();"/>
							      </td>
							      <td><span id="threesum">0</span></td>
							    </tr>
							    </c:forEach>
								<tr>
							      <td>전학년</td>
							      <td><span id="absencesum">0</span></td>
							      <td><span id="latesum">0</span></td>
							      <td><span id="leavesum">0</span></td>
							      <td><span id="outcomesum">0</span></td>
							      <td><span id="total">0</span></td>
							    </tr>
							  </tbody>
							</table>
						</c:otherwise>
					</c:choose>
				</form>
			</div>
			<div class="voluntary">
				<form name="voluntaryFrm" method="post" onsubmit="return volunValidate(this)" action="<c:url value="./volunAction.do"/>">
				<h5 style="margin-left:20px;margin-top:10px;text-align:left;">봉사활동&nbsp;&nbsp;<button type="submit" class="btn btn-dark btn-sm">저장</button></h5>
					<input type="hidden" value="${sessionScope.siteUserInfo }" name="id" />
					<c:choose>
						<c:when test="${count2 != 1 }">
							<table class="table table-bordered" style="margin-left:20px;font-size:14px;">
							  <thead>
							    <tr>
							      <th>학년</th>
							      <th>시간</th>
							    </tr>
							  </thead>
							  <tbody>
							    <tr>
							      <td>1</td>
							      <td>
							      	<input type="text" name="hour1" value="" id="hour1" onkeyup="keyupcal();"/>
							      </td>
							    </tr>
							    <tr>
							      <td>2</td>
							      <td>
							      	<input type="text" name="hour2" value="" id="hour2" onkeyup="keyupcal();"/>
							      </td>
							    </tr>
							    <tr>
							      <td>3</td>
							      <td>
							      	<input type="text" name="hour3" value="" id="hour3" onkeyup="keyupcal();"/>
							      </td>
							    </tr>
								<tr>
							      <td>전학년</td>
							      <td><span id="total2">0</span></td>
							    </tr>
							  </tbody>
							</table>
						</c:when>
						<c:otherwise>
							<table class="table table-bordered" style="margin-left:20px;font-size:14px;">
							  <thead>
							    <tr>
							      <th>학년</th>
							      <th>시간</th>
							    </tr>
							  </thead>
							  <tbody>
								  <c:forEach items="${lists2 }" var="row2">
								    <tr>
								      <td>1</td>
								      <td>
								      	<input type="text" name="hour1" value="${row2.hour1 }" id="hour1" onkeyup="keyupcal();"/>
								      </td>
								    </tr>
								    <tr>
								      <td>2</td>
								      <td>
								      	<input type="text" name="hour2" value="${row2.hour2 }" id="hour2" onkeyup="keyupcal();"/>
								      </td>
								    </tr>
								    <tr>
								      <td>3</td>
								      <td>
								      	<input type="text" name="hour3" value="${row2.hour3 }" id="hour3" onkeyup="keyupcal();"/>
								      </td>
								    </tr>
									<tr>
								      <td>전학년</td>
								      <td><span id="total2">0</span></td>
								    </tr>
								    </c:forEach>
							  </tbody>
							</table>
						</c:otherwise>
					</c:choose>
				</form>
			</div>
			<div style="text-align:right;font-size:12px;">
				※모든 내용은 저장을 누르셔야 반영됩니다.
			</div>
		</div>
	</div>
	
	<%@include file="../main/bottom.jsp" %>
</body>
</html>