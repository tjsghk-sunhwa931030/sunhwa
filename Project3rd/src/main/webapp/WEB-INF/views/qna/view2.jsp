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
<link rel="stylesheet" href="style/leftmenustyle.css" />
<link rel="stylesheet" href="style/basic.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<style>
	.lefttoptext{margin:0 auto;font-size:25px;font-weight:bold;margin-top:10px;}
	.righttoptext{margin:0 auto;font-size:40px;font-weight:bold;} 
	.form-control{float:left;}
	.view_table{border-bottom:1px #DEE2E6 solid; margin-top:20px;}
	.re_table{width:100%; height:100%; border-top:1px solid red;}
	.re{text-align:center; font-size:18px; font-weight:bold;}
	.retr{height:30px; border:1px solid red; border-left:none; border-right:none; border-top:2px gray solid; border-bottom:1px gray solid;}
	.re_link{text-decoration:none; color:black; font-size:13px;}
	.re_link:hover{color:black; font-weight:bold;}
	.re_link:visited{color:black;}
	.replywrite {text-align:left;}
	.second_text{font-size:13px;}
	a.page-link{color:black; display:inline;text-decoration:none; list-style:none;}
	/* div{border:1px blue solid;} */
</style> 
<body>
	<%@include file="../main/head.jsp" %>
	<div class="topcontents">
      <div class="lefttop">
         <div class="lefttoptext">끄적끄적</div>
      </div>
      <div class="righttop">
         <div class="righttoptext">질문있어요!</div>
      </div>
   </div> 
	<div class="contents" style="height:1300px;">
		<div class="leftmenu">
			<nav class="left1" >
				<ul class="navbar-nav1  bg-light ">
					<li class="nav-item1"><a class="nav-link" href="./board.do?bname=free">공부꿀팁<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="./qna.do">질문있어요!<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="./board.do?bname=group">소모임구함<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="./room.do">내 주변 독서실<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
				</ul>  
			</nav>
		</div>
		<div class="rightcontents">
			<form name="viewFrm" action="">
			<table class="table view_table">
			<colgroup>
				<col width="15%;"/>
				<col width="15%;"/>
				<col width="*;"/>
				<col width="20%;"/>
			</colgroup>
			<tbody>
				<tr style="border-top:2px gray solid; background-color:#F9F9F9; font-weight:bold;">
					<td colspan="4">
						<span style="color:#783712;">[1학년]</span>
						<span style="color:green;">[수학]</span>
						제목입니다.
					</td>
				</tr>
				<tr>
					<td class="second_text" colspan="2">작성자: 박나래</td>
					<td class="second_text">작성일: 2019-09-10</td>
					<td class="second_text">조회수: 12</td>
				</tr> 
				<tr>
					<td colspan="4" style="height:400px;">내용내용내용</td>
				</tr>
				<tr>
					<td colspan="4">파일첨부:</td>
				</tr>
			</tbody>		
			</table>
			<span style="float:right;">
				<button type="button" class="btn btn-dark">수정</button>
				<button type="button" class="btn btn-dark">삭제</button>
				<button type="button" class="btn btn-dark">목록</button>
			</span> 
			</form>	
			
			
			<!-- 댓글보기  -->
			<div class="replyview" style="margin-top:100px; width:100%; ">
			<table class="re_table">
			<colgroup>
				<col width="15%;"/>
				<col width="*"/>
				<col width="15%;"/>
				<col width="15%;"/>
			</colgroup>
				<tr class="retr" >
					<td class="re" colspan="4" style="background-color:#F9F9F9;">댓글</td>
				</tr>
				<!-- 댓글 리스트 반복 -->
				<%for(int i=1; i<=5 ; i++){ %>
				<tr style="border-bottom:1px #dee2e6 solid;">
					<td style="padding-left:30px; font-size:15px;">장도연</td>
					<td style="font-size:15px;">
						안녕하세요...안녕하세요...안녕하세요...안녕하세요...안녕하세요...<br />						
					</td>
					<td style="font-size:12px;"> 
						2019-09-09 14:23:55
					</td>
					<td> 
						<ul style="display:inline-block; list-style-type:none; float:right; padding-right:5px;">
							<li style="float:left; padding-right:5px;"><a class="re_link" href="">답글</a></li>
							<li style="float:left; padding-right:5px;"><a class="re_link" href="">수정</a></li>
							<li style="float:left;"><a class="re_link" href="">삭제</a></li>
						</ul>
					</td>
				</tr> 
				<%} %>
			</table>
				<!-- 페이지 번호 -->
				<div style="width:100%;">
					<ul class="pagination pagination-sm" style="margin-left:40%; margin-top:10px;">
					  <li class="page-item"><a class="page-link" href="#">이전</a></li>
					  <li class="page-item"><a class="page-link" href="#">1</a></li>
					  <li class="page-item"><a class="page-link" href="#">2</a></li>
					  <li class="page-item"><a class="page-link" href="#">3</a></li>
					  <li class="page-item"><a class="page-link" href="#">다음</a></li>
					</ul>
				</div>
			</div> 
			
			<div class="replywrite" style="margin-top:30px; width:100%; height:150px; background-color:#F7F7F7; ">
			<form name="refrm" action="">
				<textarea name="content" style="width:80%; height:120px; margin-top:1.6%; margin-left:1.5%;" ></textarea>
				<button type="submit" class="btn btn-dark" style="margin-left:10px; margin-bottom:115px; width:15%; height:120px;">등록</button>
			</form>
			</div>
			
			
			 
			<!-- 
			<ul style="height:50px; list-style-type:none; padding-top:10px; border-top:1px gray solid; border-bottom:1px gray solid;">
				<li style="font-size:20px; text-align:center; font-weight:bold;">댓글</li>
			</ul>
			<ul style="display:inline; list-style-type:none; border-bottom:2px gray solid;">
				<li style="float:left; margin-left:15px; width:100px;">작성자</li>
			</ul>
			<ul>
				<li style="float:left; width:300px;">내용내용</li>
			</ul>
			<ul style="display:inline; list-style-type:none; border-bottom:2px gray solid;">
				<li style="float:left; width:"><a href="">답글</a></li>
				<li style="float:left; width:"><a href="">수정</a></li>
				<li style="float:left;"><a href="">삭제</a></li>
			</ul>
			 -->
			
		</div> <!-- rightcontents end -->
	</div>
	
	
	
	
	
	
	
	
	
	
	
	<%@include file="../main/bottom.jsp" %>
</body>
</html>
 


































