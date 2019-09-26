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
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
	$(function(){
	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var userInputId = getCookie("userInputId");
	    $("input[name='ID']").val(userInputId); 
	      
	    if($("input[name='ID']").val()!= ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	    
	    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
	            var userInputId = $("input[name='ID']").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("userInputId");
	        }
	    });
	     
	    // ID 저장하기를 체크한    상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("input[name='ID']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            var userInputId = $("input[name='ID']").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }
	    });
	});
	 
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
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
			 <div class="righttoptext">로그인</div>
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
		
			<div class="login_box_new" >
				<h3><img src="images/coconut.PNG" alt="로그인타이틀"  /><img src="images/key.jpg" width="100" height="60"alt="" /></h3>	
				<p class="login_text">로그인을 하시면 대학입학을 위한 가장 정확한 대학정보와<br>
				다양한 서비스를 이용할 수 있습니다.</p>
			
			
			
			<form name="loginForm" method="post" action="./loginAction.do" onsubmit="return loginValidate(this);">
			
				<fieldset>
				<input type="hidden" name="backUrl" value="${param.backUrl }"/>
				<ul class="input_wrap01">
					<li><label class="label2" for="usr_id"><input type="text" class="input_style01" name="ID" id="ID" value="" maxlength="20" tabindex="2" style="ime-mode:disabled;" placeholder="아이디"></label></li> 
					<li><label class="label2" for="password"><input type="password" class="input_style01" name="PASS1" id="PASS1" value="" placeholder="비밀번호" maxlength="50" tabindex="3" onkeypress="if(event.keyCode==13){goLogin();}"></label></li> 
					<li class="check_style"><input type="checkbox" class="check_purple" name="idSaveCheck" id="idSaveCheck" title="아이디 저장" value="Y"  tabindex="4">
					<label class="label2" for="login_save_id" >아이디 저장</label></li>
				</ul> 
				<button type="submit" style="width:350px; margin:50px auto 0px; padding-top:15px; display: block;  text-align: center; padding: 0 20px; border: 1px solid #d2d2d2; background: #000;  color: #fff; border-radius: 3px; height: 50px;  line-height: 50px;  font-size: 16px;" tabindex="5">로그인</button>
				
				</fieldset>
			
			</form>
			
			
			
			<ul class="join_find">
				<li><a href="join01.do" tabindex="6">회원가입</a></li> 
				<li><a href="find_id.do" tabindex="7">아이디 찾기</a></li>
				<li><a href="find_pw.do" tabindex="8">비밀번호 찾기</a></li>
			</ul>
			
		
			<div class="login_sns">
				<!-- 네이버아이디로로그인 버튼 노출 영역 -->
				<div id="naver_id_login" class="ft_left " style="padding-right:5px"><a href="${url}"><img src="images/naver.gif" tabindex="9" /></a></div>

				
				<!-- //네이버아이디로로그인 버튼 노출 영역 -->
			
				
			
				<%-- <c:if test="${userId eq null}"> --%>
        		 <a id="custom-login-btn"href="https://kauth.kakao.com/oauth/authorize?client_id=df713cd40c0c1f562cba5cf5b40f51e5&redirect_uri=http://localhost:8080/project3rd/good.do&response_type=code">
          			<img src="images/kakao_bt_new.png" tabindex="10"/>
       			 </a>
    		
    			<%-- </c:if> --%>
   			<%--  <c:if test="${userId ne null}">
     		   <h1>로그인 성공입니다</h1>
   			 </c:if> --%>
				
				
			</div>
			
			
			
			
			</div>
		
		</div>
	</div>
	
	<%@include file="../main/bottom.jsp" %>
</body>
</html>