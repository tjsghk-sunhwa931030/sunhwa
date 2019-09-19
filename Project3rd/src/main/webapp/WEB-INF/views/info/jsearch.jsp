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
<style type="text/css">
	.lefttoptext{margin:0 auto;font-size:25px;font-weight:bold;margin-top:10px;}
	.righttoptext{margin:0 auto;font-size:40px;font-weight:bold;}
	.contents{height: 1500px;}
	#hidden{display: none;}
</style>
<script type="text/javascript">

//체크박스 
function fn_recruit_timeList_onclick(recruit_time){		
		if($(recruit_time).attr("id") == "chk_recruit_time_all"){
			$("#chk_recruit_time_all").prop("checked",true);
			$("input[id^='chk_recruit_time']:not(input[id='chk_recruit_time_all'])").prop("checked",false);
		}else{
			
			$("#chk_recruit_time_all").prop("checked",false);
			var chk_recruit_time_list = $("input[id^='chk_recruit_time']:checked").get();
			
			if(chk_recruit_time_list.length < 1){
				$("#chk_recruit_time_all").prop("checked",true);
			}
		}	
}
	
	function fn_locationList_onclick(location){
// 		$(location).toggleClass("on");
// 		search_init();
		
		
		if($(location).attr("id") == "chk_location_all"){
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

	function fn_enter_typeList_onclick(enter_type){
	
		if($(enter_type).attr("id") == "chk_enter_type_all"){
			$("#chk_enter_type_all").prop("checked",true);
			$("input[id^='chk_enter_type']:not(input[id='chk_enter_type_all'])").prop("checked",false);
		}else{
			
			$("#chk_enter_type_all").prop("checked",false);
			var chk_enter_type_list = $("input[id^='chk_enter_type']:checked").get();
			
			if(chk_enter_type_list.length < 1){
				$("#chk_enter_type_all").prop("checked",true);
			}
		}
		
	}
	
	function fn_enter_nameList_onclick(enter_name){
		
// 		$(enter_name).toggleClass("on");
// 		search_init();
		if($(enter_name).attr("id") == "chk_enter_name_all"){
			//전체선택해제
			$("#chk_enter_name_all").prop("checked",true);
			//하위선택해제
			$("input[id^='chk_enter_name']:not(input[id='chk_enter_name_all'])").prop("checked",false);
		}else if ($(enter_name).attr("id").indexOf("all") > -1){
			//전체 선택 해제
			$("#chk_enter_name_all").prop("checked",false);
						
			//하위 선택 해제
			var group = $(enter_name).data("group");
			console.log("this : " + group);
			$("input[id^='chk_enter_name']:not(input[id^='chk_enter_name_all'])").each(function() {
				console.log("target : " + $(this).data("group"));
				if($(this).data("group") == group) {
					console.log("checked" + $(this).data("group") );
					$(this).prop("checked", false);
				}
			});

			//없으면 전체
			var chk_enter_name_list = $("input[id^='chk_enter_name']:checked").get();
			if(chk_enter_name_list.length < 1){
				$("#chk_enter_name_all").prop("checked",true);
			}
		} else {
			//전체선택해제
			$("#chk_enter_name_all").prop("checked",false);
			
			//상위선택해제
			$("input[id='chk_enter_name_all_"+$(enter_name).data("group")+"']").prop("checked", false);

			//없으면 전체
			var chk_enter_name_list = $("input[id^='chk_enter_name']:checked").get();
			if(chk_enter_name_list.length < 1){
				$("#chk_enter_name_all").prop("checked",true);
			}
		}
	}
	

//전형상세조건 접기
function fn_selctnDtlBox_fold(){
	fn_selctnDtlBox_text_set();
	
	$("#btn_selctnDtlBox_fold").hide();
	$("#btn_selctnDtlBox_out").show();
	$("#tbSelctnDtlDetail").hide();
	$("#tbSelctnDtl").show();
}

function fn_selctnDtlBox_text_set() {

	//지역 텍스트
	var location_list = $("input[id^='location']:checked").get();
	var location_list = "";
	$.each(location_list, function(index, item){
		var location_id = item.id.toString();
		location_list += ","+$("#"+location_id).next("label").html();
	});
	
	$("#span_location_view").html(location_list.substring(1));
	
	//전형요소 텍스트
	var chk_enter_ele_list = $("#tbenter_eleChk input[id^='chk_']:checked").get();
	var enter_ele_list = "";
	$.each(chk_enter_ele_list, function(index, item){
		var enter_ele_id = item.id.toString();
		enter_ele_list += ","+$("#"+enter_ele_id).next("label").html();
	});
	
	if(enter_ele_list == ""){
		enter_ele_list = "전체";
	}else{
		enter_ele_list = enter_ele_list.substring(1);
	}
	
	$("#span_enter_ele_view").html(enter_ele_list);
	
	
	//수능반영영역 텍스트
	var chk_enter_test_list = $("#tbenter_testRelm input[id^='v_cho']:checked").get();
	var enter_test_list = "";
	$.each(chk_enter_test_list, function(index, item){
		var enter_test_id = item.id.toString();
		enter_test_list += ","+$("#"+enter_test_id).next("label").html();
	});

	if(enter_test_list == ""){
		enter_test_list = "전체";
	}else{
		enter_test_list = enter_test_list.substring(1);
	}
	
	$("#span_enter_test_view").html(enter_test_list);

	//최저학력기준 텍스트
	var chk_lwacst_list = $("#tbLwacstCn input[id^='rad_']:checked").get();
	var lwacst_list = "";
	$.each(chk_lwacst_list, function(index, item){
		var lwacst_id = item.id.toString();
		lwacst_list += ","+$("#"+lwacst_id).next("label").html();
	});

	if(lwacst_list == ""){
		lwacst_list = "전체";
	}else{
		lwacst_list = lwacst_list.substring(1);
	}
	
	$("#span_lwacst_view").html(lwacst_list);
}

//전형상세조건 펼치기
function fn_selctnDtlBox_out(){
	$("#btn_selctnDtlBox_out").hide();
	$("#btn_selctnDtlBox_fold").show();
	$("#tbSelctnDtl").hide();
	$("#tbSelctnDtlDetail").show();
}



//학과계열조건 접기
function fn_sersBox_fold(){
	
	fn_sersBox_text_set();
	
	$("#btn_sersBox_fold").hide();
	$("#btn_sersBox_out").show();
	$("#tbsersDetail").hide();
	$("#tbSers").show();
}

function fn_sersBox_text_set() {
	var lgcl = $("#lst_lgcl_cd").val();
	var mdcl = $("#lst_mdcl_cd").val();
	var smcl = $("#lst_smcl_cd").val();
	
	var sers_nm = "";
	
	if(lgcl != ""){
		sers_nm = $("#lst_lgcl_"+lgcl+" a").html();
	}
	
	if(mdcl != ""){
		sers_nm = sers_nm + " > " + $("#lst_mdcl_"+mdcl+" a").html();
	}
	
	if(smcl != ""){
		sers_nm = sers_nm + " > " + $("#lst_smcl_"+smcl+" a").html();
	}
	
	if(sers_nm == ""){
		sers_nm = "전체";
	}
	
	$("#span_sers_view").html(sers_nm);
}
//학과계열조건 펼치기
function fn_sersBox_out(){
	$("#btn_sersBox_out").hide();
	$("#btn_sersBox_fold").show();
	$("#tbSers").hide();
	$("#tbsersDetail").show();
}


function utypeClick(){

	$('.tbResult').empty();
	
 }





</script>

</head>
<body>
<%@include file="../main/head.jsp" %> 
	<div class="topcontents">
		<div class="lefttop">
        	 <div class="lefttoptext">대학간다</div>
      	</div>
      <div class="righttop">
         <div class="righttoptext">전형 검색</div>
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
					<a class="nav-link active" data-toggle="tab" href="#ilban"  id="u_type" onclick="javascript:utypeClick()">일반대학교</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#junmun"  id="u_type" onclick="javascript:utypeClick()">전문대학교</a>
				</li>
			</ul>
			
			<div class="tab-content">
					<!-- 일반대학교 시작 -->
				<div id="ilban" class="container tab-pane active"><br/>
			<form id="checkFrm" name="checkFrm" action="./checkAction3.do" method="get" onsubmit="return checkboxFrm();">
					<div class="search_tbl_box">
							<fieldset>
								<!-- 학과상세 -->
								<div class="tbl_wrap">
									<table class="search_tbl01">
										<colgroup>
											<col style="width:8%;">
											<col>
											<col style="width:80%;">
										</colgroup>
										<tbody id="tbSelctnDetail">
											<tr>
												<th scope="col">
													<label for="univ_nm">대학</label>
												</th>
												<td colspan="2">
													<input id="searchWord" name="searchWord" title="대학명검색" placeholder="대학명을 입력해주세요." type="text" value="" maxlength="30">
													<button type="submit" title="검색" class="btn btn-default btn-sm btn btn-outline-dark" style="border-color: #783712">
															<i class="fa fa-search" style="color:#783712 "></i>&nbsp;<b>검색</b>
													</button>
												</td>								
											</tr>		
																				
											<tr>
												<th scope="row" rowspan="3">
													<label for="uv">전형<br>조건</label>
												</th>
												<td class="tt">모집시기</td>
												<td>
													<input type="checkbox" name="recruit_time" id="recruit_time_all" title="모집시기 검색조건" value="" checked="checked" onclick="fn_recruit_timeList_onclick(this)"><label for="chk_recruit_time_all">전체</label>
							    					<input type="checkbox" name="recruit_time" id="recruit_time_1" title="모집시기 검색조건" value="수시" onclick="fn_recruit_timeList_onclick(this)"><label for="chk_recruit_time_1">수시</label>
													<input type="checkbox" name="recruit_time" id="recruit_time_2" title="모집시기 검색조건" value="정시(가)" onclick="fn_recruit_timeList_onclick(this)"><label for="chk_recruit_time_2">정시(가)</label>
													<input type="checkbox" name="recruit_time" id="recruit_time_3" title="모집시기 검색조건" value="정시(나)" onclick="fn_recruit_timeList_onclick(this)"><label for="chk_recruit_time_3">정시(나)</label>
													<input type="checkbox" name="recruit_time" id="recruit_time_4" title="모집시기 검색조건" value="정시(다)" onclick="fn_recruit_timeList_onclick(this)"><label for="chk_recruit_time_4">정시(다)</label>
													<input type="checkbox" name="recruit_time" id="recruit_time_5" title="모집시기 검색조건" value="추가" onclick="fn_recruit_timeList_onclick(this)"><label for="chk_recruit_time_5">추가</label>
												</td>
											</tr>
											<tr>
												<td class="tt">전형유형</td>
												<td>
													<input type="checkbox" name="enter_type" id="enter_type_all" title="전형유형 검색조건" value="" checked="checked" onclick="fn_enter_typeList_onclick(this);"><label for="enter_type_all">전체</label>
													<input type="checkbox" name="enter_type" id="enter_type_01" title="전형유형 검색조건" onclick="fn_enter_typeList_onclick(this)" value="학생부위주(교과)"><label for="enter_type_01">학생부위주(교과)</label>
													<input type="checkbox" name="enter_type" id="enter_type_02" title="전형유형 검색조건" onclick="fn_enter_typeList_onclick(this)" value="학생부위주(종합)"><label for="enter_type_02">학생부위주(종합)</label>
													<input type="checkbox" name="enter_type" id="enter_type_03" title="전형유형 검색조건" onclick="fn_enter_typeList_onclick(this)" value="실기/실적위주"><label for="enter_type_03">실기/실적위주</label>
													<br/>
													<input type="checkbox" name="enter_type" id="enter_type_04" title="전형유형 검색조건" onclick="fn_enter_typeList_onclick(this)" value="논술위주"><label for="enter_type_04">논술위주</label>
													<input type="checkbox" name="enter_type" id="enter_type_05" title="전형유형 검색조건" onclick="fn_enter_typeList_onclick(this)" value="수능위주"><label for="enter_type_05">수능위주</label>
													<input type="checkbox" name="enter_type" id="enter_type_06" title="전형유형 검색조건" onclick="fn_enter_typeList_onclick(this)" value="기타"><label for="enter_type_06">기타</label>
												</td>
											</tr>
											<tr>
												<td class="tt">전형명</td>
												<td>
													<table style="width:100%;">
														<tbody><tr>
															<td colspan="2">
																<input type="checkbox" name="enter_name" id="enter_name_all" title="전형명 검색조건" value="" checked="checked" onclick="fn_enter_nameList_onclick(this);"><label for="enter_name_all">전체</label>									
															</td>
														</tr>
														<tr>
															<td style="width:170px;" colspan="2">
																<input type="checkbox" name="enter_name" id="enter_name_01" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="01" value="01"><label for="enter_name_01">일반전형</label>
															</td>
															
														</tr>
														<tr>
															<td style="width:170px;">
																<input type="checkbox" name="enter_name" id="enter_name_all_02" title="전형명 검색조건" data-group="02" value="04,22,06,03," onclick="fn_enter_nameList_onclick(this);"><label for="enter_name_all_02">특별전형(정원내)</label>
															</td>
															<td>
																<input type="checkbox" name="enter_name" id="enter_name_04" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="02" value="04"><label for="enter_name_04">대학별독자적기준</label>
																<input type="checkbox" name="enter_name" id="enter_name_22" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="02" value="22"><label for="enter_name_22">정원외 특별전형(정원외)</label>
																<br/>
																<input type="checkbox" name="enter_name" id="enter_name_06" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="02" value="06"><label for="enter_name_06">고른기회 특별전형</label>
																<input type="checkbox" name="enter_name" id="enter_name_03" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="02" value="03"><label for="enter_name_03">특기자</label>
															</td>
														</tr>
														<tr>
															<td style="width:170px;">
																<input type="checkbox" name="enter_name" id="enter_name_all_03" title="전형명 검색조건" data-group="03" value="10,12,17,14,13,18,08,16,11,19,21,20," onclick="fn_enter_nameList_onclick(this);"><label for="enter_name_all_03">특별전형(정원외)</label>
															</td>
															<td>
																<input type="checkbox" name="enter_name" id="enter_name_10" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="10"><label for="enter_name_10">농어촌 학생</label>
																<input type="checkbox" name="enter_name" id="enter_name_12" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="12"><label for="enter_name_12">특성화고교 졸업자</label>
																<input type="checkbox" name="enter_name" id="enter_name_17" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="17"><label for="enter_name_17">특성화고 등을 졸업한 재직자</label>
																<br/>
																<input type="checkbox" name="enter_name" id="enter_name_14" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="14"><label for="enter_name_14">기초생활수급자, 차상위계층, 한부모가족 지원대상자</label>
																<br/>
																<input type="checkbox" name="enter_name" id="enter_name_13" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="13"><label for="enter_name_13">장애인등대상자</label>
																<input type="checkbox" name="enter_name" id="enter_name_18" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="18"><label for="enter_name_18">서해5도</label>
																<input type="checkbox" name="enter_name" id="enter_name_08" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="08"><label for="enter_name_08">군위탁생</label>
																<input type="checkbox" name="enter_name" id="enter_name_16" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="16"><label for="enter_name_16">계약학과</label>
																<input type="checkbox" name="enter_name" id="enter_name_99" data-group="03" title="산업대학위탁생(정원외),정부위탁생(정원외),제주특별자치도 특별법(정원외),416 세월호 특별법(정원외)," value="11,19,21,20," onclick="fn_enter_nameList_onclick(this);">
																 <label for="enter_name_99" title="산업대학위탁생(정원외),정부위탁생(정원외),제주특별자치도 특별법(정원외),416 세월호 특별법(정원외)," style="margin-left: -5px;">기타</label>
															
															</td>
														</tr>
													</tbody></table>											
												</td>
											</tr>
										</tbody>
									
									</table>
								</div>
								<!-- //학과상세 -->
								<!-- 전형상세 -->
								<div class="tbl_wrap" id="tb_dtl_search">
									<p class="box_btn" id="btn_selctnDtlBox_fold" style="display: none;"><a href="javascript:fn_selctnDtlBox_fold()" title="접기"><img src="./resources/images/btn_box_fold.png" alt="접기"></a></p>
									<p class="box_btn" id="btn_selctnDtlBox_out"><a href="javascript:fn_selctnDtlBox_out()" title="펼치기"><img src="./resources/images/btn_box_out.png" alt="펼치기"></a></p>
									<table class="search_tbl01">
										<colgroup>
											<col style="width:8%;">
											<col>
											<col style="width:80%;">
										</colgroup>
										<tbody id="tbSelctnDtlDetail" style="display: none;">
											<tr>
												<th scope="row" rowspan="4">
													<label for="uv">전형<br>상세</label>
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
												<td class="tt">전형요소</td>
												<td id="tbenter_eleChk">
													<span><input type="checkbox" value="Y" id="enter_ele" name="enter_ele"> <label for="chk_stdpt">학생부</label></span>
													<span><input type="checkbox" value="Y" id="enter_ele" name="enter_ele"> <label for="chk_csat">수능</label></span>
													<span><input type="checkbox" value="Y" id="enter_ele" name="enter_ele"> <label for="chk_oral_intrvw">면접/구술</label></span>
													<span><input type="checkbox" value="Y" id="enter_ele" name="enter_ele"> <label for="chk_essy">논술</label></span>
													<span><input type="checkbox" value="Y" id="enter_ele" name="enter_ele"> <label for="chk_aptd">적성</label></span>
													<span><input type="checkbox" value="Y" id="enter_ele" name="enter_ele"> <label for="chk_prcttq">실기</label></span>
													<span><input type="checkbox" value="Y" id="enter_ele" name="enter_ele"> <label for="chk_papers">서류</label></span>
													<span><input type="checkbox" value="Y" id="enter_ele" name="enter_ele"> <label for="chk_etc">기타</label></span>
													<span><input type="checkbox" value="Y" id="enter_ele" name="enter_ele"> <label for="chk_one_step_scr">1단계성적</label></span></td>
											</tr>
											<tr>
												<td class="tt">수능반영영역</td>
												<td id="tbenter_testRelm">
												<input type="hidden" id="enter_test" name="enter_test" />
													<span><input type="checkbox" id="v_cho_lang" name="enter_test1" value="Y" onclick="fn_use_select(this)"> 
															<label for="v_cho_lang">국어</label>
													</span>
													<span><input type="checkbox" id="v_cho_math" name="enter_test2" value="Y" onclick="fn_use_select(this)"> 
														<label for="v_cho_math">수학</label>
															<label class="tts" for="v_cho_math_sel">수학영역선택</label> 
																<select class="w70" id="v_cho_math_sel" name="enter_test2" disabled="disabled">
																	<option value="ALL">선택</option>
																	<option value="A">가</option>
																	<option value="B">나</option>
																</select>
													</span>
																	
													<span><input type="checkbox" id="v_cho_fori" name="enter_test3" value="Y" onclick="fn_use_select(this)"> 
															<label for="v_cho_fori">영어</label>
													</span>
														
													<span><input type="checkbox" id="v_cho_serch" name="enter_test4" value="Y" onclick="fn_use_select(this)">
														<label for="v_cho_serch">탐구영역</label>
															<label class="tts" for="v_cho_serch_sel">탐구영역선택</label>
																 <select class="w70" id="v_cho_serch_sel" name="cho_serch_sel" disabled="disabled">
																 	<option value="ALL">선택</option>
																 	<option value="so">사회</option>
																 	<option value="sc">과학</option>
																 	<option value="oc">직업</option>
																 </select>
													</span>
																 	
													<span><input type="checkbox" id="v_cho_secLan_chi" name="enter_test5" value="Y"> 
														<label for="v_cho_secLan_chi">제2외국어/한문</label>
													</span>
													
													<span><input type="checkbox" id="v_cho_his" name="enter_test6" value="Y"> 
														<label for="v_cho_his">한국사</label>
													</span>
												</td>
											</tr>
										</tbody>
										
										<tbody id="tbSelctnDtl" class="tbl_fold">
											<tr>
												<th scope="row">전형<br>상세</th>
												<td colspan="2" onclick="fn_selctnDtlBox_out()">
													<span class="tt_fold first">지역</span><span id="span_location_view">전체</span>
													<span class="tt_fold">전형요소</span><span id="span_enter_ele_view">전체</span>
													<span class="tt_fold">수능반영영역</span><span id="span_enter_test_view">전체</span>
												</td>
											</tr>
										</tbody>
										
									</table>
								</div>
								<!-- //전형상세 -->
								
								<!-- 학과계열 -->
								<div class="tbl_wrap">
									<p class="box_btn" id="btn_sersBox_fold" style="display: none;"><a href="javascript:fn_sersBox_fold()" title="접기"><img src="./resources/images/btn_box_fold.png" alt="접기"></a></p>
										<p class="box_btn" id="btn_sersBox_out"><a href="javascript:fn_sersBox_out()" title="펼치기"><img src="./resources/images/btn_box_out.png" alt="펼치기"></a></p>
									<table class="search_tbl01">
										<colgroup>
											<col style="width:8%;">
											<col>
											<col style="width:80%;">
										</colgroup>
										<tbody id="tbsersDetail" style="display: none;">
											<tr class="bor_no">
												<th scope="row" rowspan="2">
													<label for="uv">학과</label>
												</th>
												
												<td colspan="2">
													<input id="searchKeyword" name="searchKeyword" title="학과검색어" onkeypress="if(event.keyCode==13){btn_search_keyword_init();}" style="ime-mode:active" placeholder="학과관련 키워드" class="search_input" type="text" value="" maxlength="30">
														<button title="검색" class="btn btn-default btn-sm btn btn-outline-dark" style="border-color: #783712">
															<i class="fa fa-search" style="color:#783712 "></i>&nbsp;<b>검색</b>
														</button>
												</td>
											</tr>
											<tr>
												<td colspan="2" class="list_wrap">
													<!-- 계열 선택 전 문구 -->
													
													<!-- //계열 선택 전 문구 -->
													<div class="box_wrap" id="searchBox">
														<div class="list box01">
															<h3>대계열</h3>
															
															<div class="menu" id="major1">
																<input id="major1" name="major1" type="hidden" value="">
							            						<ul>
							            							<li>대계열</li>
							            							<li></li>
							            							<li></li>
							            							<li></li>
							            						</ul>
															</div>
														</div>
														<div class="list box02">
															<h3>중계열</h3>
															<div class="menu" id="major2">
																<input id="major2" name="major2" type="hidden" value="">
							            						<ul>
							            							<li>중계열</li>
							            							<li></li>
							            							<li></li>
							            							<li></li>
							            						</ul>
															</div>
														</div>
														<div class="list box04">
															<h3>학과명</h3>
															<div class="menu" id="major">
																<input id="major" name="major" type="hidden" value="">
							            						<ul>
							            							<li>학과명</li>
							            							<li></li>
							            							<li></li>
							            							<li></li>
							            						</ul>
															</div>
														</div>
													</div>
													
													<!-- 키워드로 검색시 -->
													<div class="box_wrap" id="keywordBox" style="display: none;">
														<ul class="h3">
															<li class="h3_01">대계열</li>
															<li class="h3_02">중계열</li>
															<li class="h3_04"><input type="checkbox" name="chk_keySubjct_all" id="chk_keySubjct_all" onclick="fn_chkKeywordSubjct_onclick()"><label for="chk_keySubjct_all">학과명</label></li>
														</ul>
														<div class="keyword_list_box mCustomScrollbar _mCS_5 mCS_no_scrollbar"><div id="mCSB_5" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" tabindex="0" style="max-height: 142px;"><div id="mCSB_5_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
															<table class="search_tbl02">
																<caption>검색박스</caption>
																<colgroup>
																	<col style="width:20%;">
																	<col style="width:20%;">
																	<col style="width:26%;">
																	<col>
																</colgroup>
																<tbody id="tbKeyword">
																</tbody>
															</table>
														</div><div id="mCSB_5_scrollbar_vertical" class="mCSB_scrollTools mCSB_5_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;"><div class="mCSB_draggerContainer"><div id="mCSB_5_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; top: 0px;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div>
													</div>
													<!-- //키워드로 검색시 -->
													
												</td>
											</tr>
										</tbody>
										
										<tbody id="tbSers" class="tbl_fold">
											<tr>
												<th scope="row">
													<label for="uv">학과</label>
												</th>
												<td colspan="2" onclick="fn_sersBox_out()">
													<span class="tt_fold first">계열</span><span id="span_sers_view">전체</span>
												</td>
											</tr>
										</tbody>
										
									</table>
								</div>
								<!-- //학과계열 -->
							</fieldset>
					</div>
					<!-- 조건박스 모두 열렸을떄 -->
					<div class="search_box_btn">
						<button type="submit" title="검색" class="btn_searchAll btn btn-dark" >검색</button>
					</div>
			</form>
			
		<!-- 대학리스트 -->
					
					<div class="tbl_list" style="margin-top: 0px;">
						<table class="list_tbl01" id="tbSelctnInfList">
							<caption>대학 리스트</caption>
							<colgroup>
								<col style="width:13%;">
								<col style="width:6%;">
								<col style="width:8%;">
								<col><!-- 전형명 -->
								<col style="width:6%;"><!-- 모집인원 -->
								<col style="width:12%;"><!-- 경쟁률 -->
								
								<col style="width:7%;">
								
								<col style="width:6%;">
							</colgroup>
							<thead style="border-bottom: 1px solid #ddd;">
								<tr>
									<th scope="col">대학</th>
									<th scope="col">모집<br>시기</th>
									<th scope="col">학과</th>
									<th scope="col">전형명</th>
									<th scope="col">모집<br>인원</th>
									<th scope="col"><span id="cmpet_head"></span>경쟁률</th>
									
									<th scope="col">학습<br>진단</th>
									
									<th scope="col">관심<br>설정</th>
								</tr>
							</thead>
							<tbody id="tbResult">
								<c:forEach items="${listsJ }" var="rowj">
								<tr>
								</tr>
								<tr>
									<td id="hidden" scope="col" rowspan="2">${rowj.u_type}</td>			
									<td scope="col" rowspan="2">${rowj.uname}</td>
									<td scope="col" rowspan="2">${rowj.recruit_time}</td>
									<td scope="col" rowspan="2">${rowj.major}</td>
									<td scope="col" rowspan="2">${rowj.enter_name}</td>
									<td scope="col" rowspan="2">${rowj.recruit_num}</td>
									<td scope="col" rowspan="2">${rowj.rate_sj}</td>
									<td scope="col" rowspan="2">학습진단</td>
									<td scope="col" rowspan="2">관심설정</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				<!-- 대학 리스트 -->
			
				</div><!-- 일반대학교 끝 -->
				
		<!-- 전문대학교 시작 -->
				<div id="junmun" class="container tab-pane fade"><br/>
					<div class="search_tbl_box">
							<fieldset>
								<!-- 학과상세 -->
								<div class="tbl_wrap">
								<p class="box_btn" id="btn_selctnBox_fold"><a href="javascript:fn_selctnBox_fold()" title="접기"><img src="./resources/images/btn_box_fold.png" alt="접기"></a></p>
									<p class="box_btn" id="btn_selctnBox_out" style="display: none;"><a href="javascript:fn_selctnBox_out()" title="펼치기"><img src="./resources/images/btn_box_out.png" alt="펼치기"></a></p>
									<table class="search_tbl01">
										<colgroup>
											<col style="width:8%;">
											<col>
											<col style="width:80%;">
										</colgroup>
										<tbody id="tbSelctnDetail">
											<tr>
												<th scope="col">
													<label for="univ_nm">대학</label>
												</th>
												<td colspan="2">
													<input id="searchUnivKeyword" name="searchUnivKeyword" title="대학명검색" onkeypress="if(event.keyCode==13){btn_search_univ_init();}" style="ime-mode:active" placeholder="대학명을 입력해주세요." class="search_input" type="text" value="" maxlength="30">
													<button title="검색" class="btn btn-default btn-sm btn btn-outline-dark" style="border-color: #783712">
														<i class="fa fa-search" style="color:#783712 "></i>&nbsp;<b>검색</b>
													</button>
												</td>								
											</tr>											
											<tr>
												<th scope="row" rowspan="3">
													<label for="uv">전형<br>조건</label>
												</th>
												<td class="tt">모집시기</td>
												<td>
													<input type="checkbox" name="chk_recruit_time" id="chk_recruit_time_all" title="모집시기 검색조건" value="" checked="checked" onclick="fn_recruit_timeList_onclick(this)"><label for="chk_recruit_time_all">전체</label>
							    					<input type="checkbox" name="chk_recruit_time" id="chk_recruit_time_20" title="모집시기 검색조건" value="20" onclick="fn_recruit_timeList_onclick(this)"><label for="chk_recruit_time_20">수시</label>
													<input type="checkbox" name="chk_recruit_time" id="chk_recruit_time_31" title="모집시기 검색조건" value="31" onclick="fn_recruit_timeList_onclick(this)"><label for="chk_recruit_time_31">정시</label>
													<input type="checkbox" name="chk_recruit_time" id="chk_recruit_time_40" title="모집시기 검색조건" value="40" onclick="fn_recruit_timeList_onclick(this)"><label for="chk_recruit_time_40">추가</label>
												</td>
											</tr>
											<tr>
												<td class="tt">전형유형</td>
												<td>
													<input type="checkbox" name="chk_enter_type" id="chk_enter_type_all" title="전형유형 검색조건" value="" checked="checked" onclick="fn_enter_typeList_onclick(this);"><label for="chk_enter_type_all">전체</label>
													<input type="checkbox" name="chk_enter_type" id="chk_enter_type_02" title="전형유형 검색조건" onclick="fn_enter_typeList_onclick(this)" value="02"><label for="chk_enter_type_02">학생부위주</label>
														<input type="checkbox" name="chk_enter_type" id="chk_enter_type_05" title="전형유형 검색조건" onclick="fn_enter_typeList_onclick(this)" value="05"><label for="chk_enter_type_05">수능위주</label>
													<input type="checkbox" name="chk_enter_type" id="chk_enter_type_03" title="전형유형 검색조건" onclick="fn_enter_typeList_onclick(this)" value="03"><label for="chk_enter_type_03">실기/실적위주</label>
													<br/>
													<input type="checkbox" name="chk_enter_type" id="chk_enter_type_07" title="전형유형 검색조건" onclick="fn_enter_typeList_onclick(this)" value="07"><label for="chk_enter_type_06">면접위주</label>
													<input type="checkbox" name="chk_enter_type" id="chk_enter_type_08" title="전형유형 검색조건" onclick="fn_enter_typeList_onclick(this)" value="08"><label for="chk_enter_type_06">비교과</label>
													<input type="checkbox" name="chk_enter_type" id="chk_enter_type_06" title="전형유형 검색조건" onclick="fn_enter_typeList_onclick(this)" value="06"><label for="chk_enter_type_06">기타</label>
													
												</td>
											</tr>
											<tr>
												<td class="tt">전형명</td>
												<td>
													<table style="width:100%;">
														<tbody><tr>
															<td colspan="2">
																<input type="checkbox" name="enter_name" id="enter_name_all" title="전형명 검색조건" value="" checked="checked" onclick="fn_enter_nameList_onclick(this);"><label for="enter_name_all">전체</label>									
															</td>
														</tr>
														<tr>
															<td style="width:170px;" colspan="2">
																<input type="checkbox" name="enter_name" id="enter_name_01" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="01" value="01"><label for="enter_name_01">일반전형</label>
															</td>
															
														</tr>
														<tr>
															<td style="width:170px;">
																<input type="checkbox" name="enter_name" id="enter_name_all_02" title="전형명 검색조건" data-group="02" value="04,22,06,03," onclick="fn_enter_nameList_onclick(this);"><label for="enter_name_all_02">특별전형(정원내)</label>
															</td>
															<td>
																<input type="checkbox" name="enter_name" id="enter_name_04" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="02" value="04"><label for="enter_name_04">대학별독자적기준</label>
																<input type="checkbox" name="enter_name" id="enter_name_22" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="02" value="22"><label for="enter_name_22">정원외 특별전형(정원외)</label>
																<br/>
																<input type="checkbox" name="enter_name" id="enter_name_06" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="02" value="06"><label for="enter_name_06">고른기회 특별전형</label>
																<input type="checkbox" name="enter_name" id="enter_name_03" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="02" value="03"><label for="enter_name_03">특기자</label>
															</td>
														</tr>
														<tr>
															<td style="width:170px;">
																<input type="checkbox" name="enter_name" id="enter_name_all_03" title="전형명 검색조건" data-group="03" value="10,12,17,14,13,18,08,16,11,19,21,20," onclick="fn_enter_nameList_onclick(this);"><label for="enter_name_all_03">특별전형(정원외)</label>
															</td>
															<td>
																<input type="checkbox" name="enter_name" id="enter_name_10" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="10"><label for="enter_name_10">농어촌 학생</label>
																<input type="checkbox" name="enter_name" id="enter_name_12" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="12"><label for="enter_name_12">특성화고교 졸업자</label>
																<input type="checkbox" name="enter_name" id="enter_name_17" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="17"><label for="enter_name_17">특성화고 등을 졸업한 재직자</label>
																<br/>
																<input type="checkbox" name="enter_name" id="enter_name_14" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="14"><label for="enter_name_14">기초생활수급자, 차상위계층, 한부모가족 지원대상자</label>
																<br/>
																<input type="checkbox" name="enter_name" id="enter_name_13" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="13"><label for="enter_name_13">장애인등대상자</label>
																<input type="checkbox" name="enter_name" id="enter_name_18" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="18"><label for="enter_name_18">서해5도</label>
																<input type="checkbox" name="enter_name" id="enter_name_08" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="08"><label for="enter_name_08">군위탁생</label>
																<input type="checkbox" name="enter_name" id="enter_name_16" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="16"><label for="enter_name_16">계약학과</label>
																<input type="checkbox" name="enter_name" id="enter_name_99" data-group="03" title="산업대학위탁생(정원외),정부위탁생(정원외),제주특별자치도 특별법(정원외),416 세월호 특별법(정원외)," value="11,19,21,20," onclick="fn_enter_nameList_onclick(this);">
																 <label for="enter_name_99" title="산업대학위탁생(정원외),정부위탁생(정원외),제주특별자치도 특별법(정원외),416 세월호 특별법(정원외)," style="margin-left: -5px;">기타</label>
															
															</td>
														</tr>
													</tbody></table>											
												</td>
											</tr>
										</tbody>
										
										<tbody style="display: none;" id="tbSelctn" class="tbl_fold">
											<tr>
												<th scope="row">전형<br>조건</th>
 													<td colspan="2" onclick="fn_selctnBox_out()">
													<span class="tt_fold first">모집시기</span><span id="span_recruit_time_view"></span>
													<span class="tt_fold">전형유형</span><span id="span_enter_type_view"></span>
													<span class="tt_fold">전형명</span><span id="span_enter_name_view"></span>
												</td>
											</tr>
										</tbody>
										
									</table>
								</div>
								<!-- //학과상세 -->
								<!-- 전형상세 -->
								<div class="tbl_wrap" id="tb_dtl_search">
									<table class="search_tbl01">
										<colgroup>
											<col style="width:8%;">
											<col>
											<col style="width:80%;">
										</colgroup>
										<tbody id="tbSelctnDtlDetail" style="display: none;">
											<tr>
												<th scope="row" rowspan="4">
													<label for="uv">전형<br>상세</label>
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
												<td class="tt">전형요소</td>
												<td id="tbenter_eleChk">
													<span><input type="checkbox" value="Y" id="chk_stdpt" name="chk_stdpt"> <label for="chk_stdpt">학생부</label></span>
													<span><input type="checkbox" value="Y" id="chk_csat" name="chk_csat"> <label for="chk_csat">수능</label></span>
													<span><input type="checkbox" value="Y" id="chk_oral_intrvw" name="chk_oral_intrvw"> <label for="chk_oral_intrvw">면접/구술</label></span>
													<span><input type="checkbox" value="Y" id="chk_essy" name="chk_essy"> <label for="chk_essy">논술</label></span>
													<span><input type="checkbox" value="Y" id="chk_aptd" name="chk_aptd"> <label for="chk_aptd">적성</label></span>
													<span><input type="checkbox" value="Y" id="chk_prcttq" name="chk_prcttq"> <label for="chk_prcttq">실기</label></span>
													<span><input type="checkbox" value="Y" id="chk_papers" name="chk_papers"> <label for="chk_papers">서류</label></span>
													<span><input type="checkbox" value="Y" id="chk_etc" name="chk_etc"> <label for="chk_etc">기타</label></span>
													<span><input type="checkbox" value="Y" id="chk_one_step_scr" name="chk_one_step_scr"> <label for="chk_one_step_scr">1단계성적</label></span></td>
											</tr>
											<tr>
												<td class="tt">수능반영영역</td>
												<td id="tbenter_testRelm"><span><input type="checkbox" id="v_cho_lang" name="cho_lang" value="Y" onclick="fn_use_select(this)"> <label for="v_cho_lang">국어</label></span><span><input type="checkbox" id="v_cho_math" name="cho_math" value="Y" onclick="fn_use_select(this)"> <label for="v_cho_math">수학</label><label class="tts" for="v_cho_math_sel">수학영역선택</label> <select class="w70" id="v_cho_math_sel" name="cho_math_sel" disabled="disabled"><option value="ALL">선택</option><option value="A">가</option><option value="B">나</option></select></span><span><input type="checkbox" id="v_cho_fori" name="cho_fori" value="Y" onclick="fn_use_select(this)"> <label for="v_cho_fori">영어</label></span><span><input type="checkbox" id="v_cho_serch" name="cho_serch" value="Y" onclick="fn_use_select(this)"> <label for="v_cho_serch">탐구영역</label><label class="tts" for="v_cho_serch_sel">탐구영역선택</label> <select class="w70" id="v_cho_serch_sel" name="cho_serch_sel" disabled="disabled"><option value="ALL">선택</option><option value="so">사회</option><option value="sc">과학</option><option value="oc">직업</option></select></span><span><input type="checkbox" id="v_cho_secLan_chi" name="cho_secLan_chi" value="Y"> <label for="v_cho_secLan_chi">제2외국어/한문</label></span><span><input type="checkbox" id="v_cho_his" name="cho_his" value="Y"> <label for="v_cho_his">한국사</label></span></td>
											</tr>
										</tbody>
										
										<tbody id="tbSelctnDtl" class="tbl_fold">
											<tr>
												<th scope="row">전형<br>상세</th>
												<td colspan="2" onclick="fn_selctnDtlBox_out()">
													<span class="tt_fold first">지역</span><span id="span_location_view">전체</span>
													<span class="tt_fold">전형요소</span><span id="span_enter_ele_view">전체</span>
													<span class="tt_fold">수능반영영역</span><span id="span_enter_test_view">전체</span>
													
												</td>
											</tr>
										</tbody>
										
									</table>
								</div>
								<!-- //전형상세 -->
								
								<!-- 학과계열 -->
								<div class="tbl_wrap">
									<table class="search_tbl01">
										<colgroup>
											<col style="width:8%;">
											<col>
											<col style="width:80%;">
										</colgroup>
										<tbody id="tbsersDetail" style="display: none;">
											<tr class="bor_no">
												<th scope="row" rowspan="2">
													<label for="uv">학과</label>
												</th>
												
												<td colspan="2">
													<input id="searchKeyword" name="searchKeyword" title="학과검색어" onkeypress="if(event.keyCode==13){btn_search_keyword_init();}" style="ime-mode:active" placeholder="학과관련 키워드" class="search_input" type="text" value="" maxlength="30">
														<button title="검색" class="btn btn-default btn-sm btn btn-outline-dark" style="border-color: #783712">
															<i class="fa fa-search" style="color:#783712 "></i>&nbsp;<b>검색</b>
														</button>
												</td>
											</tr>
											<tr>
												<td colspan="2" class="list_wrap">
													<!-- 계열 선택 전 문구 -->
													
													<!-- //계열 선택 전 문구 -->
													<div class="box_wrap" id="searchBox">
														<div class="list box01">
															<h3>대계열</h3>
															
															<div class="menu" id="major1">
																<input id="major1" name="major1" type="hidden" value="">
								            						<ul>
								            							<li>대계열</li>
								            							<li></li>
								            							<li></li>
								            							<li></li>
								            						</ul>
															</div>
														</div>
														<div class="list box02">
															<h3>중계열</h3>
															<div class="menu" id="major2">
																<input id="major2" name="major2" type="hidden" value="">
							            						<ul>
							            							<li>중계열</li>
							            							<li></li>
							            							<li></li>
							            							<li></li>
							            						</ul>
															</div>
														</div>
														<div class="list box04">
															<h3>학과명</h3>
															<div class="menu" id="major">
																<input id="major" name="major" type="hidden" value="">
								            						<ul>
								            							<li>학과명</li>
								            							<li></li>
								            							<li></li>
								            							<li></li>
								            						</ul>
															</div>
														</div>
													</div>
													
									
												</td>
											</tr>
										</tbody>
										
										<tbody id="tbSers" class="tbl_fold">
											<tr>
												<th scope="row">
													<label for="uv">학과</label>
												</th>
												<td colspan="2" onclick="fn_sersBox_out()">
													<span class="tt_fold first">계열</span><span id="span_sers_view">전체</span>
												</td>
											</tr>
										</tbody>
										
									</table>
								</div>
								<!-- //학과계열 -->
							</fieldset>
					</div>
					<!-- 조건박스 모두 열렸을떄 -->
					<div class="search_box_btn">
						<button type="submit" title="검색" class="btn_searchAll btn btn-dark" >검색</button>
					</div>
			
			
		<!-- 대학리스트 -->
					
					<div class="tbl_list" style="margin-top: 0px;">
						<table class="list_tbl01" id="tbSelctnInfList">
							<caption>대학 리스트</caption>
							<colgroup>
								<col style="width:13%;">
								<col style="width:6%;">
								<col style="width:8%;">
								<col><!-- 전형명 -->
								<col style="width:6%;"><!-- 모집인원 -->
								<col style="width:12%;"><!-- 경쟁률 -->
								
								<col style="width:7%;">
								
								<col style="width:6%;">
							</colgroup>
							<thead style="border-bottom: 1px solid #ddd;">
								<tr>
									<th scope="col">대학</th>
									<th scope="col">모집<br>시기</th>
									<th scope="col">학과</th>
									<th scope="col">전형명</th>
									<th scope="col">모집<br>인원</th>
									<th scope="col"><span id="cmpet_head"></span>경쟁률</th>
									
									<th scope="col">학습<br>진단</th>
									
									<th scope="col">관심<br>설정</th>
								</tr>
							</thead>
							<tbody id="tbResult">
							<c:forEach items="${listsJ }" var="rowj">
								<tr>
								</tr>
								<tr>
									<td id="hidden" scope="col" rowspan="2">${rowj.u_type}</td>			
									<td scope="col" rowspan="2">${rowj.uname}</td>
									<td scope="col" rowspan="2">${rowj.recruit_time}</td>
									<td scope="col" rowspan="2">${rowj.major}</td>
									<td scope="col" rowspan="2">${rowj.enter_name}</td>
									<td scope="col" rowspan="2">${rowj.recruit_num}</td>
									<td scope="col" rowspan="2">${rowj.rate_sj}</td>
									<td scope="col" rowspan="2">학습진단</td>
									<td scope="col" rowspan="2">관심설정</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
			<!-- 대학리스트 -->
				</div><!-- 전문대학교 끝 -->
				
			</div><!-- tab-content -->
		</div>
	</div>
	
	<%@include file="../main/bottom.jsp" %>
</body>
</html>