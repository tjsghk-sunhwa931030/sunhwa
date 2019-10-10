<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>

function select_grade(idx, idx2, uname) {
	$.ajax({
		type: "POST",
		url: "get_grade2.do",
		dataType: "html",
		data: {idx: idx, junh_idx: idx2, uname: uname},
		success: function(result){
			$("#select").html(result);
		},
		error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
	});
}


	google.charts.load('current', {packages: ['corechart']});
	google.charts.setOnLoadCallback(drawMultSeries);
	
	function drawMultSeries() {
	      var data = google.visualization.arrayToDataTable([
	    	  ['비교', '등급', { role: 'style' }],
	    	  <c:forEach items="${selected_junh }" var="row">
	        	['내신 최저 등급', ${row.hak_mini}, 'gold'],
	        	['나의 등급', ${avg}, 'red'],
	        	['내신 최고 등급', ${row.hak_max}, 'green']
	        	</c:forEach>
	        ]); 
	 
	      var options = {
	        title: '',
	        legend: 'none',
	        chartArea: {width: '50%'},
	        hAxis: {
	          title: '비교',
	          minValue: 0
	        },
	        vAxis: {
	          title: '등급'
	        }
	      };
	 
	      var chart = new google.visualization.BarChart(document.getElementById('graph1'));
	      chart.draw(data, options);
	}


</script>
</head>
<body>
	<br /><br />
	<h2 style="font-weight: bold;">나의 ${recruit_time } 성적</h2>
	<c:set var="type" value="${recruit_time }" />
	<c:choose>
		<c:when test="${type == '수시'}">
			<table class="table table-bordered" style="text-align: center;">
				<tr>
					<th>언어 평균</th>
					<th>영어 평균</th>
					<th>수학 평균</th>
					<th>사회탐구 평균</th>
					<th>과학탐구 평균</th>
					<th>총 평균<br />(탐구영역중 높은 성적으로 계산)</th>
				</tr>
				<tr>
					<td>${rate_korea }</td>
					<td>${rate_english }</td>
					<td>${rate_math }</td>
					<td>${rate_society }</td>
					<td>${rate_science }</td>
					<td>${avg }</td>
				</tr>
			</table>
		<h2 style="font-weight: bold;">내 ${recruit_time } 성적과 작년 <${uname }> 입시 성적 비교</h2>
			
			<div style="border: 1px solid black">
				<h3>
					${sessionScope.siteUserInfo }님,
					<c:forEach items="${selected_junh }" var="row">
						<c:if test="${avg > row.hak_mini}">
							<c:set var="dif" value="${avg - row.hak_mini }"/>
							<h4>${dif }등급만 올려봐요!</h4>
						</c:if> 
						<c:if test="${avg <= row.hak_max}">
							<h4>이정도 성적이면 <${uname }>에 충분히 합격할 것으로 보입니다.</h4>
						</c:if> 
						<c:if test="${avg > row.hak_max && avg < row.hak_mini}">
							<h4>이정도 성적이면 <${uname }>에 합격할 가능성이 있습니다.</h4>
						</c:if> 
					</c:forEach>
				</h3>
				<h4></h4>
			</div>
			<div id="graph1" style="width: 1200px; height: 500px; text-align: center;">
			</div>
		</c:when>
		 <c:otherwise>
			<h3>성적을 선택하세요</h3>
			<table class="table table-hover" style="text-align: center;">
				<tr>
					<th>학년</th>
					<th>날짜</th>
					<th>시험명</th>
					<th>선택</th>
				</tr>
				<c:forEach items="${lists }" var="row">
			      <tr>
			        <c:set var="gradeArray" value="${fn:split(row.year, 'year') }"></c:set>
			        <c:set var="grade" value="${gradeArray[0] }"></c:set>
			        <td>${grade }학년</td>
			        <td>${row.dates }</td>
			        <td>${row.ex_name}</td>
			      	<td>
			      		<c:forEach items="${selected_junh }" var="row2">
			      			<button type="button" class="btn btn-warning"  onclick="select_grade(${row.idx }, ${row2.idx }, '${uname }')">선택</button>
			      		</c:forEach>
			      	</td>
			      </tr>
			     </c:forEach>
			</table>
			<div id="select"></div>
		</c:otherwise>
	</c:choose>
</body>
</html>