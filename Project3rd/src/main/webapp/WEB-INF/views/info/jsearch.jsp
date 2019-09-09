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
<link rel="stylesheet" href="style/info_re.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
		
			<!-- 조건박스 모두 열렸을떄 -->
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
														<input id="searchUnivKeyword" name="searchUnivKeyword" title="대학명검색" onkeypress="if(event.keyCode==13){btn_search_univ_init();}" style="ime-mode:active" placeholder="대학명을 입력해주세요." class="search_input" type="text" value="" maxlength="30">
														<button title="검색" class="btn btn-default btn-sm btn btn-outline-dark" style="border-color: #783712">
															<i class="fa fa-search" style="color:#783712 "></i>&nbsp;<b>검색</b>
														</buton>
													</td>								
												</tr>											
												<tr>
													<th scope="row" rowspan="3">
														<label for="uv">전형<br>조건</label>
													</th>
													<td class="tt">모집시기</td>
													<td>
														<input type="checkbox" name="chk_rcrr" id="chk_rcrr_all" title="모집시기 검색조건" value="" checked="checked" onclick="fn_rcrrList_onclick(this)"><label for="chk_rcrr_all">전체</label>
								    					<input type="checkbox" name="chk_rcrr" id="chk_rcrr_20" title="모집시기 검색조건" value="20" onclick="fn_rcrrList_onclick(this)"><label for="chk_rcrr_20">수시</label>
														<input type="checkbox" name="chk_rcrr" id="chk_rcrr_31" title="모집시기 검색조건" value="31" onclick="fn_rcrrList_onclick(this)"><label for="chk_rcrr_31">정시(가)</label>
														<input type="checkbox" name="chk_rcrr" id="chk_rcrr_32" title="모집시기 검색조건" value="32" onclick="fn_rcrrList_onclick(this)"><label for="chk_rcrr_32">정시(나)</label>
														<input type="checkbox" name="chk_rcrr" id="chk_rcrr_33" title="모집시기 검색조건" value="33" onclick="fn_rcrrList_onclick(this)"><label for="chk_rcrr_33">정시(다)</label>
														<input type="checkbox" name="chk_rcrr" id="chk_rcrr_40" title="모집시기 검색조건" value="40" onclick="fn_rcrrList_onclick(this)"><label for="chk_rcrr_40">추가</label>
													</td>
												</tr>
												<tr>
													<td class="tt">전형유형</td>
													<td>
														<input type="checkbox" name="chk_slcty" id="chk_slcty_all" title="전형유형 검색조건" value="" checked="checked" onclick="fn_slctyList_onclick(this);"><label for="chk_slcty_all">전체</label>
														<input type="checkbox" name="chk_slcty" id="chk_slcty_01" title="전형유형 검색조건" onclick="fn_slctyList_onclick(this)" value="01"><label for="chk_slcty_01">학생부위주(교과)</label>
														<input type="checkbox" name="chk_slcty" id="chk_slcty_02" title="전형유형 검색조건" onclick="fn_slctyList_onclick(this)" value="02"><label for="chk_slcty_02">학생부위주(종합)</label>
														<input type="checkbox" name="chk_slcty" id="chk_slcty_03" title="전형유형 검색조건" onclick="fn_slctyList_onclick(this)" value="03"><label for="chk_slcty_03">실기/실적위주</label>
														<br/>
														<input type="checkbox" name="chk_slcty" id="chk_slcty_04" title="전형유형 검색조건" onclick="fn_slctyList_onclick(this)" value="04"><label for="chk_slcty_04">논술위주</label>
														<input type="checkbox" name="chk_slcty" id="chk_slcty_05" title="전형유형 검색조건" onclick="fn_slctyList_onclick(this)" value="05"><label for="chk_slcty_05">수능위주</label>
														<input type="checkbox" name="chk_slcty" id="chk_slcty_06" title="전형유형 검색조건" onclick="fn_slctyList_onclick(this)" value="06"><label for="chk_slcty_06">기타</label>
													</td>
												</tr>
												<tr>
													<td class="tt">전형명</td>
													<td>
														<table style="width:100%;">
															<tbody><tr>
																<td colspan="2">
																	<input type="checkbox" name="chk_selctnNm" id="chk_selctnNm_all" title="전형명 검색조건" value="" checked="checked" onclick="fn_selctnNmList_onclick(this);"><label for="chk_selctnNm_all">전체</label>									
																</td>
															</tr>
															<tr>
																<td style="width:170px;" colspan="2">
																	<input type="checkbox" name="chk_selctnNm" id="chk_selctnNm_01" title="전형명 검색조건" onclick="fn_selctnNmList_onclick(this)" data-group="01" value="01"><label for="chk_selctnNm_01">일반전형</label>
																</td>
																
															</tr>
															<tr>
																<td style="width:170px;">
																	<input type="checkbox" name="chk_selctnNm" id="chk_selctnNm_all_02" title="전형명 검색조건" data-group="02" value="04,22,06,03," onclick="fn_selctnNmList_onclick(this);"><label for="chk_selctnNm_all_02">특별전형(정원내)</label>
																</td>
																<td>
																	<input type="checkbox" name="chk_selctnNm" id="chk_selctnNm_04" title="전형명 검색조건" onclick="fn_selctnNmList_onclick(this)" data-group="02" value="04"><label for="chk_selctnNm_04">대학별독자적기준</label>
																	<input type="checkbox" name="chk_selctnNm" id="chk_selctnNm_22" title="전형명 검색조건" onclick="fn_selctnNmList_onclick(this)" data-group="02" value="22"><label for="chk_selctnNm_22">정원외 특별전형(정원외)</label>
																	<br/>
																	<input type="checkbox" name="chk_selctnNm" id="chk_selctnNm_06" title="전형명 검색조건" onclick="fn_selctnNmList_onclick(this)" data-group="02" value="06"><label for="chk_selctnNm_06">고른기회 특별전형</label>
																	<input type="checkbox" name="chk_selctnNm" id="chk_selctnNm_03" title="전형명 검색조건" onclick="fn_selctnNmList_onclick(this)" data-group="02" value="03"><label for="chk_selctnNm_03">특기자</label>
																</td>
															</tr>
															<tr>
																<td style="width:170px;">
																	<input type="checkbox" name="chk_selctnNm" id="chk_selctnNm_all_03" title="전형명 검색조건" data-group="03" value="10,12,17,14,13,18,08,16,11,19,21,20," onclick="fn_selctnNmList_onclick(this);"><label for="chk_selctnNm_all_03">특별전형(정원외)</label>
																</td>
																<td>
																	<input type="checkbox" name="chk_selctnNm" id="chk_selctnNm_10" title="전형명 검색조건" onclick="fn_selctnNmList_onclick(this)" data-group="03" value="10"><label for="chk_selctnNm_10">농어촌 학생</label>
																	<input type="checkbox" name="chk_selctnNm" id="chk_selctnNm_12" title="전형명 검색조건" onclick="fn_selctnNmList_onclick(this)" data-group="03" value="12"><label for="chk_selctnNm_12">특성화고교 졸업자</label>
																	<input type="checkbox" name="chk_selctnNm" id="chk_selctnNm_17" title="전형명 검색조건" onclick="fn_selctnNmList_onclick(this)" data-group="03" value="17"><label for="chk_selctnNm_17">특성화고 등을 졸업한 재직자</label>
																	<br/>
																	<input type="checkbox" name="chk_selctnNm" id="chk_selctnNm_14" title="전형명 검색조건" onclick="fn_selctnNmList_onclick(this)" data-group="03" value="14"><label for="chk_selctnNm_14">기초생활수급자, 차상위계층, 한부모가족 지원대상자</label>
																	<br/>
																	<input type="checkbox" name="chk_selctnNm" id="chk_selctnNm_13" title="전형명 검색조건" onclick="fn_selctnNmList_onclick(this)" data-group="03" value="13"><label for="chk_selctnNm_13">장애인등대상자</label>
																	<input type="checkbox" name="chk_selctnNm" id="chk_selctnNm_18" title="전형명 검색조건" onclick="fn_selctnNmList_onclick(this)" data-group="03" value="18"><label for="chk_selctnNm_18">서해5도</label>
																	<input type="checkbox" name="chk_selctnNm" id="chk_selctnNm_08" title="전형명 검색조건" onclick="fn_selctnNmList_onclick(this)" data-group="03" value="08"><label for="chk_selctnNm_08">군위탁생</label>
																	<input type="checkbox" name="chk_selctnNm" id="chk_selctnNm_16" title="전형명 검색조건" onclick="fn_selctnNmList_onclick(this)" data-group="03" value="16"><label for="chk_selctnNm_16">계약학과</label>
																	<input type="checkbox" name="chk_selctnNm" id="chk_selctnNm_99" data-group="03" title="산업대학위탁생(정원외),정부위탁생(정원외),제주특별자치도 특별법(정원외),416 세월호 특별법(정원외)," value="11,19,21,20," onclick="fn_selctnNmList_onclick(this);">
																	 <label for="chk_selctnNm_99" title="산업대학위탁생(정원외),정부위탁생(정원외),제주특별자치도 특별법(정원외),416 세월호 특별법(정원외)," style="margin-left: -5px;">기타</label>
																
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
														<span class="tt_fold first">모집시기</span><span id="span_rcrr_view"></span>
														<span class="tt_fold">전형유형</span><span id="span_slcty_view"></span>
														<span class="tt_fold">전형명</span><span id="span_selctnNm_view"></span>
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
												<p>
													<input type="checkbox" name="chk_area" id="chk_area_all" value="" checked="checked" onclick="fn_areaList_onclick(this);"><label for="chk_area_all">전체</label>
													<input type="checkbox" name="chk_area" id="chk_area_09" value="09" onclick="fn_areaList_onclick(this);"><label for="chk_area_09">강원</label>
													<input type="checkbox" name="chk_area" id="chk_area_08" value="08" onclick="fn_areaList_onclick(this);"><label for="chk_area_08">경기</label>
													<input type="checkbox" name="chk_area" id="chk_area_15" value="15" onclick="fn_areaList_onclick(this);"><label for="chk_area_15">경남</label>
													<input type="checkbox" name="chk_area" id="chk_area_14" value="14" onclick="fn_areaList_onclick(this);"><label for="chk_area_14">경북</label>
													<input type="checkbox" name="chk_area" id="chk_area_05" value="05" onclick="fn_areaList_onclick(this);"><label for="chk_area_05">광주</label>
													<input type="checkbox" name="chk_area" id="chk_area_03" value="03" onclick="fn_areaList_onclick(this);"><label for="chk_area_03">대구</label>
													<input type="checkbox" name="chk_area" id="chk_area_06" value="06" onclick="fn_areaList_onclick(this);"><label for="chk_area_06">대전</label>
													<input type="checkbox" name="chk_area" id="chk_area_02" value="02" onclick="fn_areaList_onclick(this);"><label for="chk_area_02">부산</label>
													<input type="checkbox" name="chk_area" id="chk_area_01" value="01" onclick="fn_areaList_onclick(this);"><label for="chk_area_01">서울</label>
												<br/>
													<input type="checkbox" name="chk_area" id="chk_area_17" value="17" onclick="fn_areaList_onclick(this);"><label for="chk_area_17">세종</label>
													<input type="checkbox" name="chk_area" id="chk_area_07" value="07" onclick="fn_areaList_onclick(this);"><label for="chk_area_07">울산</label>
													<input type="checkbox" name="chk_area" id="chk_area_04" value="04" onclick="fn_areaList_onclick(this);"><label for="chk_area_04">인천</label>
													<input type="checkbox" name="chk_area" id="chk_area_13" value="13" onclick="fn_areaList_onclick(this);"><label for="chk_area_13">전남</label>
													<input type="checkbox" name="chk_area" id="chk_area_12" value="12" onclick="fn_areaList_onclick(this);"><label for="chk_area_12">전북</label>
													<input type="checkbox" name="chk_area" id="chk_area_16" value="16" onclick="fn_areaList_onclick(this);"><label for="chk_area_16">제주</label>
													<input type="checkbox" name="chk_area" id="chk_area_11" value="11" onclick="fn_areaList_onclick(this);"><label for="chk_area_11">충남</label>
													<input type="checkbox" name="chk_area" id="chk_area_10" value="10" onclick="fn_areaList_onclick(this);"><label for="chk_area_10">충북</label>
												</p>
											</td>
													
												</tr>
												<tr>
													<td class="tt">전형요소</td>
													<td id="tbRcbkChk">
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
													<td id="tbCsatRfRelm"><span><input type="checkbox" id="v_cho_lang" name="cho_lang" value="Y" onclick="fn_use_select(this)"> <label for="v_cho_lang">국어</label></span><span><input type="checkbox" id="v_cho_math" name="cho_math" value="Y" onclick="fn_use_select(this)"> <label for="v_cho_math">수학</label><label class="tts" for="v_cho_math_sel">수학영역선택</label> <select class="w70" id="v_cho_math_sel" name="cho_math_sel" disabled="disabled"><option value="ALL">선택</option><option value="A">가</option><option value="B">나</option></select></span><span><input type="checkbox" id="v_cho_fori" name="cho_fori" value="Y" onclick="fn_use_select(this)"> <label for="v_cho_fori">영어</label></span><span><input type="checkbox" id="v_cho_serch" name="cho_serch" value="Y" onclick="fn_use_select(this)"> <label for="v_cho_serch">탐구영역</label><label class="tts" for="v_cho_serch_sel">탐구영역선택</label> <select class="w70" id="v_cho_serch_sel" name="cho_serch_sel" disabled="disabled"><option value="ALL">선택</option><option value="so">사회</option><option value="sc">과학</option><option value="oc">직업</option></select></span><span><input type="checkbox" id="v_cho_secLan_chi" name="cho_secLan_chi" value="Y"> <label for="v_cho_secLan_chi">제2외국어/한문</label></span><span><input type="checkbox" id="v_cho_his" name="cho_his" value="Y"> <label for="v_cho_his">한국사</label></span></td>
												</tr>
												<tr>
													<td class="tt">최저학력기준</td>
													<td id="tbLwacstCn"><span><input type="radio" name="rdo_lwacst" id="rad_csat" value="csat" onclick="fn_radio_uncheck(this)" data-val=""> <label for="rad_csat">수능</label></span><span><input type="radio" name="rdo_lwacst" id="rad_stdpt" value="stdpt" onclick="fn_radio_uncheck(this)" data-val=""> <label for="rad_stdpt">학생부</label></span><span><input type="radio" name="rdo_lwacst" id="rad_none" value="none" onclick="fn_radio_uncheck(this)" data-val=""> <label for="rad_none">반영안함</label></span></td>
												</tr>
											</tbody>
											
											<tbody id="tbSelctnDtl" class="tbl_fold">
												<tr>
													<th scope="row">전형<br>상세</th>
													<td colspan="2" onclick="fn_selctnDtlBox_out()">
														<span class="tt_fold first">지역</span><span id="span_area_view">전체</span>
														<span class="tt_fold">전형요소</span><span id="span_rcbk_view">전체</span>
														<span class="tt_fold">수능반영영역</span><span id="span_csatrf_view">전체</span>
														<span class="tt_fold">최저학력기준</span><span id="span_lwacst_view">전체</span>
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
														<input id="searchKeyword" name="searchKeyword" onkeypress="if(event.keyCode==13){btn_search_keyword_init();}" style="ime-mode:active" placeholder="학과관련 키워드" class="search_input" type="text" value="" maxlength="30">
														
													</td>
												</tr>
												<tr>
													<td colspan="2" class="list_wrap">
														<!-- 계열 선택 전 문구 -->
														<div class="box_txt" id="box_keyword_txt">학과관련 키워드 혹은 해당 계열을 선택합니다.</div>
														<!-- //계열 선택 전 문구 -->
														<div class="box_wrap" id="searchBox">
															<div class="list box01">
																<h3>대계열</h3>
																
																<div class="menu mCustomScrollbar _mCS_1 mCS_no_scrollbar" id="sel_lgcl"><div id="mCSB_1" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: 128px;" tabindex="0"><div id="mCSB_1_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
																	<input id="lst_lgcl_cd" name="lst_lgcl_cd" type="hidden" value="">
								            						<ul>
								            							
								            								<!-- <li id="lst_lgcl_A" name="lst_lgcl" value="A"><a href="javascript:fn_LgclList_onclick(this,&#39;A&#39;,&#39;L&#39;)">인문사회계열</a></li>
								            							
								            								<li id="lst_lgcl_B" name="lst_lgcl" value="B"><a href="javascript:fn_LgclList_onclick(this,&#39;B&#39;,&#39;L&#39;)">자연과학계열</a></li>
								            							
								            								<li id="lst_lgcl_C" name="lst_lgcl" value="C"><a href="javascript:fn_LgclList_onclick(this,&#39;C&#39;,&#39;L&#39;)">예체능계열</a></li>
								            							
								            								<li id="lst_lgcl_D" name="lst_lgcl" value="D"><a href="javascript:fn_LgclList_onclick(this,&#39;D&#39;,&#39;L&#39;)">공학계열</a></li>
								            							
								            								<li id="lst_lgcl_E" name="lst_lgcl" value="E"><a href="javascript:fn_LgclList_onclick(this,&#39;E&#39;,&#39;L&#39;)">의학계열</a></li> -->
								            							
								            						</ul>
																</div><div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;"><div class="mCSB_draggerContainer"><div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; top: 0px;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div>
																
															</div>
															<div class="list box02">
																<h3>중계열</h3>
																<div class="menu mCustomScrollbar _mCS_2 mCS_no_scrollbar" id="sel_mdcl"><div id="mCSB_2" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" tabindex="0" style="max-height: 128px;"><div id="mCSB_2_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
																	<input id="lst_mdcl_cd" name="lst_mdcl_cd" type="hidden" value="">
																	<ul></ul>
																</div><div id="mCSB_2_scrollbar_vertical" class="mCSB_scrollTools mCSB_2_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;"><div class="mCSB_draggerContainer"><div id="mCSB_2_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; top: 0px;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div>
															</div>
															<div class="list box04">
																<h3><input type="checkbox" name="chk_subjct_all" id="chk_subjct_all" onclick="fn_chkSubjct_onclick()"><label for="chk_subjct_all">학과명</label></h3>
																<div class="menu mCustomScrollbar _mCS_4 mCS_no_scrollbar" id="sel_subjctNm"><div id="mCSB_4" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" tabindex="0" style="max-height: 128px;"><div id="mCSB_4_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
																	<ul>
																	</ul>
																</div><div id="mCSB_4_scrollbar_vertical" class="mCSB_scrollTools mCSB_4_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;"><div class="mCSB_draggerContainer"><div id="mCSB_4_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; top: 0px;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div>
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
							<a href="javascript:btn_search_onclick_init()" title="검색" class="btn_searchAll btn btn-dark" role="button">검색</a>
						</div>
			
			
		<!-- 대학리스트 -->
					<div class="tbl_list">
						
					</div>
					
					<div class="align_c">
						<!-- 수능/모의고사 선택 레이어팝업  -->
						<!-- <div class="mask"></div>
						<div class="w360 ui-draggable" id="loadingDiv" style="left: 200px;">
							<div class="pop_layer">
								<div class="tit_popcal ui-draggable-handle">
									<h3>수능/모의고사 선택</h3>
									<button type="button" class="closed" onclick="closed(&#39;loadingDiv&#39;);"><img src="./대입정보포털 - 대학_학과_전형 - 전형정보 - 일반대학_files/btn_closed.png" alt="창닫기"></button>
								</div>
								<div class="con_popcal">
									<div class="align_c">
										<label class="tts" for="sel_csat_imtexm">수능/모의고사 선택</label>
										<select class="w210" id="sel_csat_imtexm" name="sel_csat_imtexm">
											<option value="">수능/모의고사 선택</option>
											
										</select>
									</div>
									<div class="align_c mgt20">
										csat_dgnss_view
										<button type="button" class="btnc_member2_2 w70" onclick="csat_dgnss_view()">진단</button>
										<button type="button" class="btnc_member2_2 w70" onclick="closed(&#39;loadingDiv&#39;);">닫기</button>
									</div>
								</div>
							</div>
						</div> -->
						<!-- //수능/모의고사 선택  -->
						
					</div>
						
					<!-- 전년도 변환표준점수 사용여부 레이어팝업  -->
						<!-- <div class="mask"></div>
						<div class="w520 table_box ui-draggable" id="loadingDiv3" style="center:100px;">
							<div class="pop_cal h330">
								<div class="tit_popcal ui-draggable-handle">
									<h3 id="p_title">전년도 변환표준점수 사용 대학교</h3>
									<button type="button" class="closed" onclick="closed(&#39;loadingDiv3&#39;);"><img src="./대입정보포털 - 대학_학과_전형 - 전형정보 - 일반대학_files/btn_closed.png" alt="창닫기"></button>
								</div>
								<div class="con_popcal">
									<div id="bfyr_content" class="line_c" style="height: 50px; overflow: auto; border: 1px solid gray; letter-spacing: 1.1px;">
									</div>
									<div style="letter-spacing: 1.1px; padding: 30px 0;">
										<p>위 대학은 변환표준점수를 사용하여 점수가 산출되기 때문에 대학의 2017학년도 변환표준점수가 발표되기 전까지는 2016학년도 변환표준점수를 기준으로 점수가 산출되고, 2017학년도 변환표준점수 적용 시 결과 가 달라질 수 있습니다.</p>
									</div>

									<div class="img_site"><span class="d_t3 mgr51 t_cr02"><img src="./대입정보포털 - 대학_학과_전형 - 전형정보 - 일반대학_files/bullet_07.png" class="mgt6 mgr5">자세한 사항은 공지사항을 참고하여주시기 바랍니다. </span><a href="https://adiga.kr/PageLinkAll.do?link=/kcue/ast/eip/eis/cstmr/notice/EipNoticeView.do&amp;p_menu_id=PG-EIP-10901&amp;sn=6515&amp;rnum=136" target="_blank"><img src="./대입정보포털 - 대학_학과_전형 - 전형정보 - 일반대학_files/btn_dirgo.png" alt="공지사항 페이지"></a></div>
									<div class="align_c mgb10">
										<button type="button" class="btnc_click07 w70 h30" style="position: absolute; top: 290px; left: 230px;" onclick="dgnss_pageCall()">확인</button>
									</div>
								</div>
								
							</div>
						</div> -->
						<!-- //전년도 변환표준점수 사용여부 레이어팝업  -->
						
					
						
						<!-- 전년도입시결과 레이어팝업  -->
						<div class="mask"></div>
						<%-- <div class="w450" id="loadingDiv4">
							<div class="pop_layer">
								<div class="tit_popcal">
									<h3>전년도 입시결과</h3>
									<button type="button" class="closed" onclick="closed(&#39;loadingDiv4&#39;);"><img src="./대입정보포털 - 대학_학과_전형 - 전형정보 - 일반대학_files/btn_closed.png" alt="창닫기"></button>
								</div>
								<div class="con_popcal">
									
									
									<table class="table_row2 align_c mgt5" style="width:100%">
										<caption>전년도 입시결과</caption>
										<colgroup>
											<col>
											<col style="width:15%">
											<col style="width:15%">
											<col style="width:15%">
											<col style="width:15%">
											<col style="width:15%">
										</colgroup>
										<thead>
											<tr>
												<th scope="col" rowspan="2">검증결과</th>
												<th scope="col" colspan="2">학생부</th>
												<th scope="col" colspan="3">수능</th>
											</tr>
											<tr>
												<th scope="col">환산점수</th>
												<th scope="col">등급</th>
												<th scope="col">환산점수</th>
												<th scope="col">백분위</th>
												<th scope="col">등급</th>
											</tr>
										</thead>
										<tbody id="bfyr_entexm">
										</tbody>
									</table>
									
									<div class="align_c mgt20">
										<button type="button" class="btnc_member2_2 w70" onclick="closed(&#39;loadingDiv4&#39;);">닫기</button>
									</div>
								</div>
							</div>
						</div> --%>
						<!-- //전년도입시결과 서비스표  -->
						
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
									<th scope="col">비교<br>분석</th>
									<th scope="col">관심<br>설정</th>
								</tr>
							</thead>
							<tbody id="tbResult">
								<tr>
									<td colspan="9">조회된 자료가 없습니다.</td>
								</tr>
							</tbody>
						</table>
					</div>
		
		
		
		</div>
	</div>
	
	<%@include file="../main/bottom.jsp" %>
</body>
</html>