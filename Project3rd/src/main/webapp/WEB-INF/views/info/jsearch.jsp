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
//모집시기 체크박스 처리
function fn_recruit_timeList_onclick(recruit_time){		
		if($(recruit_time).attr("id") == "recruit_time_all"){
			$("#recruit_time_all").prop("checked",true);
			$("input[id^='recruit_time']:not(input[id='recruit_time_all'])").prop("checked",false);
		}else{
			
			$("#recruit_time_all").prop("checked",false);
			var recruit_time_list = $("input[id^='recruit_time']:checked").get();
			
			if(recruit_time_list.length < 1){
				$("#recruit_time_all").prop("checked",true);
			}
		}	
		
		//전문대
		if($(recruit_time).attr("id") == "j_recruit_time_all"){
			$("#j_recruit_time_all").prop("checked",true);
			$("input[id^='j_recruit_time']:not(input[id='j_recruit_time_all'])").prop("checked",false);
		}else{
			
			$("#j_recruit_time_all").prop("checked",false);
			var recruit_time_list = $("input[id^='j_recruit_time']:checked").get();
			
			if(recruit_time_list.length < 1){
				$("#j_recruit_time_all").prop("checked",true);
			}
		}	
		
}


//지역 체크박스 처리
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

//전형요소 체크 처리
function enterEle_onclick(ele){
	
	if($(ele).attr("id") == "enter_ele_all"){
		$("#enter_ele_all").prop("checked",true);
		$("input[id^='enter_ele']:not(input[id='enter_ele_all'])").prop("checked",false);
	}else{
		
		$("#enter_ele_all").prop("checked",false);
		var enterEle_list = $("input[id^='enter_ele']:checked").get();
		
		if(enterEle_list.length < 1){
			$("#enter_ele_all").prop("checked",true);
		}
	}	
	
	//전문대
	if($(ele).attr("id") == "j_enter_ele_all"){
		$("#j_enter_ele_all").prop("checked",true);
		$("input[id^='j_enter_ele']:not(input[id='j_enter_ele_all'])").prop("checked",false);
	}else{
		
		$("#j_enter_ele_all").prop("checked",false);
		var enterEle_list = $("input[id^='j_enter_ele']:checked").get();
		
		if(enterEle_list.length < 1){
			$("#j_enter_ele_all").prop("checked",true);
		}
	}	
}



//전형유형타입 체크박스 처리
function fn_enter_typeList_onclick(enter_type){

	if($(enter_type).attr("id") == "enter_type_all"){
		$("#enter_type_all").prop("checked",true);
		$("input[id^='enter_type']:not(input[id='enter_type_all'])").prop("checked",false);
	}else{
		
		$("#enter_type_all").prop("checked",false);
		var enter_type_list = $("input[id^='enter_type']:checked").get();
		
		if(enter_type_list.length < 1){
			$("#enter_type_all").prop("checked",true);
		}
	}
	
	
	if($(enter_type).attr("id") == "j_enter_type_all"){
		$("#j_enter_type_all").prop("checked",true);
		$("input[id^='j_enter_type']:not(input[id='j_enter_type_all'])").prop("checked",false);
	}else{
		
		$("#j_enter_type_all").prop("checked",false);
		var enter_type_list = $("input[id^='j_enter_type']:checked").get();
		
		if(enter_type_list.length < 1){
			$("#j_enter_type_all").prop("checked",true);
		}
	}
	
}


	
//전형명 체크박스 처리
function fn_enter_nameList_onclick(enter_name){

	if($(enter_name).attr("id") == "enter_name_all"){
		//전체선택해제
		$("#enter_name_all").prop("checked",true);
		//하위선택해제
		$("input[id^='enter_name']:not(input[id='enter_name_all'])").prop("checked",false);
	}else if ($(enter_name).attr("id").indexOf("all") > -1){
		//전체 선택 해제
		$("#enter_name_all").prop("checked",false);
					
		//하위 선택 해제
		var group = $(enter_name).data("group");
		console.log("this : " + group);
		$("input[id^='enter_name']:not(input[id^='enter_name_all'])").each(function() {
			console.log("target : " + $(this).data("group"));
			if($(this).data("group") == group) {
				console.log("checked" + $(this).data("group") );
				$(this).prop("checked", false);
			}
		});

		//없으면 전체
		var enter_name_list = $("input[id^='enter_name']:checked").get();
		if(enter_name_list.length < 1){
			$("#enter_name_all").prop("checked",true);
		}
	} else {
		//전체선택해제
		$("#enter_name_all").prop("checked",false);
		
		//상위선택해제
		$("input[id='enter_name_all_"+$(enter_name).data("group")+"']").prop("checked", false);

		//없으면 전체
		var enter_name_list = $("input[id^='enter_name']:checked").get();
		if(enter_name_list.length < 1){
			$("#enter_name_all").prop("checked",true);
		}
	}
	
	//전문대
	if($(enter_name).attr("id") == "j_enter_name_all"){
		//전체선택해제
		$("#j_enter_name_all").prop("checked",true);
		//하위선택해제
		$("input[id^='j_enter_name']:not(input[id='j_enter_name_all'])").prop("checked",false);
	}else if ($(enter_name).attr("id").indexOf("all") > -1){
		//전체 선택 해제
		$("#j_enter_name_all").prop("checked",false);
					
		//하위 선택 해제
		var group = $(enter_name).data("group");
		console.log("this : " + group);
		$("input[id^='j_enter_name']:not(input[id^='j_enter_name_all'])").each(function() {
			console.log("target : " + $(this).data("group"));
			if($(this).data("group") == group) {
				console.log("checked" + $(this).data("group") );
				$(this).prop("checked", false);
			}
		});

		//없으면 전체
		var enter_name_list = $("input[id^='j_enter_name']:checked").get();
		if(enter_name_list.length < 1){
			$("#j_enter_name_all").prop("checked",true);
		}
	} else {
		//전체선택해제
		$("#j_enter_name_all").prop("checked",false);
		
		//상위선택해제
		$("input[id='j_enter_name_all_"+$(enter_name).data("group")+"']").prop("checked", false);

		//없으면 전체
		var enter_name_list = $("input[id^='j_enter_name']:checked").get();
		if(enter_name_list.length < 1){
			$("#j_enter_name_all").prop("checked",true);
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
	
	$("#btn_selctnDtlBox_fold2").hide();
	$("#btn_selctnDtlBox_out2").show();
	$("#tbSelctnDtlDetail2").hide();
	$("#tbSelctnDtl2").show();
}

//전형상세 텍스트
function fn_selctnDtlBox_text_set() {

	//지역 텍스트
	var chk_location_list = $("input[id^='chk_location']:checked").get();
	var location_list = "";
	$.each(chk_location_list, function(index, item){
		var location_id = item.id.toString();
		location_list += ","+$("#"+location_id).next("label").html();
	});
	
	$("#location_view").html(location_list.substring(1));
	
	//전형요소 텍스트
	var chk_enter_ele_list = $("input[id^='enter_ele']:checked").get();
	var enter_ele_list = "";
	
	$.each(chk_enter_ele_list, function(index, item){
		var enter_ele_id = item.id.toString();
		enter_ele_list += ","+$("#"+enter_ele_id).next("label").html();
	});

	$("#enter_ele_view").html(enter_ele_list.substring(1));
	
	
}	

//전형상세조건 펼치기
function fn_selctnDtlBox_out(){
	
	$("#btn_selctnDtlBox_out").hide();
	$("#btn_selctnDtlBox_fold").show();
	$("#tbSelctnDtl").hide();
	$("#tbSelctnDtlDetail").show();
	
	$("#btn_selctnDtlBox_out2").hide();
	$("#btn_selctnDtlBox_fold2").show();
	$("#tbSelctnDtl2").hide();
	$("#tbSelctnDtlDetail2").show();
}



//학과계열조건 접기
function fn_sersBox_fold(){
	
	$("#btn_sersBox_fold").hide();
	$("#btn_sersBox_out").show();
	$("#tbsersDetail").hide();
	$("#tbSers").show();
	//전문대
	$("#btn_sersBox_fold2").hide();
	$("#btn_sersBox_out2").show();
	$("#tbsersDetail2").hide();
	$("#tbSers2").show();
}


//학과계열조건 펼치기
function fn_sersBox_out(){
	$("#btn_sersBox_out").hide();
	$("#btn_sersBox_fold").show();
	$("#tbSers").hide();
	$("#tbsersDetail").show();
	
	//전문대
	$("#btn_sersBox_out2").hide();
	$("#btn_sersBox_fold2").show();
	$("#tbSers2").hide();
	$("#tbsersDetail2").show();
}

//폼값 전달하기 
function checkboxFrm(fn){
	
	var fn = document.checkFrm;
	
	var lst_location_list = [];
	var lst_recruit_list = [];
	var lst_enter_type_list = [];
	var lst_enter_name_list = [];
	var lst_enter_ele_list = [];

	
	var locationlist = $("input[id^='chk_location']:checked").get();
	var recruit_list = $("input[id^='recruit_time']:checked").get();
	var enter_type_list = $("input[id^='enter_type']:checked").get();
	var enter_name_list = $("input[id^='enter_name']:checked").get();
	var enter_ele_list = $("input[id^='enter_ele']:checked").get();



}



function utypeClick(){

	$('#tbResult').empty();
	$('#tbResult2').empty();
	
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

//중계열 선택
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

//학과명 선택
function ch_major3(maj3){
	
	document.getElementById('major3').value =maj3;
	document.getElementById('major').value =maj3;
	
	var maj= document.getElementById('major1').value;
	var maj2= document.getElementById('major2').value;

}

//관심전형 선택
function click_interestJ(){

	$.ajax({
		url : "./interest_chkJ.do",
		type : 'POST',
		dataType : "html",
		data :{
			major_idx : major_idx,
			   id : id
		},
		success : function(){
			$("#noheart"+major_idx).toggle();
			$("#heart"+major_idx).toggle();
	
			alert("관심대학 설정되었습니다.")
			alert("대학정보"+uname)
			alert("id"+id)
	
		
		},
		error : function(e){
			alert("실패"+e.status)
			alert("대학정보"+uname)
			alert("id"+id)
			
		
		}
	});

}


function click_nointerestJ(major_idx,id){

$.ajax({
	url : "./interest_unchkJ.do",
	type : 'GET',
	dataType : "html",
	data :{
		major_idx : major_idx,
		   id : id
	},
	success : function(){
		
		$("#heart"+major_idx).toggle();
		$("#noheart"+major_idx).toggle();

		alert("관심대학 설정이 취소되었습니다.")
		alert("major_idx="+major_idx)
		alert("id"+id)
	},
	error : function(e){
		alert("실패"+e.status)
		alert("major_idx="+major_idx)
		alert("id"+id)
	
	}
});

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
	<div class="contents" style="height: 1500px;">
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
				<div id="ilban" class="container tab-pane active" ><br/>
			<form id="checkFrm" name="checkFrm" action="./checkAction3.do" method="get" onsubmit="return checkboxFrm();">
					<div class="search_tbl_box">
							<fieldset>
								<!-- 학과상세 -->
								<div class="tbl_wrap">
								<input type="hidden" id="u_type" name="u_type" value="일반대" />
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
													<input type="checkbox" name="recruit_time" id="recruit_time_all" title="모집시기 검색조건" value="%" checked="checked" onclick="fn_recruit_timeList_onclick(this)"><label for="chk_recruit_time_all">전체</label>
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
													<input type="checkbox" name="enter_type" id="enter_type_all" title="전형유형 검색조건" value="%" checked="checked" onclick="fn_enter_typeList_onclick(this);"><label for="enter_type_all">전체</label>
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
																<input type="checkbox" name="enter_name" id="enter_name_all" title="전형명 검색조건" value="%" checked="checked" onclick="fn_enter_nameList_onclick(this);"><label for="enter_name_all">전체</label>									
															</td>
														</tr>
														<tr>
															<td style="width:170px;" colspan="2">
																<input type="checkbox" name="enter_name" id="enter_name_1" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="01" value="일반전형"><label for="enter_name_01">일반전형</label>
															</td>
															
														</tr>
														<tr>
															
															<td>
																<input type="checkbox" name="enter_name" id="enter_name_1" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="농어촌"><label for="enter_name_10">농어촌 학생</label>
																<input type="checkbox" name="enter_name" id="enter_name_2" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="특성화고교"><label for="enter_name_12">특성화고교 졸업자</label>
																<input type="checkbox" name="enter_name" id="enter_name_3" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="재직자"><label for="enter_name_17">특성화고 등을 졸업한 재직자</label>
																<br/>
																<input type="checkbox" name="enter_name" id="enter_name_4" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="기초생활차상위"><label for="enter_name_14">기초생활수급자 및 차상위</label>
																<input type="checkbox" name="enter_name" id="enter_name_5" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="고른기회"><label for="enter_name_14">고른기회전형</label>
																<input type="checkbox" name="enter_name" id="enter_name_6" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="장애인"><label for="enter_name_14">장애인등대상자</label>
																<br/>
																<input type="checkbox" name="enter_name" id="enter_name_7" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="저소득"><label for="enter_name_13">저소득가구학생</label>
																<input type="checkbox" name="enter_name" id="enter_name_8" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="특수교육"><label for="enter_name_18">특수교육대상자</label>
																<input type="checkbox" name="enter_name" id="enter_name_9" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="지역"><label for="enter_name_08">지역인재 및 균형선발 전형</label>
																<input type="checkbox" name="enter_name" id="enter_name_10" title="산업대학위탁생(정원외),정부위탁생(정원외),제주특별자치도 특별법(정원외),416 세월호 특별법(정원외)," value="%" onclick="fn_enter_nameList_onclick(this);">
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
												<th scope="row" rowspan="2">
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
												<td>
													<input type="checkbox" value="%"  id="enter_ele_all" name="enter_ele" checked="checked" onclick="enterEle_onclick(this);"> <label for="enter_ele_all">전체</label>
													<input type="checkbox" value="학생부"  id="enter_ele_1" name="enter_ele" onclick="enterEle_onclick(this);"> <label for="enter_ele_1">학생부</label>
													<input type="checkbox" value="수능"  id="enter_ele_2" name="enter_ele" onclick="enterEle_onclick(this);"> <label for="enter_ele_2">수능</label>
													<input type="checkbox" value="면접"  id="enter_ele_3" name="enter_ele" onclick="enterEle_onclick(this);"> <label for="enter_ele_3">면접/구술</label>
													<input type="checkbox" value="논술"  id="enter_ele_4" name="enter_ele" onclick="enterEle_onclick(this);"> <label for="enter_ele_4">논술</label>
													<input type="checkbox" value="적성"  id="enter_ele_5" name="enter_ele" onclick="enterEle_onclick(this);"> <label for="enter_ele_5">적성</label>
													<input type="checkbox" value="실기"  id="enter_ele_6" name="enter_ele" onclick="enterEle_onclick(this);"> <label for="enter_ele_6">실기</label>
													<input type="checkbox" value="서류"  id="enter_ele_7" name="enter_ele" onclick="enterEle_onclick(this);"> <label for="enter_ele_7">서류</label>
													<input type="checkbox" value="기타"  id="enter_ele_8" name="enter_ele" onclick="enterEle_onclick(this);"> <label for="enter_ele_8">기타</label>
													<input type="checkbox" value="1단계성적"  id="enter_ele_9" name="enter_ele" onclick="enterEle_onclick(this);"> <label for="enter_ele_9">1단계성적</label>
													<input type="checkbox" value="2단계성적"  id="enter_ele_10" name="enter_ele" onclick="enterEle_onclick(this);"> <label for="enter_ele_10">2단계성적</label>
												</td>
													
											</tr>
											
										</tbody>
										
										<tbody id="tbSelctnDtl" class="tbl_fold">
											<tr>
												<th scope="row">전형<br>상세</th>
												<td colspan="2" onclick="fn_selctnDtlBox_out()">
													<span class="tt_fold first">지역</span><span id="location_view">전체</span>
													<span class="tt_fold">전형요소</span><span id="enter_ele_view">전체</span>
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
													<input id="major" name="major" title="학과검색어" onkeypress="if(event.keyCode==13){btn_search_keyword_init();}" style="ime-mode:active" placeholder="학과관련 키워드" class="search_input" type="text" value="" maxlength="30">
														<button title="검색" class="btn btn-default btn-sm btn btn-outline-dark" style="border-color: #783712">
															<i class="fa fa-search" style="color:#783712 "></i>&nbsp;<b>검색</b>
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
															<br /> 
																<input style="margin-top:5px; margin-left:4px; width: 98%" type="text" id="major1" name="major1" value="" />
															
													
														</div>
														<div class="list box02" class="dropdown">
															<button type="button" id="button2" class="btn btn-default dropdown-toggle" data-toggle="dropdown">대학분류 [중계열]</button>
															<div class="menu dropdown-menu" id="maj2div" >
															
															</div>
															<br /> 
																<input style="margin-top:5px; margin-left:4px; width: 98%" type="text" id="major2" name="major2" value="" />
															
														</div>
														
														<div class="list box04" class="dropdown">
															<button type="button" id="button3" class="btn btn-default dropdown-toggle" data-toggle="dropdown">학과명</button>
															<div class="menu dropdown-menu" id="maj3div">
																
															</div>	
															<br/>
																<input style="margin-top:5px; margin-left:4px; width: 98%" type="text" id="major3" name="major" value=""  />
																
															
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
			</form>
			
		<!-- 대학리스트 -->
					
					<div class="tbl_list" style="margin-top: 0px;">
						<table class="list_tbl01" id="tbSelctnInfList">
							<caption>검색버튼을 눌러주세요</caption>
							<colgroup>
								<col style="width:13%;">
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
									<th id="hid-den" scope="col">IDX</th>
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
									<td id="hid-den" scope="col" rowspan="2">${rowj.major_idx}</td>			
									<td id="hidden" scope="col" rowspan="2">${rowj.u_type}</td>			
									<td scope="col" rowspan="2">${rowj.uname}</td>
									<td scope="col" rowspan="2">${rowj.recruit_time}</td>
									<td scope="col" rowspan="2">${rowj.major}</td>
									<td scope="col" rowspan="2">${rowj.enter_name}</td>
									<td scope="col" rowspan="2">${rowj.recruit_num}</td>
									<td scope="col" rowspan="2">${rowj.rate_sj}</td>
									<td scope="col" rowspan="2">학습진단</td>
									<td scope="col" rowspan="2">
											<i onclick="click_interestJ('${rowj.major_idx}','${siteUserInfo }');" id="noheart${rowj.major_idx }" class="far fa-star" style='font-size:24px'></i>
											<i onclick="click_nointerestJ('${rowj.major_idx}','${siteUserInfo }');" id="heart${rowj.major_idx }" class="fas fa-star" style='display:none; font-size:24px'></i>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				<!-- 대학 리스트 -->
			
				</div><!-- 일반대학교 끝 -->
				
		<!-- 전문대학교 시작 -->
				<div id="junmun" class="container tab-pane fade" ><br/>
				<form id="checkFrm" name="checkFrm" action="./checkAction3.do" method="get" onsubmit="return checkboxFrm();">
					<div class="search_tbl_box">
							<fieldset>
								<!-- 학과상세 -->
								<div class="tbl_wrap">
								<input type="hidden" id="u_type2" name="u_type" value="전문대" />
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
													<input id="searchWord2" name="searchWord" title="대학명검색" placeholder="대학명을 입력해주세요." type="text" value="" maxlength="30">
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
													<input type="checkbox" name="recruit_time" id="j_recruit_time_all" title="모집시기 검색조건" value="%" checked="checked" onclick="fn_recruit_timeList_onclick(this)"><label for="chk_recruit_time_all">전체</label>
							    					<input type="checkbox" name="recruit_time" id="j_recruit_time_1" title="모집시기 검색조건" value="수시" onclick="fn_recruit_timeList_onclick(this)"><label for="chk_recruit_time_1">수시</label>
													<input type="checkbox" name="recruit_time" id="j_recruit_time_2" title="모집시기 검색조건" value="정시(가)" onclick="fn_recruit_timeList_onclick(this)"><label for="chk_recruit_time_2">정시(가)</label>
													<input type="checkbox" name="recruit_time" id="j_recruit_time_3" title="모집시기 검색조건" value="정시(나)" onclick="fn_recruit_timeList_onclick(this)"><label for="chk_recruit_time_3">정시(나)</label>
													<input type="checkbox" name="recruit_time" id="j_recruit_time_4" title="모집시기 검색조건" value="정시(다)" onclick="fn_recruit_timeList_onclick(this)"><label for="chk_recruit_time_4">정시(다)</label>
													<input type="checkbox" name="recruit_time" id="j_recruit_time_5" title="모집시기 검색조건" value="추가" onclick="fn_recruit_timeList_onclick(this)"><label for="chk_recruit_time_5">추가</label>
												</td>
											</tr>
											<tr>
												<td class="tt">전형유형</td>
												<td>
													<input type="checkbox" name="enter_type" id="j_enter_type_all" title="전형유형 검색조건" value="%" checked="checked" onclick="fn_enter_typeList_onclick(this);"><label for="enter_type_all">전체</label>
													<input type="checkbox" name="enter_type" id="j_enter_type_1" title="전형유형 검색조건" onclick="fn_enter_typeList_onclick(this)" value="학생부위주(교과)"><label for="enter_type_01">학생부위주(교과)</label>
													<input type="checkbox" name="enter_type" id="j_enter_type_2" title="전형유형 검색조건" onclick="fn_enter_typeList_onclick(this)" value="학생부위주(종합)"><label for="enter_type_02">학생부위주(종합)</label>
													<input type="checkbox" name="enter_type" id="j_enter_type_3" title="전형유형 검색조건" onclick="fn_enter_typeList_onclick(this)" value="실기/실적위주"><label for="enter_type_03">실기/실적위주</label>
													<br/>
													<input type="checkbox" name="enter_type" id="j_enter_type_4" title="전형유형 검색조건" onclick="fn_enter_typeList_onclick(this)" value="논술위주"><label for="enter_type_04">논술위주</label>
													<input type="checkbox" name="enter_type" id="j_enter_type_5" title="전형유형 검색조건" onclick="fn_enter_typeList_onclick(this)" value="수능위주"><label for="enter_type_05">수능위주</label>
													<input type="checkbox" name="enter_type" id="j_enter_type_6" title="전형유형 검색조건" onclick="fn_enter_typeList_onclick(this)" value="기타"><label for="enter_type_06">기타</label>
												</td>
											</tr>
											<tr>
												<td class="tt">전형명</td>
												<td>
													<table style="width:100%;">
														<tbody><tr>
															<td colspan="2">
																<input type="checkbox" name="enter_name" id="j_enter_name_all" title="전형명 검색조건" value="%" checked="checked" onclick="fn_enter_nameList_onclick(this);"><label for="enter_name_all">전체</label>									
															</td>
														</tr>
														<tr>
															<td style="width:170px;" colspan="2">
																<input type="checkbox" name="enter_name" id="j_enter_name_1" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="01" value="일반전형"><label for="enter_name_01">일반전형</label>
															</td>
															
														</tr>
														<tr>
															
															<td>
																<input type="checkbox" name="enter_name" id="j_enter_name_1" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="농어촌"><label for="enter_name_10">농어촌 학생</label>
																<input type="checkbox" name="enter_name" id="j_enter_name_2" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="특성화고교"><label for="enter_name_12">특성화고교 졸업자</label>
																<input type="checkbox" name="enter_name" id="j_enter_name_3" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="재직자"><label for="enter_name_17">특성화고 등을 졸업한 재직자</label>
																<br/>
																<input type="checkbox" name="enter_name" id="j_enter_name_4" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="기초생활차상위"><label for="enter_name_14">기초생활수급자 및 차상위</label>
																<input type="checkbox" name="enter_name" id="j_enter_name_5" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="고른기회"><label for="enter_name_14">고른기회전형</label>
																<input type="checkbox" name="enter_name" id="j_enter_name_6" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="장애인"><label for="enter_name_14">장애인등대상자</label>
																<br/>
																<input type="checkbox" name="enter_name" id="j_enter_name_7" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="저소득"><label for="enter_name_13">저소득가구학생</label>
																<input type="checkbox" name="enter_name" id="j_enter_name_8" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="특수교육"><label for="enter_name_18">특수교육대상자</label>
																<input type="checkbox" name="enter_name" id="j_enter_name_9" title="전형명 검색조건" onclick="fn_enter_nameList_onclick(this)" data-group="03" value="지역"><label for="enter_name_08">지역인재 및 균형선발 전형</label>
																<input type="checkbox" name="enter_name" id="j_enter_name_10" title="산업대학위탁생(정원외),정부위탁생(정원외),제주특별자치도 특별법(정원외),416 세월호 특별법(정원외)," value="%" onclick="fn_enter_nameList_onclick(this);">
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
									<p class="box_btn" id="btn_selctnDtlBox_fold2" style="display: none;"><a href="javascript:fn_selctnDtlBox_fold()" title="접기"><img src="./resources/images/btn_box_fold.png" alt="접기"></a></p>
									<p class="box_btn" id="btn_selctnDtlBox_out2"><a href="javascript:fn_selctnDtlBox_out()" title="펼치기"><img src="./resources/images/btn_box_out.png" alt="펼치기"></a></p>
									<table class="search_tbl01">
										<colgroup>
											<col style="width:8%;">
											<col>
											<col style="width:80%;">
										</colgroup>
										<tbody id="tbSelctnDtlDetail2" style="display: none;">
											<tr>
												<th scope="row" rowspan="2">
													<label for="uv">전형<br>상세</label>
												</th>
												<td class="tt">지역</td>
												<td>
													<input type="checkbox" name="location" id="j_chk_location_all" value="%" checked="checked" onclick="locationList_onclick(this);"><label for="chk_location_all">전체</label>
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
												<td class="tt">전형요소</td>
												<td>
													<input type="checkbox" value="%" id="j_enter_ele_all" name="enter_ele" checked="checked" onclick="enterEle_onclick(this);"> <label for="enter_ele_all">전체</label>
													<input type="checkbox" value="학생부" id="j_enter_ele_1" name="enter_ele" onclick="enterEle_onclick(this);"> <label for="enter_ele_1">학생부</label>
													<input type="checkbox" value="수능" id="j_enter_ele_2" name="enter_ele" onclick="enterEle_onclick(this);"> <label for="enter_ele_2">수능</label>
													<input type="checkbox" value="면접" id="j_enter_ele_3" name="enter_ele" onclick="enterEle_onclick(this);"> <label for="enter_ele_3">면접/구술</label>
													<input type="checkbox" value="논술" id="j_enter_ele_4" name="enter_ele" onclick="enterEle_onclick(this);"> <label for="enter_ele_4">논술</label>
													<input type="checkbox" value="적성" id="j_enter_ele_5" name="enter_ele" onclick="enterEle_onclick(this);"> <label for="enter_ele_5">적성</label>
													<input type="checkbox" value="실기" id="j_enter_ele_6" name="enter_ele" onclick="enterEle_onclick(this);"> <label for="enter_ele_6">실기</label>
													<input type="checkbox" value="서류" id="j_enter_ele_7" name="enter_ele" onclick="enterEle_onclick(this);"> <label for="enter_ele_7">서류</label>
													<input type="checkbox" value="기타" id="j_enter_ele_8" name="enter_ele" onclick="enterEle_onclick(this);"> <label for="enter_ele_8">기타</label>
													<input type="checkbox" value="1단계성적" id="j_enter_ele_9" name="enter_ele" onclick="enterEle_onclick(this);"> <label for="enter_ele_9">1단계성적</label>
													<input type="checkbox" value="2단계성적" id="j_enter_ele_10" name="enter_ele" onclick="enterEle_onclick(this);"> <label for="enter_ele_10">2단계성적</label>
												</td>
													
											</tr>
											
										</tbody>
										
										<tbody id="tbSelctnDtl2" class="tbl_fold">
											<tr>
												<th scope="row">전형<br>상세</th>
												<td colspan="2" onclick="fn_selctnDtlBox_out()">
													<span class="tt_fold first">지역</span><span id="span_location_view">전체</span>
													<span class="tt_fold">전형요소</span><span id="span_enter_ele_view">전체</span>
													
												</td>
											</tr>
										</tbody>
										
									</table>
								</div>
								<!-- //전형상세 -->
								
								<!-- 학과계열 -->
								<div class="tbl_wrap">
									<p class="box_btn" id="btn_sersBox_fold2" style="display: none;"><a href="javascript:fn_sersBox_fold()" title="접기"><img src="./resources/images/btn_box_fold.png" alt="접기"></a></p>
										<p class="box_btn" id="btn_sersBox_out2"><a href="javascript:fn_sersBox_out()" title="펼치기"><img src="./resources/images/btn_box_out.png" alt="펼치기"></a></p>
									<table class="search_tbl01">
										<colgroup>
											<col style="width:8%;">
											<col>
											<col style="width:80%;">
										</colgroup>
										<tbody id="tbsersDetail2" style="display: none;">
											<tr class="bor_no">
												<th scope="row" rowspan="2">
													<label for="uv">학과</label>
												</th>
												
												<td colspan="2">
													<input id="major" name="major" title="학과검색어" onkeypress="if(event.keyCode==13){btn_search_keyword_init();}" style="ime-mode:active" placeholder="학과관련 키워드" class="search_input" type="text" value="" maxlength="30">
														<button title="검색" class="btn btn-default btn-sm btn btn-outline-dark" style="border-color: #783712">
															<i class="fa fa-search" style="color:#783712 "></i>&nbsp;<b>검색</b>
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
																<input style="margin-top:5px; margin-left:4px; width: 98%" type="text" id="major3" name="major" value=""  />
														</div>
														
													</div> 

												</td>
											</tr>
										</tbody>
										
										<tbody id="tbSers2" class="tbl_fold">
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
							<caption>검색버튼을 눌러주세요</caption>
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
							<tbody id="tbResult2">
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