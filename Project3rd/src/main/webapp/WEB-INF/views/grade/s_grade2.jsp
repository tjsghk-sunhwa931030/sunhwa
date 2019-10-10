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
	    if($('input:radio[id=radio2]').is(':checked')){
	    	$('#grade_graph').hide();
	    }else{
	    }
	}
</script>
<script>
	google.charts.load('current', {packages: ['corechart']});
	google.charts.setOnLoadCallback(drawMultSeries1);
	function setDisplay(){
	    if($('input:radio[id=radio1]').is(':checked')){
	    	google.charts.setOnLoadCallback(drawMultSeries1);
	    }
	    else if($('input:radio[id=radio2]').is(':checked')){
	    	google.charts.setOnLoadCallback(drawMultSeries2);
		}
		else if($('input:radio[id=radio3]').is(':checked')){
	    	google.charts.setOnLoadCallback(drawMultSeries3);
	    }
		else if($('input:radio[id=radio4]').is(':checked')){
	    	google.charts.setOnLoadCallback(drawMultSeries4);
	    }
	}
	function drawMultSeries1() {
	      var data = google.visualization.arrayToDataTable([
	        ['학년, 학기', '20/30/50'],
	        ['국어·수학·영어', ${kor_mat_eng1} * 0.2 + ${kor_mat_eng2} * 0.3 + ${kor_mat_eng3} * 0.5],
	        ['국어·수학·영어·과학', ${kor_mat_eng_sci1} * 0.2 + ${kor_mat_eng_sci2} * 0.3 + ${kor_mat_eng_sci3} * 0.5 ],
	        ['국어·수학·영어·사회', ${kor_mat_eng_soc1} * 0.2 + ${kor_mat_eng_soc2} * 0.3 + ${kor_mat_eng_soc3} * 0.5],
	        ['수학·영어·과학', ${mat_eng_sci1} * 0.2 + ${mat_eng_sci2} * 0.3 + ${mat_eng_sci3} * 0.5],
	        ['국어·영어·사회', ${kor_eng_soc1} * 0.2 + ${kor_eng_soc2} * 0.3 + ${kor_eng_soc3} * 0.5],
	        ['국어·수학·영어·사회·과학', ${all1} * 0.2 + ${all2} * 0.3 + ${all3} * 0.5]
	      ]);
	 
	      var options = {
	        title: '학년별 국영수사과 비교',
	        legend: 'none',
	        chartArea: {width: '50%'},
	        hAxis: {
	          title: '학년',
	          minValue: 0
	        },
	        vAxis: {
	          title: '등급'
	        }
	      };
	      var chart = new google.visualization.ColumnChart(document.getElementById('grade_graph'));
	      chart.draw(data, options);
	    }
	
	function drawMultSeries2() {
	      var data = google.visualization.arrayToDataTable([
	        ['학년, 학기', '20/40/40'],
	        ['국어·수학·영어', ${kor_mat_eng1} * 0.2 + ${kor_mat_eng2} * 0.4 + ${kor_mat_eng3} * 0.4],
	        ['국어·수학·영어·과학', ${kor_mat_eng_sci1} * 0.2 + ${kor_mat_eng_sci2} * 0.4 + ${kor_mat_eng_sci3} * 0.4 ],
	        ['국어·수학·영어·사회', ${kor_mat_eng_soc1} * 0.2 + ${kor_mat_eng_soc2} * 0.4 + ${kor_mat_eng_soc3} * 0.4],
	        ['수학·영어·과학', ${mat_eng_sci1} * 0.2 + ${mat_eng_sci2} * 0.4 + ${mat_eng_sci3} * 0.4],
	        ['국어·영어·사회', ${kor_eng_soc1} * 0.2 + ${kor_eng_soc2} * 0.4 + ${kor_eng_soc3} * 0.4],
	        ['국어·수학·영어·사회·과학', ${all1} * 0.2 + ${all2} * 0.4 + ${all3} * 0.4]
	      ]);
	 	
	      var options = {
	        title: '학년별 국영수사과 비교',
	        legend: 'none',
	        chartArea: {width: '50%'},
	        hAxis: {
	          title: '학년',
	          minValue: 0
	        },
	        vAxis: {
	          title: '점수'
	        }
	      };
	      var chart = new google.visualization.ColumnChart(document.getElementById('grade_graph'));
	      chart.draw(data, options);
	    }
	
	function drawMultSeries3() {
	      var data = google.visualization.arrayToDataTable([
	        ['학년, 학기', '30/30/40'],
	        ['국어·수학·영어', ${kor_mat_eng1} * 0.3 + ${kor_mat_eng2} * 0.3 + ${kor_mat_eng3} * 0.4],
	        ['국어·수학·영어·과학', ${kor_mat_eng_sci1} * 0.3 + ${kor_mat_eng_sci2} * 0.3 + ${kor_mat_eng_sci3} * 0.4 ],
	        ['국어·수학·영어·사회', ${kor_mat_eng_soc1} * 0.3 + ${kor_mat_eng_soc2} * 0.3 + ${kor_mat_eng_soc3} * 0.4],
	        ['수학·영어·과학', ${mat_eng_sci1} * 0.3 + ${mat_eng_sci2} * 0.3 + ${mat_eng_sci3} * 0.4],
	        ['국어·영어·사회', ${kor_eng_soc1} * 0.3 + ${kor_eng_soc2} * 0.3 + ${kor_eng_soc3} * 0.4],
	        ['국어·수학·영어·사회·과학', ${all1} * 0.3 + ${all2} * 0.3 + ${all3} * 0.4]
	      ]);
	      
	      var options = {
	        title: '학년별 국영수사과 비교',
	        legend: 'none',
	        chartArea: {width: '50%'},
	        hAxis: {
	          title: '학년',
	          minValue: 0
	        },
	        vAxis: {
	          title: '점수'
	        }
	      };
	      var chart = new google.visualization.ColumnChart(document.getElementById('grade_graph'));
	      chart.draw(data, options);
	    }
	
	function drawMultSeries4() {
	      var data = google.visualization.arrayToDataTable([
	        ['학년, 학기', '전학년 100'],
	        ['국어·수학·영어', (${kor_mat_eng1} + ${kor_mat_eng2} + ${kor_mat_eng3}) / 3 ],
	        ['국어·수학·영어·과학', (${kor_mat_eng_sci1} + ${kor_mat_eng_sci2} + ${kor_mat_eng_sci3}) / 3 ],
	        ['국어·수학·영어·사회', (${kor_mat_eng_soc1} + ${kor_mat_eng_soc2} + ${kor_mat_eng_soc3}) / 3 ],
	        ['수학·영어·과학', (${mat_eng_sci1} + ${mat_eng_sci2} + ${mat_eng_sci3}) / 3 ],
	        ['국어·영어·사회', (${kor_eng_soc1} + ${kor_eng_soc2} + ${kor_eng_soc3}) / 3 ],
	        ['국어·수학·영어·사회·과학', (${all1} + ${all2} + ${all3}) / 3 ]
	      ]);
	 
	      var options = {
	        title: '학년별 국영수사과 비교',
	        legend: 'none',
	        chartArea: {width: '50%'},
	        hAxis: {
	          title: '학년',
	          minValue: 0
	        },
	        vAxis: {
	          title: '점수'
	        }
	      };
	      var chart = new google.visualization.ColumnChart(document.getElementById('grade_graph'));
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
			<div class="righttoptext">학생부 성적 분석 - 교과조합 분석</div>
		</div>
	</div>
	<div class="contents" style="height: 2000px">
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
							href="sugrade.do?id=${sessionScope.siteUserInfo }" class="btn_compare_off" title="학생부 성적입력">학생부 성적입력</a>이 필요합니다.
					</p>
					<p>아래 입력버튼을 통해 성적을 입력하여 주십시오.</p>
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
						<!-- 성적 테이블 -->
						<table class="table_row2 align_c mgt15" style="width:100%">
					  <caption>전형일정</caption>
						<colgroup>
							<col style="width:5%">
							<col style="width:22%">
							<col style="width:13%">
							<col style="width:13%">
							<col style="width:17%">
							<col style="width:13%">
							<col style="width:17%">
						</colgroup>
					  <thead>
					  <tr>
						<th scope="col" rowspan="3">번호</th>
						<th rowspan="3">구분</th>
						<th colspan="4">석차등급</th>
					  </tr>
					  <tr>
						<th colspan="4">학년별 반영비율</th>
					  </tr>
					  <tr>
						<th scope="col">(20/30/50)</th>
						<th scope="col">(20/40/40)</th>
						<th scope="col">(30/30/40)</th>
						<th scope="col">(전학년 100)</th>						
					  </tr>
					 </thead>
					  
					  <tbody id="mxtrResult">
					  <tr>
					  	<td scope="row">1</td>
					  	<td>국어·수학·영어</td>
					  	<td>
					  		<c:set var="kor_mat_eng" value="${kor_mat_eng1 * 0.2 + kor_mat_eng2 * 0.3 + kor_mat_eng3 * 0.5 }" />
								<fmt:formatNumber value="${kor_mat_eng}" pattern="0.00"/>
					  	</td>
					  	<td>
					  		<c:set var="kor_mat_eng" value="${kor_mat_eng1 * 0.2 + kor_mat_eng2 * 0.4 + kor_mat_eng3 * 0.4 }" />
								<fmt:formatNumber value="${kor_mat_eng}" pattern="0.00"/>
					  	</td>
					  	<td>
					  		<c:set var="kor_mat_eng" value="${kor_mat_eng1 * 0.3 + kor_mat_eng2 * 0.3 + kor_mat_eng3 * 0.4 }" />
								<fmt:formatNumber value="${kor_mat_eng}" pattern="0.00"/>
					  	</td>
					  	<td>
					  		<c:set var="kor_mat_eng" value="${(kor_mat_eng1 + kor_mat_eng2 + kor_mat_eng3)/3 }" />
								<fmt:formatNumber value="${kor_mat_eng}" pattern="0.00"/>
					  	</td>
					  </tr>
					  <tr class="bg_c02">
					  	<td scope="row">2</td>
					  	<td>국어·수학·영어·과학</td>
					  	<td>
					  		<c:set var="kor_mat_eng_sci" value="${kor_mat_eng_sci1 * 0.2 + kor_mat_eng_sci2 * 0.3 + kor_mat_eng_sci3 * 0.5 }" />
										<fmt:formatNumber value="${kor_mat_eng_sci}" pattern="0.00"/>
					  	</td>
					  	<td>
					  		<c:set var="kor_mat_eng_sci" value="${kor_mat_eng_sci1 * 0.2 + kor_mat_eng_sci2 * 0.4 + kor_mat_eng_sci3 * 0.4 }" />
										<fmt:formatNumber value="${kor_mat_eng_sci}" pattern="0.00"/>
					  	</td>
					  	<td>
					  		<c:set var="kor_mat_eng_sci" value="${kor_mat_eng_sci1 * 0.3 + kor_mat_eng_sci2 * 0.3 + kor_mat_eng_sci3 * 0.4 }" />
										<fmt:formatNumber value="${kor_mat_eng_sci}" pattern="0.00"/>
					  	</td>
					  	<td>
					  		<c:set var="kor_mat_eng_sci" value="${(kor_mat_eng_sci1 + kor_mat_eng_sci2 + kor_mat_eng_sci3) / 3}" />
										<fmt:formatNumber value="${kor_mat_eng_sci}" pattern="0.00"/>
					  	</td>
					  </tr>
					  <tr>
					  	<td scope="row">3</td>
					  	<td>국어·수학·영어·사회</td>
					  	<td>
					  		<c:set var="kor_mat_eng_soc" value="${kor_mat_eng_soc1 * 0.2 + kor_mat_eng_soc2 * 0.3 + kor_mat_eng_soc3 * 0.5 }" />
										<fmt:formatNumber value="${kor_mat_eng_soc}" pattern="0.00"/>
					  	</td>
					  	<td>
					  		<c:set var="kor_mat_eng_soc" value="${kor_mat_eng_soc1 * 0.2 + kor_mat_eng_soc2 * 0.4 + kor_mat_eng_soc3 * 0.4 }" />
										<fmt:formatNumber value="${kor_mat_eng_soc}" pattern="0.00"/>
					  	</td>
					  	<td>
					  		<c:set var="kor_mat_eng_soc" value="${kor_mat_eng_soc1 * 0.3 + kor_mat_eng_soc2 * 0.3 + kor_mat_eng_soc3 * 0.4 }" />
										<fmt:formatNumber value="${kor_mat_eng_soc}" pattern="0.00"/>
					  	</td>
					  	<td>
					  		<c:set var="kor_mat_eng_soc" value="${(kor_mat_eng_soc1 + kor_mat_eng_soc2 + kor_mat_eng_soc3) / 3 }" />
										<fmt:formatNumber value="${kor_mat_eng_soc}" pattern="0.00"/>
						</td>
					  </tr>
					  <tr class="bg_c02">
					  	<td scope="row">4</td>
					  	<td>수학·영어·과학</td>
					  	<td>
					  		<c:set var="mat_eng_sci" value="${mat_eng_sci1 * 0.2 + mat_eng_sci2 * 0.3 + mat_eng_sci3 * 0.5 }" />
										<fmt:formatNumber value="${mat_eng_sci}" pattern="0.00"/>
					  	</td>
					  	<td>
					  		<c:set var="mat_eng_sci" value="${mat_eng_sci1 * 0.2 + mat_eng_sci2 * 0.4 + mat_eng_sci3 * 0.4 }" />
									<fmt:formatNumber value="${mat_eng_sci}" pattern="0.00"/>
					  	</td>
					  	<td>
					  		<c:set var="mat_eng_sci" value="${mat_eng_sci1 * 0.3 + mat_eng_sci2 * 0.3 + mat_eng_sci3 * 0.4 }" />
										<fmt:formatNumber value="${mat_eng_sci}" pattern="0.00"/>
					  	</td>
					  	<td>
					  		<c:set var="mat_eng_sci" value="${(mat_eng_sci1 + mat_eng_sci2 + mat_eng_sci3) / 3 }" />
										<fmt:formatNumber value="${mat_eng_sci}" pattern="0.00"/>
					  	</td>
					  </tr>
					  <tr>
					  	<td scope="row">5</td>
					  	<td>국어·영어·사회</td>
					  	<td>
					  		<c:set var="kor_eng_soc" value="${kor_eng_soc1 * 0.2 + kor_eng_soc2 * 0.3 + kor_eng_soc3 * 0.5 }" />
								<fmt:formatNumber value="${kor_eng_soc}" pattern="0.00"/>
					  	</td>
					  	<td>
					  		<c:set var="kor_eng_soc" value="${kor_eng_soc1 * 0.2 + kor_eng_soc2 * 0.4 + kor_eng_soc3 * 0.4 }" />
								<fmt:formatNumber value="${kor_eng_soc}" pattern="0.00"/>		
					  	</td>
					  	<td>
					  		<c:set var="kor_eng_soc" value="${kor_eng_soc1 * 0.3 + kor_eng_soc2 * 0.3 + kor_eng_soc3 * 0.4 }" />
								<fmt:formatNumber value="${kor_eng_soc}" pattern="0.00"/>
					  	</td>
					  	<td>
					  		<c:set var="kor_eng_soc" value="${(kor_eng_soc1 + kor_eng_soc2 + kor_eng_soc3) / 3 }" />
								<fmt:formatNumber value="${kor_eng_soc}" pattern="0.00"/>
					  	</td>
					  </tr>
					  <tr class="bg_c02">
						  <td scope="row">6</td>
						  <td>국어·수학·영어·사회·과학</td>
						  <td>
						  	<c:set var="all" value="${all1 * 0.2 + all2 * 0.3 + all3 * 0.5 }" />
								<fmt:formatNumber value="${all}" pattern="0.00"/>
						  </td>
						  <td>
						  	<c:set var="all" value="${all1 * 0.2 + all2 * 0.4 + all3 * 0.4 }" />
								<fmt:formatNumber value="${all}" pattern="0.00"/>
						  </td>
						  <td>
						  	<c:set var="all" value="${all1 * 0.3 + all2 * 0.3 + all3 * 0.4 }" />
								<fmt:formatNumber value="${all}" pattern="0.00"/>
						  </td>
						  <td>
						  	<c:set var="all" value="${(all1 + all2 + all3) / 3 }" />
								<fmt:formatNumber value="${all}" pattern="0.00"/>
						  </td>
					 </tr>
					
					</tbody>
					</table>
					</div>	<!-- 주요교과 분석 -->
					<!-- // 결과리스트 -->
					<div class="t_span mgb5">※ 재학생은 3학년 1학기까지, 졸업생은 3학년 2학기까지의
						성적을 기준으로 제공됩니다.</div>
					<!-- 학기별 교과추이 -->
					<div class="table_box5">
						<h4 class="mgt35">석차등급</h4>
						<div style="text-align: right; font-size: 0.7em">학년별 반영 비율 &nbsp;&nbsp;
							<input type="radio" id="radio1" name="rate" value="1" checked="checked" onchange="setDisplay()">(20/30/50)
							<input type="radio" id="radio2" name="rate" value="1" onchange="setDisplay()">(20/40/40)
							<input type="radio" id="radio3" name="rate" value="1" onchange="setDisplay()">(30/30/40)
							<input type="radio" id="radio4" name="rate" value="1" onchange="setDisplay()">(전학년 100)
						</div>
						<div id="grade_graph" style="width: 1200px; height: 500px;">
						</div>
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