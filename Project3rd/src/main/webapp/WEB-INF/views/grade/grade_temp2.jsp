<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
google.charts.load('current', {packages: ['corechart']});
google.charts.setOnLoadCallback(drawMultSeries);

function drawMultSeries() {
	<c:forEach items="${lists }" var="row">
	<c:forEach items="${selected_junh }" var="row2">
		<c:set var="kor" value="${row.native_rate * row2.enter_test1 / 100}"/>
		<c:set var="math" value="${row.math_rate * row2.enter_test2 / 100}"/>
		<c:set var="eng" value="${row.eng_rate * row2.enter_test3 / 100}"/>
		<c:choose>
			<c:when test="${row.study1_rate <= row.study2_rate }">
				<c:set var="other" value="${row.study1_rate * row2.enter_test4 / 100}"/>
			</c:when>
			<c:otherwise>
				<c:set var="other" value="${row.study2_rate * row2.enter_test4 / 100}"/>
			</c:otherwise>
		</c:choose>
		<c:set var="jung_avg" value="${kor + math + eng + other }"/>
	</c:forEach>
	</c:forEach>
      var data = google.visualization.arrayToDataTable([
    	  ['비교', '등급', { role: 'style' }],
    	  <c:forEach items="${selected_junh }" var="row">
        	['내신 최저 등급', ${row.su_mini}, 'gold'],
        	['나의 등급', ${jung_avg}, 'red']
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
	<br />
	<c:forEach items="${lists }" var="row">
	<c:forEach items="${selected_junh }" var="row2">
        <c:set var="gradeArray" value="${fn:split(row.year, 'year') }"></c:set>
        <c:set var="grade" value="${gradeArray[0] }"></c:set>
		<h3>나의 <${grade }학년 ${row.ex_name}> 성적</h3>
		<h6>※탐구는 더 높은 등급의 성적으로 계산됩니다.※</h6>
		<table class="list_tbl01" style="text-align: center;">
			<tr>
				<th colspan="2" style="width: 40%">과목</th>
				<th>등급</th>
				<th>
				반영 비율 계산 후 등급 <br />
				※국어:${row2.enter_test1 }, 수학:${row2.enter_test2 }, 영어:${row2.enter_test3 },
				탐구:${row2.enter_test4 }※
					<c:set var="kor" value="${row.native_rate * row2.enter_test1 / 100}"/>
					<c:set var="math" value="${row.math_rate * row2.enter_test2 / 100}"/>
					<c:set var="eng" value="${row.eng_rate * row2.enter_test3 / 100}"/>
					<c:choose>
						<c:when test="${row.study1_rate <= row.study2_rate }">
							<c:set var="other" value="${row.study1_rate * row2.enter_test4 / 100}"/>
						</c:when>
						<c:otherwise>
							<c:set var="other" value="${row.study2_rate * row2.enter_test4 / 100}"/>
						</c:otherwise>
					</c:choose>
					<c:set var="jung_avg" value="${kor + math + eng + other }"/>
				</th>
			</tr>
		      <tr>
		        <td colspan="2">국어</td>
		        <td>${row.native_rate }</td>
		        <td rowspan="4" style="font-size: 2em"><fmt:formatNumber value="${jung_avg}" pattern="0.00"/></td>
		      </tr>
		      <tr>
		        <td>수학</td>
		        <td>${row.math_type }</td>
		        <td>${row.math_rate }</td>
		      </tr>
		      <tr>
		        <td colspan="2">영어</td>
		        <td>${row.eng_rate }</td>
		      </tr>
		      <tr>
		      <c:choose>
		      	<c:when test="${row.study1_rate <= row.study2_rate }">
			        <td>${row.study1 }</td>
			        <td>${row.study1_type }</td>
			        <td>${row.study1_rate }</td>
		      	</c:when>
		      	<c:otherwise>
		      		<td>${row.study2 }</td>
			        <td>${row.study2_type }</td>
			        <td>${row.study2_rate }</td>
		      	</c:otherwise>
		      </c:choose>
		      </tr>
		</table>
	 </c:forEach>
     </c:forEach>
     <br />
     <div style="border: 1px solid black">
				<h3>
					${sessionScope.siteUserInfo }님, <br />
					<c:forEach items="${selected_junh }" var="row">
						<c:if test="${jung_avg > row.su_mini}">
							<c:set var="dif" value="${jung_avg - row.su_mini }"/>
							<h4><fmt:formatNumber value="${dif}" pattern="0.00"/>등급을 올려야 합니다.</h4>
						</c:if> 
						<c:if test="${jung_avg <= row.su_avg}">
							<h4>이정도 성적이면 <${uname }>에 충분히 합격할 것으로 보입니다.</h4>
						</c:if> 
						<c:if test="${jung_avg > row.su_avg && jung_avg < row.su_mini}">
							<h4>이정도 성적이면 <${uname }>에 합격할 가능성이 있습니다.</h4>
						</c:if> 
					</c:forEach>
				</h3>
				<h4></h4>
			</div>
	<h2 style="font-weight: bold;">내 성적과 작년 <${uname }> 입시 성적 비교</h2>
		<div id="graph1" style="width: 1200px; height: 500px; text-align: center;">
		</div>
</body>
</html>