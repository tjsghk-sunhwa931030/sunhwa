<%@page import="common.BoardDTO"%>
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
	a.page-link{color:black; display:inline;text-decoration:none; list-style:none;}
	a.title_view{color:black;}
	a.title_view:hover{color:black;}
	.text-center{text-align:center; font-size:15px;}
	.text-left{text-align:left; font-size:15px;}
	.list_table{border-bottom:1px gray solid; border-top:2px gray solid;}
	.searchbox{margin-top:10px;; height:60px; width:95%; background-color:#fafafa; border:1px gray solid;}
	/* div{border:1px blue solid;} */
</style>
<body> 
	<c:set var="bname" value="${bname }"/>
	<%@include file="../main/head.jsp" %>
	<div class="topcontents">
      <div class="lefttop">
   		<c:choose>
	   		<c:when test="${bname eq 'notice' or bname eq 'unient'}">
	      		<div class="lefttoptext">알리미</div>
	      	</c:when>
      		<c:otherwise>
	      		<div class="lefttoptext">끄적끄적</div>
	      	</c:otherwise>
      	</c:choose>
      </div>
      <div class="righttop">
      <c:choose>
	    <c:when test="${bname eq 'free' }">
	    	<div class="righttoptext">공부꿀팁</div>
	    </c:when>
	    <c:when test="${bname eq 'group' }">
	    	<div class="righttoptext">소모임구함</div>
	    </c:when>
	    <c:when test="${bname eq 'notice' }">
	    	<div class="righttoptext">공지사항</div>
	    </c:when>
	    <c:when test="${bname eq 'unient' }">
	   		<div class="righttoptext">대입제도</div>
	  	</c:when>
      </c:choose>
      </div>
   	</div> 
	<div class="contents" style="height:780px;">
		<div class="leftmenu">
			<nav class="left1" >
				<ul class="navbar-nav1  bg-light ">
					<!-- bname이 notice거나 unient일 때 -->
					<c:choose>
					    <c:when test="${bname eq 'notice' or bname eq 'unient'}">
							<li class="nav-item1"><a class="nav-link" href="./board.do?bname=notice">공지사항<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
							<li class="nav-item1"><a class="nav-link" href="./board.do?bname=unient">대입제도<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					    </c:when> 
						<c:otherwise>					 
							<li class="nav-item1"><a class="nav-link" href="./board.do?bname=free">공부꿀팁<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
							<li class="nav-item1"><a class="nav-link" href="./qna.do">질문있어요!<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
							<li class="nav-item1"><a class="nav-link" href="./board.do?bname=group">소모임구함<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
							<li class="nav-item1"><a class="nav-link" href="./library.do">내 주변 독서실<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
						</c:otherwise>
					</c:choose>
				</ul> 
			</nav>
		</div>
		<div class="rightcontents">
			<form id="list_frm" name="list_frm" method="get">
			<!-- 테이블검색영역 -->
			<input type="hid-den" name="nowPage" value="${nowPage }" />
			<input type="hid-den" name="bname" value="${bname }" />
			<div class="searchbox"> 
				<div class="search" style="margin-left:30%; margin-top:15px;">
						<select name="keyField"  class="form-control form-control-sm" style="width:15%;">
							<option value="title">제목</option>
						    <option value="contents">내용</option>
						    <option value="name">작성자</option>
						</select>
						<input type="text" name="keyString" class="form-control form-control-sm" style="width:40%; margin-left:10px;"/>
						<button type="submit" class="btn btn-dark btn-sm" style="background-color:#783712; border-color:#783712;">검색</button>
				</div>
			</div>
			</form> 
			<div style="width:95%; margin-top:1%;">
				<table class="table list_table" >
		 		<colgroup>
					<col width="100px"/>
					<col width="*"/> 
					<col width="120px"/>
					<col width="130px"/>
					<col width="80px"/>
				</colgroup>
				<thead>
					<tr style="background-color:#FAFAFA;">
						<th class="text-center">번호</th>
						<th class="text-center">제목</th>
						<th class="text-center">작성자</th>
						<th class="text-center">등록일</th>
						<th class="text-center">조회수</th>
					</tr>
				</thead>
				<c:choose>
					<c:when test="${empty lists }">
						<tr>
							<td colspan="5" align="center">
								등록된 게시물이 없습니다.
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<!-- 리스트반복 -->
						<tbody>
						<c:forEach items="${lists }" var="row" varStatus="loop">
						<tr>
							<td class="text-center">${row.virtualNum }</td>
							<td class="text-left">
								<a href="./view.do?bname=${bname }&idx=${row.idx }&nowPage=${nowPage}" class="title_view">${row.title }</a>
							</td>   
							<td class="text-center">${row.name }</td>
							<td class="text-center">${row.postdate }</td>
							<td class="text-center">${row.visitcount }</td>
						</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</tbody>
				</table>
				<button type="button" class="btn btn-dark" style="float:right;" onclick="location.href='./write.do?bname=${bname}';">글쓰기</button>
				<!-- 페이지 번호 -->
				<div style="width:100%;">
					<ul class="pagination" style="margin-left:40%;">
					${pagingImg }
					</ul>
				</div>
			</div>
			
		</div>
	</div>
	 
	 <%@include file="../main/bottom.jsp" %> 
</body>
</html>
 




























































