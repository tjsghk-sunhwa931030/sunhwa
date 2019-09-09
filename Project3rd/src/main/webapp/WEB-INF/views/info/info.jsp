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



//목록 조회하기 
function search_init() {
	btn_search_onclick();
}

//대학 이름 검색
function btn_search_onclick_init(){
	document.frm.pageIndex.value = 1;
	$("#univ_nm").val($.trim($("#univ_nm").val()));
	search_init();
}

/* //설정한 조건에 맞는 대학 정보 제공
function btn_search_onclick() {
			
	$('#paginationholder').html('');
	   $('#paginationholder').html('<ul id="pagination" class="pages"></ul>');
	
	var lst_area_list = [];
	var lst_elsm_list = [];
	var lst_fond_list = [];
	
	var arealist = $("input[id^='chk_area']:checked").get();
	var elsmlist = $("input[id^='chk_elsm']:checked").get();
	var fondlist = $("input[id^='chk_fond']:checked").get();
	var empymnlist = $("input[id^='rdo_empymn']:checked").val();
	var tutfeelist = $("input[id^='rdo_tutfee']:checked").val();
	
	$.each(arealist, function(index, item){
		var area = item.value.toString();
		if(area != '%'){
			area = gfn_leadingZeros(area,2);
		}
		lst_area_list[index] = area;
	});
	
	$.each(elsmlist, function(index, item){
		var elsm = item.value.toString();
		if(elsm != '%'){
			elsm = gfn_leadingZeros(elsm,2);
		}
		lst_elsm_list[index] = elsm;
	});
	
	$.each(fondlist, function(index, item){
		var fond = item.value.toString();
	
		lst_fond_list[index] = fond;
	});
	
	$("#lst_area_cd").val(lst_area_list);
	$("#lst_elsm_cd").val(lst_elsm_list);
	$("#lst_fond_se_cd").val(lst_fond_list);
	$("#lst_empymn_cd").val(empymnlist);
	$("#lst_tutfee_cd").val(tutfeelist);
	
	gfn_Submission_Call("/kcue/ast/eip/eis/inf/univinf/eipUnivInfGnrlList.do",$("#frm").serialize(), function(data){
		if(data != null){
	        if (data.resultVO.resultCode == "SUCCESS")
		    {
				fn_makeResult("/kcue/ast/eip/eis/inf/univinf/eipUnivInfGnrlList.do",data,Number(document.frm.pageIndex.value));
		    }else{
		    	alert(data.resultVO.resultMessage);
		    }
		}
	},'json');
} */

	/* //결과 리스트에 제공
	function fn_makeResult(doName, data, currentPage){
			var dataResultTotCnt = data.resultTotCnt;
			var dataResultTotCntOrg = data.resultTotCntOrg;
			var dataResultPageSize = data.resultPageSize;
			var v_totalPages = Math.ceil(dataResultTotCnt / dataResultPageSize);
			var dataResultList = data.resultList;
			var dataCmpet = data.cmpetVO;
			
			
			if(gfn_null(dataCmpet.cmpet_at) == 'N'){
				$("#notice_div").html("<span class='t_cr02'>"+dataCmpet.cmpet_txt+ "</span>");
			}else{
				$("#notice_div").empty();
			}
			
			var strRow = "";
			var colCnt = 9;  //컬럼 갯수
			
			var tbResult = $("#tbResult");
			var totalCnt = $("#totalCountOrg");
			
			$("#empymn_head").empty();
			$("#cmpet_head").empty();
			tbResult.empty();
			totalCnt.empty();
			
			totalCnt.append(dataResultTotCntOrg);
			
			if(dataResultList != "" && dataResultList != null){
				
				if(dataCmpet.cmpet_year != "" && dataCmpet.cmpet_year != null)
					$("#cmpet_head").append(dataCmpet.cmpet_year);
				
				for(var i =0; i < dataResultList.length; i++){
					
					var chk = 0;
					strRow += '<tr>';
					strRow += "<td class='tt'><a href='javascript:go_set(\""+gfn_null(dataResultList[i].univ_cd)+"\")'>" + gfn_null(dataResultList[i].univ_all_nm) + "</a></td>";
					strRow += '<td>'+gfn_null(dataResultList[i].area_nm) + '</td>';
					strRow += '<td>'+gfn_zeroToHipen(dataResultList[i].atrcr_cmpet_rt)+'</td>';
					strRow += '<td>'+gfn_zeroToHipen(dataResultList[i].ftrc_cmpet_rt)+'</td>';
					strRow += '<td>'+gfn_zeroToHipen(dataResultList[i].rcnp)+'</td>';
					strRow += '<td>'+gfn_zeroToHipen(dataResultList[i].instl_subjct)+'</td>';
					strRow += '<td>'+gfn_zeroToHipen(dataResultList[i].selctn_inf)+'</td>';

					for(var k = 0 ; k < chkUniv.length ; k++){
						if(chkUniv[k] == gfn_null(dataResultList[i].univ_cd)){
							strRow += '<td><a href="javascript:fn_chkCompr_onclick(\''+gfn_null(dataResultList[i].univ_cd)+'\');" id="compr_'+dataResultList[i].univ_cd+'" value="\''+dataResultList[i].univ_cd+'\','+gfn_null(dataResultList[i].univ_all_nm)+'" class="btn_compare" title="비교">비교</a></td>';							
							chk++;
						}
					}
					if(chk == 0){
						strRow += '<td><a href="javascript:fn_chkCompr_onclick(\''+gfn_null(dataResultList[i].univ_cd)+'\');" id="compr_'+dataResultList[i].univ_cd+'" value="\''+dataResultList[i].univ_cd+'\','+gfn_null(dataResultList[i].univ_all_nm)+'" class="btn_compare_off" title="비교">비교</a></td>';					
					}
					
					strRow += '<td id="tdIntrst_'+gfn_null(dataResultList[i].univ_cd)+'">';
					
					if(gfn_null(dataResultList[i].intrst_cnt) != "0"){
// 						<!-- 관심설정 on -->
						strRow += '<a href="javascript:intrst_univ_onclick(\''+gfn_null(dataResultList[i].sch_year)+'\',\''+gfn_null(dataResultList[i].univ_cd)+'\',\'D\')" title="관심설정"><img src="/images/re_icon/icon_favorite_on.gif" alt="관심설정"></a>';
					}else{
// 						<!-- 관심설정 off -->
						strRow += '<a href="javascript:intrst_univ_onclick(\''+gfn_null(dataResultList[i].sch_year)+'\',\''+gfn_null(dataResultList[i].univ_cd)+'\',\'C\')" title="관심설정"><img src="/images/re_icon/icon_favorite_off.gif" alt="관심설정"></a>';
					}
					
					strRow += '</td>';
					strRow += '</tr>';
					
				}
				tbResult.append(strRow);
				
			}else{
				v_totalPages = 1;
				strRow += '<tr>';
				strRow += "<td colspan="+colCnt+">조회된 자료가 없습니다.</td>";
				strRow += '</tr>';
				tbResult.append(strRow);
			}
			
			$('#pagination').twbsPagination({totalPages: v_totalPages, visiblePages: 10
						, startPage: currentPage
						, first: '<img src="/images/btn_first.png" alt="처음" />'
			        	, prev: '<img src="/images/btn_prev.png" alt="이전" />'
				        , next: '<img src="/images/btn_next.png" alt="다음" />'
				        , last: '<img src="/images/btn_last.png" alt="마지막" />'
						, onPageClick: function (event, page) {
					        	var f = document.frm;
					    		f.pageIndex.value = page;
					    		gfn_Submission_Call(doName, $("#frm").serialize(),  function(data){
									if(data != null){
								        if (data.resultVO.resultCode == "SUCCESS")
									    {
											fn_makeResult(doName,data,page);
									    }else{
									    	alert(data.resultVO.resultMessage);
									    }
									}
								},'json');
		        		}
		    });
			
			$("#pagination .num a").filter(function() {
			    return $(this).text() === document.frm.pageIndex.value;
			}).addClass("on");
		} */

	/* //관심대학교 설정
	function intrst_univ_onclick(sch_year, univ_cd, saveAt){
			var strRow = "";
			
			$("#intrst_sch_year").val(sch_year);
			$("#intrst_univ_cd").val(univ_cd);
			
			if(gs_usidId != "null" && gs_macIp != "null"){
				gfn_Submission_Call("/kcue/ast/eip/eis/inf/univinf/saveIntrstUniv.do?saveAt="+saveAt,$("#intrstFrm").serialize(), function(data){
					if(data != null){
				        if (data.resultVO.resultCode == "SUCCESS")
					    {
		 					//관심설정 on
				        	if(saveAt == "C"){
								strRow = '<a href="javascript:intrst_univ_onclick(\''+sch_year+'\',\''+univ_cd+'\',\'D\')" title="관심설정" data-title="관심대학"><img src="/images/re_icon/icon_favorite_on.gif" alt="관심설정"></a>';
					        	$("#tdIntrst_"+univ_cd).html(strRow);
					        	gfn_setComSession('univRef','Y','N', function(){
			   						createToast($("#tdIntrst_"+univ_cd+" > a"), 'add');
					        	});
				        	}else if(saveAt == "D"){
			 					//관심설정 off
								strRow = '<a href="javascript:intrst_univ_onclick(\''+sch_year+'\',\''+univ_cd+'\',\'C\')" title="관심설정" data-title="관심대학"><img src="/images/re_icon/icon_favorite_off.gif" alt="관심설정"></a>';
					        	$("#tdIntrst_"+univ_cd).html(strRow);
					        	gfn_setComSession('univRef','Y','N', function(){
			   						createToast($("#tdIntrst_"+univ_cd+" > a"), 'remove');
					        	});
				        	}
				        	
					    }else{
					    	alert(data.resultVO.resultMessage);
					    }
					}
				},'json');
			}else{
				alert("로그인 후 이용해주시기 바랍니다!");
				return;
			}
		} */

	//각 항목 선택하기 
	//지역 선택하기
	function fn_areaList_onclick(area){
			
			if($(area).attr("id") == "chk_area_all"){
				$("#chk_area_all").prop("checked",true);
				$("input[id^='chk_area']:not(input[id='chk_area_all'])").prop("checked",false);
			}else{
				
				$("#chk_area_all").prop("checked",false);
				var chk_area_list = $("input[id^='chk_area']:checked").get();
				
				if(chk_area_list.length < 1){
					$("#chk_area_all").prop("checked",true);
				}
			}
		}
	//전형요소 선택하기
		function fn_elsmList_onclick(elsm){
			if($(elsm).attr("id") == "chk_elsm_all"){
				$("#chk_elsm_all").prop("checked",true);
				$("input[id^='chk_elsm']:not(input[id='chk_elsm_all'])").prop("checked",false);
			}else{
				
				$("#chk_elsm_all").prop("checked",false);
				var chk_elsm_list = $("input[id^='chk_elsm']:checked").get();
				
				if(chk_elsm_list.length < 1){
					$("#chk_elsm_all").prop("checked",true);
				}
			}
			
		}
	//학교유형 선택하기
		function fn_fondList_onclick(fond){
			if($(fond).attr("id") == "chk_fond_all"){
				$("#chk_fond_all").prop("checked",true);
				$("input[id^='chk_fond']:not(input[id='chk_fond_all'])").prop("checked",false);
			}else{
				
				$("#chk_fond_all").prop("checked",false);
				var chk_fond_list = $("input[id^='chk_fond']:checked").get();
				
				if(chk_fond_list.length < 1){
					$("#chk_fond_all").prop("checked",true);
				}
			}
			
		}
	//설립유형 선택하기
		function fn_empymnList_onclick(empymn){
			$(empymn).toggleClass("on");
			
			// 바로 조회
			btn_search_onclick_init();
		}
	//취업률 선택하기 
		function fn_tutfeeList_onclick(tutfee){
			$(tutfee).toggleClass("on");
			
			// 바로 조회
			btn_search_onclick_init();
		}

	function fn_box_text_set() {
		//지역 텍스트
		var chk_area_list = $("input[id^='chk_area']:checked").get();
		var area_list = "";
		$.each(chk_area_list, function(index, item){
			var area_id = item.id.toString();
			area_list += ","+$("#"+area_id).next("label").html();
		});
		
		$("#span_area_view").html(area_list.substring(1));
	
		//학교유형 텍스트
		var chk_elsm_list = $("input[id^='chk_elsm']:checked").get();
		var elsm_list = "";
		$.each(chk_elsm_list, function(index, item){
			var elsm_id = item.id.toString();
			elsm_list += ","+$("#"+elsm_id).next("label").html();
		});
		
		$("#span_elsm_view").html(elsm_list.substring(1));
	
		//설립유형 텍스트
		var chk_fond_list = $("input[id^='chk_fond']:checked").get();
		var fond_list = "";
		$.each(chk_fond_list, function(index, item){
			var fond_id = item.id.toString();
			fond_list += ","+$("#"+fond_id).next("label").html();
		});
		
		$("#span_fond_view").html(fond_list.substring(1));
	
		//취업률 텍스트
		var rdo_empymn_list = $("input[id^='rdo_empymn']:checked").get();
		var empymn_list = "";
		$.each(rdo_empymn_list, function(index, item){
			var empymn_id = item.id.toString();
			empymn_list += ","+$("#"+empymn_id).next("label").html();
		});
		
		$("#span_empymn_view").html(empymn_list.substring(1));
	
		//등록금 텍스트
		var rdo_tutfee_list = $("input[id^='rdo_tutfee']:checked").get();
		var tutfee_list = "";
		$.each(rdo_tutfee_list, function(index, item){
			var tutfee_id = item.id.toString();
			tutfee_list += ","+$("#"+tutfee_id).next("label").html();
		});
		
		$("#span_tutfee_view").html(tutfee_list.substring(1));
	}



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


</script>
<style type="text/css">
	.lefttoptext{margin:0 auto;font-size:25px;font-weight:bold;margin-top:10px;}
	.righttoptext{margin:0 auto;font-size:40px;font-weight:bold;}
	.contents{height: 950px;;}
</style>


</head>
<body>
	<%@include file="../main/head.jsp" %> 
	<div class="topcontents">
		<div class="lefttop">
        	 <div class="lefttoptext">대학간다</div>
      	</div>
<form id="frm" name="frm" action="" method="post" onsubmit="return false;">
		<input id="pageIndex" name="pageIndex" type="hidden" value="1">
		<input id="pageSize" name="pageSize" value="15" type="hidden">
		<input id="univ_se_cd" name="univ_se_cd" value="10" type="hidden">
		<input type="hidden" name="univ_sort" id="univ_sort" value="UP">
		<input type="hidden" name="area_sort" id="area_sort" value="">
		<input type="hidden" name="main_search_at" id="main_search_at" value="">
		<input type="hidden" name="gnrlKeyword" id="gnrlKeyword" value="">
		<input type="hidden" name="area" id="area" value="">
		<input type="hidden" name="stdr_sch_year" id="stdr_sch_year" value="">
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
				<!-- 조건박스 모두 열렸을떄 -->
				<div class="search_tbl_box">
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
											<input id="univ_nm" name="univ_nm" title="대학명검색" style="ime-mode:active" placeholder="대학명을 입력해주세요." class="search_input" type="text" value="" maxlength="30">
												<a href="javascript:btn_search_onclick_init()" title="검색" class="btn_search" style="color:#783712 ">
													<button title="검색" class="btn btn-default btn-sm btn btn-outline-dark" style="border-color: #783712">
														<i class="fa fa-search" style="color:#783712 "></i>&nbsp;<b>검색</b>
													</buton>
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
											<input id="lst_area_cd" name="lst_area_cd" type="hidden" value="">
											<input type="checkbox" name="chk_area" id="chk_area_all" value="%" checked="checked" onclick="fn_areaList_onclick(this);"><label for="chk_area_all">전체</label>
											<input type="checkbox" name="chk_area" id="chk_area_09" value="09" onclick="fn_areaList_onclick(this);"><label for="chk_area_09">강원</label>
											<input type="checkbox" name="chk_area" id="chk_area_08" value="08" onclick="fn_areaList_onclick(this);"><label for="chk_area_08">경기</label>
											<input type="checkbox" name="chk_area" id="chk_area_15" value="15" onclick="fn_areaList_onclick(this);"><label for="chk_area_15">경남</label>
											<input type="checkbox" name="chk_area" id="chk_area_14" value="14" onclick="fn_areaList_onclick(this);"><label for="chk_area_14">경북</label>
											<input type="checkbox" name="chk_area" id="chk_area_05" value="05" onclick="fn_areaList_onclick(this);"><label for="chk_area_05">광주</label>
											<input type="checkbox" name="chk_area" id="chk_area_03" value="03" onclick="fn_areaList_onclick(this);"><label for="chk_area_03">대구</label>
											<input type="checkbox" name="chk_area" id="chk_area_06" value="06" onclick="fn_areaList_onclick(this);"><label for="chk_area_06">대전</label>
											<input type="checkbox" name="chk_area" id="chk_area_02" value="02" onclick="fn_areaList_onclick(this);"><label for="chk_area_02">부산</label>
											<br/>
											<input type="checkbox" name="chk_area" id="chk_area_01" value="01" onclick="fn_areaList_onclick(this);"><label for="chk_area_01">서울</label>
											<input type="checkbox" name="chk_area" id="chk_area_17" value="17" onclick="fn_areaList_onclick(this);"><label for="chk_area_17">세종</label>
											<input type="checkbox" name="chk_area" id="chk_area_07" value="07" onclick="fn_areaList_onclick(this);"><label for="chk_area_07">울산</label>
											<input type="checkbox" name="chk_area" id="chk_area_04" value="04" onclick="fn_areaList_onclick(this);"><label for="chk_area_04">인천</label>
											<input type="checkbox" name="chk_area" id="chk_area_13" value="13" onclick="fn_areaList_onclick(this);"><label for="chk_area_13">전남</label>
											<input type="checkbox" name="chk_area" id="chk_area_12" value="12" onclick="fn_areaList_onclick(this);"><label for="chk_area_12">전북</label>
											<input type="checkbox" name="chk_area" id="chk_area_16" value="16" onclick="fn_areaList_onclick(this);"><label for="chk_area_16">제주</label>
											<input type="checkbox" name="chk_area" id="chk_area_11" value="11" onclick="fn_areaList_onclick(this);"><label for="chk_area_11">충남</label>
											<input type="checkbox" name="chk_area" id="chk_area_10" value="10" onclick="fn_areaList_onclick(this);"><label for="chk_area_10">충북</label>
										
										</td>
									</tr>
									
									<tr>
										<td class="tt">학교유형</td>
										<td>
											<input id="lst_elsm_cd" name="lst_elsm_cd" type="hidden" value="">
	            							<input type="checkbox" name="chk_elsm" id="chk_elsm_all" value="%" checked="checked" onclick="fn_elsmList_onclick(this)"><label for="chk_elsm_all">전체</label>
											<input type="checkbox" name="chk_elsm" id="chk_elsm_02" value="02" onclick="fn_elsmList_onclick(this)"><label for="chk_elsm_02">교육대학</label>
											<input type="checkbox" name="chk_elsm" id="chk_elsm_03" value="03" onclick="fn_elsmList_onclick(this)"><label for="chk_elsm_03">대학교</label>
											<input type="checkbox" name="chk_elsm" id="chk_elsm_05" value="05" onclick="fn_elsmList_onclick(this)"><label for="chk_elsm_05">산업대학</label>	
										</td>
										
									</tr>
									
									<tr>
										<td class="tt">설립유형</td>
										<td>
											<input id="lst_fond_se_cd" name="lst_fond_se_cd" type="hidden" value="">
	            							<input type="checkbox" name="chk_fond" id="chk_fond_all" value="%" checked="checked" onclick="fn_fondList_onclick(this)"><label for="chk_fond_all">전체</label>
											<input type="checkbox" name="chk_fond" id="chk_fond_1" value="1" onclick="fn_fondList_onclick(this)"><label for="chk_fond_1">국립</label>
	            							<input type="checkbox" name="chk_fond" id="chk_fond_2" value="2" onclick="fn_fondList_onclick(this)"><label for="chk_fond_2">공립</label>
											<input type="checkbox" name="chk_fond" id="chk_fond_3" value="3" onclick="fn_fondList_onclick(this)"><label for="chk_fond_3">사립</label>
	            							<input type="checkbox" name="chk_fond" id="chk_fond_6" value="6" onclick="fn_fondList_onclick(this)"><label for="chk_fond_6">특별법법인</label>
	            							<input type="checkbox" name="chk_fond" id="chk_fond_7" value="7" onclick="fn_fondList_onclick(this)"><label for="chk_fond_7">국립대법인</label>
	            					
										</td>
									</tr>
									
									<tr>
										<td class="tt">취업률</td>
										<td>
										
									<input id="lst_empymn_cd" name="lst_empymn_cd" type="hidden" value="">
									<input type="radio" name="rdo_empymn" id="rdo_empymn_all" value="" checked="checked"><label for="rdo_empymn_all">전체</label>
									<input type="radio" name="rdo_empymn" id="rdo_empymn_90" value="90"><label for="rdo_empymn_90">90%이상</label>
									<input type="radio" name="rdo_empymn" id="rdo_empymn_80" value="80"><label for="rdo_empymn_80">80%&nbsp;~&nbsp;90%</label>
									<input type="radio" name="rdo_empymn" id="rdo_empymn_70" value="70"><label for="rdo_empymn_70">70%&nbsp;~&nbsp;80%</label>
									<br>
									<input type="radio" name="rdo_empymn" id="rdo_empymn_60" value="60"><label for="rdo_empymn_60">60%&nbsp;~&nbsp;70%</label>
									<input type="radio" name="rdo_empymn" id="rdo_empymn_50" value="50"><label for="rdo_empymn_50">50%&nbsp;~&nbsp;60%</label>
									<input type="radio" name="rdo_empymn" id="rdo_empymn_40" value="40"><label for="rdo_empymn_40">40%&nbsp;~&nbsp;50%</label>
									<input type="radio" name="rdo_empymn" id="rdo_empymn_39" value="39"><label for="rdo_empymn_39">40%미만</label>
										</td>
									</tr>
									
									<tr>
										<td class="tt">등록금</td>
										<td>
										
										<input id="lst_tutfee_cd" name="lst_tutfee_cd" type="hidden" value="">
										<input type="radio" name="rdo_tutfee" id="rdo_tutfee_all" value="" checked="checked"><label for="rdo_tutfee_all">전체</label>
										<input type="radio" name="rdo_tutfee" id="rdo_tutfee_1000" value="1000"><label for="rdo_tutfee_1000">1000만이상</label>
										<input type="radio" name="rdo_tutfee" id="rdo_tutfee_800" value="800"><label for="rdo_tutfee_800">800만&nbsp;~&nbsp;1000만</label>
										<input type="radio" name="rdo_tutfee" id="rdo_tutfee_600" value="600"><label for="rdo_tutfee_600">600만&nbsp;~&nbsp;800만</label>
											<br>
											
										<input type="radio" name="rdo_tutfee" id="rdo_tutfee_400" value="400"><label for="rdo_tutfee_400">400만&nbsp;~&nbsp;600만</label>
										<input type="radio" name="rdo_tutfee" id="rdo_tutfee_200" value="200"><label for="rdo_tutfee_200">200만&nbsp;~&nbsp;400만</label>
										<input type="radio" name="rdo_tutfee" id="rdo_tutfee_199" value="199"><label for="rdo_tutfee_199">200만미만</label>
										
										</td>
									</tr>
								
								</tbody>
								
								<tbody id="tbSimple" class="tbl_fold" style="display: none;">
									<tr>
										<td scope="col">대학조건</td>
										<td colspan="2" onclick="fn_box_out()">
											<span class="tt_fold first">지역</span><span id="span_area_view">전체</span>
											<span class="tt_fold">학교유형</span><span id="span_elsm_view">전체</span>
											<span class="tt_fold">설립유형</span><span id="span_fond_view">전체</span><br>
											<span class="tt_fold first">취업률</span><span id="span_empymn_view">전체</span>
											<span class="tt_fold">등록금</span><span id="span_tutfee_view">전체</span>
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
			
				
				
				<!-- 대학리스트 -->
			<div class="tbl_list">
				<br>
				<div class="but_table">
					<div class="t_span" style="min-width: 170px; max-width: 170px;">총 <span class="t_cr01 font_w" id="totalCountOrg">0</span>건이 있습니다.</div>
				</div>
				
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
						<col style="width:40px;">
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
						<tr><td colspan="8">조회된 자료가 없습니다.</td></tr>
					</tbody>
				</table>
			</div>
			<!-- //대학리스트 -->
				
				
			<!-- 페이징 -->
	    	<div class="paging" id="paginationholder"> 
	        	<ul id="pagination" class="pages"></ul>
	    	</div>
			<!-- //페이징 -->
	</form>			
				
				
				
		</div>
	</div>
	
	<%@include file="../main/bottom.jsp" %>


</body>
</html>