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
<link rel="stylesheet" href="style/interuniv.css" />
<link rel="stylesheet" href="style/leftmenustyle.css" />
<link rel="stylesheet" href="style/basic.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style>
	#map{
		width:100%; height:700px;
	}
</style>
<c:choose>
	<c:when test="${param.distance eq 1 }">
		<c:set var="zoomLevel" value="15" />
	</c:when>
	<c:when test="${param.distance eq 5 }">
		<c:set var="zoomLevel" value="14" />
	</c:when>
	<c:when test="${param.distance eq 10 }">
		<c:set var="zoomLevel" value="13" />
	</c:when>
	<c:otherwise>
		<c:set var="zoomLevel" value="12" />
	</c:otherwise>
</c:choose>

<script type="text/javascript">
var span;
window.onload = function(){
	span = document.getElementById("result");
	
	if(navigator.geolocation){
		span.innerHTML = "";
		
		var options = {	
			enableHighAccurcy:true, 
			timeout:5000,
			maximumAge:3000
		};
		navigator.geolocation.getCurrentPosition(showPosition,showError,options);
	}
	else{
		span.innerHTML = "이 브라우저는 Geolocation API를 지원하지 않습니다.";
	}	
}

var showPosition = function(position){
	//위도를 가져오는 부분
	var latitude = position.coords.latitude;
	//경도를 가져오는 부분
	var longitude = position.coords.longitude;
	
	////////////////////////////////////////////////////////////////////////
	//위경도를 text input에 입력
	document.getElementById("latTxt").value = latitude;
	document.getElementById("lngTxt").value = longitude;
	////////////////////////////////////////////////////////////////////////
	
		
	//위경도를 가져온후 지도 표시
	initMap(latitude, longitude) ;
}

function initMap(latVar, lngVar) {				
	var uluru = {lat: latVar, lng: lngVar};
	var map = new google.maps.Map(document.getElementById('map'), {
		zoom: ${zoomLevel},
		center: uluru
	});
	//현재 내 위치를 맵에 표시
	var marker = new google.maps.Marker({
		position: uluru,
		map: map,
		/////////////////////////////////////////////////////////////////////
		//내위치 아이콘 변경
		icon: './icon/icon_me.png'
		/////////////////////////////////////////////////////////////////////
	});
	
	//////////////////////////////////////////////////////////////////////////
	//다중마커s
	var infowindow = new google.maps.InfoWindow();
	
 	//시설을 맵에 표시
	var locations = [		
		<c:forEach items="${searchLists }" var="row">
			['${row.l_name }', ${row.hp_latitude }, ${row.hp_longitude }, 
				'${row.sido}', '${row.sigungu}', '${row.addr}', '${row.rest_day}',
				'${row.weekday_start}', '${row.weekday_end}', '${row.saturday_start}', '${row.saturday_end}',
				'${row.holiday_start}', '${row.holiday_end}', '${row.phone_num}', '${row.l_url}', ${row.l_like}, '${row.l_num}'
				], 
		</c:forEach>
	];
	
 	var marker, i;
	for (i=0; i<locations.length; i++) {  
		marker = new google.maps.Marker({
			id:i,
			position: new google.maps.LatLng(locations[i][1], locations[i][2]),
			map: map,
			icon: './icon/icon_facil.png'
		});
		var url = locations[i][14];
		
		//alert(l_num);
		google.maps.event.addListener(marker, 'click', (function(marker, i) {
			return function() {
				var l_num = locations[i][16];
				//정보창에 HTML코드가 들어갈 수 있음.
				infowindow.setContent("<a href=" + locations[i][14] + ">"+locations[i][0]+"</a><br/>" +
						"주소: " + locations[i][3] + ", " + locations[i][4] + ", " + locations[i][5] + "<br/>"
						+"평일: " + locations[i][7] + " ~ " + locations[i][8] + "<br/>"
						+"토요일: " + locations[i][9] + " ~ " + locations[i][10] + "<br/>"
						+"공휴일: " + locations[i][11] + " ~ " + locations[i][12] + "<br/>"
						+"휴관일: " + locations[i][6] + "<br/>"
						+"전화번호: " + locations[i][13] + "<br/>"
						+"일련번호: " +locations[i][16]+ "<br/>" 
						/* +"추천수: " + locations[i][15] + "<br/>"  */
						+"<button type=\"button\" class=\"btn btn-primary\" id=\"btn1\"" 
						+"onclick=\"like("+l_num+")\"\">추천"    
						+"<span class=\"badge badge-light\" id='count'>" + locations[i][15] 
						+"</span>"
						+"<div id='rec_count' class='rec_count'></div>"
						+"</button>"
				);
				infowindow.open(map, marker);
			}
		})(marker, i));
	
		if(marker)
		{
			marker.addListener('click', function() {
				map.setZoom(16);
				map.setCenter(this.getPosition());
				
			});
		}
	}  
	//다중마커s
	//////////////////////////////////////////////////////////////////////////
}

var showError = function(error){
	switch(error.code){
		case error.UNKNOWN_ERROR:
			span.innerHTML = "알수없는오류발생";break;
		case error.PERMISSION_DENIED:
			span.innerHTML = "권한이 없습니다";break;
		case error.POSITION_UNAVAILABLE:
			span.innerHTML = "위치 확인불가";break;
		case error.TIMEOUT:
			span.innerHTML = "시간초과";break;
	}
}

function like(l_num){
	
	var l_num = l_num;
	var count = $("#count").text();
	
	$.ajax({
		url : "like_action.do",
		type : "post",
		data : {
			l_num : l_num,
		},
		success : function(d){
			//recCount();
			if(d.statusCode==0){
				alert("추천 실패");
			}
			else if(d.statusCode==1){
				alert("추천이 완료되었습니다.");
				$("#count").text(d.l_count);
				//location.reload();
			}
		},
		error : function(e){
			alert("ajax 실패...!");
		}
	});
}



</script>

</head>
<body>
	<%@include file="../main/head.jsp" %> 
	<div class="topcontents">
		<div class="lefttop">
			<div class="lefttoptext">게시판</div>
		</div>
		<div class="righttop">
			<div class="righttoptext">주변 도서관 검색</div>
		</div>
	</div>
	<div class="contents" style="height:900px">
		<div class="leftmenu">
			<nav class="left1" >
				<ul class="navbar-nav1  bg-light ">
					<li class="nav-item1"><a class="nav-link" href="./board.do?bname=free">공부꿀팁<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="./board.do?bname=qna">질문있어요!<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="./board.do?bname=group">소모임구함<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="./library.do">내 주변 독서실<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
				</ul>
			</nav>
		</div>
		<div class="rightcontents">
			<span id="result" style="color:red; font-size:1.5em; font-weight:bold;"></span>
				<fieldset>
					<form name="searchFrm">
						<!-- 현재위치 위경도 입력상자 -->
						<input type="hidden" id="latTxt" name="latTxt" />
						<input type="hidden" id="lngTxt" name="lngTxt" />
						 내 주변
						<select name="distance" id="distance">
							<option value="1" <c:if test="${param.distance==1 }">selected</c:if>>1Km</option>
							<option value="5" <c:if test="${param.distance==5 }">selected</c:if>>5Km</option>
							<option value="10" <c:if test="${param.distance==10 }">selected</c:if>>10Km</option>
							<option value="20" <c:if test="${param.distance==20 }">selected</c:if>>20Km</option>
							<option value="30" <c:if test="${param.distance==30 }">selected</c:if>>30Km</option>
							<option value="40" <c:if test="${param.distance==40 }">selected</c:if>>40Km</option>
						</select>
						 반경 내 도서관
						<Button type="submit" class="btn btn-info">검색하기</Button>
					</form>
				</fieldset>
				
				<div id="map"></div>
				<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAlhPQMCg8LPtFXgfQGPu87K7m6OsFn9Wg"></script>
		</div>
	</div>
	
	<%@include file="../main/bottom.jsp" %>
</body>
</html>