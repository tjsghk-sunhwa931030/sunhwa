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

//지역 펼치기
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
	
	// 바로 조회
//		btn_search_onclick_init();
}

//학과명 정렬
function btn_subjct_sort_onclick(){
	if($("#thead_subjct_sort").attr("class") == "btn_array_up"){
		$("#thead_subjct_sort").attr("class","btn_array_down");
		$("#subjct_sort").val("DOWN");
	}else{
		$("#thead_subjct_sort").attr("class","btn_array_up");
		$("#subjct_sort").val("UP");
	}
	
	$("#univ_sort").val("");
	$("#area_sort").val("");
	
	btn_search_onclick();
}

//대학명 정렬
function btn_univ_sort_onclick(){
	if($("#thead_univ_sort").attr("class") == "btn_array_up"){
		$("#thead_univ_sort").attr("class","btn_array_down");
		$("#univ_sort").val("DOWN");
	}else{
		$("#thead_univ_sort").attr("class","btn_array_up");
		$("#univ_sort").val("UP");
	}
	
	$("#subjct_sort").val("");
	$("#area_sort").val("");
	
	btn_search_onclick();
}

//지역명 정렬
function btn_area_sort_onclick(){
	if($("#thead_area_sort").attr("class") == "btn_array_up"){
		$("#thead_area_sort").attr("class","btn_array_down");
		$("#area_sort").val("DOWN");
	}else{
		$("#thead_area_sort").attr("class","btn_array_up");
		$("#area_sort").val("UP");
	}
	
	$("#subjct_sort").val("");
	$("#univ_sort").val("");
	
	btn_search_onclick();
}



//조건검색 학과명 체크 클릭
function fn_chkSubjct_onclick(){
	var chk_subjct = $("#chk_subjct_all").is(":checked");
	
	if(chk_subjct){
		$(":checkbox[id^='lst_subjct']").prop("checked",true);
	}else{
		$(":checkbox[id^='lst_subjct']").prop("checked",false);
	}
}

//키워드검색 학과명 체크 클릭
function fn_chkKeywordSubjct_onclick(){
	var chk_subjct = $("#chk_keySubjct_all").is(":checked");
	
	if(chk_subjct){
		$(":checkbox[id^='cmmn_subjct_list']").parent().parent().removeClass("on").addClass("on");
		$(":checkbox[id^='cmmn_subjct_list']").prop("checked",true);
	}else{
		$(":checkbox[id^='cmmn_subjct_list']").parent().parent().removeClass("on");
		$(":checkbox[id^='cmmn_subjct_list']").prop("checked",false);
	}
}



</script>



<style type="text/css">
	.lefttoptext{margin:0 auto;font-size:25px;font-weight:bold;margin-top:10px;}
	.righttoptext{margin:0 auto;font-size:40px;font-weight:bold;}
	.contents{height: 950px;}
</style>
</head>
<body>
<%@include file="../main/head.jsp" %> 
	<div class="topcontents">
		<div class="lefttop">
        	 <div class="lefttoptext">대학간다</div>
      	</div>
      <div class="righttop">
         <div class="righttoptext">학과 검색</div>
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
					<div class="search_tbl_box">
				<fieldset>
					<!-- 학과 --> 
					<div class="tbl_wrap">
						<table class="search_tbl01">
							<%-- <caption>검색박스</caption> --%>
							<colgroup>
								<col style="width:8%;">
								<col>
								<col style="width:80%;">
							</colgroup>
							<tbody id="tbsersDetail">
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
										<!-- <div class="box_txt" id="box_keyword_txt" style="top:200px;">학과관련 키워드 혹은 해당 계열을 선택합니다.</div> -->
										<!-- //계열 선택 전 문구 -->
										<div class="box_wrap" id="searchBox">
											<div class="list box01">
												<h3>대계열</h3>
												
												<div class="menu" id="sel_lgcl">
													<!-- <input id="lst_lgcl_cd" name="lst_lgcl_cd" type="hidden" value="">
				            						<ul>
				            							
				            								<li id="lst_lgcl_A" name="lst_lgcl" value="A"><a href="javascript:fn_LgclList_onclick(this,&#39;A&#39;,&#39;L&#39;)" title="대계열검색조건">인문사회계열</a></li>
				            							
				            								<li id="lst_lgcl_B" name="lst_lgcl" value="B"><a href="javascript:fn_LgclList_onclick(this,&#39;B&#39;,&#39;L&#39;)" title="대계열검색조건">자연과학계열</a></li>
				            							
				            								<li id="lst_lgcl_C" name="lst_lgcl" value="C"><a href="javascript:fn_LgclList_onclick(this,&#39;C&#39;,&#39;L&#39;)" title="대계열검색조건">예체능계열</a></li>
				            							
				            								<li id="lst_lgcl_D" name="lst_lgcl" value="D"><a href="javascript:fn_LgclList_onclick(this,&#39;D&#39;,&#39;L&#39;)" title="대계열검색조건">공학계열</a></li>
				            							
				            								<li id="lst_lgcl_E" name="lst_lgcl" value="E"><a href="javascript:fn_LgclList_onclick(this,&#39;E&#39;,&#39;L&#39;)" title="대계열검색조건">의학계열</a></li>
				            							
				            						</ul> -->
												</div>
												
											</div>
											<div class="list box02">
												<h3>중계열</h3>
												<div class="menu" id="sel_mdcl">
													<!-- <input id="lst_mdcl_cd" name="lst_mdcl_cd" type="hidden" value=""> -->
													<ul></ul>
												</div>
											</div>
											<div class="list box04">
												<h3>학과명</h3>
												<div class="menu" id="sel_subjctNm">
													<ul>
													</ul>
												</div>
											</div>
										</div>
										
										<%-- <!-- 키워드로 검색시 -->
										<div class="box_wrap" id="keywordBox" style="display: none;">
											<ul class="h3">
												<li class="h3_01">대계열</li>
												<li class="h3_02">중계열</li>
												<li class="h3_03">소계열</li>
												<li class="h3_04"><input type="checkbox" name="chk_keySubjct_all" id="chk_keySubjct_all" onclick="fn_chkKeywordSubjct_onclick()"><label for="chk_keySubjct_all">학과명</label></li>
											</ul>
											<div class="keyword_list_box">
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
											</div>
										</div>
										<!-- //키워드로 검색시 --> --%>
			
									</td>
								</tr>
								<tr>
									<th scope="row" rowspan="3">
										<label for="uv">지역</label>
									</th>
									
								</tr>
								<tr>
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
							</tbody>
							
							<tbody style="display: none;" id="tbSers" class="tbl_fold">
								<tr>
									<th scope="row">
										<label for="uv">학과</label>
									</th>
									<td colspan="2" onclick="fn_sersBox_out()">
										<span class="tt_fold first">계열</span><span id="span_sers_view"></span>
									</td>
								</tr>
							</tbody>
							
						</table>
					</div>
				</fieldset>
		
			<!-- 조건박스 모두 열렸을떄 -->
			
			<!-- search_tbl_box -->
				<div class="search_box_btn">
					<a href="javascript:btn_search_onclick_init()" title="검색" class="btn_searchAll btn btn-dark" role="button">검색</a>
				</div>
		
		
			<!-- 대학리스트 -->
		<div class="tbl_list">
			<br>	
			<table class="list_tbl01">
				<caption>대학 리스트</caption>
				<colgroup>
					<col>
					<col style="width:90px;">
					<col style="width:70px;">
					<col style="width:60px;">
					<col style="width:60px;">
					<col style="width:60px;">
					<col style="width:60px;">
					<col style="width:80px;">
				</colgroup>
				
				<thead style="border-bottom: 1px solid #ddd;">
					<tr style="border-bottom: none;">
						<th scope="col" rowspan="2" >학과명</th>
						<th scope="col" rowspan="2">대학명</th>
						<th scope="col" rowspan="2">지역</th>
						<th scope="col" rowspan="2">입학정원</th>
						<th scope="col" rowspan="2">취업률</th>
						<th scope="col" rowspan="2">전년도 최저</th>
						<th scope="col" rowspan="2">입시결과</th>
					</tr>
					<tr>
						<th>수시</th>
						<th>정시</th>
					</tr>
				</thead>
				
				<tbody id="tbResult">
					<c:forEach items="${lists }" var="rowh">
					<tr>
					</tr>
					<tr>
						<td id="hidden" scope="col" rowspan="2">${rowh.u_type}</td>			
						<td scope="col" rowspan="2">${rowh.major}</td>
						<td scope="col" rowspan="2">${rowh.uname}</td>
						<td scope="col" rowspan="2">${rowh.location}</td>
						<td scope="col" rowspan="2">${rowh.majorman}</td>
						<td scope="col" rowspan="2">${rowh.mjobrate}</td>
						<td scope="col" rowspan="2"></td>
						<td scope="col" rowspan="2">${rowh.ibresult}</td>
	
					</tr>
					<tr>
						<th>${rowh.lastminis}</th>
						<th>${rowh.lastminij}</th>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- //대학리스트 -->
		</div>
		</div><!-- 일반대학교 끝 -->
			
			
			<!-- 전문대학교 시작 -->
				<div id="junmun" class="container tab-pane fade"><br/>
					<div class="search_tbl_box">
				<fieldset>
					<!-- 학과 --> 
					<div class="tbl_wrap">
						<p class="box_btn" id="btn_sersBox_fold"><a href="javascript:fn_sersBox_fold()" title="접기"><img src="./resources/images/btn_box_fold.png" alt="접기"></a></p>
						<p class="box_btn" id="btn_sersBox_out" style="display: none;"><a href="javascript:fn_sersBox_out()" title="펼치기"><img src="./resources/images/btn_box_out.png" alt="펼치기"></a></p>
						<table class="search_tbl01">
							<%-- <caption>검색박스</caption> --%>
							<colgroup>
								<col style="width:8%;">
								<col>
								<col style="width:80%;">
							</colgroup>
							<tbody id="tbsersDetail">
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
										<!-- <div class="box_txt" id="box_keyword_txt" style="top:200px;">학과관련 키워드 혹은 해당 계열을 선택합니다.</div> -->
										<!-- //계열 선택 전 문구 -->
										<div class="box_wrap" id="searchBox">
											<div class="list box01">
												<h3>대계열</h3>
												
												<div class="menu" id="sel_lgcl">
													<!-- <input id="lst_lgcl_cd" name="lst_lgcl_cd" type="hidden" value="">
				            						<ul>
				            							
				            								<li id="lst_lgcl_A" name="lst_lgcl" value="A"><a href="javascript:fn_LgclList_onclick(this,&#39;A&#39;,&#39;L&#39;)" title="대계열검색조건">인문사회계열</a></li>
				            							
				            								<li id="lst_lgcl_B" name="lst_lgcl" value="B"><a href="javascript:fn_LgclList_onclick(this,&#39;B&#39;,&#39;L&#39;)" title="대계열검색조건">자연과학계열</a></li>
				            							
				            								<li id="lst_lgcl_C" name="lst_lgcl" value="C"><a href="javascript:fn_LgclList_onclick(this,&#39;C&#39;,&#39;L&#39;)" title="대계열검색조건">예체능계열</a></li>
				            							
				            								<li id="lst_lgcl_D" name="lst_lgcl" value="D"><a href="javascript:fn_LgclList_onclick(this,&#39;D&#39;,&#39;L&#39;)" title="대계열검색조건">공학계열</a></li>
				            							
				            								<li id="lst_lgcl_E" name="lst_lgcl" value="E"><a href="javascript:fn_LgclList_onclick(this,&#39;E&#39;,&#39;L&#39;)" title="대계열검색조건">의학계열</a></li>
				            							
				            						</ul> -->
												</div>
												
											</div>
											<div class="list box02">
												<h3>중계열</h3>
												<div class="menu" id="sel_mdcl">
													<!-- <input id="lst_mdcl_cd" name="lst_mdcl_cd" type="hidden" value=""> -->
													<ul></ul>
												</div>
											</div>
											<div class="list box04">
												<h3>학과명</h3>
												<div class="menu" id="sel_subjctNm">
													<ul>
													</ul>
												</div>
											</div>
										</div>
										
										<%-- <!-- 키워드로 검색시 -->
										<div class="box_wrap" id="keywordBox" style="display: none;">
											<ul class="h3">
												<li class="h3_01">대계열</li>
												<li class="h3_02">중계열</li>
												<li class="h3_03">소계열</li>
												<li class="h3_04"><input type="checkbox" name="chk_keySubjct_all" id="chk_keySubjct_all" onclick="fn_chkKeywordSubjct_onclick()"><label for="chk_keySubjct_all">학과명</label></li>
											</ul>
											<div class="keyword_list_box">
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
											</div>
										</div>
										<!-- //키워드로 검색시 --> --%>
										
										
										
									</td>
								</tr>
							</tbody>
							
							<tbody style="display: none;" id="tbSers" class="tbl_fold">
								<tr>
									<th scope="row">
										<label for="uv">학과</label>
									</th>
									<td colspan="2" onclick="fn_sersBox_out()">
										<span class="tt_fold first">계열</span><span id="span_sers_view"></span>
									</td>
								</tr>
							</tbody>
							
						</table>
					</div>
					<!-- //학과 -->
					<!-- 학과상세 -->
					<div class="tbl_wrap">
						<table class="search_tbl01 bor_no">
							<caption>검색박스</caption>
							<colgroup>
								<col style="width:8%;">
								<col>
								<col style="width:80%;">
							</colgroup>
							<tbody id="tbDetail" style="display: none;">
								<tr>
									<th scope="row" rowspan="3">
										<label for="uv">학과<br>상세</label>
									</th>
									<td class="tt">학과특성</td>
									<td>
										<input id="lst_sjchartr_cd" name="lst_sjchartr_cd" type="hidden" value="">
										<input type="checkbox" name="chk_sjchartr" id="chk_sjchartr_all" value="%" checked="checked" onclick="fn_sjchartrList_onclick(this);"><label for="chk_sjchartr_all">전체</label>
										<input type="checkbox" name="chk_sjchartr" id="chk_sjchartr_01" value="01" onclick="fn_sjchartrList_onclick(this);"><label for="chk_sjchartr_01">일반과정</label>
										<input type="checkbox" name="chk_sjchartr" id="chk_sjchartr_02" value="02" onclick="fn_sjchartrList_onclick(this);"><label for="chk_sjchartr_02">산업체위탁</label>
										<input type="checkbox" name="chk_sjchartr" id="chk_sjchartr_03" value="03" onclick="fn_sjchartrList_onclick(this);"><label for="chk_sjchartr_03">특별과정</label>
										<input type="checkbox" name="chk_sjchartr" id="chk_sjchartr_04" value="04" onclick="fn_sjchartrList_onclick(this);"><label for="chk_sjchartr_04">계약학과</label>
										<br/>
										<input type="checkbox" name="chk_sjchartr" id="chk_sjchartr_05" value="05" onclick="fn_sjchartrList_onclick(this);"><label for="chk_sjchartr_05">산학협력취업약정제</label>
										<input type="checkbox" name="chk_sjchartr" id="chk_sjchartr_09" value="09" onclick="fn_sjchartrList_onclick(this);"><label for="chk_sjchartr_09">학석사통합과정</label>
									</td>
								</tr>
								<tr>
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
							</tbody>
							
							<tbody id="tbSimple" class="tbl_fold">
								<tr>
									<th scope="row" rowspan="2">
										<label for="uv">학과<br>상세</label>
									</th>
									<td colspan="2" onclick="fn_simpleBox_out()">
										<span class="tt_fold first">학과특성</span><span id="span_sjchartr_view">전체</span>
										<span class="tt_fold">지역</span><span id="span_area_view">전체</span>
										<span class="tt_fold">취업률</span><span id="span_empymn_view">전체</span>
									</td>
								</tr>
							</tbody>
							
						</table>
					</div>
					<!-- //학과상세 -->
				</fieldset>
		
			<!-- 조건박스 모두 열렸을떄 -->
			
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
					<col style="width:150px;">
					<col style="width:70px;">
					<col style="width:60px;">
					<col style="width:60px;">
					<col style="width:80px;">
				</colgroup>
				
				<thead style="border-bottom: 1px solid #ddd;">
					<tr style="border-bottom: none;">
						<th scope="col" rowspan="2" >학과명</th>
						<th scope="col" rowspan="2">대학명</th>
						<th scope="col" rowspan="2">지역</th>
						<th scope="col" rowspan="2">입학정원</th>
						<th scope="col" rowspan="2">입시결과</th>
					</tr>
				</thead>
				
				<tbody id="tbResult">
					<tr><td colspan="5">조회된 자료가 없습니다.</td></tr>
				</tbody>
			</table>
		</div>
		<!-- //대학리스트 -->
		</div>
		</div><!-- 전문대학교 끝 -->
		
		<!-- 페이징 -->
	    	<div class="paging" id="paginationholder"> 
	        	<ul id="pagination" class="pages"></ul>
	    	</div>
		<!-- //페이징 -->
		
		
		</div>
	</div>
	</div>
	
	<%@include file="../main/bottom.jsp" %>
</body>
</html>