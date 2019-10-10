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
<link rel="stylesheet" href="style/sugrade.css" />
<link rel="stylesheet" href="style/leftmenustyle.css" />
<link rel="stylesheet" href="style/basic.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
function change(s1, s2){
	const year = s1;
	const semester = s2;
	const id = document.getElementById("id").value
	
	//alert(id);

	location.href="./sugrade.do?year="+s1+"&semester="+s2+"&id="+id;
	
	document.getElementById("hak").innerHTML=year;
	document.getElementById('gi').innerHTML=semester;
	
	document.getElementById("year").value=year;
	document.getElementById("semester").value=semester;
	
	
}

function suValidate(f){
	
	var subject = f.subject.value;
	var subject_type = f.subject_type.value;
	var counts = f.counts.value; 
	var rate = f.rate.value;
	var jumsu = f.jumsu.value;
	var avg = f.avg.value;
	var deviation = f.deviation.value;
	var totalman = f.totalman.value;
	
	//특수부호인지 여부
	var special_pattern = /[`~!@#$%^&*|\\\";:\/?]/gi; 
	//한글인지 여부
	var pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	
	if(special_pattern.test(counts)==true){
		alert("특수부호는 사용하실 수 없습니다.");
		return false;
	}
	
	if(pattern_kor.test(counts)==true){
		alert("한글은 사용하실 수 없습니다.");
		return false; 
	}
	
	if(special_pattern.test(rate)==true){
		alert("특수부호는 사용하실 수 없습니다.");
		return false;
	}
	
	if(pattern_kor.test(rate)==true){
		alert("한글은 사용하실 수 없습니다.");
		return false;
	}
	
	if(special_pattern.test(jumsu)==true){
		alert("특수부호는 사용하실 수 없습니다.");
		return false;
	}
	
	if(pattern_kor.test(jumsu)==true){
		alert("한글은 사용하실 수 없습니다.");
		return false;
	}
	
	if(special_pattern.test(avg)==true){
		alert("특수부호는 사용하실 수 없습니다.");
		return false;
	}
	
	if(pattern_kor.test(avg)==true){
		alert("한글은 사용하실 수 없습니다.");
		return false;
	}
	
	if(special_pattern.test(deviation)==true){
		alert("특수부호는 사용하실 수 없습니다.");
		return false;
	}
	
	if(pattern_kor.test(deviation)==true){
		alert("한글은 사용하실 수 없습니다.");
		return false;
	}
	
	if(special_pattern.test(totalman)==true){
		alert("특수부호는 사용하실 수 없습니다.");
		return false;
	}
	
	if(pattern_kor.test(totalman)==true){
		alert("한글은 사용하실 수 없습니다.");
		return false;
	}
	
	if(!f.subject.value){
		alert("교과를 입력하세요.");
		return false;
	}
	if(!f.subject_type.value){
		alert("과목을 입력하세요.");
		return false;
	}
	if(!f.counts.value){
		alert("단위수를 입력하세요.");
		return false;
	}	
	if(!f.rate.value){
		alert("석차등급을 입력하세요.");
		return false;
	}
	if(!f.jumsu.value){
		alert("원점수를 입력하세요.");
		return false;
	}
	if(!f.avg.value){
		alert("과목평균을 입력하세요.");
		return false;
	}
	if(!f.deviation.value){
		alert("표준편차를 입력하세요.");
		return false;
	}
	if(!f.totalman.value){
		alert("수강자수를 입력하세요.");
		return false;
	}
	
}

function deleteRow(idx){
	if(confirm('삭제하시겠습니까?')){
		location.href="./delete.do?idx="+idx+"&id="+document.getElementById("id").value;
	}
}

function editRow(idx){
	if(confirm('수정하시겠습니까?')){
		var subject_type = document.getElementById("subject_type").value;
		var counts = document.getElementById("counts").value;
		var rate = document.getElementById("rate").value;
		var jumsu = document.getElementById("jumsu").value;
		var avg = document.getElementById("avg").value;
		var deviation = document.getElementById("deviation").value;
		var totalman = document.getElementById("totalman").value;
		var id = document.getElementById("id").value;
		
		location.href="./suedit.do?idx="+idx+"&id="+id+"&subject_type="+subject_type+"&counts="+counts+"&rate="+rate+"&jumsu="+jumsu+"&avg="+avg+"&deviation="+deviation+"&totalman="+totalman;
	}
}

function alertcall(){
	alert("로그인후 이용해주세요.");
	location.href="./login.do";
}
</script>
</head>
<body>
	<form name="suFrm" method="post" onsubmit="return suValidate(this);" action="<c:url value="./suAction.do"/>">
	<%@include file="../main/head.jsp" %> 
	<div class="topcontents">
		<div class="lefttop">
			<div class="lefttoptext">마이페이지</div>
		</div>
		<div class="righttop">
			<div class="righttoptext">수시성적</div>
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
			<div class="container-fluid" style="margin-top:20px;">
				<div class="row">
					<div class="col-4">1학년</div>
					<div class="col-4">2학년</div>
					<div class="col-4">3학년</div>
				 </div>
				 <div class="row">
					<div class="col">
						1학기 <br />
						<button type="button" class="btn btn-secondary btn-sm" style="border:0px;" onclick="change('1학년','1학기');">입력</button>
					</div>
					<div class="col">
						2학기 <br />
						<button type="button" class="btn btn-secondary btn-sm" style="border:0px;" onclick="change('1학년','2학기');">입력</button>
					</div>
					<div class="col">
						1학기 <br />
						<button type="button" class="btn btn-secondary btn-sm" style="border:0px;" onclick="change('2학년','1학기');">입력</button>
					</div>
					<div class="col">
						2학기 <br />
						<button type="button" class="btn btn-secondary btn-sm" style="border:0px;" onclick="change('2학년','2학기');">입력</button>
					</div>
					<div class="col">
						1학기 <br />
						<button type="button" class="btn btn-secondary btn-sm" style="border:0px;" onclick="change('3학년','1학기');">입력</button>
					</div>
					<div class="col">
						2학기 <br />
						<button type="button" class="btn btn-secondary btn-sm" style="border:0px;" onclick="change('3학년','2학기');">입력</button>
					</div>
				</div>
			</div><!-- 학년부분 end -->
			<!-- 입력부분 시작 -->
			<div>
				<%
				String id = request.getParameter("id");
				String year="";
				String semester="";
				
				if(request.getParameter("year")==null){
					year="1학년";
				}
				else{
					year=request.getParameter("year");
				}
				if(request.getParameter("semester")==null){
					semester="1학기";
				}
				else{
					semester=request.getParameter("semester");
				}
				%>
				<p class="tabletop" id="distinction"><strong id="hak"><%=year %></strong>&nbsp;<strong id="gi"><%=semester %></strong></p>
				<input type="hidden" name="year" value="<%=year %>" id="year"/><!-- 저장을 누를때 넘겨줄값이 들어있는곳 -->
				<input type="hidden" name="semester" value="<%=semester %>" id="semester"/><!-- 저장을 누를때 넘겨줄값이 들어있는곳 -->
				<input type="hidden" name="id" value="<%=id %>" id="id"/><!-- 저장을 누를때 넘겨줄값이 들어있는곳 -->
				<table class="table">
					<thead>
						<tr>
							<th>교과</th>
							<th>과목</th>
							<th>단위수</th>
							<th>석차등급</th>
							<th>원점수</th>
							<th>과목평균</th>
							<th>표준편차</th>
							<th>수강자수</th>
							<th>관리</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${lists}" var="row">
							<tr>
								<!-- <td>영어</td>
								<td>실용영어2</td>
								<td>3</td>
								<td>3</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>
									<button type="button" class="btn btn-dark btn-sm" style="border:0px;">삭제</button> <br />
								</td> -->
								
									<td>${row.subject}</td>
									<td><input type="text" value="${row.subject_type }" style="width:70px;" id="subject_type" /></td>
									<td><input type="text" value="${row.counts }" style="width:70px;" id="counts"/></td>
									<td><input type="text" value="${row.rate }" style="width:70px;" id="rate"/></td>
									<td><input type="text" value="${row.jumsu }" style="width:70px;" id="jumsu"/></td>
									<td><input type="text" value="${row.avg }" style="width:70px;" id="avg"/></td>
									<td><input type="text" value="${row.deviation }" style="width:70px;" id="deviation"/></td>
									<td><input type="text" value="${row.totalman }" style="width:70px;" id="totalman"/></td>
									<td>
										<button type="button" class="btn btn-dark btn-sm" style="border:70px;" onclick="javascript:editRow(${row.idx})">수정</button> <br />
									</td>
							</tr>
						</c:forEach>
						<tr>
							<td>
								<input type="text" class="input" name="subject"/>
							</td>
							<td>
								<input type="text" class="input" name="subject_type"/>
							</td>
							<td>
								<input type="text" class="input" name="counts"/>							
							</td>
							<td>
								<input type="text" class="input" name="rate"/>
							</td>
							<td>
								<input type="text" class="input" name="jumsu"/>
							</td>
							<td>
								<input type="text" class="input" name="avg"/>
							</td>
							<td>
								<input type="text" class="input" name="deviation"/>
							</td>
							<td>
								<input type="text" class="input" name="totalman"/>
							</td>
							<td>
								<button type="submit" class="btn btn-info btn-sm" style="background-color:#783712;border:0px;">저장</button>
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