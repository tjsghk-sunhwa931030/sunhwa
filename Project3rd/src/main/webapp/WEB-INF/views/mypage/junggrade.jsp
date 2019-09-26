<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 문자열을 자르기위한 jstl taglib 선언 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="style/junggrade.css" />
<link rel="stylesheet" href="style/leftmenustyle.css" />
<link rel="stylesheet" href="style/basic.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
//모의고사년도선택하면 해당 히든폼에 입력하기
var years=''; //년도
function choiceYears(frm, elem){
	for(var i=0; i<elem.length; i++){
		if(elem.options[i].selected){
			frm.years.value=elem.options[elem.selectedIndex].value
			years=elem.options[elem.selectedIndex].value;
		}
	}
	
}

function selectyear(year){
	document.getElementById("year").value=year;
}

function insertinto(dates,ex_name){
	document.getElementById("dates").value=dates;
	document.getElementById("ex_name").value=ex_name;
	var dates = document.getElementById("dates").value; //시험일정
	var year = document.getElementById("year").value; //학년
	var years = document.getElementById("years").value;
	
	var id = '<c:out value="${sessionScope.siteUserInfo }"/>';		/* 로그인후 고친부분 */
	
	location.href="./junggrade.do?years="+years+"&dates="+dates+"&year="+year+"&id="+id; /* 로그인후 고친부분 */
}

function analyze(dates,ex_name){
	document.getElementById("dates").value=dates;
	document.getElementById("ex_name").value=ex_name;
	var dates = document.getElementById("dates").value; //시험일정
	var year = document.getElementById("year").value; //학년
	var years = document.getElementById("years").value;
	
	var id = '<c:out value="${sessionScope.siteUserInfo }"/>';		/* 로그인후 고친부분 */
	
	location.href="./j_grade.do?years="+years+"&dates="+dates+"&year="+year+"&id="+id; /* 로그인후 고친부분 */
}

function study1typeselect(frm, study1){
	var study1type='';
	
	for(var i=0; i<study1.length; i++){
		if(study1.options[i].selected){
			if(study1.options[study1.selectedIndex].value=="사회탐구"){
				study1type="<option value='경제'>경제</option>";
				study1type += "<option value='공통과학'>공통과학</option>";
				study1type += "<option value='공통사회'>공통사회</option>";
				study1type += "<option value='동아시아사'>동아시아사</option>";
				study1type += "<option value='법과정치'>법과정치</option>";
				study1type += "<option value='사회문화'>사회문화</option>";
				study1type += "<option value='생활과윤리'>생활과윤리</option>";
				study1type += "<option value='세계지리'>세계지리</option>";
				study1type += "<option value='세계사'>세계사</option>";
				study1type += "<option value='윤리와사상'>윤리와사상</option>";
				study1type += "<option value='정치와법'>정치와법</option>";
				study1type += "<option value='한국지리'>한국지리</option>";
			}
			else if(study1.options[study1.selectedIndex].value=="과학탐구"){
				study1type="<option value='공통과학'>공통과학</option>";
				study1type += "<option value='공통사회'>공통사회</option>";
				study1type += "<option value='물리1'>물리1</option>";
				study1type += "<option value='물리2'>물리2</option>";
				study1type += "<option value='생명과학1'>생명과학1</option>";
				study1type += "<option value='생명과학2'>생명과학2</option>";
				study1type += "<option value='지구과학1'>지구과학1</option>";
				study1type += "<option value='지구과학2'>지구과학2</option>";
				study1type += "<option value='화학1'>화학1</option>";
				study1type += "<option value='화학2'>화학2</option>";
			}
			else if(study1.options[study1.selectedIndex].value=="직업탐구"){
				study1type="<option value='공업일반'>공업일반</option>";
				study1type += "<option value='기초제도'>기초제도</option>";
				study1type += "<option value='농업기초기술'>농업기초기술</option>";
				study1type += "<option value='농업이해'>농업이해</option>";
				study1type += "<option value='상업경제'>상업경제</option>";
				study1type += "<option value='인간발달'>인간발달</option>";
				study1type += "<option value='해양의이해'>해양의이해</option>";
				study1type += "<option value='회계원리'>회계원리</option>";
			}
		}
	}
	
	document.getElementById("study1_type").innerHTML = study1type;
}

function study2typeselect(frm, study2){
	var study2type='';
	
	for(var i=0; i<study2.length; i++){
		if(study2.options[i].selected){
			if(study2.options[study2.selectedIndex].value=="사회탐구"){
				study2type="<option value='경제'>경제</option>";
				study2type += "<option value='공통과학'>공통과학</option>";
				study2type += "<option value='공통사회'>공통사회</option>";
				study2type += "<option value='동아시아사'>동아시아사</option>";
				study2type += "<option value='법과정치'>법과정치</option>";
				study2type += "<option value='사회문화'>사회문화</option>";
				study2type += "<option value='생활과윤리'>생활과윤리</option>";
				study2type += "<option value='세계지리'>세계지리</option>";
				study2type += "<option value='세계사'>세계사</option>";
				study2type += "<option value='윤리와사상'>윤리와사상</option>";
				study2type += "<option value='정치와법'>정치와법</option>";
				study2type += "<option value='한국지리'>한국지리</option>";
			}
			else if(study2.options[study2.selectedIndex].value=="과학탐구"){
				study2type="<option value='공통과학'>공통과학</option>";
				study2type += "<option value='공통사회'>공통사회</option>";
				study2type += "<option value='물리1'>물리1</option>";
				study2type += "<option value='물리2'>물리2</option>";
				study2type += "<option value='생명과학1'>생명과학1</option>";
				study2type += "<option value='생명과학2'>생명과학2</option>";
				study2type += "<option value='지구과학1'>지구과학1</option>";
				study2type += "<option value='지구과학2'>지구과학2</option>";
				study2type += "<option value='화학1'>화학1</option>";
				study2type += "<option value='화학2'>화학2</option>";
			}
			else if(study2.options[study2.selectedIndex].value=="직업탐구"){
				study2type="<option value='공업일반'>공업일반</option>";
				study2type += "<option value='기초제도'>기초제도</option>";
				study2type += "<option value='농업기초기술'>농업기초기술</option>";
				study2type += "<option value='농업이해'>농업이해</option>";
				study2type += "<option value='상업경제'>상업경제</option>";
				study2type += "<option value='인간발달'>인간발달</option>";
				study2type += "<option value='해양의이해'>해양의이해</option>";
				study2type += "<option value='회계원리'>회계원리</option>";
			}
		}
	}
	
	document.getElementById("study2_type").innerHTML = study2type;
}

function jungValidate(){
	var fn = document.jungFrm;
	var frmArray = ["native_standard","native_percent","native_rate","math_standard","math_percent","math_rate","eng_rate","study1_standard","study1_percent","study1_rate",
					"study2_standard","study2_percent","study2_rate","foreign_standard","foreign_percent","foreign_rate","history_rate"];
	var txtArray = ["국어 표준점수","국어 백분위","국어 등급","수학 표준점수","수학 백분위","수학 등급","영어 등급","탐구1 표준점수","탐구1 백분위","탐구1 등급","탐구2 표준점수"
					,"탐구2 백분위","탐구2 등급","외국어 표준점수","외국어 백분위","외국어 등급","한국사 등급"];
	
	for(var i=0; i<frmArray.length;i++){
		if(eval("fn."+frmArray[i]+".type")=="text"){
			if(eval("fn."+frmArray[i]+".value")==""){
				alert(txtArray[i]+"를(을) 입력하세요");
				eval("fn."+frmArray[i]+".focus()");
				return false;
			}
		}
	}
	
	
	//특수부호인지 여부
	var special_pattern = /[`~!@#$%^&*|\\\";:\/?]/gi; 
	//한글인지 여부
	var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	//문자인지 여부
	var pattern_eng = /[a-zA-Z]/;
	
	
	var native_standard = fn.native_standard.value;
	var native_percent = fn.native_percent.value;
	var native_rate = fn.native_rate.value;
	var math_standard = fn.math_standard.value;
	var math_percent = fn.math_percent.value;
	var math_rate = fn.math_rate.value;
	var eng_rate = fn.eng_rate.value;
	var study1_standard = fn.study1_standard.value;
	var study1_percent = fn.study1_percent.value;
	var study1_rate = fn.study1_rate.value;
	var study2_standard = fn.study2_standard.value;
	var study2_percent = fn.study2_percent.value;
	var study2_rate = fn.study2_rate.value;
	var foreign_standard = fn.foreign_standard.value;
	var foreign_percent = fn.foreign_percent.value;
	var foreign_rate = fn.foreign_rate.value;
	var history_rate = fn.history_rate.value;
	
	if(special_pattern.test(native_standard)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_kor.test(native_standard)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_eng.test(native_standard)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	
	if(special_pattern.test(native_percent)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_kor.test(native_percent)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_eng.test(native_percent)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	
	if(special_pattern.test(native_rate)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_kor.test(native_rate)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_eng.test(native_rate)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	
	if(special_pattern.test(math_standard)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_kor.test(math_standard)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_eng.test(math_standard)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	
	if(special_pattern.test(math_percent)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_kor.test(math_percent)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_eng.test(math_percent)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	
	if(special_pattern.test(math_rate)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_kor.test(math_rate)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_eng.test(math_rate)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	
	if(special_pattern.test(eng_rate)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_kor.test(eng_rate)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_eng.test(eng_rate)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	
	if(special_pattern.test(study1_standard)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_kor.test(study1_standard)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_eng.test(study1_standard)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	
	if(special_pattern.test(study1_percent)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_kor.test(study1_percent)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_eng.test(study1_percent)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	
	if(special_pattern.test(study1_rate)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_kor.test(study1_rate)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_eng.test(study1_rate)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	
	if(special_pattern.test(study2_standard)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_kor.test(study2_standard)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_eng.test(study2_standard)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	
	if(special_pattern.test(study2_percent)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_kor.test(study2_percent)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_eng.test(study2_percent)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	
	if(special_pattern.test(study2_rate)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_kor.test(study2_rate)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_eng.test(study2_rate)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	
	if(special_pattern.test(foreign_standard)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_kor.test(foreign_standard)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_eng.test(foreign_standard)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	
	if(special_pattern.test(foreign_percent)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_kor.test(foreign_percent)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_eng.test(foreign_percent)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	
	if(special_pattern.test(foreign_rate)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_kor.test(foreign_rate)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_eng.test(foreign_rate)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	
	if(special_pattern.test(history_rate)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_kor.test(history_rate)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	if(pattern_eng.test(history_rate)==true){
		alert("숫자만 입력가능합니다.");
		return false;
	}
	
}
</script>
</head>
<body>
<!-- form시작 -->
<form name="jungFrm" method="post" onsubmit="return jungValidate();" action="<c:url value="./jungAction.do"/>">
	<%@include file="../main/head.jsp" %> 
	<div class="topcontents">
		<div class="lefttop">
			<div class="lefttoptext">마이페이지</div>
		</div>
		<div class="righttop">
			<div class="righttoptext">모의고사성적</div>
		</div>
	</div>
	<div class="contents" style="height:1100px;">
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
		<div class="rightcontents" >
			<div class="year">
				모의고사 연도 : 
				<select name="selectyears" id="selectyears" onchange="choiceYears(this.form, this)">
					<option value="2019" >2019</option>
					<option value="2018">2018</option>
					<option value="2017">2017</option>
					<option value="2016">2016</option>
				</select>
			</div>
			<div class="container mt-3">
				<!-- tab부분 -->
				<ul class="nav nav-tabs">
				    <li class="nav-item">
				      <a class="nav-link active" data-toggle="tab" href="#home" onclick="selectyear('1year');">1학년</a>
				    </li>
				    <li class="nav-item"> 
				      <a class="nav-link" data-toggle="tab" href="#menu1" onclick="selectyear('2year')">2학년</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" data-toggle="tab" href="#menu2" onclick="selectyear('3year')">3학년</a>
				    </li>
			  	</ul>
			  	<!-- tab내용부분 -->
			  	<div class="tab-content">
				    <div id="home" class="container tab-pane active"><br>
				      <table class="table">
					    <thead class="thead-light">
					      <tr>
					        <th>일정</th>
					        <th>시험명</th>
					        <th>직접입력</th>
					        <th>분석하기</th>
					      </tr>
					    </thead>
					    <tbody>
					    <c:forEach items="${test_lists }" var="row">
					      <tr>
					      	<c:set var="dateArray" value="${fn:split(row.starts, ' ') }"></c:set>
					        <c:set var="date" value="${dateArray[0] }"></c:set>
					        <td>${row.title}</td>
					        <td>${date}</td>
					        <td>
					        	<button type="button" class="btn btn-secondary btn-sm" data-toggle="collapse" data-target="#demo" onclick="insertinto('${date}','${row.title}');">입력</button>
					        </td>
					        <td>
					        	<button type="button" class="btn btn-secondary btn-sm" onclick="analyze('${date}','${row.title}');">분석하기</button>
					        </td>
					      </tr>
					     </c:forEach>
					    </tbody>
					  </table>
				    </div><!-- 1학년 end -->
				    <div id="menu1" class="container tab-pane fade"><br>
				      <table class="table">
					    <thead class="thead-light">
					      <tr>
					        <th>일정</th>
					        <th>시험명</th>
					        <th>직접입력</th>
					        <th>분석하기</th>
					      </tr>
					    </thead>
					    <tbody>
					    <c:forEach items="${test_lists }" var="row">
					      <tr>
					      	<c:set var="dateArray" value="${fn:split(row.starts, ' ') }"></c:set>
					        <c:set var="date" value="${dateArray[0] }"></c:set>
					        <td>${row.title}</td>
					        <td>${date}</td>
					        <td>
					        	<button type="button" class="btn btn-secondary btn-sm" data-toggle="collapse" data-target="#demo" onclick="insertinto('${date}','${row.title}');">입력</button>
					        </td>
					        <td>
					        	<button type="button" class="btn btn-secondary btn-sm" onclick="analyze('${date}','${row.title}');">분석하기</button>
					        </td>
					      </tr>
					     </c:forEach>
					    </tbody>
					  </table>
				    </div> <!-- 2학년 end -->
				    <div id="menu2" class="container tab-pane fade"><br>
				      <table class="table">
					    <thead class="thead-light">
					      <tr>
					        <th>일정</th>
					        <th>시험명</th>
					        <th>직접입력</th>
					        <th>분석하기</th>
					      </tr>
					    </thead>
					    <tbody>
					    <c:forEach items="${test_lists }" var="row">
					      <tr>
					      	<c:set var="dateArray" value="${fn:split(row.starts, ' ') }"></c:set>
					        <c:set var="date" value="${dateArray[0] }"></c:set>
					        <td>${row.title}</td>
					        <td>${date}</td>
					        <td>
					        	<button type="button" class="btn btn-secondary btn-sm" data-toggle="collapse" data-target="#demo" onclick="insertinto('${date}','${row.title}');">입력</button>
					        </td>
					        <td>
					        	<button type="button" class="btn btn-secondary btn-sm" onclick="analyze('${date}','${row.title}');">분석하기</button>
					        </td>
					      </tr>
					     </c:forEach>
					    </tbody>
					  </table>
				    </div><!-- 3학년 end -->
				    <!-- 공통으로나오는 부분 -->
				    <div id="demo">
				    	<%
				    	String id=request.getParameter("id");
				    	String years="";
				    	String dates = "";
				    	String ex_name = "";
				    	String year = "";
				    	
				    	if(request.getParameter("years")==null || request.getParameter("years")==""){
				    		years="2019";
				    	}
				    	else{
				    		years=request.getParameter("years"); 
				    	}
				    	if(request.getParameter("dates")==null){
				    		dates="2019-11-20";
				    	}
				    	else{
				    		dates=request.getParameter("dates");
				    	}
				    	if(request.getParameter("ex_name")==null){
				    		ex_name="학력평가";
				    	}
				    	else{
				    		ex_name=request.getParameter("ex_name");
				    	}
				    	if(request.getParameter("year")==null){
				    		year="1year";
				    	}
				    	else{
				    		year = request.getParameter("year");
				    	}
				    	
				    	String temp = year;
				    	String [] temp2 = temp.split("year");
				    	String year_int =  temp2[0];
				    
				    	%>
				    	<h3 style="padding-top:20px;"><%=year_int %>학년 <%=dates %> <%=ex_name %></h3>
			    		<input type="hidden" value="<%=id %>" name="id"/>
			    		<input type="hidden" value="<%=years %>" name="years" id="years"/>
			    		<input type="hidden" value="<%=dates %>" name="dates" id="dates"/>
			    		<input type="hidden" value="<%=ex_name %>" name="ex_name" id="ex_name"/>
			    		<input type="hidden" value="<%=year %>" name="year" id="year"/>
			    		<c:choose>
			    			<c:when test="${count eq 1 }">
			    				<c:forEach items="${lists }" var="row">
				    				<table class="table">
									  <thead class="thead-light">
									    <tr>
									      <th colspan="2">과목</th>
									      <th>표준점수</th>
									      <th>백분위</th>
									      <th>등급</th>
									    </tr>
									  </thead>
									  <tbody>
									    <tr>
									      <td><input type="text" readonly value="국어" style="border:0px;text-align:center;" name="natives"/></td>
									      <td></td>
									      <td>
									      	<input type="text" value="${row.native_standard }" name="native_standard"/>
									      </td>
									      <td>
									      	<input type="text" value="${row.native_percent }" name="native_percent"/>
									      </td>
									      <td>
									      	<input type="text"  value="${row.native_rate }" name="native_rate"/>
									      </td>
									    </tr>
									    <tr>
									      <td><input type="text" readonly value="수학" style="border:0px;text-align:center;" name="math"/></td>
									      <td>
									      	<select name="math_type" id="">
									      		<option value="가형" <c:if test="${row.math_type eq '가형' }">selected</c:if>>가형</option>
									      		<option value="나형" <c:if test="${row.math_type eq '나형' }">selected</c:if>>나형</option>
									      	</select>
									      </td>
									      <td>
									      	<input type="text" value="${row.math_standard }" name="math_standard"/>
									      </td>
									      <td>
									      	<input type="text" value="${row.math_percent }" name="math_percent"/>
									      </td>
									      <td>
									      	<input type="text" value="${row.math_rate }" name="math_rate"/>
									      </td>
									    </tr>
									    <tr>
									      <td><input type="text" readonly value="영어" style="border:0px;text-align:center;" name="eng"/></td>
									      <td></td>
									      <td>
									      	<input type="text" disabled/>
									      </td>
									      <td>
									      	<input type="text" disabled />
									      </td>
									      <td>
									      	<input type="text" name="eng_rate" value="${row.eng_rate }"/>
									      </td>
									    </tr>
									    <tr>
									      <td>
									      	<select name="study1" id="study1" onchange="study1typeselect(this.form, this)">
									      		<option value="사회탐구" <c:if test="${row.study1 eq '사회탐구' }">selected</c:if>>사회탐구</option>
									      		<option value="과학탐구" <c:if test="${row.study1 eq '과학탐구' }">selected</c:if>>과학탐구</option>
									      		<option value="직업탐구" <c:if test="${row.study1 eq '직업탐구' }">selected</c:if>>직업탐구</option>
									      	</select>
									      </td>
									      <td>
									      	<c:choose>
									      		<c:when test="${row.study1 eq '사회탐구' }">
									      			<select name="study1_type" id="study1_type">
											      		<option value='경제' <c:if test="${row.study1_type eq '경제' }">selected</c:if>>경제</option>
														<option value='공통과학' <c:if test="${row.study1_type eq '공통과학' }">selected</c:if>>공통과학</option>
														<option value='공통사회' <c:if test="${row.study1_type eq '공통사회' }">selected</c:if>>공통사회</option>
														<option value='동아시아사' <c:if test="${row.study1_type eq '동아시아사' }">selected</c:if>>동아시아사</option>
														<option value='법과정치' <c:if test="${row.study1_type eq '법과정치' }">selected</c:if>>법과정치</option>
														<option value='사회문화' <c:if test="${row.study1_type eq '사회문화' }">selected</c:if>>사회문화</option>
														<option value='생활과윤리' <c:if test="${row.study1_type eq '생활과윤리' }">selected</c:if>>생활과윤리</option>
														<option value='세계지리' <c:if test="${row.study1_type eq '세계지리' }">selected</c:if>>세계지리</option>
														<option value='세계사' <c:if test="${row.study1_type eq '세계사' }">selected</c:if>>세계사</option>
														<option value='윤리와사상' <c:if test="${row.study1_type eq '윤리와사상' }">selected</c:if>>윤리와사상</option>
														<option value='정치와법' <c:if test="${row.study1_type eq '정치와법' }">selected</c:if>>정치와법</option>
														<option value='한국지리' <c:if test="${row.study1_type eq '한국지리' }">selected</c:if>>한국지리</option>
										      		</select>
									      		</c:when>
									      		<c:when test="${row.study1 eq '과학탐구' }">
									      			<select name="study1_type" id="study1_type">
											      		<option value='공통과학' <c:if test="${row.study1_type eq '공통과학' }">selected</c:if>>공통과학</option>
														<option value='공통사회' <c:if test="${row.study1_type eq '공통사회' }">selected</c:if>>공통사회</option>
														<option value='물리1' <c:if test="${row.study1_type eq '물리1' }">selected</c:if>>물리1</option>
														<option value='물리2' <c:if test="${row.study1_type eq '물리2' }">selected</c:if>>물리2</option>
														<option value='생명과학1' <c:if test="${row.study1_type eq '생명과학1' }">selected</c:if>>생명과학1</option>
														<option value='생명과학2' <c:if test="${row.study1_type eq '생명과학2' }">selected</c:if>>생명과학2</option>
														<option value='지구과학1' <c:if test="${row.study1_type eq '지구과학1' }">selected</c:if>>지구과학1</option>
														<option value='지구과학2' <c:if test="${row.study1_type eq '지구과학2' }">selected</c:if>>지구과학2</option>
														<option value='화학1' <c:if test="${row.study1_type eq '화학1' }">selected</c:if>>화학1</option>
														<option value='화학2' <c:if test="${row.study1_type eq '화학2' }">selected</c:if>>화학2</option>
										      		</select>
									      		</c:when>
									      		<c:otherwise>
									      			<select name="study1_type" id="study1_type">
											      		<option value='공업일반' <c:if test="${row.study1_type eq '공업일반' }">selected</c:if>>공업일반</option>
														<option value='기초제도' <c:if test="${row.study1_type eq '기초제도' }">selected</c:if>>기초제도</option>
														<option value='농업기초기술' <c:if test="${row.study1_type eq '농업기초기술' }">selected</c:if>>농업기초기술</option>
														<option value='농업이해' <c:if test="${row.study1_type eq '농업이해' }">selected</c:if>>농업이해</option>
														<option value='상업경제' <c:if test="${row.study1_type eq '상업경제' }">selected</c:if>>상업경제</option>
														<option value='인간발달' <c:if test="${row.study1_type eq '인간발달' }">selected</c:if>>인간발달</option>
														<option value='해양의이해' <c:if test="${row.study1_type eq '해양의이해' }">selected</c:if>>해양의이해</option>
														<option value='회계원리' <c:if test="${row.study1_type eq '회계원리' }">selected</c:if>>회계원리</option>
										      		</select>
									      		</c:otherwise>
									      	</c:choose>
									      </td>
									      <td>
									      	<input type="text" value="${row.study1_standard }" name="study1_standard"/>
									      </td>
									      <td>
									      	<input type="text" value="${row.study1_percent }" name="study1_percent"/>
									      </td>
									      <td>
									      	<input type="text" value="${row.study1_rate }" name="study1_rate"/>
									      </td>
									    </tr>
									    <tr>
									      <td>
									      	<select name="study2" id="" onchange="study2typeselect(this.form, this)">
									      		<option value="사회탐구" <c:if test="${row.study2 eq '사회탐구' }">selected</c:if>>사회탐구</option>
									      		<option value="과학탐구" <c:if test="${row.study2 eq '과학탐구' }">selected</c:if>>과학탐구</option>
									      		<option value="직업탐구" <c:if test="${row.study2 eq '직업탐구' }">selected</c:if>>직업탐구</option>
									      	</select>
									      </td>
									      <td>
									      	<c:choose>
									      		<c:when test="${row.study2 eq '사회탐구' }">
									      			<select name="study2_type" id="study2_type">
											      		<option value='경제' <c:if test="${row.study2_type eq '경제' }">selected</c:if>>경제</option>
														<option value='공통과학' <c:if test="${row.study2_type eq '공통과학' }">selected</c:if>>공통과학</option>
														<option value='공통사회' <c:if test="${row.study2_type eq '공통사회' }">selected</c:if>>공통사회</option>
														<option value='동아시아사' <c:if test="${row.study2_type eq '동아시아사' }">selected</c:if>>동아시아사</option>
														<option value='법과정치' <c:if test="${row.study2_type eq '법과정치' }">selected</c:if>>법과정치</option>
														<option value='사회문화' <c:if test="${row.study2_type eq '사회문화' }">selected</c:if>>사회문화</option>
														<option value='생활과윤리' <c:if test="${row.study2_type eq '생활과윤리' }">selected</c:if>>생활과윤리</option>
														<option value='세계지리' <c:if test="${row.study2_type eq '세계지리' }">selected</c:if>>세계지리</option>
														<option value='세계사' <c:if test="${row.study2_type eq '세계사' }">selected</c:if>>세계사</option>
														<option value='윤리와사상' <c:if test="${row.study2_type eq '윤리와사상' }">selected</c:if>>윤리와사상</option>
														<option value='정치와법' <c:if test="${row.study2_type eq '정치와법' }">selected</c:if>>정치와법</option>
														<option value='한국지리' <c:if test="${row.study2_type eq '한국지리' }">selected</c:if>>한국지리</option>
										      		</select>
									      		</c:when>
									      		<c:when test="${row.study2 eq '과학탐구' }">
									      			<select name="study2_type" id="study2_type">
											      		<option value='공통과학' <c:if test="${row.study2_type eq '공통과학' }">selected</c:if>>공통과학</option>
														<option value='공통사회' <c:if test="${row.study2_type eq '공통사회' }">selected</c:if>>공통사회</option>
														<option value='물리1' <c:if test="${row.study2_type eq '물리1' }">selected</c:if>>물리1</option>
														<option value='물리2' <c:if test="${row.study2_type eq '물리2' }">selected</c:if>>물리2</option>
														<option value='생명과학1' <c:if test="${row.study2_type eq '생명과학1' }">selected</c:if>>생명과학1</option>
														<option value='생명과학2' <c:if test="${row.study2_type eq '생명과학2' }">selected</c:if>>생명과학2</option>
														<option value='지구과학1' <c:if test="${row.study2_type eq '지구과학1' }">selected</c:if>>지구과학1</option>
														<option value='지구과학2' <c:if test="${row.study2_type eq '지구과학2' }">selected</c:if>>지구과학2</option>
														<option value='화학1' <c:if test="${row.study2_type eq '화학1' }">selected</c:if>>화학1</option>
														<option value='화학2' <c:if test="${row.study2_type eq '화학2' }">selected</c:if>>화학2</option>
										      		</select>
									      		</c:when>
									      		<c:otherwise>
									      			<select name="study2_type" id="study2_type">
											      		<option value='공업일반' <c:if test="${row.study2_type eq '공업일반' }">selected</c:if>>공업일반</option>
														<option value='기초제도' <c:if test="${row.study2_type eq '기초제도' }">selected</c:if>>기초제도</option>
														<option value='농업기초기술' <c:if test="${row.study2_type eq '농업기초기술' }">selected</c:if>>농업기초기술</option>
														<option value='농업이해' <c:if test="${row.study2_type eq '농업이해' }">selected</c:if>>농업이해</option>
														<option value='상업경제' <c:if test="${row.study2_type eq '상업경제' }">selected</c:if>>상업경제</option>
														<option value='인간발달' <c:if test="${row.study2_type eq '인간발달' }">selected</c:if>>인간발달</option>
														<option value='해양의이해' <c:if test="${row.study2_type eq '해양의이해' }">selected</c:if>>해양의이해</option>
														<option value='회계원리' <c:if test="${row.study2_type eq '회계원리' }">selected</c:if>>회계원리</option>
										      		</select>
									      		</c:otherwise>
									      	</c:choose>
									      </td>
									      <td>
									      	<input type="text" value="${row.study2_standard }" name="study2_standard"/>
									      </td>
									      <td>
									      	<input type="text" value="${row.study2_percent }" name="study2_percent"/>
									      </td>
									      <td>
									      	<input type="text" value="${row.study2_rate }" name="study2_rate"/>
									      </td>
									    </tr>
									    <tr>
									      <td><input type="text" readonly value="제2외국어" style="border:0px;text-align:center;" name="foreign"/></td>
									      <td>
									      	<select name="foreign_type" id="">
									      		<option value="독일어1" <c:if test="${row.foreign_type eq '독일어1' }">selected</c:if>>독일어1</option>
									      		<option value="러시아어1" <c:if test="${row.foreign_type eq '러시아어1' }">selected</c:if>>러시아어1</option>
									      		<option value="베트남어1" <c:if test="${row.foreign_type eq '베트남어1' }">selected</c:if>>베트남어1</option>
									      		<option value="스페인어1" <c:if test="${row.foreign_type eq '스페인어1' }">selected</c:if>>스페인어1</option>
									      		<option value="아랍어1" <c:if test="${row.foreign_type eq '아랍어1' }">selected</c:if>>아랍어1</option>
									      		<option value="일본어1" <c:if test="${row.foreign_type eq '일본어1' }">selected</c:if>>일본어1</option>
									      		<option value="중국어1" <c:if test="${row.foreign_type eq '중국어1' }">selected</c:if>>중국어1</option>
									      		<option value="프랑스어1" <c:if test="${row.foreign_type eq '프랑스어1' }">selected</c:if>>프랑스어1</option>
									      		<option value="한문1" <c:if test="${row.foreign_type eq '한문1' }">selected</c:if>>한문1</option>
									      	</select>
									      </td>
									      <td>
									      	<input type="text" value="${row.foreign_standard }" name="foreign_standard"/>
									      </td>
									      <td>
									      	<input type="text" value="${row.foreign_percent }" name="foreign_percent"/>
									      </td>
									      <td>
									      	<input type="text" value="${row.foreign_rate }" name="foreign_rate"/>
									      </td>
									    </tr>
									    <tr>
									      <td><input type="text" readonly value="한국사" style="border:0px;text-align:center;" name="history" /></td>
									      <td></td>
									      <td>
									      	<input type="text" disabled/>
									      </td>
									      <td>
									      	<input type="text" disabled/>
									      </td>
									      <td>
									      	<input type="text" value="${row.history_rate }" name="history_rate"/>
									      </td>
									    </tr>
									  </tbody>
									</table>
								</c:forEach>
			    			</c:when>
				    		<c:otherwise>
			    				<table class="table">
								  <thead class="thead-light">
								    <tr>
								      <th colspan="2">과목</th>
								      <th>표준점수</th>
								      <th>백분위</th>
								      <th>등급</th>
								    </tr>
								  </thead>
								  <tbody>
								    <tr>
								      <td><input type="text" readonly value="국어" style="border:0px;text-align:center;" name="natives"/></td>
								      <td></td>
								      <td>
								      	<input type="text" value="" name="native_standard"/>
								      </td>
								      <td>
								      	<input type="text" value="" name="native_percent"/>
								      </td>
								      <td>
								      	<input type="text"  value="" name="native_rate"/>
								      </td>
								    </tr>
								    <tr>
								      <td><input type="text" readonly value="수학" style="border:0px;text-align:center;" name="math"/></td>
								      <td>
								      	<select name="math_type" id="">
								      		<option value="가형">가형</option>
								      		<option value="나형">나형</option>
								      	</select>
								      </td>
								      <td>
								      	<input type="text" value="" name="math_standard"/>
								      </td>
								      <td>
								      	<input type="text" value="" name="math_percent"/>
								      </td>
								      <td>
								      	<input type="text" value="" name="math_rate"/>
								      </td>
								    </tr>
								    <tr>
								      <td><input type="text" readonly value="영어" style="border:0px;text-align:center;" name="eng"/></td>
								      <td></td>
								      <td>
								      	<input type="text" disabled/>
								      </td>
								      <td>
								      	<input type="text" disabled />
								      </td>
								      <td>
								      	<input type="text" name="eng_rate" value=""/>
								      </td>
								    </tr>
								    <tr>
								      <td>
								      	<select name="study1" id="study1" onchange="study1typeselect(this.form, this)">
								      		<option value="사회탐구">사회탐구</option>
								      		<option value="과학탐구">과학탐구</option>
								      		<option value="직업탐구">직업탐구</option>
								      	</select>
								      </td>
								      <td>
								      	<select name="study1_type" id="study1_type">
								      		<option value='경제'>경제</option>
											<option value='공통과학'>공통과학</option>
											<option value='공통사회'>공통사회</option>
											<option value='동아시아사'>동아시아사</option>
											<option value='법과정치'>법과정치</option>
											<option value='사회문화'>사회문화</option>
											<option value='생활과윤리'>생활과윤리</option>
											<option value='세계지리'>세계지리</option>
											<option value='세계사'>세계사</option>
											<option value='윤리와사상'>윤리와사상</option>
											<option value='정치와법'>정치와법</option>
											<option value='한국지리'>한국지리</option>
								      	</select>
								      </td>
								      <td>
								      	<input type="text" value="" name="study1_standard"/>
								      </td>
								      <td>
								      	<input type="text" value="" name="study1_percent"/>
								      </td>
								      <td>
								      	<input type="text" value="" name="study1_rate"/>
								      </td>
								    </tr>
								    <tr>
								      <td>
								      	<select name="study2" id="" onchange="study2typeselect(this.form, this)">
								      		<option value="사회탐구">사회탐구</option>
								      		<option value="과학탐구">과학탐구</option>
								      		<option value="직업탐구">직업탐구</option>
								      	</select>
								      </td>
								      <td>
								      	<select name="study2_type" id="study2_type">
								      		<option value='경제'>경제</option>
											<option value='공통과학'>공통과학</option>
											<option value='공통사회'>공통사회</option>
											<option value='동아시아사'>동아시아사</option>
											<option value='법과정치'>법과정치</option>
											<option value='사회문화'>사회문화</option>
											<option value='생활과윤리'>생활과윤리</option>
											<option value='세계지리'>세계지리</option>
											<option value='세계사'>세계사</option>
											<option value='윤리와사상'>윤리와사상</option>
											<option value='정치와법'>정치와법</option>
											<option value='한국지리'>한국지리</option>
								      	</select>
								      </td>
								      <td>
								      	<input type="text" value="" name="study2_standard"/>
								      </td>
								      <td>
								      	<input type="text" value="" name="study2_percent"/>
								      </td>
								      <td>
								      	<input type="text" value="" name="study2_rate"/>
								      </td>
								    </tr>
								    <tr>
								      <td><input type="text" readonly value="제2외국어" style="border:0px;text-align:center;" name="foreign"/></td>
								      <td>
								      	<select name="foreign_type" id="">
								      		<option value="독일어1">독일어1</option>
								      		<option value="러시아어1">러시아어1</option>
								      		<option value="베트남어1">베트남어1</option>
								      		<option value="스페인어1">스페인어1</option>
								      		<option value="아랍어1">아랍어1</option>
								      		<option value="일본어1">일본어1</option>
								      		<option value="중국어1">중국어1</option>
								      		<option value="프랑스어1">프랑스어1</option>
								      		<option value="한문1">한문1</option>
								      	</select>
								      </td>
								      <td>
								      	<input type="text" value="" name="foreign_standard"/>
								      </td>
								      <td>
								      	<input type="text" value="" name="foreign_percent"/>
								      </td>
								      <td>
								      	<input type="text" value="" name="foreign_rate"/>
								      </td>
								    </tr>
								    <tr>
								      <td><input type="text" readonly value="한국사" style="border:0px;text-align:center;" name="history" /></td>
								      <td></td>
								      <td>
								      	<input type="text" disabled/>
								      </td>
								      <td>
								      	<input type="text" disabled/>
								      </td>
								      <td>
								      	<input type="text" value="" name="history_rate"/>
								      </td>
								    </tr>
								  </tbody>
								</table>
			    			</c:otherwise>
			    		</c:choose>
						<div class="button">
							<button type="submit" class="btn btn-success btn-sm" style="background-color:#783712;border:0px;">저장</button>
						</div>
				    </div> 
			  	</div>
			</div>
		</div>
	</div>
	
	<%@include file="../main/bottom.jsp" %>
	</form><!-- form end -->
</body>
</html>