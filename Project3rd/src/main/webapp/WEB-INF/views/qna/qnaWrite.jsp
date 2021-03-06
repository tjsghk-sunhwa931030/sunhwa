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
<script type="text/javascript" src="<%=request.getContextPath() %>/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<style>
	.lefttoptext{margin:0 auto;font-size:25px;font-weight:bold;margin-top:10px;}
	.righttoptext{margin:0 auto;font-size:40px;font-weight:bold;}
	.text-center{background-color:#FAFAFA;}
	.write_table{border-bottom:1px gray solid;}

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
	<div class="contents" style="height:900px;">
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
		<div class="rightcontents" >
			<div style="margnin-left:2%;">
			<form id="writeFrm" name="writeFrm" action="<c:url value="./qnaWriteAction.do" />" method="post" enctype="multipart/form-data">
				<input type="hidden" name="id" id="id" value="${siteUserInfo }"/>
				<table class="table write_table">
				<colgroup>
					<col width="15%"/>
					<col width="*"/>
				</colgroup>
				<tbody>
					<tr>
						<th class="text-center" style="vertical-align:middle;">작성자</th>
						<td>
							<input type="text" class="form-control" name="name" value="${name }" readonly style="width:200px;" />
						</td>
					</tr> 
					<tr>
						<th class="text-center" style="vertical-align:middle;">학년</th>
						<td>
							<select name="grade" id="grade" class="form-control form-control-sm" style="width:15%;">
								<option value="">전체</option> 
								<option value="1학년">1학년</option> 
							    <option value="2학년">2학년</option>
							    <option value="3학년">3학년</option>
							</select>
						</td>
					</tr>
					<tr>
						<th class="text-center" style="vertical-align:middle;">과목</th>
						<td>
							<select name="subject" id="subject" class="form-control form-control-sm" style="width:15%;">
								<option value="">전체</option> 
								<option value="국어">국어</option> 
							    <option value="영어">영어</option>
							    <option value="수학">수학</option>
							    <option value="사회">사회</option>
							    <option value="과학">과학</option>
							    <option value="기타">기타</option>
							</select>
						</td>
					</tr> 
					<tr> 
						<th class="text-center" style="vertical-align:middle;">제목</th>
						<td>
							<input type="text" class="form-control" name="title" value="" style="" />
						</td>
					</tr>
					<tr>
						<th class="text-center" style="vertical-align:middle;">내용</th>
						<td>
							<textarea id="contents" name="contents" cols="85" rows="15"></textarea>
						</td>
					</tr>
					<tr>
						<th class="text-center" style="vertical-align:middle;">첨부파일</th>
						<td>
							<input type="file" id="attachedfile" class="form-control" name="attachedfile" />
						</td>
					</tr>
				</tbody>
				</table>
				
				<div class="buttons" style="float:right; width:140px;">
					<!-- 각종 버튼 부분 -->
					<button type="button" id="writeBtn" class="btn btn-dark">등록</button>
					<button type="button" class="btn btn-dark" onclick="location.href='./qna.do';">취소</button>
				</div>
			</form>
			</div>
		</div>
	</div>
	<script type="text/javascript"> 
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	 oAppRef: oEditors,
	 elPlaceHolder: "contents",
	 sSkinURI: "<%=request.getContextPath()%>/smarteditor/SmartEditor2Skin.html",
	 fCreator: "createSEditor2"
	});	
	</script>
	<script type="text/javascript">
	window.onload = function(){
		var btn = document.getElementById("writeBtn");
		btn.onclick = function(){
	
			submitContents(btn); 
		}
	}

	function submitContents(elClickedObj){
		
		var f = document.writeFrm;
		oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
		
		if(f.name.value==""){
			alert("작성자 이름을 입력하세요.");
			f.name.focus();
			return false;
		}
		
		if(f.grade.value==""){
			alert("학년을 선택하세요.");
			return false;
		}
		if(f.subject.value==""){
			alert("과목을 선택하세요.");
			return false;
		}
		if(f.title.value==""){
			alert("제목을 입력하세요.");
			f.title.focus(); 
			return false;
		} 
		if(f.contents.value =="" ||f.contents.value== null || f.contents.value=='&nbsp;'||f.contents.value=='<p><br></p>'){
			alert("내용을 입력하세요.");
			oEditors.getById["contents"].exec("FOCUS"); 
			return false;
		}
		
		try{
			elClickedObj.form.submit();
		}
		catch(e){
			 
		}
	}
	</script>
	<%@include file="../main/bottom.jsp" %>
</body>
</html>

























