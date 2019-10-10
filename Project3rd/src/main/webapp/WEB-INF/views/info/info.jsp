
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="style/leftmenustyle.css" />
<link rel="stylesheet" href="style/basic.css" />
<link rel="stylesheet" href="style/info.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript">



//체크박스 동작 구현 (전체 선택 <--> 개별선택)
//지역
function locationList_onclick(lct){
	
	if($(lct).attr("id") == "chk_location_all"){
		$("#chk_location_all").prop("checked",true);
		$("input[id^='chk_location']:not(input[id='chk_location_all'])").prop("checked",false);
	}else{
		
		$("#chk_location_all").prop("checked",false);
		var chk_location_list = $("input[id^='chk_location']:checked").get();
		
		if(chk_location_list.length < 1){
			$("#chk_location_all").prop("checked",true);
		}
	}	
	
	//전문대
	if($(lct).attr("id") == "j_chk_location_all"){
		$("#j_chk_location_all").prop("checked",true);
		$("input[id^='j_chk_location']:not(input[id='j_chk_location_all'])").prop("checked",false);
	}else{
		
		$("#j_chk_location_all").prop("checked",false);
		var chk_location_list = $("input[id^='j_chk_location']:checked").get();
		
		if(chk_location_list.length < 1){
			$("#j_chk_location_all").prop("checked",true);
		}
	}	
}

//설립유형
function ptypeList_onclick(ptype){
	//일반대
	if($(ptype).attr("id") == "chk_ptype_all"){
		$("#chk_ptype_all").prop("checked",true);
		$("input[id^='chk_ptype']:not(input[id='chk_ptype_all'])").prop("checked",false);
	}else{
		
		$("#chk_ptype_all").prop("checked",false);
		var chk_ptype_list = $("input[id^='chk_ptype']:checked").get();
		
		if(chk_ptype_list.length < 1){
			$("#chk_ptype_all").prop("checked",true);
		}
	}		
	
	//전문대
	if($(ptype).attr("id") == "j_chk_ptype_all"){
		$("#j_chk_ptype_all").prop("checked",true);
		$("input[id^='j_chk_ptype']:not(input[id='j_chk_ptype_all'])").prop("checked",false);
	}else{
		
		$("#j_chk_ptype_all").prop("checked",false);
		var chk_ptype_list = $("input[id^='j_chk_ptype']:checked").get();
		
		if(chk_ptype_list.length < 1){
			$("#j_chk_ptype_all").prop("checked",true);
		}
	}			
}



//폼값 전달하기 
function checkboxFrm(fn){
	
	var fn = document.checkFrm;
	

	fn.action="./checkAction.do";
	fn.method = "get";
	fn.submit(); 
	
}


function utypeClick(){

	$('#tbResult').empty();
	$('#tbResult2').empty();
	
 }

function click_interest(uname,id){
	var member_id = "<%=(String)session.getAttribute("siteUserInfo")%>"

		$.ajax({
			url : "./interest_chk.do",
			type : 'POST',
			dataType : "html",
			data :{
				   uname : uname,
				   id : id
			},
			success : function(){
				$("#noheart"+uname).toggle();
				$("#heart"+uname).toggle();
				
				
				$("#noheart2"+uname).toggle();
				$("#heart2"+uname).toggle();
		
				alert("관심대학 설정되었습니다.")
			
			
			},
			error : function(e){
				alert("이미 등록된 관심대학입니다"+e.status)
			
				
			}
			
		});
	
		

}


function click_nointerest(uname,id){

	$.ajax({
		url : "./interest_unchk.do",
		type : 'GET',
		contentType: "application/json",
		dataType : "html",
		data :{
			uname : uname,
			   id : id
		},
		success : function(){
			
			$("#heart"+uname).toggle();
			$("#noheart"+uname).toggle();
			
			$("#heart2"+uname).toggle();
			$("#noheart2"+uname).toggle();
			

			alert("관심대학 설정이 취소되었습니다.")
			
	
		
		},
		error : function(e){
			alert("실패"+e.status)
			alert("대학정보"+uname)
				alert("id"+id)
		
		}
	});
	
}


</script>
<style type="text/css">
	.lefttoptext{margin:0 auto;font-size:25px;font-weight:bold;margin-top:10px;}
	.righttoptext{margin:0 auto;font-size:40px;font-weight:bold;}
	#hidden{display: none;}
</style>


</head>
<body>
	<%@include file="../main/head.jsp" %> 
	<div class="topcontents">
		<div class="lefttop">
        	 <div class="lefttoptext">대학간다</div>
      	</div>

      <div class="righttop">
         <div class="righttoptext">대학 검색</div>
      </div>
	</div>


	<div class="contents" style="height: 1000px;">
		<div class="leftmenu">
			<nav class="left1" >
				<ul class="navbar-nav1  bg-light ">
					<li class="nav-item1"><a class="nav-link" href="info.do">대학검색<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="hsearch.do">학과검색<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="jsearch.do">전형검색<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					
				</ul>
			</nav>
		</div>
		
		<div class="rightcontents">
			<ul class="nav nav-tabs">
				<li class="nav-item">
					<a class="nav-link active" data-toggle="tab" href="#ilban" id="u_type" onclick="javascript:utypeClick()" >일반대학교</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#junmun" id="u_type" onclick="javascript:utypeClick()">전문대학교</a>
				</li>
			</ul>
			
			<div class="tab-content">
					<!-- 일반대학교 시작 -->
				<div id="ilban" class="container tab-pane active"><br/>
				
			 <form id="checkFrm" name="checkFrm" method="get" onsubmit="return checkboxFrm();">
					<div class="search_tbl_box" >
						<fieldset>
							<!-- 대학 -->
							<div class="tbl_wrap">
								<input type="hidden" id="u_type" name="u_type" value="일반대" />
								<table class="search_tbl01">
									<colgroup>
										<col style="width:8%;">
										<col>
										<col style="width:80%;">
									</colgroup>
									<tbody style="border-bottom: 1px solid #ddd;">
										<tr>
											<th scope="col">
												<label for="univ_nm">대학</label>
											</th>
											<td colspan="2">
												<input id="searchWord" name="searchWord" title="대학명검색" placeholder="대학명을 입력해주세요." type="text" value="" maxlength="30">
												
														<button type="submit" title="검색" class="btn btn-default btn-sm btn btn-outline-dark" style="border-color: #783712" onclick="javascript:btn_search_onclick_init()">
															<i class="fa fa-search" style="color:#783712 "></i>&nbsp;<b>검색</b>
														</button>
											
											</td>
										</tr>
									</tbody>
								
							
									<tbody id="tbDetail" style="">
										<tr>
											<th scope="col" rowspan="2">
												<label for="uv">대학<br>조건</label>
											</th>
										
											<td class="tt">지역</td>
											<td>
												<input type="checkbox" name="location" id="chk_location_all" value="" checked="checked" onclick="locationList_onclick(this);"><label for="chk_location_all">전체</label>
												<input type="checkbox" name=location id="chk_location_1" value="강원" onclick="locationList_onclick(this);"><label for="chk_location_1">강원</label>
												<input type="checkbox" name="location" id="chk_location_2" value="경기" onclick="locationList_onclick(this);"><label for="chk_location_2">경기</label>
												<input type="checkbox" name="location" id="chk_location_3" value="경남" onclick="locationList_onclick(this);"><label for="chk_location_3">경남</label>
												<input type="checkbox" name="location" id="chk_location_4" value="경북" onclick="locationList_onclick(this);"><label for="chk_location_4">경북</label>
												<input type="checkbox" name="location" id="chk_location_5" value="광주" onclick="locationList_onclick(this);"><label for="chk_location_5">광주</label>
												<input type="checkbox" name="location" id="chk_location_6" value="대구" onclick="locationList_onclick(this);"><label for="chk_location_6">대구</label>
												<input type="checkbox" name="location" id="chk_location_7" value="대전" onclick="locationList_onclick(this);"><label for="chk_location_7">대전</label>
												<input type="checkbox" name="location" id="chk_location_8" value="부산" onclick="locationList_onclick(this);"><label for="chk_location_8">부산</label>
												<br/>
												<input type="checkbox" name="location" id="chk_location_9" value="서울" onclick="locationList_onclick(this);"><label for="chk_location_9">서울</label>
												<input type="checkbox" name="location" id="chk_location_10" value="세종" onclick="locationList_onclick(this);"><label for="chk_location_10">세종</label>
												<input type="checkbox" name="location" id="chk_location_11" value="울산" onclick="locationList_onclick(this);"><label for="chk_location_11">울산</label>
												<input type="checkbox" name="location" id="chk_location_12" value="인천" onclick="locationList_onclick(this);"><label for="chk_location_12">인천</label>
												<input type="checkbox" name="location" id="chk_location_13" value="전남" onclick="locationList_onclick(this);"><label for="chk_location_13">전남</label>
												<input type="checkbox" name="location" id="chk_location_14" value="전북" onclick="locationList_onclick(this);"><label for="chk_location_14">전북</label>
												<input type="checkbox" name="location" id="chk_location_15" value="제주" onclick="locationList_onclick(this);"><label for="chk_location_15">제주</label>
												<input type="checkbox" name="location" id="chk_location_16" value="충남" onclick="locationList_onclick(this);"><label for="chk_location_16">충남</label>
												<input type="checkbox" name="location" id="chk_location_17" value="충북" onclick="locationList_onclick(this);"><label for="chk_location_17">충북</label>
											
											</td>
										</tr>
										
										
										
										<tr>
											<td class="tt">설립유형</td>
											<td>
											
		            							<input type="checkbox" name="p_type" id="chk_ptype_all" value="" checked="checked" onclick="ptypeList_onclick(this)"><label for="chk_ptype_all">전체</label>
												<input type="checkbox" name="p_type" id="chk_ptype_1" value="국공립" onclick="ptypeList_onclick(this)"><label for="chk_ptype_1">국공립</label>
												<input type="checkbox" name="p_type" id="chk_ptype_2" value="사립" onclick="ptypeList_onclick(this)"><label for="chk_ptype_3">사립</label>
		            							
		            					
											</td>
										</tr>
										
										
									
									</tbody>
									
									<tbody id="tbSimple" class="tbl_fold" style="display: none;">
										<tr>
											<th scope="col"><label for="uv">대학<br>조건</label></th>
											<td colspan="2" onclick="fn_box_out()">
												<span class="tt_fold first">지역</span><span id="location_view"></span>
												<span class="tt_fold">설립유형</span><span id="ptype_view"></span><br>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- //대학 -->
						</fieldset>
					</div>
					<!-- 조건박스 -->
					
					<!-- search_tbl_box -->
					<div class="search_box_btn">
						<button type="submit" title="검색" class="btn_searchAll btn btn-dark" >검색</button>
					</div>
		 </form>	
					
					
					<!-- 대학리스트 -->
				<div class="tbl_list">
					<br>
					
		
					<table class="list_tbl01">
						<caption>검색버튼을 눌러주세요</caption>
						<input type="hidden" name="id" id="${siteUserInfo }" value="${siteUserInfo }"/>
						<colgroup>
							<col style="width:70px;">
							<col style="width:70px;">
							<col style="width:70px;">
							<col style="width:70px;">
							<col style="width:70px;">
							<col style="width:70px;">
							<col style="width:70px;">
							<col style="width:70px;">
							<col style="width:40px;">
						</colgroup>
						<thead style="border-bottom: 1px solid #ddd;">
							<tr style="border-bottom: none;">
							
								<th id="hidden" scope="col" rowspan="2">대학</th>
								<th scope="col" rowspan="2">대학명</th>
								<th scope="col" rowspan="2">지역</th>
								<th scope="col" rowspan="2">경쟁률</th>
								<th scope="col" rowspan="2">입학정원</th>
								<th scope="col" rowspan="2">취업률</th>
								<th scope="col" rowspan="2">평균등록금</th>
								<th scope="col" rowspan="2">설치학과</th>
								<th scope="col" rowspan="2">전형정보</th>
								<c:if test="${sessionScope.siteUserInfo ne null}">
									<th scope="col" rowspan="2">관심설정</th>
								</c:if>
							</tr>
						</thead>
						<tbody id="tbResult" >
						
							<c:forEach items="${lists }" var="row" >
										<tr>
										</tr>
										<tr>
											<td id="hidden" scope="col" rowspan="2">${row.u_type}</td>			
											<td scope="col" rowspan="2">${row.uname}</td>
											<td scope="col" rowspan="2">${row.location}</td>
											<td scope="col" rowspan="2">${row.rate_univ}</td>
											<td scope="col" rowspan="2">${row.totalman}</td>
											<td scope="col" rowspan="2">${row.jobrate}</td>
											<td scope="col" rowspan="2">${row.tuition}</td>
											<td scope="col" rowspan="2">${row.major_num}</td>
											<td scope="col" rowspan="2">${row.enter_num}</td>
											<c:if test="${sessionScope.siteUserInfo ne null}">
												
											<!-- 회원이라 관심항목 보여짐   -->
												<td scope="col" rowspan="2">
													
														<c:choose>
															<c:when test="${row.id=='null'}">
																<i onclick="click_interest('${row.uname}','${siteUserInfo }');" id="noheart${row.uname}" class="far fa-star" style='font-size:24px'></i>
																<i onclick="click_nointerest('${row.uname}','${siteUserInfo }');" id="heart${row.uname}" class="fas fa-star" style='display:none; font-size:24px'></i>
															</c:when>
															<c:when test="${row.univ_uname !=null}"> 
															<!-- 관심항목에 대학이름이 추가되어있으면 검은하트로 표시한다  -->
																<i onclick="click_nointerest('${row.uname}','${siteUserInfo }');" id="heart${row.uname}" class="fas fa-star" style='font-size:24px'></i>
																<i onclick="click_interest('${row.uname}','${siteUserInfo }');" id="noheart${row.uname}" class="far fa-star" style='display:none; font-size:24px'></i>
															</c:when>
															
															<c:otherwise>
																<i onclick="click_interest('${row.uname}','${siteUserInfo }');" id="noheart${row.uname}" class="far fa-star" style='font-size:24px'></i>
																<i onclick="click_nointerest('${row.uname}','${siteUserInfo }');" id="heart${row.uname}" class="fas fa-star" style='display:none; font-size:24px'></i>
															</c:otherwise>
															
														</c:choose>
												
												</td>
											</c:if>
										</tr>
							</c:forEach>
						
								<div style="width:100%;">
									  <ul class="pagination pagination-sm" style="color: black;">
									   ${pagingImg }
									  </ul>
								</div>
						</tbody>
					</table>
				</div>
				<!-- //대학리스트 -->
				
				
		
			</div><!-- 일반대학교 끝 -->
			
			
			<!-- 전문대학교 시작 -->
				<div id="junmun" class="container tab-pane fade" onclick="javascript:utypeClick();"><br/>
					<form id="checkfrm" name="checkfrm" action="./checkAction.do" method="get" onsubmit="return checkboxFrm();">
					<div class="search_tbl_box" >
						<fieldset>
							<!-- 대학 -->
							<div class="tbl_wrap">
						<input type="hidden" id="u_type" name="u_type" value="전문대" />
								<table class="search_tbl01">
									<colgroup>
										<col style="width:8%;">
										<col>
										<col style="width:80%;">
									</colgroup>
									<tbody style="border-bottom: 1px solid #ddd;">
										<tr>
											<th scope="col">
												<label for="uname">대학</label>
											</th>
											<td colspan="2">
												<input id="searchWord" name="searchWord" title="대학명검색" placeholder="대학명을 입력해주세요." type="text" value="" maxlength="30">
												
														<button type="submit" title="검색" class="btn btn-default btn-sm btn btn-outline-dark" style="border-color: #783712" onclick="javascript:btn_search_onclick_init()">
															<i class="fa fa-search" style="color:#783712 "></i>&nbsp;<b>검색</b>
														</button>
											</td>
										</tr>
									</tbody>
								
							
									<tbody id="tbDetail" style="">
										<tr>
											<th scope="col" rowspan="5">
												<label for="uv">대학<br>조건</label>
											</th>
										
											<td class="tt">지역</td>
												<td>
												<input type="checkbox" name="location" id="j_chk_location_all" value="" checked="checked" onclick="locationList_onclick(this);"><label for="chk_location_all">전체</label>
												<input type="checkbox" name=location id="j_chk_location_1" value="강원" onclick="locationList_onclick(this);"><label for="chk_location_1">강원</label>
												<input type="checkbox" name="location" id="j_chk_location_2" value="경기" onclick="locationList_onclick(this);"><label for="chk_location_2">경기</label>
												<input type="checkbox" name="location" id="j_chk_location_3" value="경남" onclick="locationList_onclick(this);"><label for="chk_location_3">경남</label>
												<input type="checkbox" name="location" id="j_chk_location_4" value="경북" onclick="locationList_onclick(this);"><label for="chk_location_4">경북</label>
												<input type="checkbox" name="location" id="j_chk_location_5" value="광주" onclick="locationList_onclick(this);"><label for="chk_location_5">광주</label>
												<input type="checkbox" name="location" id="j_chk_location_6" value="대구" onclick="locationList_onclick(this);"><label for="chk_location_6">대구</label>
												<input type="checkbox" name="location" id="j_chk_location_7" value="대전" onclick="locationList_onclick(this);"><label for="chk_location_7">대전</label>
												<input type="checkbox" name="location" id="j_chk_location_8" value="부산" onclick="locationList_onclick(this);"><label for="chk_location_8">부산</label>
												<br/>
												<input type="checkbox" name="location" id="j_chk_location_9" value="서울" onclick="locationList_onclick(this);"><label for="chk_location_9">서울</label>
												<input type="checkbox" name="location" id="j_chk_location_10" value="세종" onclick="locationList_onclick(this);"><label for="chk_location_10">세종</label>
												<input type="checkbox" name="location" id="j_chk_location_11" value="울산" onclick="locationList_onclick(this);"><label for="chk_location_11">울산</label>
												<input type="checkbox" name="location" id="j_chk_location_12" value="인천" onclick="locationList_onclick(this);"><label for="chk_location_12">인천</label>
												<input type="checkbox" name="location" id="j_chk_location_13" value="전남" onclick="locationList_onclick(this);"><label for="chk_location_13">전남</label>
												<input type="checkbox" name="location" id="j_chk_location_14" value="전북" onclick="locationList_onclick(this);"><label for="chk_location_14">전북</label>
												<input type="checkbox" name="location" id="j_chk_location_15" value="제주" onclick="locationList_onclick(this);"><label for="chk_location_15">제주</label>
												<input type="checkbox" name="location" id="j_chk_location_16" value="충남" onclick="locationList_onclick(this);"><label for="chk_location_16">충남</label>
												<input type="checkbox" name="location" id="j_chk_location_17" value="충북" onclick="locationList_onclick(this);"><label for="chk_location_17">충북</label>
											
											</td>
										</tr>
										
										<tr>
											<td class="tt">설립유형</td>
											<td>
											
		            							<input type="checkbox" name="p_type" id="j_chk_ptype_all" value="" checked="checked" onclick="ptypeList_onclick(this)"><label for="chk_ptype_all">전체</label>
												<input type="checkbox" name="p_type" id="j_chk_ptype_1" value="국공립" onclick="ptypeList_onclick(this)"><label for="chk_ptype_1">국공립</label>
												<input type="checkbox" name="p_type" id="j_chk_ptype_2" value="사립" onclick="ptypeList_onclick(this)"><label for="chk_ptype_3">사립</label>
		            							
		            					
											</td>
										</tr>
										
									</tbody>
									
									<tbody id="tbSimple" class="tbl_fold" style="display: none;">
										<tr>
											<th scope="col"><label for="uv">대학<br>조건</label></th>
											<td colspan="2" onclick="fn_box_out()">
												<span class="tt_fold first">지역</span><span id="location_view"></span>
												<span class="tt_fold">설립유형</span><span id="ptype_view"></span><br>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- //대학 -->
						</fieldset>
					</div>
					<!-- 조건박스 -->
					
					<!-- search_tbl_box -->
					<div class="search_box_btn">
						<button type="submit" title="검색" class="btn_searchAll btn btn-dark" >검색</button>
					</div>
		</form>
					
					
					<!-- 대학리스트 -->
				<div class="tbl_list">
					<br>
					
	
					<table class="list_tbl01" id="result_list">
						<caption>검색버튼을 눌러주세요</caption>
						<input type="hidden" name="id" id="${siteUserInfo }" value="${siteUserInfo }"/>
						<colgroup>
							<col style="width:70px;">
							<col style="width:70px;">
							<col style="width:70px;">
							<col style="width:70px;">
							<col style="width:70px;">
							<col style="width:70px;">
							<col style="width:70px;">
							<col style="width:70px;">
							<col style="width:70px;">
							<col style="width:40px;">
							
						</colgroup>
						<thead style="border-bottom: 1px solid #ddd;">
							<tr style="border-bottom: none;">
								<th id="hidden" scope="col" rowspan="2">대학</th>
								<th scope="col" rowspan="2">대학명</th>
								<th scope="col" rowspan="2">지역</th>
								<th scope="col" rowspan="2">경쟁률</th>
								<th scope="col" rowspan="2">입학정원</th>
								<th scope="col" rowspan="2">취업률</th>
								<th scope="col" rowspan="2">평균등록금</th>
								<th scope="col" rowspan="2">설치학과</th>
								<th scope="col" rowspan="2">전형정보</th>
								<c:if test="${sessionScope.siteUserInfo ne null}">
									<th scope="col" rowspan="2">관심설정</th>
								</c:if>
							</tr>
						</thead>
						<tbody id="tbResult2">
							<c:forEach items="${lists }" var="row">
								<tr>
								</tr>
								<tr>
									<td id="hidden" scope="col" rowspan="2">${row.u_type}</td>			
									<td scope="col" rowspan="2">${row.uname}</td>
									<td scope="col" rowspan="2">${row.location}</td>
									<td scope="col" rowspan="2">${row.rate_univ}</td>
									<td scope="col" rowspan="2">${row.totalman}</td>
									<td scope="col" rowspan="2">${row.jobrate}</td>
									<td scope="col" rowspan="2">${row.tuition}</td>
									<td scope="col" rowspan="2">${row.major_num}</td>
									<td scope="col" rowspan="2">${row.enter_num}</td>
									<c:if test="${sessionScope.siteUserInfo ne null}">
										<td scope="col" rowspan="2">
											<c:choose>
												<c:when test="${row.univ_uname !=null}" >
													<i onclick="click_nointerest('${row.uname}','${siteUserInfo }');" id="heart2${row.uname }" class="fas fa-star" style='font-size:24px'></i>
													<i onclick="click_interest('${row.uname}','${siteUserInfo }');" id="noheart2${row.uname }" class="far fa-star" style='display:none;font-size:24px'></i>
												</c:when>
												<c:when test="${id == 'null'}">
													<i onclick="click_nointerest('${row.uname}','${siteUserInfo }');" id="heart2${row.uname }" class="fas fa-star" style='font-size:24px'></i>
													<i onclick="click_interest('${row.uname}','${siteUserInfo }');" id="noheart2${row.uname }" class="far fa-star" style='display:none;font-size:24px'></i>
												</c:when>
												<c:otherwise>
													<i onclick="click_interest('${row.uname}','${siteUserInfo }');" id="noheart2${row.uname }" class="far fa-star" style='font-size:24px'></i>
													<i onclick="click_nointerest('${row.uname}','${siteUserInfo }');" id="heart2${row.uname }" class="fas fa-star" style='display:none; font-size:24px'></i>
												</c:otherwise>
											</c:choose>
										</td>
									</c:if>
								</tr>
							</c:forEach>
							
							<!-- 페이징 -->
						    	<div style="width:100%;">
									<ul class="pagination pagination-sm" style="color: black;">
										 ${pagingImg }
									 </ul>
								</div>
							<!-- //페이징 -->
						</tbody>
					</table>

				</div>
				<!-- //대학리스트 -->
		
			</div>
		</div><!-- tab-content  -->

	</div><!-- rightcontents  -->
</div><!-- contents -->
	<%@include file="../main/bottom.jsp" %>


</body>
</html>