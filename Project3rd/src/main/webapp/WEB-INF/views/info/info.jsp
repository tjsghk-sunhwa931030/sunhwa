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
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript">

// 검색버튼 누르기  
function search_init() {
	btn_search_onclick();
}


function btn_search_onclick_init(){
	/* document.frm.pageIndex.value = 1;
	$("#uname").val($.trim($("#uname").val())); */
	search_init();
}  


//체크박스 접었을때 (접었을때 전체가 디폴트로 나오는거 수정해야함 )
function fn_box_text_set() {
	
	//지역 텍스트
	var chk_location_list = $("input[id^='chk_location']:checked").get();
	var location_list = "";
	$.each(chk_location_list, function(index, item){
		var location_id = item.id.toString();
		location_list += ","+$("#"+location_id).next("label").html();
	});
	
	$("#location_view").html(location_list.substring(1));

	//설립유형 텍스트
	var chk_ptype_list = $("input[id^='chk_ptype']:checked").get();
	var ptype_list = "";
	$.each(chk_ptype_list, function(index, item){
		var ptype_id = item.id.toString();
		ptype_list += ","+$("#"+ptype_id).next("label").html();
	});
	
	$("#ptype_view").html(ptype_list.substring(1));

	//취업률 텍스트
	var rdo_jobrate_list = $("input[id^='rdo_jobrate']:checked").get();
	var jobrate_list = "";
	$.each(rdo_jobrate_list, function(index, item){
		var jobrate_id = item.id.toString();
		jobrate_list += ","+$("#"+jobrate_id).next("label").html();
	});
	
	$("#jobrate_view").html(jobrate_list.substring(1));

	//등록금 텍스트
	var rdo_tuition_list = $("input[id^='rdo_tuition']:checked").get();
	var tuition_list = "";
	$.each(rdo_tuition_list, function(index, item){
		var tuition_id = item.id.toString();
		tuition_list += ","+$("#"+tuition_id).next("label").html();
	});
	
	$("#tuition_view").html(tuition_list.substring(1));
}//체크박스 접기



//대학조건 접기
function fn_box_fold(){
	fn_box_text_set();
	
	$("#btn_box_fold").hide();
	$("#btn_box_out").show();
	$("#tbDetail").hide();
	$("#tbSimple").show();
}

//대학조건 펼치기
function fn_box_out(){
	$("#btn_box_out").hide();
	$("#btn_box_fold").show();
	$("#tbSimple").hide();
	$("#tbDetail").show();
}

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
}

//설립유형
function ptypeList_onclick(ptype){
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
}

//폼값 전달하기 
function checkboxFrm(fn){
	
	var fn = document.checkFrm;
	
	var lst_location_list = [];
	var lst_ptype_list = [];
	
	var locationlist = $("input[id^='chk_location']:checked").get();
	var ptypelist = $("input[id^='chk_ptype']:checked").get();
	var jobratelist = $("input[id^='rdo_jobrate']:checked").val();
	var tuitionlist = $("input[id^='rdo_tuition']:checked").val();

	
	
	$.each(locationlist, function(index, item){
		var location = item.value.toString();
	
		lst_location_list[index] = location;
	});
	
	$.each(ptypelist, function(index, item){
		var ptype = item.value.toString();

		lst_ptype_list[index] = ptype;
	});
	

/* 	fn.action="./checkAction.do";
	fn.method = "get";
	fn.submit(); */
	
}













</script>
<style type="text/css">
	.lefttoptext{margin:0 auto;font-size:25px;font-weight:bold;margin-top:10px;}
	.righttoptext{margin:0 auto;font-size:40px;font-weight:bold;}
	.contents{height: 1000px;}
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


	<div class="contents">
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
					<a class="nav-link active" data-toggle="tab" href="#ilban">일반대학교</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#junmun">전문대학교</a>
				</li>
			</ul>
			
			<div class="tab-content">
					<!-- 일반대학교 시작 -->
				<div id="ilban" class="container tab-pane active"><br/>
				
			 <form id="checkFrm" name="checkFrm" action="./checkAction.do" method="get" onsubmit="return checkboxFrm();">
					<div class="search_tbl_box" >
						<fieldset>
							<!-- 대학 -->
							<div class="tbl_wrap">
								<p class="box_btn" id="btn_box_fold" style=""><a href="javascript:fn_box_fold()" title="접기"><img src="./resources/images/btn_box_fold.png" alt="접기"></a></p>
								<p class="box_btn" id="btn_box_out" style="display: none;"><a href="javascript:fn_box_out()" title="펼치기"><img src="./resources/images/btn_box_out.png" alt="펼치기"></a></p>
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
											<th scope="col" rowspan="5">
												<label for="uv">대학<br>조건</label>
											</th>
										
											<td class="tt">지역</td>
											<td>
												<input type="checkbox" name="location" id="chk_location_all" value="%" checked="checked" onclick="locationList_onclick(this);"><label for="chk_location_all">전체</label>
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
											
		            							<input type="checkbox" name="p_type" id="chk_ptype_all" value="%" checked="checked" onclick="ptypeList_onclick(this)"><label for="chk_ptype_all">전체</label>
												<input type="checkbox" name="p_type" id="chk_ptype_1" value="국공립" onclick="ptypeList_onclick(this)"><label for="chk_ptype_1">국공립</label>
												<input type="checkbox" name="p_type" id="chk_ptype_2" value="사립" onclick="ptypeList_onclick(this)"><label for="chk_ptype_3">사립</label>
		            							
		            					
											</td>
										</tr>
										
										<tr>
											<td class="tt">취업률</td>
											<td>
											
									
										<input type="radio" name="jobrate" id="rdo_jobrate_all" value="%" checked="checked"><label for="rdo_jobrate_all">전체</label>
										<input type="radio" name="jobrate" id="rdo_jobrate_90" value="90"><label for="rdo_jobrate_90">90%이상</label>
										<input type="radio" name="jobrate" id="rdo_jobrate_80" value="80"><label for="rdo_jobrate_80">80%&nbsp;~&nbsp;90%</label>
										<input type="radio" name="jobrate" id="rdo_jobrate_70" value="70"><label for="rdo_jobrate_70">70%&nbsp;~&nbsp;80%</label>
										<br>
										<input type="radio" name="jobrate" id="rdo_jobrate_60" value="60"><label for="rdo_jobrate_60">60%&nbsp;~&nbsp;70%</label>
										<input type="radio" name="jobrate" id="rdo_jobrate_50" value="50"><label for="rdo_jobrate_50">50%&nbsp;~&nbsp;60%</label>
										<input type="radio" name="jobrate" id="rdo_jobrate_40" value="40"><label for="rdo_jobrate_40">40%&nbsp;~&nbsp;50%</label>
										<input type="radio" name="jobrate" id="rdo_jobrate_39" value="39"><label for="rdo_jobrate_39">40%미만</label>
											</td>
										</tr>
										
										<tr>
											<td class="tt">등록금</td>
											<td>
											
											
											<input type="radio" name="tuition" id="rdo_tuition_all" value="%" checked="checked"><label for="rdo_tuition_all">전체</label>
											<input type="radio" name="tuition" id="rdo_tuition_1000" value="1000"><label for="rdo_tuition_1000">1000만이상</label>
											<input type="radio" name="tuition" id="rdo_tuition_800" value="800"><label for="rdo_tuition_800">800만&nbsp;~&nbsp;1000만</label>
											<input type="radio" name="tuition" id="rdo_tuition_600" value="600"><label for="rdo_tuition_600">600만&nbsp;~&nbsp;800만</label>
												<br>
												
											<input type="radio" name="tuition" id="rdo_tuition_400" value="400"><label for="rdo_tuition_400">400만&nbsp;~&nbsp;600만</label>
											<input type="radio" name="tuition" id="rdo_tuition_200" value="200"><label for="rdo_tuition_200">200만&nbsp;~&nbsp;400만</label>
											<input type="radio" name="tuition" id="rdo_tuition_199" value="199"><label for="rdo_tuition_199">200만미만</label>
											
											</td>
										</tr>
									
									</tbody>
									
									<tbody id="tbSimple" class="tbl_fold" style="display: none;">
										<tr>
											<th scope="col"><label for="uv">대학<br>조건</label></th>
											<td colspan="2" onclick="fn_box_out()">
												<span class="tt_fold first">지역</span><span id="location_view"></span>
												<span class="tt_fold">설립유형</span><span id="ptype_view"></span><br>
												<span class="tt_fold first">취업률</span><span id="jobrate_view"></span>
												<span class="tt_fold">등록금</span><span id="tuition_view"></span>
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
					<div class="but_table">
						<div class="t_span" style="min-width: 170px; max-width: 170px;">총 ${totalRecordCount} 건이 있습니다.</div>
					</div>
		<form>	
					<table class="list_tbl01">
						<caption>대학 리스트</caption>
						<colgroup>
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
								<th scope="col" rowspan="2">대학명</th>
								<th scope="col" rowspan="2">지역</th>
								<th scope="col" rowspan="2">경쟁률</th>
								<th scope="col" rowspan="2">입학정원</th>
								<th scope="col" rowspan="2">설치학과</th>
								<th scope="col" rowspan="2">전형정보</th>
								<th scope="col" rowspan="2">관심설정</th>
							</tr>
						</thead>
						<tbody id="tbResult">
							<c:forEach items="${lists }" var="row">
								<tr>
								</tr>
								<tr>		
									<td scope="col" rowspan="2">${row.uname}</td>
									<td scope="col" rowspan="2">${row.location}</td>
									<td scope="col" rowspan="2">${row.rate_univ}</td>
									<td scope="col" rowspan="2">${row.totalman}</td>
									<td scope="col" rowspan="2">${row.major_num}</td>
									<td scope="col" rowspan="2">${row.enter_num}</td>
									<td scope="col" rowspan="2">${row.interest}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
		</form>
				</div>
				<!-- //대학리스트 -->
		
			</div><!-- 일반대학교 끝 -->
			
			
			<!-- 전문대학교 시작 -->
				<div id="junmun" class="container tab-pane fade"><br/>
		<form id="checkfrm" name="checkfrm" action="폼값넘기기" method="post" onsubmit="return false;">
				
					<div class="search_tbl_box" >
						<fieldset>
							<!-- 대학 -->
							<div class="tbl_wrap">
								<p class="box_btn" id="btn_box_fold" style=""><a href="javascript:fn_box_fold()" title="접기"><img src="./resources/images/btn_box_fold.png" alt="접기"></a></p>
								<p class="box_btn" id="btn_box_out" style="display: none;"><a href="javascript:fn_box_out()" title="펼치기"><img src="./resources/images/btn_box_out.png" alt="펼치기"></a></p>
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
												<input id="uname" name="uname" title="대학명검색" style="ime-mode:active" placeholder="대학명을 입력해주세요." class="search_input" type="text" value="" maxlength="30">
													<a href="javascript:btn_search_onclick_init()" title="검색" class="btn_search" style="color:#783712 ">
														<button title="검색" class="btn btn-default btn-sm btn btn-outline-dark" style="border-color: #783712" onclick="javascript:btn_search_onclick_init()">
															<i class="fa fa-search" style="color:#783712 "></i>&nbsp;<b>검색</b>
														</button>
													</a>
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
												<input id="lst_location_cd" name="lst_location_cd" type="hidden" value="">
												<input type="checkbox" name="chk_location" id="chk_location_all" value="%" checked="checked" onclick="locationList_onclick(this);"><label for="chk_location_all">전체</label>
												<input type="checkbox" name="chk_location" id="chk_location_09" value="09" onclick="locationList_onclick(this);"><label for="chk_location_09">강원</label>
												<input type="checkbox" name="chk_location" id="chk_location_08" value="08" onclick="locationList_onclick(this);"><label for="chk_location_08">경기</label>
												<input type="checkbox" name="chk_location" id="chk_location_15" value="15" onclick="locationList_onclick(this);"><label for="chk_location_15">경남</label>
												<input type="checkbox" name="chk_location" id="chk_location_14" value="14" onclick="locationList_onclick(this);"><label for="chk_location_14">경북</label>
												<input type="checkbox" name="chk_location" id="chk_location_05" value="05" onclick="locationList_onclick(this);"><label for="chk_location_05">광주</label>
												<input type="checkbox" name="chk_location" id="chk_location_03" value="03" onclick="locationList_onclick(this);"><label for="chk_location_03">대구</label>
												<input type="checkbox" name="chk_location" id="chk_location_06" value="06" onclick="locationList_onclick(this);"><label for="chk_location_06">대전</label>
												<input type="checkbox" name="chk_location" id="chk_location_02" value="02" onclick="locationList_onclick(this);"><label for="chk_location_02">부산</label>
												<br/>
												<input type="checkbox" name="chk_location" id="chk_location_01" value="01" onclick="locationList_onclick(this);"><label for="chk_location_01">서울</label>
												<input type="checkbox" name="chk_location" id="chk_location_17" value="17" onclick="locationList_onclick(this);"><label for="chk_location_17">세종</label>
												<input type="checkbox" name="chk_location" id="chk_location_07" value="07" onclick="locationList_onclick(this);"><label for="chk_location_07">울산</label>
												<input type="checkbox" name="chk_location" id="chk_location_04" value="04" onclick="locationList_onclick(this);"><label for="chk_location_04">인천</label>
												<input type="checkbox" name="chk_location" id="chk_location_13" value="13" onclick="locationList_onclick(this);"><label for="chk_location_13">전남</label>
												<input type="checkbox" name="chk_location" id="chk_location_12" value="12" onclick="locationList_onclick(this);"><label for="chk_location_12">전북</label>
												<input type="checkbox" name="chk_location" id="chk_location_16" value="16" onclick="locationList_onclick(this);"><label for="chk_location_16">제주</label>
												<input type="checkbox" name="chk_location" id="chk_location_11" value="11" onclick="locationList_onclick(this);"><label for="chk_location_11">충남</label>
												<input type="checkbox" name="chk_location" id="chk_location_10" value="10" onclick="locationList_onclick(this);"><label for="chk_location_10">충북</label>
											
											</td>
										</tr>
										
										<tr>
											<td class="tt">설립유형</td>
											<td>
												<input id="lst_ptype_se_cd" name="lst_ptype_se_cd" type="hidden" value="">
		            							<input type="checkbox" name="chk_ptype" id="chk_ptype_all" value="%" checked="checked" onclick="ptypeList_onclick(this)"><label for="chk_ptype_all">전체</label>
												<input type="checkbox" name="chk_ptype" id="chk_ptype_1" value="1" onclick="ptypeList_onclick(this)"><label for="chk_ptype_1">국립</label>
		            							<input type="checkbox" name="chk_ptype" id="chk_ptype_2" value="2" onclick="ptypeList_onclick(this)"><label for="chk_ptype_2">공립</label>
												<input type="checkbox" name="chk_ptype" id="chk_ptype_3" value="3" onclick="ptypeList_onclick(this)"><label for="chk_ptype_3">사립</label>
		            							<input type="checkbox" name="chk_ptype" id="chk_ptype_6" value="6" onclick="ptypeList_onclick(this)"><label for="chk_ptype_6">특별법법인</label>
		            							<input type="checkbox" name="chk_ptype" id="chk_ptype_7" value="7" onclick="ptypeList_onclick(this)"><label for="chk_ptype_7">국립대법인</label>
		            					
											</td>
										</tr>
										
										<tr>
											<td class="tt">취업률</td>
											<td>
											
										<input id="lst_jobrate_cd" name="lst_jobrate_cd" type="hidden" value="">
										<input type="radio" name="rdo_jobrate" id="rdo_jobrate_all" value="" checked="checked"><label for="rdo_jobrate_all">전체</label>
										<input type="radio" name="rdo_jobrate" id="rdo_jobrate_90" value="90"><label for="rdo_jobrate_90">90%이상</label>
										<input type="radio" name="rdo_jobrate" id="rdo_jobrate_80" value="80"><label for="rdo_jobrate_80">80%&nbsp;~&nbsp;90%</label>
										<input type="radio" name="rdo_jobrate" id="rdo_jobrate_70" value="70"><label for="rdo_jobrate_70">70%&nbsp;~&nbsp;80%</label>
										<br>
										<input type="radio" name="rdo_jobrate" id="rdo_jobrate_60" value="60"><label for="rdo_jobrate_60">60%&nbsp;~&nbsp;70%</label>
										<input type="radio" name="rdo_jobrate" id="rdo_jobrate_50" value="50"><label for="rdo_jobrate_50">50%&nbsp;~&nbsp;60%</label>
										<input type="radio" name="rdo_jobrate" id="rdo_jobrate_40" value="40"><label for="rdo_jobrate_40">40%&nbsp;~&nbsp;50%</label>
										<input type="radio" name="rdo_jobrate" id="rdo_jobrate_39" value="39"><label for="rdo_jobrate_39">40%미만</label>
											</td>
										</tr>
										
										<tr>
											<td class="tt">등록금</td>
											<td>
											
											<input id="lst_tuition_cd" name="lst_tuition_cd" type="hidden" value="">
											<input type="radio" name="rdo_tuition" id="rdo_tuition_all" value="" checked="checked"><label for="rdo_tuition_all">전체</label>
											<input type="radio" name="rdo_tuition" id="rdo_tuition_1000" value="1000"><label for="rdo_tuition_1000">1000만이상</label>
											<input type="radio" name="rdo_tuition" id="rdo_tuition_800" value="800"><label for="rdo_tuition_800">800만&nbsp;~&nbsp;1000만</label>
											<input type="radio" name="rdo_tuition" id="rdo_tuition_600" value="600"><label for="rdo_tuition_600">600만&nbsp;~&nbsp;800만</label>
												<br>
												
											<input type="radio" name="rdo_tuition" id="rdo_tuition_400" value="400"><label for="rdo_tuition_400">400만&nbsp;~&nbsp;600만</label>
											<input type="radio" name="rdo_tuition" id="rdo_tuition_200" value="200"><label for="rdo_tuition_200">200만&nbsp;~&nbsp;400만</label>
											<input type="radio" name="rdo_tuition" id="rdo_tuition_199" value="199"><label for="rdo_tuition_199">200만미만</label>
											
											</td>
										</tr>
									
									</tbody>
									
									<tbody id="tbSimple" class="tbl_fold" style="display: none;">
										<tr>
											<td scope="col">대학조건</td>
											<td colspan="2" onclick="fn_box_out()">
												<span class="tt_fold first">지역</span><span id="span_location_view">전체</span>
												<span class="tt_fold">설립유형</span><span id="span_ptype_view">전체</span><br>
												<span class="tt_fold first">취업률</span><span id="span_jobrate_view">전체</span>
												<span class="tt_fold">등록금</span><span id="span_tuition_view">전체</span>
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
						<a href="javascript:btn_search_onclick_init()" title="검색" class="btn_searchAll btn btn-dark" role="button">검색</a>
					</div>
		</form>
					
					
					<!-- 대학리스트 -->
				<div class="tbl_list">
					<br>
					<div class="but_table">
						<div class="t_span" style="min-width: 170px; max-width: 170px;">총 <span class="t_cr01 font_w" id="totalCountOrg">0</span>건이 있습니다.</div>
					</div>
		<form>	
					<table class="list_tbl01">
						<caption>대학 리스트</caption>
						<colgroup>
							<col>
							<col style="width:70px;">
							<col style="width:70px;">
							<col style="width:70px;">
							<col style="width:70px;">
							<col style="width:70px;">
							<col style="width:70px;">
							<col style="width:60px;">
							
						</colgroup>
						<thead style="border-bottom: 1px solid #ddd;">
							<tr style="border-bottom: none;">
								<th scope="col" rowspan="2">대학명<a href="javascript:btn_univ_sort_onclick()" id="thead_univ_sort" class="btn_array_up"></a></th>
								<th scope="col" rowspan="2">지역<a href="javascript:btn_area_sort_onclick()" id="thead_area_sort" class="btn_array_up"></a></th>
								<th scope="col" colspan="2"><span id="cmpet_head"></span>경쟁률</th>
								<th scope="col" rowspan="2">입학정원</th>
								<th scope="col" rowspan="2">설치<br>학과</th>
								<th scope="col" rowspan="2">전형<br>정보</th>
								<th scope="col" rowspan="2">관심<br>설정</th>
							</tr>
							<tr>
								<th>수시</th>
								<th>정시</th>
							</tr>
						</thead>
						<tbody id="tbResult">
							<c:forEach items="${lists }" var="row">
								<tr>
								</tr>
								<tr>		
									<td scope="col" rowspan="2">${row.uname}</td>
									<td scope="col" rowspan="2">${row.location}</td>
									<td scope="col" rowspan="2">${row.rate_univ}</td>
									<td scope="col" rowspan="2">${row.totalman}</td>
									<td scope="col" rowspan="2">${row.major_num}</td>
									<td scope="col" rowspan="2">${row.enter_num}</td>
									<td scope="col" rowspan="2">${row.interest}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>	
				</div>
				<!-- //대학리스트 -->
			
				
				<!-- 페이징 -->
		    	<div class="paging" id="paginationholder"> 
		        	<ul id="pagination" class="pages"></ul>
		    	</div>
				<!-- //페이징 -->
				
			</div>
		</div><!-- tab-content  -->
		
		
		
		
	</div><!-- rightcontents  -->
</div><!-- contents -->
	<%@include file="../main/bottom.jsp" %>


</body>
</html>