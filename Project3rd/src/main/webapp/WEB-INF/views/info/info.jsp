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
		
		
		
				<!-- 조건박스 모두 열렸을떄 -->
				<div class="search_tbl_box">
					<fieldset>
						<!-- 대학 -->
						<div class="tbl_wrap">
							<!-- <p class="box_btn" id="btn_box_fold" style=""><a href="javascript:fn_box_fold()" title="접기"><img src="./대입정보포털 - 대학_학과_전형 - 대학정보 - 일반대학_files/btn_box_fold.png" alt="접기"></a></p>
							<p class="box_btn" id="btn_box_out" style="display: none;"><a href="javascript:fn_box_out()" title="펼치기"><img src="./대입정보포털 - 대학_학과_전형 - 대학정보 - 일반대학_files/btn_box_out.png" alt="펼치기"></a></p> -->
							<table class="search_tbl01">
								<caption>검색박스</caption>
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
												<button title="검색" class="btn btn-default btn-sm">
													<i class="fa fa-search"></i>&nbsp;&nbsp;<b>검색</b>
												</buton>
											
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
										<th scope="col">대학<br>조건</th>
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
							<th scope="col" rowspan="2">비교<br>분석</th>
							<th scope="col" rowspan="2">관심<br>설정</th>
						</tr>
						<tr>
							<th>수시</th>
							<th>정시</th>
						</tr>
					</thead>
					<tbody id="tbResult">
						<tr><td colspan="9">조회된 자료가 없습니다.</td></tr>
					</tbody>
				</table>
			</div>
			<!-- //대학리스트 -->
				
				
				
				
				
				
		</div>
	</div>
	
	<%@include file="../main/bottom.jsp" %>


</body>
</html>