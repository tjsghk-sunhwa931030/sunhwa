<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	$(document).ready(function() {
		$("#scoreDetailView_table11").hide();
		$("#scoreDetailView_table12").hide();
		$("#scoreDetailView_table21").hide();
		$("#scoreDetailView_table22").hide();
		$("#scoreDetailView_table31").hide();
		$("#scoreDetailView_table32").hide();

		$("#grade_table2").hide();
		$('#button11').click(function() {
			$("#scoreDetailView_table11").toggle();
			$("#scoreDetailView_table12").hide();
			$("#scoreDetailView_table21").hide();
			$("#scoreDetailView_table22").hide();
			$("#scoreDetailView_table31").hide();
			$("#scoreDetailView_table32").hide();
		});
		$('#button12').click(function() {
			$("#scoreDetailView_table12").toggle();
			$("#scoreDetailView_table11").hide();
			$("#scoreDetailView_table21").hide();
			$("#scoreDetailView_table22").hide();
			$("#scoreDetailView_table31").hide();
			$("#scoreDetailView_table32").hide();
		});
		$('#button21').click(function() {
			$("#scoreDetailView_table21").toggle();
			$("#scoreDetailView_table11").hide();
			$("#scoreDetailView_table12").hide();
			$("#scoreDetailView_table22").hide();
			$("#scoreDetailView_table31").hide();
			$("#scoreDetailView_table32").hide();
		});
		$('#button22').click(function() {
			$("#scoreDetailView_table22").toggle();
			$("#scoreDetailView_table11").hide();
			$("#scoreDetailView_table12").hide();
			$("#scoreDetailView_table21").hide();
			$("#scoreDetailView_table31").hide();
			$("#scoreDetailView_table32").hide();
		});
		$('#button31').click(function() {
			$("#scoreDetailView_table31").toggle();
			$("#scoreDetailView_table11").hide();
			$("#scoreDetailView_table12").hide();
			$("#scoreDetailView_table21").hide();
			$("#scoreDetailView_table22").hide();
			$("#scoreDetailView_table32").hide();
		});
		$('#button32').click(function() {
			$("#scoreDetailView_table32").toggle();
			$("#scoreDetailView_table11").hide();
			$("#scoreDetailView_table12").hide();
			$("#scoreDetailView_table21").hide();
			$("#scoreDetailView_table22").hide();
			$("#scoreDetailView_table31").hide();
		});
	});
	function setDisplay(){
	    if($('input:radio[id=rio3]').is(':checked')){
	        $('#grade_table').show();
	        $('#grade_table2').hide();
	    }else{
	        $('#grade_table2').show();
	        $('#grade_table').hide();
	    }
	}
</script>
<script>
	google.charts.load('current', {packages: ['corechart']});
	google.charts.setOnLoadCallback(drawMultSeries);
	google.charts.setOnLoadCallback(drawMultSeries2);
	
	function drawMultSeries() {
	      var data = google.visualization.arrayToDataTable([
	        ['학년, 학기', '국어', '영어', '수학', '사회', '과학'],
	        	['1학년 1학기', ${rate_korea11}, ${rate_english11}, ${rate_math11}, ${rate_society11}, ${rate_science11}],
	        	['1학년 2학기', ${rate_korea12}, ${rate_english12}, ${rate_math12}, ${rate_society12}, ${rate_science12}],
	        	['2학년 1학기', ${rate_korea21}, ${rate_english21}, ${rate_math21}, ${rate_society21}, ${rate_science21}],
	        	['2학년 2학기', ${rate_korea22}, ${rate_english22}, ${rate_math22}, ${rate_society22}, ${rate_science22}],
	        	['3학년 1학기', ${rate_korea31}, ${rate_english31}, ${rate_math31}, ${rate_society31}, ${rate_science31}],
	        	['3학년 2학기', ${rate_korea32}, ${rate_english32}, ${rate_math32}, ${rate_society32}, ${rate_science32}]
	       ]); 
	 
	      var options = {
	        title: '학년, 학기별 국영수사과 비교',
	        chartArea: {width: '50%'},
	        hAxis: {
	          title: '학년, 학기',
	          minValue: 0
	        },
	        vAxis: {
	          title: '등급'
	        }
	      };
	 
	      var chart = new google.visualization.LineChart(document.getElementById('grade_graph'));
	      chart.draw(data, options);
	}
	function drawMultSeries2() {
	      var data = google.visualization.arrayToDataTable([
	        ['과목', '등급', { role: 'style' }],
	        	['국어', ${rate_korea}, 'blue'],
	        	['수학', ${rate_math}, 'red'],
	        	['영어', ${rate_english}, 'gold'],
	        	['사회', ${rate_society}, 'green'],
	        	['과학', ${rate_science}, 'purple']
	       ]); 
	 
	      var options = {
	        title: '과목별 등급 비교',
	        legend: 'none',
	        chartArea: {width: '50%'},
	        hAxis: {
	          title: '과목',
	          minValue: 0
	        },
	        vAxis: {
	          title: '등급'
	        }
	      };
	 
	      var chart = new google.visualization.ColumnChart(document.getElementById('grade_graph2'));
	      chart.draw(data, options);
	    }
</script>
</head>
<body>
	<%@include file="../main/head.jsp"%>
	<div class="topcontents">
		<div class="lefttop">
			<div class="lefttoptext">성적분석</div>
		</div>
		<div class="righttop">
			<div class="righttoptext">학생부 성적 분석 - 주요교과 분석</div>
		</div>
	</div>
	<div class="contents">
		<div class="leftmenu">
			<nav class="left1">
				<ul class="navbar-nav1  bg-light ">
					<li class="nav-item1"><a class="nav-link" href="s_grade.do?id=${sessionScope.siteUserInfo }">학생부
							성적 분석<i class='fas fa-chevron-circle-right'
							style='margin-top: 4px;'></i>
					</a></li>
					<li class="nav-item1"><a class="nav-link" href="j_grade.do?id=${sessionScope.siteUserInfo }">수능
							성적 분석<i class='fas fa-chevron-circle-right'
							style='margin-top: 4px;'></i>
					</a></li>
					<li class="nav-item1"><a class="nav-link" href="u_grade.do?id=${sessionScope.siteUserInfo }">대학별
							성적 분석<i class='fas fa-chevron-circle-right'
							style='margin-top: 4px;'></i>
					</a></li>
				</ul>
			</nav>
		</div>
		<!-- leftmenu -->
		<div class="rightcontents">
			<div class="con_box">
				<div class="grade_blank mgb20">
					<p>	
						<%
							String id=request.getParameter("id");
						%>
						<span class="atxt2"><%=id %></span>님 반갑습니다. 학생부 성적분석을 위해서는 <a
							href="sugrade.do?id=${sessionScope.siteUserInfo }" class="btn_compare_off" title="학생부 성적입력">수능 성적입력</a>이 필요합니다.
					</p>
				</div>
				<!-- 학생부성적 -->
				<div id="stdView">

					<p class="search_box_text  mgt25">
						<img src="../images/ico_goal_univ.png" alt=""> 입력이 안되거나 과목수가
						충분하지 않은 경우 다른 성적을 참조하게 되므로 정확도가 떨어집니다
					</p>
					<!-- 학생부성적 -->
					<div id="">
						<table class="list_tbl02">
							<caption>학생부성적</caption>
							<colgroup>
								<col style="width: 10%">
								<col style="width: 10%">
								<col style="width: 10%">
								<col style="width: 10%">
								<col style="width: 10%">
								<col style="width: 10%">
								<col style="width: 20%">
								<col style="width: 20%">
							</colgroup>
							<thead>
								<tr>
									<th colspan="2" scope="col" style="text-align: center;">1학년</th>
									<th colspan="2" scope="col" style="text-align: center;">2학년</th>
									<th colspan="2" scope="col" style="text-align: center;">3학년</th>
									<th colspan="2" scope="col" style="text-align: center;">비교과</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<p class="p_text">1학기</p>
										<p>
											<a href="javascript:gotoScoreDetail('11')"
												class="btn_compare_off" id="button11" title="보기">보기</a>
										</p> <!-- <button type="button" class="btn btn-light" data-toggle="collapse" data-target="#result_table">보기</button> -->
									</td>
									<td>
										<p class="p_text">2학기</p>
										<p>
											<a href="javascript:gotoScoreDetail('12')"
												class="btn_compare_off" id="button12" title="보기">보기</a>
										</p>
									</td>
									<td>
										<p class="p_text">1학기</p>
										<p>
											<a href="javascript:gotoScoreDetail('21')"
												class="btn_compare_off" id="button21" title="보기">보기</a>
										</p>
									</td>
									<td>
										<p class="p_text">2학기</p>
										<p>
											<a href="javascript:gotoScoreDetail('22')"
												class="btn_compare_off" id="button22" title="보기">보기</a>
										</p>
									</td>
									<td>
										<p class="p_text">1학기</p>
										<p>
											<a href="javascript:gotoScoreDetail('31')"
												class="btn_compare_off" id="button31" title="보기">보기</a>
										</p>
									</td>
									<td>
										<p class="p_text">2학기</p>
										<p>
											<a href="javascript:gotoScoreDetail('32')"
												class="btn_compare_off" id="button32" title="보기">보기</a>
										</p>
									</td>
									<td colspan="2"><a
										href="attenvolun.do?id=${sessionScope.siteUserInfo }" class="btn_ing"
										title="보기">입력</a></td>

								</tr>
							</tbody>
						</table>
					</div>
					<!-- //학생부성적 -->
					<div id="scoreDetailView" class="table_box4 mgt25"></div>
					<table class="list_tbl02" id="scoreDetailView_table11">
						<caption>학생부성적 테이블</caption>
						<colgroup>
							<col style="width: 6%">
							<col style="width: 17%">
							<col style="width: 17%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 10%">
							<col style="width: *%">
						</colgroup>
						<thead>
							<tr style="text-align: center;">
								<th scope="col">번호</th>
								<th scope="col">교과</th>
								<th scope="col">과목</th>
								<th scope="col">단위<br>수 <span class="f_pit"> *</span></th>
								<th scope="col">석차<br>등급 <span class="f_pit"> *</span></th>
								<th scope="col">원점<br>수
								</th>
								<th scope="col">과목<br>평균
								</th>
								<th scope="col">표준<br>편차
								</th>
								<th scope="col">수강<br>자수
								</th>
								<th scope="col">관리</th>
							</tr>
						</thead>
						<tbody id="sgcTblBd">
							<c:forEach items="${lists11 }" var="row" varStatus="status">
							<tr id="row-1">
								<td>${status.count}</td>
								<td id="course-c-1"><input type="hidden" id="course-1"
									name="course-1" value="C0001">${row.subject }</td>
								<td id="sbject-c-1"><input type="hidden" id="sbject-1"
									name="sbject-1" value="S0586">${row.subject_type }</td>
								<td id="unit-c-1"><input type="hidden" id="unit-1"
									name="unit-1" value="4">${row.counts }</td>
								<td id="grde-c-1"><input type="hidden" id="grde-1"
									name="grde-1" value="1">${row.rate }</td>
								<td id="org-c-1"><input type="hidden" id="org-1"
									name="org-1" value="92">${row.jumsu }</td>
								<td id="avg-c-1"><input type="hidden" id="avg-1"
									name="avg-1" value="63">${row.avg }</td>
								<td id="std-c-1"><input type="hidden" id="std-1"
									name="std-1" value="16">${row.deviation }</td>
								<td id="cnt-c-1"><input type="hidden" id="cnt-1"
									name="cnt-1" value="100">${row.totalman }</td>
								<td><button type="button" class="btnc_click04_1"
										onclick="location.href='sugrade.do?year=${row.year}&semester=${row.semester}&id=${row.id}'">수정</button>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<table class="list_tbl02" id="scoreDetailView_table12">
						<caption>학생부성적 테이블</caption>
						<colgroup>
							<col style="width: 6%">
							<col style="width: 17%">
							<col style="width: 17%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 10%">
							<col style="width: *%">
						</colgroup>
						<thead>
							<tr style="text-align: center;">
								<th scope="col">번호</th>
								<th scope="col">교과</th>
								<th scope="col">과목</th>
								<th scope="col">단위<br>수 <span class="f_pit"> *</span></th>
								<th scope="col">석차<br>등급 <span class="f_pit"> *</span></th>
								<th scope="col">원점<br>수
								</th>
								<th scope="col">과목<br>평균
								</th>
								<th scope="col">표준<br>편차
								</th>
								<th scope="col">수강<br>자수
								</th>
								<th scope="col">관리</th>
							</tr>
						</thead>
						<tbody id="sgcTblBd">
							<c:forEach items="${lists12 }" var="row" varStatus="status">
							<tr id="row-1">
								<td>${status.count}</td>
								<td id="course-c-1"><input type="hidden" id="course-1"
									name="course-1" value="C0001">${row.subject }</td>
								<td id="sbject-c-1"><input type="hidden" id="sbject-1"
									name="sbject-1" value="S0586">${row.subject_type }</td>
								<td id="unit-c-1"><input type="hidden" id="unit-1"
									name="unit-1" value="4">${row.counts }</td>
								<td id="grde-c-1"><input type="hidden" id="grde-1"
									name="grde-1" value="1">${row.rate }</td>
								<td id="org-c-1"><input type="hidden" id="org-1"
									name="org-1" value="92">${row.jumsu }</td>
								<td id="avg-c-1"><input type="hidden" id="avg-1"
									name="avg-1" value="63">${row.avg }</td>
								<td id="std-c-1"><input type="hidden" id="std-1"
									name="std-1" value="16">${row.deviation }</td>
								<td id="cnt-c-1"><input type="hidden" id="cnt-1"
									name="cnt-1" value="100">${row.totalman }</td>
								<td><button type="button" class="btnc_click04_1"
										onclick="location.href='sugrade.do?year=${row.year}&semester=${row.semester}&id=${row.id}'">수정</button>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<table class="list_tbl02" id="scoreDetailView_table21">
						<caption>학생부성적 테이블</caption>
						<colgroup>
							<col style="width: 6%">
							<col style="width: 17%">
							<col style="width: 17%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 10%">
							<col style="width: *%">
						</colgroup>
						<thead>
							<tr style="text-align: center;">
								<th scope="col">번호</th>
								<th scope="col">교과</th>
								<th scope="col">과목</th>
								<th scope="col">단위<br>수 <span class="f_pit"> *</span></th>
								<th scope="col">석차<br>등급 <span class="f_pit"> *</span></th>
								<th scope="col">원점<br>수
								</th>
								<th scope="col">과목<br>평균
								</th>
								<th scope="col">표준<br>편차
								</th>
								<th scope="col">수강<br>자수
								</th>
								<th scope="col">관리</th>
							</tr>
						</thead>
						<tbody id="sgcTblBd">
							<c:forEach items="${lists21 }" var="row" varStatus="status">
							<tr id="row-1">
								<td>${status.count}</td>
								<td id="course-c-1"><input type="hidden" id="course-1"
									name="course-1" value="C0001">${row.subject }</td>
								<td id="sbject-c-1"><input type="hidden" id="sbject-1"
									name="sbject-1" value="S0586">${row.subject_type }</td>
								<td id="unit-c-1"><input type="hidden" id="unit-1"
									name="unit-1" value="4">${row.counts }</td>
								<td id="grde-c-1"><input type="hidden" id="grde-1"
									name="grde-1" value="1">${row.rate }</td>
								<td id="org-c-1"><input type="hidden" id="org-1"
									name="org-1" value="92">${row.jumsu }</td>
								<td id="avg-c-1"><input type="hidden" id="avg-1"
									name="avg-1" value="63">${row.avg }</td>
								<td id="std-c-1"><input type="hidden" id="std-1"
									name="std-1" value="16">${row.deviation }</td>
								<td id="cnt-c-1"><input type="hidden" id="cnt-1"
									name="cnt-1" value="100">${row.totalman }</td>
								<td><button type="button" class="btnc_click04_1"
										onclick="location.href='sugrade.do?year=${row.year}&semester=${row.semester}&id=${row.id}'">수정</button>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<table class="list_tbl02" id="scoreDetailView_table22">
						<caption>학생부성적 테이블</caption>
						<colgroup>
							<col style="width: 6%">
							<col style="width: 17%">
							<col style="width: 17%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 10%">
							<col style="width: *%">
						</colgroup>
						<thead>
							<tr style="text-align: center;">
								<th scope="col">번호</th>
								<th scope="col">교과</th>
								<th scope="col">과목</th>
								<th scope="col">단위<br>수 <span class="f_pit"> *</span></th>
								<th scope="col">석차<br>등급 <span class="f_pit"> *</span></th>
								<th scope="col">원점<br>수
								</th>
								<th scope="col">과목<br>평균
								</th>
								<th scope="col">표준<br>편차
								</th>
								<th scope="col">수강<br>자수
								</th>
								<th scope="col">관리</th>
							</tr>
						</thead>
						<tbody id="sgcTblBd">
							<c:forEach items="${lists22 }" var="row" varStatus="status">
							<tr id="row-1">
								<td>${status.count}</td>
								<td id="course-c-1"><input type="hidden" id="course-1"
									name="course-1" value="C0001">${row.subject }</td>
								<td id="sbject-c-1"><input type="hidden" id="sbject-1"
									name="sbject-1" value="S0586">${row.subject_type }</td>
								<td id="unit-c-1"><input type="hidden" id="unit-1"
									name="unit-1" value="4">${row.counts }</td>
								<td id="grde-c-1"><input type="hidden" id="grde-1"
									name="grde-1" value="1">${row.rate }</td>
								<td id="org-c-1"><input type="hidden" id="org-1"
									name="org-1" value="92">${row.jumsu }</td>
								<td id="avg-c-1"><input type="hidden" id="avg-1"
									name="avg-1" value="63">${row.avg }</td>
								<td id="std-c-1"><input type="hidden" id="std-1"
									name="std-1" value="16">${row.deviation }</td>
								<td id="cnt-c-1"><input type="hidden" id="cnt-1"
									name="cnt-1" value="100">${row.totalman }</td>
								<td><button type="button" class="btnc_click04_1"
										onclick="location.href='sugrade.do?year=${row.year}&semester=${row.semester}&id=${row.id}'">수정</button>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<table class="list_tbl02" id="scoreDetailView_table31">
						<caption>학생부성적 테이블</caption>
						<colgroup>
							<col style="width: 6%">
							<col style="width: 17%">
							<col style="width: 17%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 10%">
							<col style="width: *%">
						</colgroup>
						<thead>
							<tr style="text-align: center;">
								<th scope="col">번호</th>
								<th scope="col">교과</th>
								<th scope="col">과목</th>
								<th scope="col">단위<br>수 <span class="f_pit"> *</span></th>
								<th scope="col">석차<br>등급 <span class="f_pit"> *</span></th>
								<th scope="col">원점<br>수
								</th>
								<th scope="col">과목<br>평균
								</th>
								<th scope="col">표준<br>편차
								</th>
								<th scope="col">수강<br>자수
								</th>
								<th scope="col">관리</th>
							</tr>
						</thead>
						<tbody id="sgcTblBd">
							<c:forEach items="${lists31 }" var="row" varStatus="status">
							<tr id="row-1">
								<td>${status.count}</td>
								<td id="course-c-1"><input type="hidden" id="course-1"
									name="course-1" value="C0001">${row.subject }</td>
								<td id="sbject-c-1"><input type="hidden" id="sbject-1"
									name="sbject-1" value="S0586">${row.subject_type }</td>
								<td id="unit-c-1"><input type="hidden" id="unit-1"
									name="unit-1" value="4">${row.counts }</td>
								<td id="grde-c-1"><input type="hidden" id="grde-1"
									name="grde-1" value="1">${row.rate }</td>
								<td id="org-c-1"><input type="hidden" id="org-1"
									name="org-1" value="92">${row.jumsu }</td>
								<td id="avg-c-1"><input type="hidden" id="avg-1"
									name="avg-1" value="63">${row.avg }</td>
								<td id="std-c-1"><input type="hidden" id="std-1"
									name="std-1" value="16">${row.deviation }</td>
								<td id="cnt-c-1"><input type="hidden" id="cnt-1"
									name="cnt-1" value="100">${row.totalman }</td>
								<td><button type="button" class="btnc_click04_1"
										onclick="location.href='sugrade.do?year=${row.year}&semester=${row.semester}&id=${row.id}'">수정</button>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<table class="list_tbl02" id="scoreDetailView_table32">
						<caption>학생부성적 테이블</caption>
						<colgroup>
							<col style="width: 6%">
							<col style="width: 17%">
							<col style="width: 17%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 7%">
							<col style="width: 10%">
							<col style="width: *%">
						</colgroup>
						<thead>
							<tr style="text-align: center;">
								<th scope="col">번호</th>
								<th scope="col">교과</th>
								<th scope="col">과목</th>
								<th scope="col">단위<br>수 <span class="f_pit"> *</span></th>
								<th scope="col">석차<br>등급 <span class="f_pit"> *</span></th>
								<th scope="col">원점<br>수
								</th>
								<th scope="col">과목<br>평균
								</th>
								<th scope="col">표준<br>편차
								</th>
								<th scope="col">수강<br>자수
								</th>
								<th scope="col">관리</th>
							</tr>
						</thead>
						<tbody id="sgcTblBd">
							<c:forEach items="${lists32 }" var="row" varStatus="status">
							<tr id="row-1">
								<td>${status.count}</td>
								<td id="course-c-1"><input type="hidden" id="course-1"
									name="course-1" value="C0001">${row.subject }</td>
								<td id="sbject-c-1"><input type="hidden" id="sbject-1"
									name="sbject-1" value="S0586">${row.subject_type }</td>
								<td id="unit-c-1"><input type="hidden" id="unit-1"
									name="unit-1" value="4">${row.counts }</td>
								<td id="grde-c-1"><input type="hidden" id="grde-1"
									name="grde-1" value="1">${row.rate }</td>
								<td id="org-c-1"><input type="hidden" id="org-1"
									name="org-1" value="92">${row.jumsu }</td>
								<td id="avg-c-1"><input type="hidden" id="avg-1"
									name="avg-1" value="63">${row.avg }</td>
								<td id="std-c-1"><input type="hidden" id="std-1"
									name="std-1" value="16">${row.deviation }</td>
								<td id="cnt-c-1"><input type="hidden" id="cnt-1"
									name="cnt-1" value="100">${row.totalman }</td>
								<td><button type="button" class="btnc_click04_1"
										onclick="location.href='sugrade.do?year=${row.year}&semester=${row.semester}&id=${row.id}'">수정</button>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					
				</div>
				<!-- //학생부성적 -->

				<!--//탭영역-->

				<div id="sample_div" class="mgt25" style="display: none;">
					<img src="/images/sample1.png" alt="샘플">
				</div>
				<div id="result_div" style="">
					<!-- 결과리스트 -->
					<div class="table_box4 mgt15" id="result_table" class="">
					<nav class="navbar navbar-expand-sm bg-light navbar-light">
					<!-- Links -->
					  <ul class="navbar-nav">
					    <li class="nav-item">
					      <a class="nav-link" href="s_grade.do?id=${sessionScope.siteUserInfo }">주요교과 분석</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link" href="s_grade2.do?id=${sessionScope.siteUserInfo }">교과조합 분석</a>
					    </li>
					  </ul>
					</nav>
						<!-- <p><a href="javascript:gotoScoreDetail('12')"
							class="btn_compare_off" title="보기">주요교과 분석</a>
						<a href="javascript:gotoScoreDetail('12')"
							class="btn_compare_off" title="보기">교과조합 분석</a></p> -->
						<div class="table_box4_right mgb5">
							<label class="tts" for="sel_rf_relm_co">등급선택</label>
								<input type="radio" id="rio3" name="grd_std" value="1"
									checked="checked" onchange="setDisplay()"><label
									class="input_co" for="rio3">석차등급</label>&nbsp;&nbsp; 
								<input type="radio" id="rio4" name="grd_std" value="2"
									onchange="setDisplay()"><label
									class="input_co" for="rio4">표준점수</label>&nbsp;&nbsp;

						</div>
						<!-- 석차등급 성적 테이블 -->
						<div id="grade_table">
						<table class="table_row2 align_c let_sp" style="width: 100%">
							<caption>학생부 성적 결과 테이블</caption>
							<colgroup>
								<col style="width: 12%">
								<col style="width: 12%">
								<col style="width: 15%">
								<col style="width: 15%">
								<col style="width: 15%">
								<col style="width: 15%">
								<col style="width: *%">
							</colgroup>
							<thead>
								<tr>
									<th colspan="2" scope="col">구분</th>
									<th scope="col">국어</th>
									<th scope="col">수학</th>
									<th scope="col">영어</th>
									<th scope="col">사회</th>
									<th scope="col">과학</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td rowspan="2">1학년</td>
									<td>1학기</td>
										<td>${rate_korea11 }</td>
										<td>${rate_math11 }</td>
										<td>${rate_english11 }</td>
										<td>${rate_society11 }</td>
										<td>${rate_science11 }</td>
								</tr>
								<tr>
									<td>2학기</td>
										<td>${rate_korea12 }</td>
										<td>${rate_math12 }</td>
										<td>${rate_english12 }</td>
										<td>${rate_society12 }</td>
										<td>${rate_science12 }</td>
								</tr>
								<tr>
									<td colspan="2">평균</td>
									<td id="krlgg02">
										<c:set var="korea_avg" value="${(rate_korea11+rate_korea12)/2 }" />
											<fmt:formatNumber value="${korea_avg}" pattern="0.00"/>
									</td>
									<td id="mthmc02">
										<c:set var="math_avg" value="${(rate_math11+rate_math12)/2 }" />
											<fmt:formatNumber value="${math_avg}" pattern="0.00"/>
									</td>
									<td id="engl02">
										<c:set var="eng_avg" value="${(rate_english11+rate_english12)/2 }" />
											<fmt:formatNumber value="${eng_avg}" pattern="0.00"/>
									</td>
									<td id="socty02">
										<c:set var="soc_avg" value="${(rate_society11+rate_society12)/2 }" />
											<fmt:formatNumber value="${soc_avg}" pattern="0.00"/>
									</td>
									<td id="scnce02">
										<c:set var="sci_avg" value="${(rate_science11+rate_science12)/2 }" />
											<fmt:formatNumber value="${sci_avg}" pattern="0.00"/>
									</td>
								</tr>
								<tr>
									<td rowspan="2">2학년</td>
									<td>1학기</td>
										<td>${rate_korea21 }</td>
										<td>${rate_math21 }</td>
										<td>${rate_english21 }</td>
										<td>${rate_society21 }</td>
										<td>${rate_science21 }</td>
								</tr>
								<tr>
									<td>2학기</td>
										<td>${rate_korea22 }</td>
										<td>${rate_math22 }</td>
										<td>${rate_english22 }</td>
										<td>${rate_society22 }</td>
										<td>${rate_science22 }</td>
								</tr>
								<tr>
									<td colspan="2">평균</td>
									<td id="krlgg02">
										<c:set var="korea_avg" value="${(rate_korea21+rate_korea22)/2 }" />
											<fmt:formatNumber value="${korea_avg}" pattern="0.00"/>
									</td>
									<td id="mthmc02">
										<c:set var="math_avg" value="${(rate_math21+rate_math22)/2 }" />
											<fmt:formatNumber value="${math_avg}" pattern="0.00"/>
									</td>
									<td id="engl02">
										<c:set var="eng_avg" value="${(rate_english21+rate_english22)/2 }" />
											<fmt:formatNumber value="${eng_avg}" pattern="0.00"/>
									</td>
									<td id="socty02">
										<c:set var="soc_avg" value="${(rate_society21+rate_society22)/2 }" />
											<fmt:formatNumber value="${soc_avg}" pattern="0.00"/>
									</td>
									<td id="scnce02">
										<c:set var="sci_avg" value="${(rate_science21+rate_science22)/2 }" />
											<fmt:formatNumber value="${sci_avg}" pattern="0.00"/>
									</td>
								</tr>
								<tr>
									<td rowspan="2">3학년</td>
									<td>1학기</td>
										<td>${rate_korea31 }</td>
										<td>${rate_math31 }</td>
										<td>${rate_english31 }</td>
										<td>${rate_society31 }</td>
										<td>${rate_science31 }</td>
								</tr>
								<tr>
									<td>2학기</td>
										<td>${rate_korea32 }</td>
										<td>${rate_math32 }</td>
										<td>${rate_english32 }</td>
										<td>${rate_society32 }</td>
										<td>${rate_science32 }</td>
								</tr>
								<tr>
									<td colspan="2">평균</td>
									<td id="krlgg02">
										<c:set var="korea_avg" value="${(rate_korea31+rate_korea32)/2 }" />
											<fmt:formatNumber value="${korea_avg}" pattern="0.00"/>
									</td>
									<td id="mthmc02">
										<c:set var="math_avg" value="${(rate_math31+rate_math32)/2 }" />
											<fmt:formatNumber value="${math_avg}" pattern="0.00"/>
									</td>
									<td id="engl02">
										<c:set var="eng_avg" value="${(rate_english31+rate_english32)/2 }" />
											<fmt:formatNumber value="${eng_avg}" pattern="0.00"/>
									</td>
									<td id="socty02">
										<c:set var="soc_avg" value="${(rate_society31+rate_society32)/2 }" />
											<fmt:formatNumber value="${soc_avg}" pattern="0.00"/>
									</td>
									<td id="scnce02">
										<c:set var="sci_avg" value="${(rate_science31+rate_science32)/2 }" />
											<fmt:formatNumber value="${sci_avg}" pattern="0.00"/>
									</td>
								</tr>
								
								<tr class="bg_c02">
									<td rowspan="3" colspan="2">전학년</td>
									<td id="krlggAll">
										<c:set var="korea_avg" value="${(rate_korea11+rate_korea12+rate_korea21+rate_korea22+rate_korea31+rate_korea32)/6 }" />
											<fmt:formatNumber value="${korea_avg}" pattern="0.00"/>
									</td>
									<td id="mthmcAll">
										<c:set var="math_avg" value="${(rate_math11+rate_math12+rate_math21+rate_math22+rate_math31+rate_math32)/6 }" />
											<fmt:formatNumber value="${math_avg}" pattern="0.00"/>
									</td>
									<td id="englAll">
										<c:set var="eng_avg" value="${(rate_english11+rate_english12+rate_english21+rate_english22+rate_english31+rate_english32)/6 }" />
											<fmt:formatNumber value="${eng_avg}" pattern="0.00"/>
									</td>
									<td id="soctyAll">
										<c:set var="soc_avg" value="${(rate_society11+rate_society12+rate_society21+rate_society22+rate_society31+rate_society32)/6 }" />
											<fmt:formatNumber value="${soc_avg}" pattern="0.00"/>
									</td>
									<td id="scnceAll">
										<c:set var="sci_avg" value="${(rate_science11+rate_science12+rate_science21+rate_science22+rate_science31+rate_science32)/6 }" />
											<fmt:formatNumber value="${sci_avg}" pattern="0.00"/>
									</td>
								</tr>
							</tbody>
						</table>
						</div>
						<!-- 표준점수 성적 테이블 -->
						<div class="table_box4 mgt15" id="grade_table2">
						<table class="table_row2 align_c let_sp" style="width:100%">
							<caption>학생부 성적 결과 테이블</caption>
								<colgroup>
									<col style="width:12%">
									<col style="width:12%">
									<col style="width:15%">
									<col style="width:15%">
									<col style="width:15%">
									<col style="width:15%">	
									<col style="width:*%">											
								</colgroup>
								<thead>
									<tr>
										<th colspan="2" scope="col">구분</th>
										<th scope="col">국어</th>
										<th scope="col">수학</th>
										<th scope="col">영어</th>	
										<th scope="col">사회</th>
										<th scope="col">과학</th>
									</tr>
								</thead>
								<tbody>
								<tr>
									<td rowspan="2">1학년</td>
									<td>1학기</td>
										<td>${korea11 }</td>
										<td>${math11 }</td>
										<td>${english11 }</td>
										<td>${society11 }</td>
										<td>${science11 }</td>
								</tr>
								<tr>
									<td>2학기</td>
										<td>${korea12 }</td>
										<td>${math12 }</td>
										<td>${english12 }</td>
										<td>${society12 }</td>
										<td>${science12 }</td>
								</tr>
								<tr>
									<td colspan="2">평균</td>
									<td id="krlgg02">
										<c:set var="korea_avg" value="${(korea11+korea12)/2 }" />
											<fmt:formatNumber value="${korea_avg}" pattern="0.00"/>
									</td>
									<td id="mthmc02">
										<c:set var="math_avg" value="${(math11+math12)/2 }" />
											<fmt:formatNumber value="${math_avg}" pattern="0.00"/>
									</td>
									<td id="engl02">
										<c:set var="eng_avg" value="${(english11+english12)/2 }" />
											<fmt:formatNumber value="${eng_avg}" pattern="0.00"/>
									</td>
									<td id="socty02">
										<c:set var="soc_avg" value="${(society11+society12)/2 }" />
											<fmt:formatNumber value="${soc_avg}" pattern="0.00"/>
									</td>
									<td id="scnce02">
										<c:set var="sci_avg" value="${(science11+science12)/2 }" />
											<fmt:formatNumber value="${sci_avg}" pattern="0.00"/>
									</td>
								</tr>
								<tr>
									<td rowspan="2">2학년</td>
									<td>1학기</td>
										<td>${korea21 }</td>
										<td>${math21 }</td>
										<td>${english21 }</td>
										<td>${society21 }</td>
										<td>${science21 }</td>
								</tr>
								<tr>
									<td>2학기</td>
										<td>${korea22 }</td>
										<td>${math22 }</td>
										<td>${english22 }</td>
										<td>${society22 }</td>
										<td>${science22 }</td>
								</tr>
								<tr>
									<td colspan="2">평균</td>
									<td id="krlgg02">
										<c:set var="korea_avg" value="${(korea21+korea22)/2 }" />
											<fmt:formatNumber value="${korea_avg}" pattern="0.00"/>
									</td>
									<td id="mthmc02">
										<c:set var="math_avg" value="${(math21+math22)/2 }" />
											<fmt:formatNumber value="${math_avg}" pattern="0.00"/>
									</td>
									<td id="engl02">
										<c:set var="eng_avg" value="${(english21+english22)/2 }" />
											<fmt:formatNumber value="${eng_avg}" pattern="0.00"/>
									</td>
									<td id="socty02">
										<c:set var="soc_avg" value="${(society21+society22)/2 }" />
											<fmt:formatNumber value="${soc_avg}" pattern="0.00"/>
									</td>
									<td id="scnce02">
										<c:set var="sci_avg" value="${(science21+science22)/2 }" />
											<fmt:formatNumber value="${sci_avg}" pattern="0.00"/>
									</td>
								</tr>
								<tr>
									<td rowspan="2">3학년</td>
									<td>1학기</td>
										<td>${korea31 }</td>
										<td>${math31 }</td>
										<td>${english31 }</td>
										<td>${society31 }</td>
										<td>${science31 }</td>
								</tr>
								<tr>
									<td>2학기</td>
										<td>${korea32 }</td>
										<td>${math32 }</td>
										<td>${english32 }</td>
										<td>${society32 }</td>
										<td>${science32 }</td>
								</tr>
								<tr>
									<td colspan="2">평균</td>
									<td id="krlgg02">
										<c:set var="korea_avg" value="${(korea31+korea32)/2 }" />
											<fmt:formatNumber value="${korea_avg}" pattern="0.00"/>
									</td>
									<td id="mthmc02">
										<c:set var="math_avg" value="${(math31+math32)/2 }" />
											<fmt:formatNumber value="${math_avg}" pattern="0.00"/>
									</td>
									<td id="engl02">
										<c:set var="eng_avg" value="${(english31+english32)/2 }" />
											<fmt:formatNumber value="${eng_avg}" pattern="0.00"/>
									</td>
									<td id="socty02">
										<c:set var="soc_avg" value="${(society31+society32)/2 }" />
											<fmt:formatNumber value="${soc_avg}" pattern="0.00"/>
									</td>
									<td id="scnce02">
										<c:set var="sci_avg" value="${(science31+science32)/2 }" />
											<fmt:formatNumber value="${sci_avg}" pattern="0.00"/>
									</td>
								</tr>
								
								<tr class="bg_c02">
									<td rowspan="3" colspan="2">전학년</td>
									<td id="krlggAll">
										<c:set var="korea_avg" value="${(korea11+korea12+korea21+korea22+korea31+korea32)/6 }" />
											<fmt:formatNumber value="${korea_avg}" pattern="0.00"/>
									</td>
									<td id="mthmcAll">
										<c:set var="math_avg" value="${(math11+math12+math21+math22+math31+math32)/6 }" />
											<fmt:formatNumber value="${math_avg}" pattern="0.00"/>
									</td>
									<td id="englAll">
										<c:set var="eng_avg" value="${(english11+english12+english21+english22+english31+english32)/6 }" />
											<fmt:formatNumber value="${eng_avg}" pattern="0.00"/>
									</td>
									<td id="soctyAll">
										<c:set var="soc_avg" value="${(society11+society12+society21+society22+society31+society32)/6 }" />
											<fmt:formatNumber value="${soc_avg}" pattern="0.00"/>
									</td>
									<td id="scnceAll">
										<c:set var="sci_avg" value="${(science11+science12+science21+science22+science31+science32)/6 }" />
											<fmt:formatNumber value="${sci_avg}" pattern="0.00"/>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					</div>	<!-- 주요교과 분석 -->
					<!-- // 결과리스트 -->
					<div class="t_span mgb5">※ 재학생은 3학년 1학기까지, 졸업생은 3학년 2학기까지의
						성적을 기준으로 제공됩니다.</div>
					<!-- 학기별 교과추이 -->
					<div class="table_box5">
						<h4 class="mgt35">학년별 교과추이</h4>
						<div id="grade_graph" style="width: 1200px; height: 500px"></div>
					</div>
					<!-- //학기별 교과추이 -->
					<!-- 전학년 교과 비교 -->
					<div class="table_box5">
						<h4 class="mgt35">전학년 교과 비교</h4>
						<div id="grade_graph2" style="width: 1200px; height: 500px"></div>
					</div>
					<!-- //학기별 교과추이 -->
				</div>
			</div>
		</div>
		<!-- rightcontents -->
	</div>
	<!-- contents -->
	<%@include file="../main/bottom.jsp"%>
</body>
</html>