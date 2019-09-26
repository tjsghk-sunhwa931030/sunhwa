<%@page import="mybatis.PersonalDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 문자열을 자르기위한 jstl taglib 선언 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="style/personaldata.css" />
<link rel="stylesheet" href="style/leftmenustyle.css" />
<link rel="stylesheet" href="style/basic.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
//이메일 셀렉트 선택하면 도메인부분에 입력하기
function choiceInput(frm, elem) { 
	for(var i=0; i<elem.length;i++) { 
		if (elem.options[i].selected) {
			if(elem.options[elem.selectedIndex].value!="direct_input"){
				frm.email_domain.value = elem.options[elem.selectedIndex].value	
				frm.email_domain.readOnly=true;
			}
			else{
				frm.email_domain.value = "";
				frm.email_domain.focus();
				frm.email_domain.readOnly=false;
			}
		}
	}
} 

function personValidate(f){
	if(!f.name.value){
		alert("이름을 입력하세요");
		return false;
	}
	if(!f.email_id.value){
		alert("이메일을 입력하세요");
		return false;
	}
	if(!f.email_domain.value){
		alert("이메일을 입력하세요");
		return false;
	}
	if(!f.phone.value){
		alert("휴대폰번호를 입력하세요");
		return false;
	}
}
</script>
</head>
<body>
	<form name="personFrm" method="post" onsubmit="return personValidate(this);" action="<c:url value="./personalAction.do?id=${sessionScope.siteUserInfo }"/>">
		<%@include file="../main/head.jsp" %> 
		<div class="topcontents">
			<div class="lefttop">
				<div class="lefttoptext">마이페이지</div>
			</div>
			<div class="righttop">
				<div class="righttoptext">개인정보수정</div>
			</div>
		</div>
		<div class="contents">
			<div class="leftmenu">
				<nav class="left1" >
					<ul class="navbar-nav1  bg-light ">
						<li class="nav-item1"><a class="nav-link" href="./interuniv.do?id=${sessionScope.siteUserInfo }">관심대학<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
						<li class="nav-item1"><a class="nav-link" href="./sugrade.do?id=${sessionScope.siteUserInfo }">수시성적<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
						<li class="nav-item1"><a class="nav-link" href="./junggrade.do?id=${sessionScope.siteUserInfo }&years=2019&dates=2019-11-20&year=1year">모의고사성적<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
						<li class="nav-item1"><a class="nav-link" href="./attenvolun.do?id=${sessionScope.siteUserInfo }">출결사항/봉사활동<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
						<li class="nav-item1"><a class="nav-link" href="./mylist.do?id=${sessionScope.siteUserInfo }">나의글<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
						<li class="nav-item1"><a class="nav-link" href="./personaldata.do?id=${sessionScope.siteUserInfo }">개인정보수정<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
						<li class="nav-item1"><a class="nav-link" href="./chpassword.do?id=${sessionScope.siteUserInfo }">비밀번호수정<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					</ul>
				</nav>
			</div>
			<div class="rightcontents">
				<div class="mydata">
					<h5 style="margin-left:20px;margin-top:10px;text-align:left;">개인정보입력</h5>
					<c:forEach items="${lists }" var="row">
						<table class="table table-bordered" style="margin-left:20px;font-size:14px;margin-top:25px;">
						  <tbody>
						    <tr>
						      <td>이름&nbsp;<span class="essential">*</span></td>
						      <c:choose>
						      	<c:when test="${row.name == '' }">
						      		<td>
							      		<input type="text" value=""  name="name"/>
						      		</td>
						      	</c:when>
						      	<c:otherwise>
						      		<td>
								      	<input type="text" value="${row.name }" name="name"/>
								    </td>
						      	</c:otherwise>
						      </c:choose>
						    </tr>
						    <tr>
						      <td>아이디(ID)&nbsp;<span class="essential">*</span></td>
						      <c:choose>
						      	<c:when test="${row.id == '' }">
						      		<td>
							      		<input type="text" value=""  name="id"/>
						      		</td>
						      	</c:when>
						      	<c:otherwise>
						      		<td>
								      	<input type="text" value="${row.id }" readonly style="border:none;"/>
								    </td>
						      	</c:otherwise>
						      </c:choose>
						    </tr>
						    <tr>
						      <td>이메일&nbsp;<span class="essential">*</span></td>
						      <c:choose>
						      	<c:when test="${row.email == '' }">
						      		<input type="text" value="" style="width:100px;" name="email_id" /> &nbsp;@&nbsp; <input type="text" value="" name="email_domain" />
						      		<select name="email_choice" id="" onchange="choiceInput(this.form, this)">
							      		<option value="direct_input">직접입력</option>
							      		<option value="naver.com">naver.com</option>
							      		<option value="nate.com">nate.com</option>
							      		<option value="daum.net">daum.net</option>
							      		<option value="gmail.com">gmail.com</option>
						      		</select>
						      	</c:when>
						      	<c:otherwise>
						      		<td>
							      	<c:set var="keywordArr" value="${fn:split(row.email,'@') }"></c:set>
							      	<c:set var="email" value="${keywordArr[0] }"></c:set>
							      	<c:set var="emaildomain" value="${keywordArr[1] }"></c:set>
							      	
							      	<input type="text" value="${email }" style="width:100px;" name="email_id"/>&nbsp;@&nbsp;<input type="text" value="${emaildomain }" name="email_domain" />
							      	<select name="email_choice" id="" onchange="choiceInput(this.form, this)">
							      		<option value="direct_input" <c:if test="${emaildomain eq 'direct_input' }">selected</c:if>>직접입력</option>
							      		<option value="naver.com" <c:if test="${emaildomain eq 'naver.com' }">selected</c:if>>naver.com</option>
							      		<option value="nate.com" <c:if test="${emaildomain eq 'nate.com' }">selected</c:if>>nate.com</option>
							      		<option value="daum.net" <c:if test="${emaildomain eq 'daum.net' }">selected</c:if>>daum.net</option>
							      		<option value="gmail.com" <c:if test="${emaildomain eq 'gmail.com' }">selected</c:if>>gmail.com</option>
							      	</select>
						      		</td>
						      	</c:otherwise>
						      </c:choose>
						      
						    </tr>
						    <tr>
						    	<td>휴대폰&nbsp;<span class="essential">*</span></td>
						    	<c:choose>
						    		<c:when test="${row.phone == '' }">
						    			<td>
						    				<input type="text" value="" width="150px" name="phone" />
						    			</td>
						    		</c:when>
						    		<c:otherwise>
						    			<td>
								    		<input type="text" value="${row.phone }" width="150px" name="phone" />
								    	</td>
						    		</c:otherwise>
						    	</c:choose>
						    	
						    </tr>
						    <!-- <tr>
						    	<td>사용자구분&nbsp;<span class="essential">*</span></td>
						    	<td>
						    		<input type="text" readonly value="" style="border:none;" />
						    	</td>
						    </tr> -->
						    <tr>
						    	<td>SMS수신여부</td>
						    	<c:choose>
						    		<c:when test="${row.sms_ok == ''}">
						    			<td>
						    				<input type="checkbox" value="1" name="sms_ok" />&nbsp;수신
						    			</td>
						    		</c:when>
						    		<c:otherwise>
						    			<td>
								    		<input type="checkbox" value="1"  name="sms_ok" <c:if test="${row.sms_ok eq '1' }">checked</c:if>/>&nbsp;수신
								    	</td>
						    		</c:otherwise>
						    	</c:choose>
						    </tr>
						    <tr>
						    	<td>EMAIL수신여부</td>
						    	<c:choose>
						    		<c:when test="${row.email_ok == '' }">
						    			<td>
						    				<input type="checkbox" name="email_ok" id="email_ok" value="1" />&nbsp;수신
						    			</td>
						    		</c:when>
						    		<c:otherwise>
						    			<td>
								    		<input type="checkbox" value="1"  name="email_ok" <c:if test="${row.email_ok eq '1' }">checked</c:if>/>&nbsp;수신
								    	</td>
						    		</c:otherwise>
						    	</c:choose>
						    </tr>
						    <!-- <tr>
						    	<td>입학도우미</td>
						    	<td>
						    		<input type="text" readonly value="" style="border:none;"/>
						    	</td>
						    </tr> -->
						  </tbody>
						</table>
					</c:forEach>
				</div>
				<div class="button">
					<button type="submit" class="btn btn-dark">수정</button>&nbsp;
					<a href="./chpassword.do?id=${sessionScope.siteUserInfo }"><button type="button" class="btn btn-dark">비밀번호변경</button></a>&nbsp;
					<a href="delete_member.do?id=${sessionScope.siteUserInfo }"><button type="button" class="btn btn-secondary">회원탈퇴</button></a>
				</div>
				
			</div>
		</div>
		
		<%@include file="../main/bottom.jsp" %>
	</form>
</body>
</html>