<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 문자열을 자르기위한 jstl taglib 선언 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="style/interuniv.css" />
<link rel="stylesheet" href="style/leftmenustyle.css" />
<link rel="stylesheet" href="style/basic.css" />
<link rel="stylesheet" href="style/grade.css" />
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

$(document).ready(function() {
	$('#table4').show();
    $('#table3').hide();
    $('#table2').hide();
});

function setDisplay(){
    if($('input:radio[id=rio4]').is(':checked')){
        $('#table4').show();
        $('#table3').hide();
        $('#table2').hide();
    }else if($('input:radio[id=rio3]').is(':checked')){
    	$('#table3').show();
        $('#table4').hide();
        $('#table2').hide();
    }else if($('input:radio[id=rio2]').is(':checked')){
    	$('#table2').show();
        $('#table4').hide();
        $('#table3').hide();
    }
}
</script>
</head>
<body>
	<%@include file="../main/head.jsp" %>
	<div class="topcontents">
		<div class="lefttop">
			<div class="lefttoptext">성적분석</div>
		</div>
		<div class="righttop">
			<div class="righttoptext">수능 성적 분석</div>
		</div>
	</div>
	<div class="contents" style="height: 1500px">
		<div class="leftmenu">
			<nav class="left1" >
				<ul class="navbar-nav1  bg-light ">
					<li class="nav-item1"><a class="nav-link" href="s_grade.do?id=${sessionScope.siteUserInfo }">학생부 성적 분석<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="j_grade.do?id=${sessionScope.siteUserInfo }">수능 성적 분석<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="u_grade.do?id=${sessionScope.siteUserInfo }">대학별 성적 분석<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
				</ul>
			</nav>
		</div>
		<form name="jungFrm" method="post" onsubmit="return jungValidate();" action="<c:url value="./jungAction.do"/>">
		<div class="rightcontents">
			<div class="year" style="text-align: right;">
				모의고사 연도 : 
				<select name="selectyears" id="selectyears" onchange="choiceYears(this.form, this)">
					<option value="2019">2019</option>
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

			    		<input type="hidden" value="<%=id %>" name="id"/>
			    		<input type="hidden" value="<%=years %>" name="years" id="years"/>
			    		<input type="hidden" value="<%=dates %>" name="dates" id="dates"/>
			    		<input type="hidden" value="<%=ex_name %>" name="ex_name" id="ex_name"/>
			    		<input type="hidden" value="<%=year %>" name="year" id="year"/>
			    		
				    </div> 
				    <div>
				    <h3 style="padding-top:20px;"><%=year_int %>학년 <%=dates %> <%=ex_name %></h3>
				    </div>
				    <div class="table_box4_right mgb5" style="text-align: right; font-size: 0.8em;">
							반영 영역 수
								<input type="radio" id="rio4" name="grd_std" value="1"
									checked="checked" onchange="setDisplay()"><label
									class="input_co" for="rio3">4</label>&nbsp;&nbsp; 
								<input type="radio" id="rio3" name="grd_std" value="2"
									onchange="setDisplay()"><label
									class="input_co" for="rio4">3</label>&nbsp;&nbsp;
								<input type="radio" id="rio2" name="grd_std" value="2"
									onchange="setDisplay()"><label
									class="input_co" for="rio4">2</label>&nbsp;&nbsp;

					</div>
				    <table class="list_tbl02" id="table4">
						<caption>수능 성적 조합 테이블</caption>
						<colgroup>
							<col style="width: 30%">
							<col style="width: 25%">
							<col style="width: 25%">
							<col style="width: 20%">
						</colgroup>
						<thead>
							<tr style="text-align: center;">
								<th scope="col">영역조합</th>
								<th scope="col">표준점수</th>
								<th scope="col">백분위</th>
								<th scope="col">등급(평균)</th>
							</tr>
						</thead>
						<c:forEach items="${lists }" var="row">
							<tbody id="sgcTblBd">
								<tr id="row-1">
									<td>국+수(${row.math_type })+영+탐</td>
									<td>
										<c:set var="sum" value="${row.native_standard + row.math_standard + row.study1_standard}" />
										<c:out value="${sum }" />
									</td>
									<td>
										<c:set var="sum" value="${row.native_percent + row.math_percent + row.study1_percent}" />
										<c:out value="${sum }" />
									</td>
									<td>
										<c:set var="sum" value="${row.native_rate + row.math_rate + row.eng_rate + row.study1_rate}" />
										<c:out value="${sum }" />
										(
										<c:set var="avg" value="${(row.native_rate + row.math_rate + row.eng_rate + row.study1_rate)/4}" />
										<fmt:formatNumber value="${avg}" pattern="0.00"/>
										)
									</td>
								</tr>
								<tr id="row-1">
									<td>국+수(${row.math_type })+영+탐(2)</td>
									<td>
										<c:set var="sum" value="${row.native_standard + row.math_standard + row.study2_standard}" />
										<c:out value="${sum }" />
									</td>
									<td>
										<c:set var="sum" value="${row.native_percent + row.math_percent + row.study2_percent}" />
										<c:out value="${sum }" />
									</td>
									<td>
										<c:set var="sum" value="${row.native_rate + row.math_rate + row.eng_rate + row.study2_rate}" />
										<c:out value="${sum }" />
										(
										<c:set var="avg" value="${(row.native_rate + row.math_rate + row.eng_rate + row.study2_rate)/4}" />
										<fmt:formatNumber value="${avg}" pattern="0.00"/>
										)
									</td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
					
					<table class="list_tbl02" id="table3">
						<caption>수능 성적 조합 테이블</caption>
						<colgroup>
							<col style="width: 30%">
							<col style="width: 25%">
							<col style="width: 25%">
							<col style="width: 20%">
						</colgroup>
						<thead>
							<tr style="text-align: center;">
								<th scope="col">영역조합</th>
								<th scope="col">표준점수</th>
								<th scope="col">백분위</th>
								<th scope="col">등급(평균)</th>
							</tr>
						</thead>
						<c:forEach items="${lists }" var="row">
						<tbody id="sgcTblBd">
							<tr id="row-1">
								<td>국+수(${row.math_type })+탐</td>
								<td>
									<c:set var="sum" value="${row.native_standard + row.math_standard + row.study1_standard}" />
										<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.native_percent + row.math_percent + row.study1_percent}" />
										<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.native_rate + row.math_rate + row.study1_rate}" />
										<c:out value="${sum }" />
										(
										<c:set var="avg" value="${(row.native_rate + row.math_rate + row.study1_rate)/3}" />
										<fmt:formatNumber value="${avg}" pattern="0.00"/>
										)
								</td>
							</tr>
							<tr id="row-1">
								<td>국+수(${row.math_type })+탐(2)</td>
								<td>
									<c:set var="sum" value="${row.native_standard + row.math_standard + row.study2_standard}" />
										<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.native_percent + row.math_percent + row.study2_percent}" />
										<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.native_rate + row.math_rate + row.study2_rate}" />
										<c:out value="${sum }" />
										(
										<c:set var="avg" value="${(row.native_rate + row.math_rate + row.study2_rate)/3}" />
										<fmt:formatNumber value="${avg}" pattern="0.00"/>
										)
								</td>
							</tr>
							<tr id="row-1">
								<td>국+수(${row.math_type })+영</td>
								<td>
									<c:set var="sum" value="${row.native_standard + row.math_standard}" />
										<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.native_percent + row.math_percent}" />
										<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.native_rate + row.math_rate + row.eng_rate}" />
										<c:out value="${sum }" />
										(
										<c:set var="avg" value="${(row.native_rate + row.math_rate + row.eng_rate)/3}" />
										<fmt:formatNumber value="${avg}" pattern="0.00"/>
										)
								</td>
							</tr>
							<tr id="row-1">
								<td>국+영+탐</td>
								<td>
									<c:set var="sum" value="${row.native_standard + row.study1_standard}" />
										<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.native_percent + row.study1_percent}" />
										<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.native_rate + row.eng_rate + row.study1_rate}" />
										<c:out value="${sum }" />
										(
										<c:set var="avg" value="${(row.native_rate + row.eng_rate + row.study1_rate)/3}" />
										<fmt:formatNumber value="${avg}" pattern="0.00"/>
										)
								</td>
							</tr>
							<tr id="row-1">
								<td>국+영+탐(2)</td>
								<td>
									<c:set var="sum" value="${row.native_standard + row.study2_standard}" />
										<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.native_percent + row.study2_percent}" />
										<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.native_rate + row.eng_rate + row.study2_rate}" />
										<c:out value="${sum }" />
										(
										<c:set var="avg" value="${(row.native_rate + row.eng_rate + row.study2_rate)/3}" />
										<fmt:formatNumber value="${avg}" pattern="0.00"/>
										)
								</td>
							</tr>
							<tr id="row-1">
								<td>수(${row.math_type })+영+탐</td>
								<td>
									<c:set var="sum" value="${row.math_standard + row.study1_standard}" />
									<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.math_percent + row.study1_percent}" />
									<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.math_rate + row.eng_rate + row.study1_rate}" />
									<c:out value="${sum }" />
									(
									<c:set var="avg" value="${(row.math_rate + row.eng_rate + row.study1_rate)/3}" />
									<fmt:formatNumber value="${avg}" pattern="0.00"/>
									)
								</td>
							</tr>
							<tr id="row-1">
								<td>수(${row.math_type })+영+탐(2)</td>
								<td>
									<c:set var="sum" value="${row.math_standard + row.study2_standard}" />
									<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.math_percent + row.study2_percent}" />
									<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.math_rate + row.eng_rate + row.study2_rate}" />
									<c:out value="${sum }" />
									(
									<c:set var="avg" value="${(row.math_rate + row.eng_rate + row.study2_rate)/3}" />
									<fmt:formatNumber value="${avg}" pattern="0.00"/>
									)
								</td>
							</tr>
						</tbody>
						</c:forEach>
					</table>
					
					<table class="list_tbl02" id="table2">
						<caption>수능 성적 조합 테이블</caption>
						<colgroup>
							<col style="width: 30%">
							<col style="width: 25%">
							<col style="width: 25%">
							<col style="width: 20%">
						</colgroup>
						<thead>
							<tr style="text-align: center;">
								<th scope="col">영역조합</th>
								<th scope="col">표준점수</th>
								<th scope="col">백분위</th>
								<th scope="col">등급(평균)</th>
							</tr>
						</thead>
						<c:forEach items="${lists }" var="row">
						<tbody id="sgcTblBd">
							<tr id="row-1">
								<td>국+수(${row.math_type })</td>
								<td>
									<c:set var="sum" value="${row.native_standard + row.math_standard}" />
										<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.native_percent + row.math_percent}" />
										<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.native_rate + row.math_rate}" />
										<c:out value="${sum }" />
										(
										<c:set var="avg" value="${(row.native_rate + row.math_rate)/2}" />
										<fmt:formatNumber value="${avg}" pattern="0.00"/>
										)
								</td>
							</tr>
							<tr id="row-1">
								<td>국+탐</td>
								<td>
									<c:set var="sum" value="${row.native_standard + row.study1_standard}" />
										<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.native_percent + row.study1_percent}" />
										<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.native_rate + row.study1_rate}" />
										<c:out value="${sum }" />
										(
										<c:set var="avg" value="${(row.native_rate + row.study1_rate)/2}" />
										<fmt:formatNumber value="${avg}" pattern="0.00"/>
										)
								</td>
							</tr>
							<tr id="row-1">
								<td>국+탐(2)</td>
								<td>
									<c:set var="sum" value="${row.native_standard + row.study2_standard}" />
										<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.native_percent + row.study2_percent}" />
										<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.native_rate + row.study2_rate}" />
										<c:out value="${sum }" />
										(
										<c:set var="avg" value="${(row.native_rate + row.study2_rate)/2}" />
										<fmt:formatNumber value="${avg}" pattern="0.00"/>
										)
								</td>
							</tr>
							<tr id="row-1">
								<td>수(${row.math_type })+탐</td>
								<td>
									<c:set var="sum" value="${row.math_standard + row.study1_standard}" />
									<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.math_percent + row.study1_percent}" />
									<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.math_rate + row.study1_rate}" />
									<c:out value="${sum }" />
									(
									<c:set var="avg" value="${(row.math_rate + row.study1_rate)/2}" />
									<fmt:formatNumber value="${avg}" pattern="0.00"/>
									)
								</td>
							</tr>
							<tr id="row-1">
								<td>수(${row.math_type })+탐(2)</td>
								<td>
									<c:set var="sum" value="${row.math_standard + row.study2_standard}" />
									<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.math_percent + row.study2_percent}" />
									<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.math_rate + row.study2_rate}" />
									<c:out value="${sum }" />
									(
									<c:set var="avg" value="${(row.math_rate + row.study2_rate)/2}" />
									<fmt:formatNumber value="${avg}" pattern="0.00"/>
									)
								</td>
							</tr>
							<tr id="row-1">
								<td>국+영</td>
								<td>
									<c:set var="sum" value="${row.native_standard}" />
										<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.native_percent}" />
										<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.native_rate + row.eng_rate}" />
										<c:out value="${sum }" />
										(
										<c:set var="avg" value="${(row.native_rate + row.eng_rate)/2}" />
										<fmt:formatNumber value="${avg}" pattern="0.00"/>
										)
								</td>
							</tr>
							<tr id="row-1">
								<td>수(${row.math_type })+영</td>
								<td>
									<c:set var="sum" value="${row.math_standard}" />
									<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.math_percent}" />
									<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.math_rate + row.eng_rate}" />
									<c:out value="${sum }" />
									(
									<c:set var="avg" value="${(row.math_rate + row.eng_rate)/2}" />
									<fmt:formatNumber value="${avg}" pattern="0.00"/>
									)
								</td>
							</tr>
							<tr id="row-1">
								<td>영+탐</td>
								<td>
									<c:set var="sum" value="${row.study1_standard}" />
									<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.study1_percent}" />
									<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.eng_rate + row.study1_rate}" />
									<c:out value="${sum }" />
									(
									<c:set var="avg" value="${(row.eng_rate + row.study1_rate)/2}" />
									<fmt:formatNumber value="${avg}" pattern="0.00"/>
									)
								</td>
							</tr>
							<tr id="row-1">
								<td>영+탐(2)</td>
								<td>
									<c:set var="sum" value="${row.study2_standard}" />
									<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.study2_percent}" />
									<c:out value="${sum }" />
								</td>
								<td>
									<c:set var="sum" value="${row.eng_rate + row.study2_rate}" />
									<c:out value="${sum }" />
									(
									<c:set var="avg" value="${(row.eng_rate + row.study2_rate)/2}" />
									<fmt:formatNumber value="${avg}" pattern="0.00"/>
									)
								</td>
							</tr>
						</tbody>
						</c:forEach>
					</table>
				    
			  	</div>
			</div>
		</div>
		</form>
	</div>
	<%@include file="../main/bottom.jsp" %>
</body>
</html>