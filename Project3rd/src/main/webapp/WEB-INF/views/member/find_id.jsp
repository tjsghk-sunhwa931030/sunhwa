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
</style>

<script type="text/javascript">


/*
 * 화면초기화 style="background:#3bc4b7;height: 50px;"
 */

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
 * 회원찾기
 */
function findId() {
	 
	

		var NAME = $('#NAME').val();
	 	var EMAIL = $('#EMAIL').val();
	 	var PHONE = $('#PHONE').val();
		var email2 = $('#email2').val();
		var mp_no2 = $('#mp_no2').val();
		var mp_no3 = $('#mp_no3').val();
		
	 	if($("#NAME").val() == ""){
			alert("이름를 입력해 주세요.");
			$("#NAME").focus();
			return;
		}else if($("#EMAIL").val() == ""){
			alert("이메일아이디를 입력해주세요");
			$("#EMAIL").focus();
			return;
		}else if($("#email2").val() == ""){
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
	 		url : "findid.do",
	        type : "post",
	        data: { "NAME" : NAME , "EMAIL" : EMAIL , "PHONE" : PHONE , 
	        	"email2" : email2 , "mp_no2" : mp_no2 , "mp_no3" : mp_no3 },
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        dataType : "json",
	        success:function(data){
	        	//var IDs = data.ID;
	        	var id = data;
	     
	        	if(id==""){
	        		$("#noIdInfo").removeClass("dpn");
					$("#idInfo").addClass("dpn");
	        	}
	        	
	        	else{
	        	$("#idInfo").removeClass("dpn");
				$("#noIdInfo").addClass("dpn");
				
	        	$('#ID1').html("<span class='font_w t_cr01'>"+id+"</span>");
	        	}
	        

	        },
	        error: function (XMLHttpRequest, textStatus, errorThrown){

	        }
	    });
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
<body>
	<%@include file="../main/head.jsp" %> 
	<div class="topcontents">
		<div class="lefttop">
			<div class="lefttoptext">회원서비스</div>
		</div>
		<div class="righttop">
			 <div class="righttoptext">아이디찾기</div>
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
				<h2>ID Find</h2>
				<p class="mgt20">회원님의 정보를 입력하시면 가입한 아이디를 조회하실 수 있습니다.</p>  
				<p>입력하신 정보는 아이디 찾기 이외에 목적으로 사용하지 않습니다.</p> 
			</div>
			<!-- 아이디찾기 영역 -->
			<form id="frm" name="frm" method="post" onsubmit="return false;">
				
				<fieldset>
				<legend class="tts">아이디찾기</legend>
					<div class="tbldiv mgt35">
						<table summary="아이디찾기 정보 테이블입니다.">
							<caption>비밀번호변경</caption>
							<colgroup>						
								<col style="width:180px">
								<col style="width:480px">									
							</colgroup>							
							<tbody>
								<tr>							
									<th scope="row" >이름 <span class="f_pit"> *</span></th>
									<td>
										<input id="NAME" name="NAME" style="ime-mode:active;" class="input_style02 w180" type="text" value="" maxlength="30" alt="이름"/>
									</td>
								</tr>
								<tr>
									<th scope="row">이메일 <span class="f_pit"> *</span></th>
									<td>
										<label class="tts" for="EMAIL">이메일</label>
										<input id="EMAIL" name="EMAIL" class="input_style02 w80" type="text" value="" maxlength="50"/>
										@ 
										<label for="email2" class="tts">이메일 나머지</label>
										<input id="email2" name="email2" title="이메일 나머지" class="input_style02 w80" type="text" value="" maxlength="50"/>
										<label class="tts" for="emailSel">이메일 종류</label> 
										<select id="emailsel" onchange="chgemailsvr()"  title="이메일 선택">
											<option value="direct" selected="selected">직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="nate.com">nate.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="gmail.com">gmail.com</option>
											<!-- class="pay w110" -->
										</select>
									</td>
								</tr>
								<tr>
								<!--class="pay w70"  -->
									<th scope="row"> 휴대전화 <span class="f_pit"> *</span></th>
									<td>
										<label class="tts" for="PHONE">휴대전화<span class="f_pit"> *</span></label>
										<select id="PHONE" name="PHONE">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
										</select>
										 - 
										<label for="mp_no2" class="tts">휴대전화 중간자리</label>
										<input id="mp_no2" name="mp_no2" onkeyup="isNum(this)" class="input_style02 w80" type="text" value="" maxlength="4"/>
										 - 
										<label for="mp_no3" class="tts">휴대전화 뒷자리</label>
										<input id="mp_no3" name="mp_no3" onkeyup="isNum(this)" class="input_style02 w80" type="text" value="" maxlength="4"/>
									</td>
								</tr> 								
							</tbody>
						</table>
					</div>	
				
		<!-- //아이디찾기 영역 -->				

		<!-- 버튼영역 -->
		
		<div class="tbldiv_btn mgt35">
		
			<button type="button" class="new_btnc_click_b1" onclick="findId();">아이디찾기</button>								
			<input type="hidden" id="findgo" value="" />
		</div>
		
		<!-- //버튼영역 -->		
		<!-- idInfo  findId  noIdInfo
		 -->
		 <div class="find_bottom mgt70 align_c dpn" id="idInfo">
			<p>해당 정보와 일치하는 ID 는 <span id="ID1"></span> 입니다.</p>
			<p class="t_cr02 letter_s-1">※ 개인정보 보호를 위해 일부는 * 표 처리 합니다.</p>
		</div>
		<div class="find_bottom mgt70 align_c dpn"  id="noIdInfo">
			<p>입력하신 정보와 일치하는 정보가 없습니다.</p>
			<p class="t_cr02 letter_s-1">※ 다시 확인 바랍니다.</p>
		</div>
		
		</fieldset>
			</form>
			
			
			
			
		</div>
	</div>
		
		
		
		
		
		</div>
	</div>
	
	<%@include file="../main/bottom.jsp" %>
</body>
</html>