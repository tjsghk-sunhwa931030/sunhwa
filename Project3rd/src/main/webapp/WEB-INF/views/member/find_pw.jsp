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
.login_box_pw{width:660px; margin: 0 auto;}
.login_box_pw .pw_tit1 h2{font-size:36px; color:#64c46f; text-align:center;}
.login_box_pw .pw_tit1 p{font-size:12px; text-align:center; line-height:20px;}
.mgt35{margin-top:35px !important;}

.new_btnc_click_b1 {padding:8px 18px; background:#318547; font-size:14px; color:#fff; }
.tit_popcal{background:#3bc4b7;height: 50px;}
</style>
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
<script>
function btn_pwd_search(){
	
	var ID = $('#ID').val();
	var NAME = $('#NAME').val();
 	var EMAIL = $('#EMAIL').val();
 	var PHONE = $('#PHONE').val();
 	var email2 = $('#email2').val();
 	var mp_no2 = $('#mp_no2').val();
 	var mp_no3 = $('#mp_no3').val();
	
 	
 	
	if($("#ID").val() == ""){
		alert("아이디를 입력해 주세요.");
		$("#ID").focus();
		return;
	}else if($("#NAME").val() == ""){
		alert("이름를 입력해 주세요.");
		$("#NAME").focus();
		return;
	}else if($("#EMAIL").val() == ""){
		alert("이메일아이디를 입력해주세요");
		$("#EMAIL").focus();
		return;
	} else if($("#email2").val() == ""){
		alert("이메일서버를 입력 또는 선택해주세요");
		$("#email2").focus();
		return;
	}else if($("#mp_no2").val() == ""){
		alert("휴대폰번호를 입력해주세요");
		$("#mp_no2").focus();
		return;
	}else if($("#mp_no3").val() == ""){
		alert("휴대폰번호를 입력해주세요");
		$("#mp_no3").focus();
		return;
	}else if(chkChar($("#mp_no2").val())){
		alert("휴대폰번호는 숫자만 입력가능합니다.");
		$("#mp_no2").focus();
		return;
	}else if(chkChar($("#mp_no3").val())){
		alert("휴대폰번호는 숫자만 입력가능합니다.");
		$("#mp_no3").focus();
		return;
	} 
	
	$.ajax({
 		url : "searchid.do",
        type : "post",
        data: { "ID" : ID , "NAME" : NAME , "EMAIL" : EMAIL , "PHONE" : PHONE,
        	"email2" : email2 , "mp_no2" : mp_no2 , "mp_no3" : mp_no3},
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType : "json",
        success:function(data){
        
        	if( data > 0 ) {
        		// 성공
        		$("#pwdSchRstInfo").removeClass("dpn");
        		
        		
        	} else {
        		// 임의의 패스워드 값으로 DB에 업데이트 하는 부분이 실패됨..
        		$("#pwdSchRstInfo").addClass("dpn");
				//팝업창
				btnPop('loadingDiv');
        	}
        	
        	
        	
        },
        error: function (XMLHttpRequest, textStatus, errorThrown){

        
        	
        }
    });
	
	
}

/*
 * 임시비밀번호 보내기
 */
 
 /* 데이터 없음 */
function btn_email_send(){
	
	var ID = $('#ID').val();
	var NAME = $('#NAME').val();
 	var EMAIL = $('#EMAIL').val();
 	var PHONE = $('#PHONE').val();
 	var email2 = $('#email2').val();
 	var mp_no2 = $('#mp_no2').val();
 	var mp_no3 = $('#mp_no3').val();
	
	$.ajax({
 		url : "findpw.do",
        type : "post",
        data: { "ID" : ID , "NAME" : NAME , "EMAIL" : EMAIL , "PHONE" : PHONE ,
        	"email2" : email2 , "mp_no2" : mp_no2 , "mp_no3" : mp_no3},
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType : "json",
        success:function(data){
        	btnPop('loadingDiv2');
        },
        error: function (XMLHttpRequest, textStatus, errorThrown){

  	
        }
    });
	
	
	
}

/*
 * 로그인 페이지 이동
 */
function go_login()
{
		location.href="login.do";
}
//입력값에 문자,숫자가 혼용되어있는지를 체크하는 함수
function chkChar(strVal){
    var regNum = /^[0-9]+$/gi;
	var bNum = regNum.test(strVal);

    if(bNum) {
        return false;
    }
    return true;
}

/*
 * 이메일 직접입력 처리
 */
function chgemailsvr(){
	
	f = document.frm;
	var sel = f.emailsel;
	var email2 = f.email2;

	// 직접 입력일 경우
	if(sel.options.selectedIndex == 0){
		email2.value="";
		email2.readOnly = false;
	}else{
		email2.value=sel.options[sel.options.selectedIndex].value;
		email2.readOnly = true;
	}
}

/*
 * 팝업창 열기
 */
function btnPop(paramDiv) 
{
	var width = $(window).width();			
	var height = $(window).height();
	var loadingDiv = paramDiv;
	//화면을 가리는 레이어의 사이즈 조정
	$(".mask").width(width);
	$(".mask").height(height);
	
	//화면을 가리는 레이어를 보여준다 (0.5초동안 30%의 농도의 투명도)
	$(".mask").fadeTo(500, 0.3);
	
	//팝업 레이어 보이게
	var loadingDivObj = $("#"+loadingDiv);
	loadingDivObj.css("top", $(".content").height()/2-$("#"+paramDiv).height()+50);
	loadingDivObj.css("left",$(".content").width()/2);
	loadingDivObj.fadeIn(500);
}

//팝업 닫기
function closed(paramDiv){
	 var ex_obj = document.getElementById(paramDiv);
	 ex_obj.style.display = ex_obj.style.display=='none'?'block':'none';
	 $(".mask").fadeOut(500);
}

//윈도우가 resize될때마다 backLayer를 조정			
$(window).resize(function(){			
	var width = $(window).width();			
	var height = $(window).height();			
	$(".mask").width(width).height(height);			
});

/***********************************************************************
함수명 : isNum(inputValue)
설 명 : 숫자만 입력 하도록 체크
인 자 : 
사용법 : isNum(inputValue)
작성자 : 홍인성
------ ------ -------------------
2015.11.04 홍인성 최초생성
***********************************************************************/
function isNum(inputValue){
	var checkCode = inputValue.value.charCodeAt(inputValue.value.length-1);
	var str;
	
	if(inputValue.value.length > 0 && !(checkCode >=48 && checkCode <=57)){
		var thisLength = inputValue.value.length;
		for(var i=0; i<thisLength; i++){
			checkCode_for = inputValue.value.charCodeAt(inputValue.value.length-1);
			if(!(checkCode_for >= 48 && checkCode_for <=57)){
				str = inputValue.value.substring(0, inputValue.value.length-1);
				inputValue.value = str;
			}
		}
		inputValue.focus();
	}else if(inputValue.value.length = 0 || checkCode >= 48 && checkCode <=57){
		inputValue.focus();
	}
}

function fn_idChk(idInput){
	var chkid = idInput.charAt(idInput.length-1);
	var reg = new RegExp(/^[a-zA-Z0-9-_-]$/);
	var str = "";
	if(!reg.test(chkid)){
		str = idInput.substring(0, idInput.length-1);
		$("#ID").val(str);
	}
}
</script>



</head>
<body>
	<%@include file="../main/head.jsp" %> 
	<div class="topcontents">
		<div class="lefttop">
			<div class="lefttoptext">회원서비스</div>




		</div>
		<div class="righttop">
			<div class="righttoptext">비밀번호찾기</div>
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
		<div class="login_box_pw ">		
		
		
						
			<div class="pw_tit1 mgt35">
				<h2>PW Find</h2>
				<p class="mgt20">본인 확인을 위해 회원가입시의 정보를 입력합니다.</p>  
				<p>입력하신 정보는 비밀번호 찾기 이외의 목적으로 사용하지 않습니다.</p> 
			</div>
			<!-- 비밀번호찾기 영역 -->
			<!-- onsubmit="return false;" -->
			<form id="frm" name="frm" method="post" >
			<!-- 키보드보안 시작 -->
			<div id="nppfs-loading-modal" style="display:none;"></div>
			<div class="nppfs-elements" style="display:none;"></div>
			<!-- 키보드보안 종료 -->
				<fieldset>
					<legend class="tts">비밀번호찾기</legend>
					<div class="tbldiv mgt35">
						<table summary="아이디찾기 정보 테이블입니다.">
							<caption>비밀번호변경</caption>
							<colgroup>						
								<col style="width:180px">
								<col style="width:480px">									
							</colgroup>							
							<tbody>
								<tr>							
									<th scope="row" >아이디 <span class="f_pit"> *</span></th>
									<td><input id="ID" name="ID" style="ime-mode:disabled;" class="input_style02 w180" type="text" value="" maxlength="20" alt="아이디"/></td>
								</tr>
								<tr>							
									<th scope="row" >이름 <span class="f_pit"> *</span></th>
									<td><input id="NAME" name="NAME" style="ime-mode:active;" class="input_style02 w180" type="text" value="" maxlength="30" alt="이름"/></td>
								</tr>
								<tr>
									<th scope="row">이메일 <span class="f_pit"> *</span></th>
									<td>
										<label for="EMAIL" class="tts">이메일</label>
										<input id="EMAIL" name="EMAIL" class="input_style02 w80" type="text" value="" maxlength="50" alt="이메일"/> @ 
										<label for="email2" class="tts">이메일 나머지</label>
										<input id="email2" name="email2" title="이메일 나머지" class=" input_style02 w80" type="text" value="" maxlength="50"/>
										<label class="tts" for="emailSel">이메일 종류</label> 
										<select id="emailsel" onchange="chgemailsvr()"  title="이메일 선택">
											<option value="direct" selected="selected">직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="nate.com">nate.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="gmail.com">gmail.com</option>
											<!-- class="w110 pay" -->
										</select>
									</td>
								</tr>
								<!-- class="w70 pay" -->
								<tr>
									<th scope="row"> 휴대전화 <span class="f_pit"> *</span></th>
									<td>
										<label for="PHONE" class="tts">휴대전화</label>
										<select id="PHONE" name="PHONE" >
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select>
										<label for="mp_no2" class="tts">휴대전화 중간자리</label>
										 - <input id="mp_no2" name="mp_no2" onkeyup="isNum(this)" class="input_style02 w80" type="text" value="" maxlength="4"/> - 
										<label for="mp_no3" class="tts">휴대전화 뒷자리</label>
										<input id="mp_no3" name="mp_no3" onkeyup="isNum(this)" class="input_style02 w80" type="text" value="" maxlength="4"/>
									</td>
								</tr> 								
							</tbody>
						</table>
					</div>	
			

		
		<!-- 버튼영역 -->
		<div class="tbldiv_btn mgt35">
			<button type="button" class="new_btnc_click_b1" id="btn1" onclick="btn_pwd_search()">비밀번호찾기</button>
		</div>
		
		</fieldset>
			</form>
	
		<!-- //버튼영역 -->
		<div class="dpn" id="pwdSchRstInfo">
			<div class="find_bottom mgt70">
				<ul>
					<li>정보조회가 완료되었습니다.</li>
					<li>아래 임시비밀번호 받기 버튼을 누르시면, 회원가입 이메일로 임시비밀번호를 받으실수 있습니다.</li>
					<li>수신하신 메일에 임시 비밀번호를 이용하여 로그인하여 주시기 바랍니다.</li>
					<li>원활한 이용을 위해 로그인 하신 후 비밀번호 재설정을 하여주시기 바랍니다.</li>
				</ul>
			</div>
			<div class="align_c mgt40">
				
				
				<button type="button" class="new_btnc_click_b" id="btn2" onclick="btn_email_send()">임시비밀번호 받기</button>
			</div>
		</div>
		
			<!-- //비밀번호찾기 영역 -->
		</div>
	</div>
	<!-- 알림1 레이어팝업  -->
	<div class="mask"></div>
	<div class="w300" id="loadingDiv" style="top: 400px; left: 800.667px;">
		<div class="pop_layer">
			<div class="tit_popcal" style="background:#3bc4b7;height: 43px;">
				<h3>알림</h3><!-- <img src="../images/btn_closed.png" alt="창닫기" /> -->
		<!-- 		<button type="button" class="closed" onclick="closed('loadingDiv');"><img src="images/btn_closed.png" alt="창닫기" /></button>
		 -->	</div>
			<div class="con_popcal">												
				<div class="txtall">
					입력하신 정보가 일치하지 않습니다.<br />
					다시 확인하시고 회원정보를 입력바랍니다.
				</div>
				<div class="align_c mgt30">
					<button type="button" class="btnc_member2_2 w70" onclick="closed('loadingDiv');">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- //알림1 레이어팝업  -->
	
	<!-- 알림2 레이어팝업  -->
	<div class="mask"></div>
	<div class="w300" id="loadingDiv2" style="top: 400px; left: 800.667px;">
		<div class="pop_layer">
			<div class="tit_popcal" style="background:#3bc4b7;height: 43px; ">
				<h3>알림</h3>
		<!-- 		<button type="button" class="closed" onclick="go_login();"><img src="images/btn_closed.png" alt="창닫기" /></button>
		 -->	</div>
			<div class="con_popcal">												
				<div class="txtall">
					가입하신 메일로 임시 비밀번호를 발송하였습니다.<br />
					임시비밀번호를 사용하여 로그인하시기 바랍니다.
				</div>
				<div class="align_c mgt30">
					<button type="button" class="btnc_member2_2 w70" onclick="go_login();">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- //알림2 레이어팝업  -->

<!-- //본문내용 -->
	
		
		
			
			
		
		
		</div>
	</div>
	
	<%@include file="../main/bottom.jsp" %>
</body>
</html>