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
<link rel="stylesheet" href="style/grade.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
</head>
<body>
	<%@include file="../main/head.jsp" %>
	
	<div class="topcontents">
		<div class="lefttop">
			<div class="lefttoptext">성적분석</div>
		</div>
		<div class="righttop">
			<div class="righttoptext">대학별 성적 분석</div>
		</div>
	</div>
	<div class="contents">
		<div class="leftmenu">
			<nav class="left1" >
				<ul class="navbar-nav1  bg-light ">
					<li class="nav-item1"><a class="nav-link" href="s_grade.do?id=${sessionScope.siteUserInfo }">학생부 성적 분석<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="j_grade.do?id=${sessionScope.siteUserInfo }">수능 성적 분석<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="u_grade.do?id=${sessionScope.siteUserInfo }">대학별 성적 분석<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
				</ul>
			</nav>
		</div>
		<div class="rightcontents">
			<h3>01 학과선택</h3>
				<div class="tbl_wrap">
					<table class="search_tbl01">
						<caption>검색박스</caption>
						<colgroup>
							<col style="width:8%;">
							<col>
							<col style="width:80%;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="col">
									<label for="univ_nm">대학</label>
								</th>
								<td colspan="2">
									<input id="searchUnivKeyword" name="searchUnivKeyword" title="대학명검색" onkeypress="if(event.keyCode==13){btn_search_univ_init();}" style="ime-mode:active" placeholder="대학명을 입력해주세요." class="search_input" type="text" value="" maxlength="30">
									<a href="javascript:btn_search_univ_init()" title="검색" class="btn_search"><img src="" alt="검색"></a>
								</td>								
							</tr>
						</tbody>
					</table>
				</div>
				<div class="tbl_wrap">
					<table class="search_tbl01">
						<caption>검색박스</caption>
						<colgroup>
							<col style="width:8%;">
							<col>
							<col style="width:80%;">
						</colgroup>
						<tbody id="tbsersDetail">
							<tr class="bor_no">
								<th scope="row" rowspan="2">
									<label for="uv">학과</label>
								</th>
								
								<td colspan="2">
									<input id="searchKeyword" name="searchKeyword" onkeypress="if(event.keyCode==13){btn_search_keyword_init();}" style="ime-mode:active" placeholder="학과관련 키워드" class="search_input" type="text" value="" maxlength="30">
									<a href="javascript:btn_search_keyword_init()" title="검색" class="btn_search"><img src="/images/re_icon/icon_search3.png" alt="검색"></a>
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
											
											<div class="menu mCustomScrollbar _mCS_1 mCS_no_scrollbar" id="sel_lgcl"><div id="mCSB_1" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0"><div id="mCSB_1_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
												<input id="lst_lgcl_cd" name="lst_lgcl_cd" type="hidden" value="">
			            						<ul>
			            							
			            								<li id="lst_lgcl_A" name="lst_lgcl" value="A"><a href="javascript:fn_LgclList_onclick(this,'A','L')">인문사회계열</a></li>
			            							
			            								<li id="lst_lgcl_B" name="lst_lgcl" value="B"><a href="javascript:fn_LgclList_onclick(this,'B','L')">자연과학계열</a></li>
			            							
			            								<li id="lst_lgcl_C" name="lst_lgcl" value="C"><a href="javascript:fn_LgclList_onclick(this,'C','L')">예체능계열</a></li>
			            							
			            								<li id="lst_lgcl_D" name="lst_lgcl" value="D"><a href="javascript:fn_LgclList_onclick(this,'D','L')">공학계열</a></li>
			            							
			            								<li id="lst_lgcl_E" name="lst_lgcl" value="E"><a href="javascript:fn_LgclList_onclick(this,'E','L')">의학계열</a></li>
			            							
			            						</ul>
											</div><div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;"><div class="mCSB_draggerContainer"><div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; height: 0px; top: 0px;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div>
											
										</div>
										<div class="list box02">
											<h3>중계열</h3>
											<div class="menu mCustomScrollbar _mCS_2 mCS_no_scrollbar" id="sel_mdcl"><div id="mCSB_2" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" tabindex="0" style="max-height: none;"><div id="mCSB_2_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
												<input id="lst_mdcl_cd" name="lst_mdcl_cd" type="hidden" value="">
												<ul></ul>
											</div><div id="mCSB_2_scrollbar_vertical" class="mCSB_scrollTools mCSB_2_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;"><div class="mCSB_draggerContainer"><div id="mCSB_2_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; top: 0px;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div>
										</div>
										<div class="list box03">
											<h3>소계열</h3>
											<div class="menu mCustomScrollbar _mCS_3 mCS_no_scrollbar" id="sel_smcl"><div id="mCSB_3" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" tabindex="0" style="max-height: none;"><div id="mCSB_3_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
												<input id="lst_smcl_cd" name="lst_smcl_cd" type="hidden" value="">
												<ul></ul>
											</div><div id="mCSB_3_scrollbar_vertical" class="mCSB_scrollTools mCSB_3_scrollbar mCS-light mCSB_scrollTools_vertical" style="display: none;"><div class="mCSB_draggerContainer"><div id="mCSB_3_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 30px; top: 0px;"><div class="mCSB_dragger_bar" style="line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div></div></div></div>
										</div>
										<div class="list box04">
											<h3><input type="checkbox" name="chk_subjct_all" id="chk_subjct_all" onclick="fn_chkSubjct_onclick()"><label for="chk_subjct_all">학과명</label></h3>
											<div class="menu mCustomScrollbar _mCS_4 mCS_no_scrollbar" id="sel_subjctNm"><div id="mCSB_4" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" tabindex="0" style="max-height: none;"><div id="mCSB_4_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
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
											<li class="h3_03">소계열</li>
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
						
						<tbody id="tbSers" class="tbl_fold" style="display: none;">
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
		</div> <!-- rightcontents -->
	</div> <!-- contents -->
	<%@include file="../main/bottom.jsp" %>
</body>
</html>