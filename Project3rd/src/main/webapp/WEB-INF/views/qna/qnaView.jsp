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
<script>
$(function(){
	$('#replyview').html('');
	//리스트 가져오기
	$.ajax({
		url : "./qnaReply.do", //요청경로(요청명)
		type : "get", //전송방식
		contentType : "text/html; charset:utf-8",
		data : {
				nowPage : $('#nowPage').val(), 
				idx : $('#idx').val(),
				b_idx:$('#b_idx').val(),
		}, //파라미터
		dataType : "html", //응답데이터형식
		success : function(d){ //성공시 콜백메소드
			//aList.do의 출력내용을 HTML형태로 아래 삽입
			$('#replyview').html(d);
		},
		error : function(e){ //실패시 콜백메소드
			alert("실패"+e);
		}
	}); 
});

function rewriteValidate(f){
	if(f.contents.value==""){
		alert("내용을 입력하세요");
		f.contents.focus(); 
		return false;
	}	
}

function Delete(){
	if(confirm("게시글을 삭제하시겠습니까?")){ 
	location.href='./qnaDelete.do?idx=${idx }&nowPage=${nowPage }';
}
	else{
		return false;
	}
} 
</script>
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
	<div class="contents" style="height:2000px;">
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
						<span style="color:#783712;">${viewRow.grade }</span>
						<span style="color:green;">${viewRow.subject }</span>
						${viewRow.title }
					</td>
				</tr>
				<tr>
					<td class="second_text" colspan="2">작성자: ${viewRow.name }</td>
					<td class="second_text">작성일: ${viewRow.postdate }</td>
					<td class="second_text">조회수: ${viewRow.visitcount }</td>
				</tr> 
				<tr>
					<td colspan="4" style="height:400px;">
						${viewRow.contents } <br /><br />
						<c:if test="${viewRow.attachedfile ne null}">
						<img src="upload/${viewRow.attachedfile }" width="500">
						</c:if> 
					</td>
				</tr>
				<tr>
					<c:if test="${not empty viewRow.attachedfile }"> <!-- download.do는 BoardController에서 공통으로 -->
						<td colspan="4">파일첨부: <a href="download.do?fileName=${viewRow.attachedfile }&oriFileName=${viewRow.attachedfile }">${viewRow.attachedfile }</a></td>
					</c:if>
				</tr>
			</tbody>		
			</table>
			<!-- 수정/삭제버튼 작성자에게만 보이게 -->
			<span style="float:right;">
				<c:if test="${sessionScope.siteUserInfo eq viewRow.id}">
				<button type="button" class="btn btn-dark" onclick="location.href='./qnaEdit.do?idx=${idx }&nowPage=${nowPage }';">수정</button>
				<button type="button" class="btn btn-dark" id="delBtn" name="delBtn" onclick="Delete();">삭제</button>
				</c:if>
				<button type="button" class="btn btn-dark" onclick="location.href='./qna.do?nowPage=${nowPage}';">목록</button>
			</span> 
			</form>	
			

		<!-- 댓글  -->
		<div class="replyview" id="replyview" style="margin-top:100px; width:100%; ">
		
		</div> 
		<div class="replywrite" style="margin-top:30px; width:100%; height:150px; background-color:#F7F7F7; ">
			<form name="refrm" action="./qnaReWrite.do " onsubmit="return rewriteValidate(this);" >
				<input type="hidden" name="id" value="${siteUserInfo }" />
				<input type="hidden" name="name" value="${name }" />
				<input type="hidden" id="b_idx" name="b_idx" value="${idx }" />
				<input type="hidden" id="nowPage" name="nowPage" value="${nowPage }" />
				<input type="hidden" id="idx" name="idx" value="${idx }" />
				<textarea name="contents" style="width:80%; height:120px; margin-top:1.6%; margin-left:1.5%;" ></textarea>
				<button type="submit" class="btn btn-dark" style="margin-left:10px; margin-bottom:115px; width:15%; height:120px;">등록</button>
			</form>
		</div> 	
			
		</div> <!-- rightcontents end -->
	</div>
	
	<%@include file="../main/bottom.jsp" %>
</body>
</html>
 


































