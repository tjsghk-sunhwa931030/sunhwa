
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="style/leftmenustyle.css" />
<link rel="stylesheet" href="style/basic.css" />
<link rel="stylesheet" href="style/info.css" />

<style type="text/css">
.lefttoptext {
	margin: 0 auto;
	font-size: 25px;
	font-weight: bold;
	margin-top: 10px;
}

.righttoptext {
	margin: 0 auto;
	font-size: 40px;
	font-weight: bold;
}

.contents {
	height: 1000px;
}

#hidden {
	display: none;
}
</style>


<script type="text/javascript">
//지역 체크박스
function locationList_onclick(lct){
	
	if($(lct).attr("id") == "chk_location_all"){
		$("#chk_location_all").prop("checked",true);
		$("input[id^='chk_location']:not(input[id='chk_location_all'])").prop("checked",false);
	}
	else{		
		$("#chk_location_all").prop("checked",false);
		var chk_location_list = $("input[id^='chk_location']:checked").get();
		
		if(chk_location_list.length < 1){
			$("#chk_location_all").prop("checked",true);
		}
	}	
	
	
	if($(lct).attr("id") == "j_chk_location_all"){
		$("#j_chk_location_all").prop("checked",true);
		$("input[id^='j_chk_location']:not(input[id='j_chk_location_all'])").prop("checked",false);
	}
	else{		
		$("#j_chk_location_all").prop("checked",false);
		var chk_location_list = $("input[id^='j_chk_location']:checked").get();
		
		if(chk_location_list.length < 1){
			$("#j_chk_location_all").prop("checked",true);
		}
	}	
}
//폼값 전달하기
function checkboxFrm(fn){
	
	var fn = document.checkFrm;
	
	var lst_location_list = [];
	var locationlist = $("input[id^='chk_location']:checked").get();
	$.each(locationlist, function(index, item){
		var location = item.value.toString();	
		lst_location_list[index] = location;
	});
}

function utypeClick(){
	$('#tbResult').empty();
	$('#tbResult').empty();
}
 
 
 //대계열 선택 
function ch_major(maj){

	 document.getElementById('major1').value =maj;
		
		$("#button2").click(function(){
			$.ajax({
				url : "./CallMajor2.do",
				dataType : "html",
				data : {
					major1 : maj
				},
				success : function(maj2){
					
					$('#maj2div').append(maj2);
					
					document.getElementById('major2').value = maj2;
					
					
				},
				error : function(e){
					alert("실패"+e.status)
				}
			
			});
		});

}
//일반대만 사용 > 중계열에서 선택
function ch_major2(maj2){
		
	document.getElementById('major2').value =maj2;
	var maj= document.getElementById('major1').value;
	
	$('#button3').click(function(){
		$.ajax({
			url : "./CallMajor3.do",
			dataType : "html",
			data : {
				major1: maj,
				major2 : maj2
			},
			success : function(maj3){
				$('#maj3div').append(maj3);
				//document.getElementById('major3').value = maj3;
			},
			error : function(e){
				alert("실패"+e.status)
			}
		});
	});
}

function ch_major3(maj3){
	
	document.getElementById('major3').value =maj3;
	document.getElementById('major').value =maj3;
	
	var maj= document.getElementById('major1').value;
	var maj2= document.getElementById('major2').value;

}


</script>

</head>
<body>
	<%@include file="../main/head.jsp"%>
	<div class="topcontents">
		<div class="lefttop">
			<div class="lefttoptext">대학간다</div>
		</div>
		<div class="righttop">
			<div class="righttoptext">학과 검색</div>
		</div>
	</div>
	<div class="contents" style="height: 1500px;">
		<div class="leftmenu">
			<nav class="left1">
				<ul class="navbar-nav1  bg-light ">
					<li class="nav-item1"><a class="nav-link" href="info.do">대학검색<i class='fas fa-chevron-circle-right' style='margin-top: 4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="hsearch.do">학과검색<i class='fas fa-chevron-circle-right' style='margin-top: 4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="jsearch.do">전형검색<i class='fas fa-chevron-circle-right' style='margin-top: 4px;'></i></a></li>

				</ul>
			</nav>
		</div>
		<div class="rightcontents">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active"
					data-toggle="tab" href="#ilban" id="u_type"
					onclick="javascript:utypeClick()">일반대학교</a></li>
				<li class="nav-item"><a class="nav-link" data-toggle="tab"
					href="#junmun" id="u_type" onclick="javascript:utypeClick()">전문대학교</a>
				</li>
			</ul>

			<div class="tab-content">
				<!-- 일반대학교 시작 -->
				<div id="ilban" class="container tab-pane active" onclick="javascript:utypeClick();">
					<br />
	<!-- 일반대 -->	<form id="checkFrm" name="checkFrm" action="./checkAction2.do"
						method="get" onsubmit="return checkboxFrm();">
						<div class="search_tbl_box">
							<fieldset>
								<!-- 학과 -->
								<div class="tbl_wrap">
			<!-- 일반대 -->		<input type="hidden" id="u_type" name="u_type" value="일반대" />
									<table class="search_tbl01">
										<%-- <caption>검색박스</caption> --%>
										<colgroup>
											<col style="width: 8%;">
											<col>
											<col style="width: 80%;">
										</colgroup>
										<tbody id="tbsersDetail">
											<tr>
												<th scope="col"><label for="univ_nm">대학</label></th>
												<td colspan="2">
												<input id="searchWord" name="searchWord" title="대학명검색" placeholder="대학명을 입력해주세요." type="text" value="" maxlength="30">
													<button type="submit" title="검색" class="btn btn-default btn-sm btn btn-outline-dark" style="border-color: #783712" onclick="javascript:btn_search_onclick_init()">
														<i class="fa fa-search" style="color: #783712"></i>&nbsp;<b>검색</b>
													</button></td>
											</tr>
											<tr>
												<th scope="row" rowspan="2"><label for="uv">학과</label></th>

												<td colspan="2">
													<input id="major" name="major" title="학과검색어"  onkeypress="if(event.keyCode==13){btn_search_keyword_init();}" 
													style="ime-mode: active" placeholder="학과관련 키워드" class="search_input" type="text" value="" maxlength="30">
													<button title="검색" class="btn btn-default btn-sm btn btn-outline-dark" style="border-color: #783712">
														<i class="fa fa-search" style="color: #783712"></i>&nbsp;<b>검색</b>
													</button>
												</td>
											</tr>
											<tr>
												<td colspan="2" class="list_wrap">

													<div class="box_wrap" id="searchBox">
														<div class="list box01" class="dropdown">
															<button type="submit" class="btn btn-default dropdown-toggle" data-toggle="dropdown">대학분류 [대계열]</button>
															<div class="menu dropdown-menu" >
																<c:forEach var="col" items="${listsM1}">
																		<a class="dropdown-item"  onclick="ch_major('${col.major1}');">${col.major1}</a>
																</c:forEach>
															</div><br /> 
																<input style="margin-top:5px; margin-left:4px; width: 98%" type="text" id="major1" name="major1" value="" />
														</div>
														
														<div class="list box02" class="dropdown">
															<button type="button" id="button2" class="btn btn-default dropdown-toggle" data-toggle="dropdown">대학분류 [중계열]</button>
															<div class="menu dropdown-menu" id="maj2div" ></div>
															<br /> 
																<input style="margin-top:5px; margin-left:4px; width: 98%" type="text" id="major2" name="major2" value="" />
														</div>
														
														<div class="list box04" class="dropdown">
															<button type="button" id="button3" class="btn btn-default dropdown-toggle" data-toggle="dropdown">학과명</button>
															<div class="menu dropdown-menu" id="maj3div"></div>	
															<br/>
																<input style="margin-top:5px; margin-left:5px; width: 98%" type="text" id="major3" name="major" value=""  />
														</div>
														
													</div> 
													
												</td>
											</tr>
											
											<tr>
												<th scope="row" rowspan="2"><label for="uv">지역</label>
												</th>

											</tr>
											<tr>
												<td>
												</td>
												<td>
													<input type="checkbox" name="location"id="chk_location_all" value="" checked="checked" onclick="locationList_onclick(this);">
													<label for="chk_location_all">전체</label> 
													<input type="checkbox" name=location id="chk_location_1" value="강원" onclick="locationList_onclick(this);">
													<label for="chk_location_1">강원</label> 
													<input type="checkbox" name="location" id="chk_location_2" value="경기" onclick="locationList_onclick(this);">
													<label for="chk_location_2">경기</label> 
													<input type="checkbox" name="location" id="chk_location_3" value="경남" onclick="locationList_onclick(this);">
													<label for="chk_location_3">경남</label> 
													<input type="checkbox" name="location" id="chk_location_4" value="경북" onclick="locationList_onclick(this);">
													<label for="chk_location_4">경북</label> 
													<input type="checkbox" name="location" id="chk_location_5" value="광주" onclick="locationList_onclick(this);">
													<label for="chk_location_5">광주</label> 
													<input type="checkbox" name="location" id="chk_location_6" value="대구" onclick="locationList_onclick(this);">
													<label for="chk_location_6">대구</label> 
													<input type="checkbox" name="location" id="chk_location_7" value="대전" onclick="locationList_onclick(this);">
													<label for="chk_location_7">대전</label>
													<input type="checkbox" name="location" id="chk_location_8" value="부산" onclick="locationList_onclick(this);">
													<label for="chk_location_8">부산</label> 
													<br /> 
													<input type="checkbox" name="location" id="chk_location_9" value="서울" onclick="locationList_onclick(this);">
													<label for="chk_location_9">서울</label> 
													<input type="checkbox" name="location" id="chk_location_10" value="세종" onclick="locationList_onclick(this);">
													<label for="chk_location_10">세종</label> 
													<input type="checkbox" name="location" id="chk_location_11" value="울산" onclick="locationList_onclick(this);">
													<label for="chk_location_11">울산</label> 
													<input type="checkbox" name="location" id="chk_location_12" value="인천" onclick="locationList_onclick(this);">
													<label for="chk_location_12">인천</label> 
													<input type="checkbox" name="location" id="chk_location_13" value="전남" onclick="locationList_onclick(this);">
													<label for="chk_location_13">전남</label> 
													<input type="checkbox" name="location" id="chk_location_14" value="전북" onclick="locationList_onclick(this);">
													<label for="chk_location_14">전북</label> 
													<input type="checkbox" name="location" id="chk_location_15" value="제주" onclick="locationList_onclick(this);">
													<label for="chk_location_15">제주</label> 
													<input type="checkbox" name="location" id="chk_location_16" value="충남" onclick="locationList_onclick(this);">
													<label for="chk_location_16">충남</label> 
													<input type="checkbox" name="location" id="chk_location_17" value="충북" onclick="locationList_onclick(this);">
													<label for="chk_location_17">충북</label>
												</td>
											</tr>
										</tbody>

									</table>
								</div>
							</fieldset>
						</div>
						<!-- 조건박스 -->

						<!-- search_tbl_box -->
						<div class="search_box_btn">
							<button type="submit" title="검색"
								class="btn_searchAll btn btn-dark">검색</button>
						</div>


					</form>

					<!-- 대학리스트 -->
					<div class="tbl_list">
						<br>
						<table class="list_tbl01">
							<caption>검색버튼을 눌러주세요</caption>
							<colgroup>
								<col>
								<col style="width: 80px;">
								<col style="width: 70px;">
								<col style="width: 60px;">
								<col style="width: 70px;">
								<col style="width: 60px;">
								<col style="width: 60px;">
								<col style="width: 80px;">
							</colgroup>

							<thead style="border-bottom: 1px solid #ddd;">
								<tr style="border-bottom: none;">
									<th scope="col" rowspan="2">학과명</th>
									<th scope="col" rowspan="2">대학명</th>
									<th scope="col" rowspan="2">지역</th>
									<th scope="col" rowspan="2">입학 정원</th>
									<th scope="col" rowspan="2">취업률</th>
									<th scope="col" colspan="2">전년도 최저</th>
								</tr>
								<tr>
									<th>수시</th>
									<th>정시</th>
								</tr>
							</thead>

							<tbody id="tbResult">
								<c:forEach items="${listsH }" var="rowh">
									<tr>
									</tr>
									<tr>
										<td id="hidden" scope="col" rowspan="2">${rowh.u_type}</td>
										<td scope="col" rowspan="2">${rowh.major}</td>
										<td scope="col" rowspan="2">${rowh.uname}</td>
										<td scope="col" rowspan="2">${rowh.location}</td>
										<td scope="col" rowspan="2">${rowh.majorman}</td>
										<td scope="col" rowspan="2">${rowh.mjobrate}</td>
										<td scope="col" rowspan="2">${rowh.lastminis}</td>
										<td scope="col" rowspan="2">${rowh.lastminij}</td>
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
				</div>
				<!-- 일반대학교 끝 -->


				<!-- 전문대학교 시작 -->
				<div id="junmun" class="container tab-pane fade"
					onclick="javascript:utypeClick();">
					<br />
					<form id="checkfrm1" name="checkfrm1" action="./checkAction2.do"
						method="get" onsubmit="return checkboxFrm();">
						<div class="search_tbl_box">
							<fieldset>
								<!-- 학과 -->
								<div class="tbl_wrap">
				<!-- 전문대 -->		<input type="hidden" id="u_type" name="u_type" value="전문대" />
									<table class="search_tbl01">
										<%-- <caption>검색박스</caption> --%>
										<colgroup>
											<col style="width: 8%;">
											<col>
											<col style="width: 80%;">
										</colgroup>
										<tbody id="tbsersDetail">
											<tr>
												<th scope="col"><label for="univ_nm">대학</label></th>
												<td colspan="2">
												<input id="searchWord" name="searchWord" title="대학명검색" placeholder="대학명을 입력해주세요." type="text" value="" maxlength="30">
													<button type="submit" title="검색" class="btn btn-default btn-sm btn btn-outline-dark" style="border-color: #783712" onclick="javascript:btn_search_onclick_init()">
														<i class="fa fa-search" style="color: #783712"></i>&nbsp;<b>검색</b>
													</button></td>
											</tr>
											<tr class="bor_no">
												<th scope="row" rowspan="2"><label for="uv">학과</label>
												</th>

												<td colspan="2">
													<input id="major" name="major" title="학과검색어"  onkeypress="if(event.keyCode==13){btn_search_keyword_init();}" 
													style="ime-mode: active" placeholder="학과관련 키워드" class="search_input" type="text" value="" maxlength="30">
													<button title="검색" class="btn btn-default btn-sm btn btn-outline-dark" style="border-color: #783712">
														<i class="fa fa-search" style="color: #783712"></i>&nbsp;<b>검색</b>
													</button>
												</td>
											</tr>
											<tr>
												<td colspan="2" class="list_wrap">
													<div class="box_wrap" id="searchBox">
														<div class="list box01" class="dropdown">
															<button type="submit" class="btn btn-default dropdown-toggle" data-toggle="dropdown">대학분류 [대계열]</button>
															<div class="menu dropdown-menu" >
																<c:forEach var="col" items="${listsM1}">
																		<a class="dropdown-item"  onclick="ch_major('${col.major1}');">${col.major1}</a>
																</c:forEach>
															</div>
																<input style="margin-top:5px; margin-left:4px; width: 98%" type="text" id="major1" name="major1" value="" />
														</div>
														
														<div class="list box02" class="dropdown">
															<button type="button" id="button2" class="btn btn-default dropdown-toggle" data-toggle="dropdown">대학분류 [중계열]</button>
															<div class="menu dropdown-menu" id="maj2div" ></div>
															<br /> 
																<input style="margin-top:5px; margin-left:4px; width: 98%" type="text" id="major2" name="major2" value="" />
														</div>
														
														<div class="list box04" class="dropdown">
															<button type="button" id="button3" class="btn btn-default dropdown-toggle" data-toggle="dropdown">학과명</button>
															<div class="menu dropdown-menu" id="maj3div"></div>	
															<br/>
																<input style="margin-top:5px; margin-left:4px; width: 98%" type="text" id="major3" name="major" value=""  />
														</div>
														
													</div> 

												</td>
											</tr>
											<tr>
												<th scope="row" rowspan="3"><label for="uv">지역</label>
												</th>

											</tr>
											<tr>
												<td class="tt">지역</td>
												<td>
													<input type="checkbox" name="location"id="j_chk_location_all" value="" checked="checked" onclick="locationList_onclick(this);">
													<label for="chk_location_all">전체</label> 
													<input type="checkbox" name=location id="j_chk_location_1" value="강원" onclick="locationList_onclick(this);">
													<label for="chk_location_1">강원</label> 
													<input type="checkbox" name="location" id="j_chk_location_2" value="경기" onclick="locationList_onclick(this);">
													<label for="chk_location_2">경기</label> 
													<input type="checkbox" name="location" id="j_chk_location_3" value="경남" onclick="locationList_onclick(this);">
													<label for="chk_location_3">경남</label> 
													<input type="checkbox" name="location" id="j_chk_location_4" value="경북" onclick="locationList_onclick(this);">
													<label for="chk_location_4">경북</label> 
													<input type="checkbox" name="location" id="j_chk_location_5" value="광주" onclick="locationList_onclick(this);">
													<label for="chk_location_5">광주</label> 
													<input type="checkbox" name="location" id="j_chk_location_6" value="대구" onclick="locationList_onclick(this);">
													<label for="chk_location_6">대구</label> 
													<input type="checkbox" name="location" id="j_chk_location_7" value="대전" onclick="locationList_onclick(this);">
													<label for="chk_location_7">대전</label>
													<input type="checkbox" name="location" id="j_chk_location_8" value="부산" onclick="locationList_onclick(this);">
													<label for="chk_location_8">부산</label> 
													<br /> 
													<input type="checkbox" name="location" id="j_chk_location_9" value="서울" onclick="locationList_onclick(this);">
													<label for="chk_location_9">서울</label> 
													<input type="checkbox" name="location" id="j_chk_location_10" value="세종" onclick="locationList_onclick(this);">
													<label for="chk_location_10">세종</label> 
													<input type="checkbox" name="location" id="j_chk_location_11" value="울산" onclick="locationList_onclick(this);">
													<label for="chk_location_11">울산</label> 
													<input type="checkbox" name="location" id="j_chk_location_12" value="인천" onclick="locationList_onclick(this);">
													<label for="chk_location_12">인천</label> 
													<input type="checkbox" name="location" id="j_chk_location_13" value="전남" onclick="locationList_onclick(this);">
													<label for="chk_location_13">전남</label> 
													<input type="checkbox" name="location" id="j_chk_location_14" value="전북" onclick="locationList_onclick(this);">
													<label for="chk_location_14">전북</label> 
													<input type="checkbox" name="location" id="j_chk_location_15" value="제주" onclick="locationList_onclick(this);">
													<label for="chk_location_15">제주</label> 
													<input type="checkbox" name="location" id="j_chk_location_16" value="충남" onclick="locationList_onclick(this);">
													<label for="chk_location_16">충남</label> 
													<input type="checkbox" name="location" id="j_chk_location_17" value="충북" onclick="locationList_onclick(this);">
													<label for="chk_location_17">충북</label>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</fieldset>
						</div>
						<!-- search_tbl_box -->
						<!-- 조건박스 -->

						<!-- search_tbl_box -->
						<div class="search_box_btn">
							<button type="submit" title="검색"
								class="btn_searchAll btn btn-dark">검색</button>
						</div>
					</form>

					<!-- 대학리스트 -->
					<div class="tbl_list">
						<br>


						<table class="list_tbl01">
							<caption>검색버튼을 눌러주세요</caption>
							<colgroup>
								<col>
								<col style="width: 80px;">
								<col style="width: 70px;">
								<col style="width: 60px;">
								<col style="width: 70px;">
								<col style="width: 60px;">
								<col style="width: 60px;">
								<col style="width: 80px;">
							</colgroup>
							<thead style="border-bottom: 1px solid #ddd;">
								<tr style="border-bottom: none;">
									<th scope="col" rowspan="2">학과명</th>
									<th scope="col" rowspan="2">대학명</th>
									<th scope="col" rowspan="2">지역</th>
									<th scope="col" rowspan="2">입학 정원</th>
									<th scope="col" rowspan="2">취업률</th>
									<th scope="col" colspan="2">전년도 최저</th>
								</tr>
								<tr>
									<th>수시</th>
									<th>정시</th>
								</tr>
							</thead>

							<tbody id="tbResult2">
								<c:forEach items="${listsH }" var="rowh">
									<tr>
									</tr>
									<tr>
										<td id="hidden" scope="col" rowspan="2">${rowh.u_type}</td>
										<td scope="col" rowspan="2">${rowh.major}</td>
										<td scope="col" rowspan="2">${rowh.uname}</td>
										<td scope="col" rowspan="2">${rowh.location}</td>
										<td scope="col" rowspan="2">${rowh.majorman}</td>
										<td scope="col" rowspan="2">${rowh.mjobrate}</td>
										<td scope="col" rowspan="2">${rowh.lastminis}</td>
										<td scope="col" rowspan="2">${rowh.lastminij}</td>
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
				<!-- 전문대학교 끝 -->

			</div>
			<!-- tab-content  -->
		</div>
		<!-- rightcontents  -->
	</div>
	<!-- contents -->


	<%@include file="../main/bottom.jsp"%>
</body>
</html>