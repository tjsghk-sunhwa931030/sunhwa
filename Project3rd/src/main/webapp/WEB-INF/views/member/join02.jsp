<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
li { list-style: none }
.login_box_new{

}
</style>

<script>



var idObj;
var idFlag;
window.onload = function(){
	idObj = document.registFrm.ID;//아이디 객체		
}
//아이디 중복체크를 위해 팝업창을 띄우기전 아이디의 유효성을 검증한다. 
function id_check_person(fn)
{
	//아이디 입력후 중복확인
	if(idObj.value.length==0) {	
		alert('아이디를 기입하신다음 중복확인을 누르세요.') ;
		idObj.focus();
		return;
	}	
	
	if(!idCapsule()){
		idObj.value="";
		idObj.focus();
		return;
	}

	
	duplicatedIdChk('0'); // 중복확인 버튼 최초 호출
	
	
	/* window.open('IdOverlap.jsp?ID=' + idObj.value , 'IDWin', 
		'width=580, height=270, toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no'); */	
}

//아이디가 8~12자 사이가 아니면 false를 반환한다.
var idLength = function(param){	
	
	//console.log(param.value.length);	
	
	if(!(param.value.length>=4 && param.value.length<=12))
	{		
		return false;
	}
	return true;
}
//아스키코드로 숫자인지 여부확인 : 숫자라면 true를 반환한다.
function isNumber(param){		
	for(var i=0 ; i<param.length ; i++){
		if(!(param[i].charCodeAt(0)>=48 && param[i].charCodeAt(0)<=57)){
			return false;
		}		
	}
	return true;
}
//아이디의 첫문자는 숫자로 시작할수 없다
var idStartAlpha = function(param){	
	if(isNumber(param.value.substring(0,1))==true){		
		return false;
	}	
	return true;
}

function CheckPass(str){
	 var reg1 = /^[a-z0-9]{4,12}$/; 
	 var reg2 = /[a-z]/g;
	var reg3 = /[0-9]/g;
	return(reg1.test(str)&&reg2.test(str)&&reg3.test(str));
	
}
//아스키코드로 숫자 or 알파벳인지 확인. 아니면 false반환
function isAlphaNumber(param){
	for(var i=0 ; i<param.value.length ; i++){	
		if(!((param.value[i].charCodeAt(0)>=97 && param.value[i].charCodeAt(0)<=122) 
				|| (param.value[i].charCodeAt(0)>=65 && param.value[i].charCodeAt(0)<=90)
				|| (param.value[i].charCodeAt(0)>=48 && param.value[i].charCodeAt(0)<=57))){
			return false;	
		}
	}
	return true;
}
//아이디검증 로직을 하나로 묶는다.
function idCapsule(){
	
	//1.아이디는 8~12자 이내여야 한다. 즉 7자를 쓰거나 13자를 쓰면 잘못된 아이디로 판단하고 재입력을 요구한다.
	if(!idLength(idObj)){
		alert('아이디는 4~12자만 가능합니다.');
		return false;
	}
	
	//2.아이디는 반드시 영문으로 시작해야 한다. 만약 숫자로 시작하면 잘못된 아이디로 판단한다.
	if(!idStartAlpha(idObj)){
		alert("아이디는 숫자로 시작할수 없습니다.");
		return false;
	}	

	//3.영문과 숫자의 조합으로만 구성해야 한다. 특수기호가 들어가거나 한글이 들어갈 경우 잘못된 아이디로 판단한다.
	if(!isAlphaNumber(idObj)){
		alert("아이디는 영문과 숫자만 포함할수 있습니다.");
		return false;
	}	
	
	if(CheckPass(idObj.value)==false){
		alert("아이디영문숫자조합");
		return false;
	}
	
	return true;
}

function commonFocusMove(obj, mLength, next_obj){
    //DOM에 입력된 글자수의 길이를 가져온다.
    var strLength = obj.value.length;
    //조건에 만족할때 다음 항목으로 포커스를 이동한다. 
    if(strLength >= mLength){
        eval('document.registFrm.'+next_obj).focus();
    }
}

function commonFocusMove1(obj, mLength, next_obj){
    //DOM에 입력된 글자수의 길이를 가져온다.
    var strLength = obj.value.length;
    //조건에 만족할때 다음 항목으로 포커스를 이동한다. 
    if(strLength >= mLength){
        eval('document.registFrm.'+next_obj).focus();
    }
}

function choiceInput(frm, elem) { 
	for(var i=0; i<elem.length;i++) { 
		if (elem.options[i].selected) {
			if(elem.options[elem.selectedIndex].value!="direct_input"){
				frm.email_domain.value = elem.options[elem.selectedIndex].value	
			}
			else{
				frm.email_domain.value = "";
				frm.email_domain.focus();
			}
		}
	}
}

function registFrmCheck()
{	
	var fn = document.registFrm;
	/* 
	if($("#SMS_OK").prop("checked")){
		$("#SMS_OK").val(1);
	}else{
		$("SMS_OK").val(0);
	}
	if($("#EMAIL_OK").prop("checked")){
		$("#EMAIL_OK").val(1);
	}else{
		$("EMAIL_OK").val(0);
	} */
	
	
	if(fn.NAME.value==""){
		alert("이름을 입력해주세요");fn.NAME.focus();
		return false;
	}
	//일반적인방법
	if(fn.ID.value==""){
		alert("아이디를 입력해주세요");fn.ID.focus();
		return false;
	}	
		  
	
	if(!idCapsule()){
		idObj.value="";
		idObj.focus();
		return false;
	}
	if(fn.PASS1.value==""){alert("비밀번호를 입력해주세요");fn.PASS1.focus();return false;}
	if(fn.PASS2.value==""){alert("비밀번호를 입력해주세요");fn.PASS2.focus();return false;}
	if(!(fn.PASS1.value.length>=4 && fn.PASS1.value.length<=12)){
		alert("비밀번호 4자 이상 12자로 구성하세요");
		fn.PASS1.focus();
		return false;
	}
	
	for(var i=0 ; i<fn.PASS1.value.length ; i++){	
		if(!((fn.PASS1.value[i].charCodeAt(0)>=97 && fn.PASS1.value[i].charCodeAt(0)<=122) 
				|| (fn.PASS1.value[i].charCodeAt(0)>=65 && fn.PASS1.value[i].charCodeAt(0)<=90)
				|| (fn.PASS1.value[i].charCodeAt(0)>=48 && fn.PASS1.value[i].charCodeAt(0)<=57))){
			alert("영문/숫자 조합으로 구성하세요");
			return false;	
		}
	}
	function CheckPass(str){
		 var reg1 = /^[a-z0-9]{4,8}$/; 
		 var reg2 = /[a-z]/g;
		var reg3 = /[0-9]/g;
		return(reg1.test(str)&&reg2.test(str)&&reg3.test(str));
		
	}
	
	if(CheckPass(fn.PASS1.value)==false){
		alert("비밀번호영문숫자조합");
		return false;
	}
	
	
	//나머지 빈값체크에 대해서는 생략합니다.
			 		
	//아이디 중복확인을 마쳐야 회원가입을 할수있다.
	/* if(fn.overFlag.value=="0"){
		alert("아이디 중복확인을 해주세요.")
		return false;
	} */
	
	if(fn.EMAIL.value=="" || fn.email_domain.value==""){
		alert("이메일 입력해주세요");
		return false;
	}
	if(fn.PHONE.value==""||fn.mobile2.value==""||fn.mobile3.value==""){
		alert("핸드폰번호 입력해주세요");
		return false;
	}

	if( '1' === $('#dupIdChk').val() ) {
		alert( "ID 중복 됐습니다.");
		return false;
	}
	
	 
	var fn = document.registFrm;

}

//아이디 중복 체크
function duplicatedIdChk(args) { // 0 : 첫 중복확인 버튼을 누른 호출 | 1 : 모달 팝업에서 버튼을 누른 호출 

	var userId = null;
	if( '0' === args ) {
		userId = $('input[name=ID]').val(); // 입력된 ID
	} else if( '1' === args ) {
		userId = $('#mPopinp1').val(); // 입력된 ID
	}
	
	$.ajax({
		url : "getDupIdChk.do",
		type : "post",
		data : { "ID" : userId },
		success: function( data ) {
			$('#mPopinp1').val( userId ); // modal popup ID 입력창에 값 세팅..
	
			if( data > 0 ) {
				// 중복 값 존재..
				$('#dupIdChk').val('1'); // "" : 중복확인 X | 0 : 중복 X | 1 : 중복 O
				$('#id_mem_content').empty();
				$('#id_mem_content').html(
					'<span class="font_w">'+userId+'</span>는'+
					'<span class="t_cr02"> 중복된 아이디 입니다.</span>'
				);
				$('#usedIdButton').hide();
				$('#loadingDiv').show(); // modal open
			} else {
				$('#dupIdChk').val('0');
				$('#id_mem_content').empty();
				$('#id_mem_content').html(
					'<span class="font_w">'+userId+'</span>는'+
					'<span class="t_cr02"> 사용 가능한 아이디 입니다.</span><br>위 아이디로 등록하시겠습니까?'
				);
				$('#usedIdButton').show();
				$('#loadingDiv').show(); // modal open
			}
		}
	});
}

function closed(arg1, arg2) { // arg1 : 화면 ID | arg2 0 : 창닫기 | 1 : 사용 안함 
	if( '1' === arg2 ) {
		$('input[name=ID]').val('');
	}
	$('#'+arg1).hide();
}

function useMemberId() {
	$('input[name=ID]').val( $('#mPopinp1').val() );
	$('#loadingDiv').hide();
}



</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
function postOpen()
{
    new daum.Postcode({
        oncomplete: function(data) {
			
        	var f = document.registFrm;
        	f.zipcode.value = data.zonecode;
        	f.address1.value = data.address;
        	
        	f.sido.value = data.sido;
        	f.gugun.value = data.sigungu;
        	
        	f.address2.focus();
        }
    }).open();
}

function registFrmCheck3()
{	
	var fn = document.registFrm;
	/*  폼값에 대한 검증은 모델1방식에서 했던 내용을 참조한다. */
	
	fn.action = "./MemberRegAction.jsp";

	MemberRegAction
	fn.method = "post";
	fn.submit();
}
</script>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="style/interuniv.css" />
<link rel="stylesheet" href="style/style.css" />
<link rel="stylesheet" href="style/leftmenustyle.css" />
<link rel="stylesheet" href="style/basic.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<script>

</script>
<body>
	<%@include file="../main/head.jsp" %> 
	<div class="topcontents">
		<div class="lefttop"> 
			<div class="lefttoptext">회원서비스</div>
		</div>
		<div class="righttop">
			 <div class="righttoptext">회원가입</div>
		</div>
	</div>
	<div class="contents">
		<div class="leftmenu">
			<nav class="left1" >
				<ul class="navbar-nav1  bg-light">
					<li class="nav-item1"><a class="nav-link" href="login.do">로그인<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="join01.do">회원가입<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="find_id.do">아이디찾기<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="find_pw.do">비밀번호찾기<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="map.do">사이트맵<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
				</ul>
			</nav>
		</div>
		
		
		
		<div class="rightcontents">
		
		<div class="con_box">
		<ul class="tab_member">
			<li>1.약관동의</li>
			<li class="on">2.회원정보입력</li>
			<li>3.회원가입완료</li>
		</ul>
		
		<form name="registFrm" action="join03.do" method="post" 
				onsubmit="return registFrmCheck();">
		<div class="table_box2 mgt35">
			<h4>회원정보입력</h4>
			<span class="t_cr01" title="필수입력">* </span><span class="t_cr03">표시된 항목은 필수 입력사항입니다.</span>
			<!-- url("../images/bg_cal2.gif") repeat; #3bc4b7    -->
			<table class="table_member mgt10" style="width:100%">
				<caption>회원정보 입력표</caption>
				<colgroup>
					<col style="width:20%" />
					<col style="width:80%" />
				</colgroup>
				<tr>
					<th scope="row">이름 <span class="f_pit" title="필수입력"> *</span></th>
					<td>
						<label class="tts" for="usr_nm">이름</label>
						
						<input  name="NAME" title="이름" style="ime-mode:active;" type="text" value="" maxlength="30"/>
					</td>
				</tr>
				<tr>
					<th scope="row">아이디(ID) <span class="f_pit" title="필수입력"> *</span></th>
					<td>
					<!-- onkeyup="fn_idChk(this.value)" onblur="fn_idBlurChk(this.value)" -->
						<label class="tts" for="usr_id">아이디(ID)</label>
						<input name="ID" title="아이디"  style="ime-mode:disabled;" type="text" value="" maxlength="20" />
						<a onclick="id_check_person();" style="cursor:pointer;">
						<img src="images/btn_idcheck.gif" alt="중복확인"/>
						<input type="hidden" id="dupIdChk" value="">
						</a>
						※ 아이디는는 4~12자의 영문 숫자를 조합하여 공백 없이 기입해주세요.
						<!-- 아이디 중복확인 레이어팝업  -->
						<div class="mask"></div> 
						<div class="w360" id="loadingDiv" style="top: 184px; left: 251.667px; display: none;">
							<div class="pop_layer">
								<div class="tit_popcal" style="background:#3bc4b7;height: 50px;" >
									<h3>아이디 중복확인</h3>
									<button type="button" class="closed" onclick="closed('loadingDiv', '0');"><img src="images/btn_closed.png" alt="창닫기"></button>
								</div>
								<div class="con_popcal">
									<label for="mPopinp1">아이디</label><!-- onkeyup="fn_idChk(this.value)" onblur="fn_idBlurChk(this.value)"-->
									<input type="text" id="mPopinp1" value=""  maxlength="20"  style="ime-mode:disabled;" title="아이디">
									<button type="button" class="btnc_click03 w80" onclick="duplicatedIdChk('1');">중복확인</button>
									<div class="id_mem" id="id_mem_content"></div>
									<div class="align_c">
										<button type="button" class="btnc_member2_2 w70" id="usedIdButton" onclick="useMemberId()">사용함</button>
										<button type="button" class="btnc_member2_3 w70" id="notUsedIdButton" onclick="closed('loadingDiv', '1');">사용안함</button>
									</div>
								</div>
							</div>
						</div>					
					</td>
				</tr>
				<tr>
					<th scope="row">비밀번호 <span class="f_pit" title="필수입력"> *</span></th>
					<td  class="pd10">
						<label class="tts" for="password">비밀번호</label>
						<input  name="PASS1" title="비밀번호" type="password" value="" maxlength="50"/>
						※ 비밀번호는 8~12자의 영문 숫자만 사용할 수 있습니다.
					</td>
				</tr>
				<tr>
					<th scope="row">비밀번호 확인 <span class="f_pit" title="필수입력"> *</span></th>
					<td>
						<label class="tts" for="cfmpw">비밀번호 확인</label>
						<input type="password" name="PASS2" value=""  maxlength="50"  title="비밀번호확인"/>
					</td>
				</tr>
				<tr>
					<th>이메일 <span class="f_pit" title="필수입력"> *</span></th>
					<td class="pd10">
						<label class="tts" for="email1">이메일</label>
						<input id="EMAIL" name="EMAIL" title="이메일" style="ime-mode:disabled;" class="w80 mgb5" type="text" value="" maxlength="50"/>
						@
						<label class="tts" for="email2">이메일 나머지</label>
						<input id="email2" name="email_domain" title="이메일 나머지" type="text" value="" maxlength="50"/>
						<label class="tts" for="emailSel">이메일 종류</label>
						<select id="emailsel" name="email_choice" onchange="choiceInput(this.form, this)" title="이메일 선택">
							<option value="direct_input" >직접입력</option><!-- selected="selected" -->
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="gmail.com">gmail.com</option>
						</select>
						<br />
						<span class="t_cr02">※ 비밀번호 찾기는 등록된 이메일 계정을 사용합니다. 정확한 이메일 계정을 입력하여 주십시오.</span>
					</td>
				</tr>
				<tr>
					<th scope="row">휴대전화 <span class="f_pit" title="필수입력"> *</span></th>
					<td>
						<label class="tts" for="mp_no1">휴대전화</label>
						<select id="mp_no1" name="PHONE" title="휴대전화 앞자리" class="w70">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
						-
						<label class="tts" for="mp_no2">휴대전화 가운데 자리</label>
						<input name="mobile2" title="휴대전화 중간자리" onkeyup="isNum(this);" class="w70" type="text" value="" maxlength="4"/>
						-
						<label class="tts" for="mp_no3">휴대전화 뒷자리</label>
						<input  name="mobile3" title="휴대전화 뒷자리" onkeyup="isNum(this);" class="w70" type="text" value="" maxlength="4"/>
					</td>
				</tr>
				
				
				<tr>
					<th scope="row">SMS 수신여부</th>
					<td>
						<input id="SMS_OK" name="SMS_OK" title="SMS수신여부" type="checkbox" value="1"/><input type="hidden" id="SMS_OK"name="SMS_OK" value="0"/> <label for="sms_email_recptn_at">수신</label>
					</td>
				</tr>
				<tr>
					<th scope="row">Email 수신여부</th>
					<td>
						<input id="EMAIL_OK" name="EMAIL_OK" title="SMS수신여부" type="checkbox" value="1"/><input type="hidden" id="EMAIL_OK" name="EMAIL_OK" value="0"/> <label for="sms_email_recptn_at">수신</label>
					</td>
				</tr>
				<!-- 전화상담서비스 생성 2018.11.30	조상현 -->
				
			</table>
			
			
			<div class="align_c mgt40">
			<button type="Submit" class="btnc_member1">가입</button>
			
			<button type="button" class="btnc_member2" onclick="go_login()">취소</button>
		</div>
		</div>
		</form>
		</div>
		</div>
	</div>
	
	
	
	<%@include file="../main/bottom.jsp" %>
</body>
</html>