<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">

//삭제처리
function deleteRow(re_idx){
	var bname = document.getElementById("bname").value;
	var idx = document.getElementById("idx").value;
	var nowPage = document.getElementById("nowPage").value;
	//alert(bname); 

	if(confirm('댓글을 삭제하시겠습니까?')==true){
		location.href='redelete.do?re_idx='+re_idx+'&idx='+idx+'&bname='+bname+'&nowPage='+nowPage;
	}
} 

//수정처리
function editRow(re_idx){
	var idx = re_idx;
	var text = $('#idno'+idx).text();
	
	var a = "";
	a += "<textarea id='editDo' style='width:80%; height:100px;'>"+text+"</textarea>";
	a += "<button type='button' id='Btn2' class='btn btn-dark' style='margin-top:5px; margin-left:5px; margin-bottom:97px; width:11%; height:100px;'>등록</button>"
	$('#idno'+idx).html(a);
	
	var b = "";
	b += "<button type='button' id ='btnDo' class='re_link'>취소</button>";
	$('#editbtn'+idx).html(b); 
	
	$("#btnDo").on('click',function(){
		location.href='./view.do?bname=${bname}&idx=${b_idx}&nowPage=${nowPage}'
	});
	
	$("#Btn2").on('click',function(){
		$.ajax({
			url : "./replyedit.do",
			type: "get", 
			contentType : "text/html; charset:utf-8",
			data : {
				re_idx : re_idx,
				contents : $('#editDo').val()
			},
			dataType:"json",
			success : function(d){
				if(d.statusCode==0){
					alert("댓글 수정 실패");
				}
				else if(d.statusCode==1){
					alert("댓글이 수정되었습니다.");
					reflash(); 
				}
			},
			error : function(e){
				alert("ajax 실패...!");
			}
		});
		$('#idno'+idx).text($("#editDo").val()); 
		$('#editbtn'+idx).html("<button type='button' id='btn' class='re_link' onclick='javascript:editRow(${row.re_idx})'>수정</button>");
	});
}

//대댓글
function reWriteRow(re_idx, rgroup, rstep, name){
	 
	var idx = re_idx;
	var rgroup = rgroup;
	var rstep = rstep;
	var name = name;
	
	var a = "";
	a += "<div class='' style='background-color:#f7f7f7; height:125px; margin-top:10px; margin-left:30px;' colspan='2'>";
	a += "<form name='refrm' action='./rereWrite.do' onsubmit='return rewriteValidate(this)'>"; 
	a += "<input type='hidden' name='b_idx' value='${idx }'/>";
	a += "<input type='hid-den' name='id' value='${siteUserInfo }'/>"; 
	a += "<input type='hidden' name='name' value='"+name+"'/>"; 
	a += "<input type='hidden' name='bname' value='${bname }'/>"; 
	a += "<input type='hidden' name='nowPage' value='${nowPage }'/>";
	a += "<input type='hidden' name='rgroup' value='"+rgroup+"' />"; 
	a += "<input type='hidden' name='rstep' value='"+rstep+"' />";
	a += "<textarea name='contents' style='width:80%; height:110px; margin-left:1.5%;'></textarea>";
	a += "<button type='submit' id='reBtn' class='btn btn-dark' style='margin-top:10px; margin-left:10px; margin-bottom:115px; width:8%; height:105px;'>등록</button>";
	a += "<button type='button' id='Btn2' class='btn btn-dark' style='margin-top:10px; margin-left:5px; margin-bottom:115px; width:8%; height:105px;'>취소</button>";
	a += "</form>"
	a += "</div>"
	
	$('#rereWrite'+idx).html(a); 

	$("#Btn2").on('click',function(){
		location.href='./view.do?bname=${bname}&idx=${b_idx}&nowPage=${nowPage}'
	});
}

function rewriteValidate(f){
	if(f.contents.value==""){
		alert("내용을 입력하세요");
		f.contents.focus(); 
		return false;
	}
}

function reflash(){
	location.reload();
}

</script> 
	<!-- 댓글보기  -->
	<table class="re_table">
	<colgroup>
		<col width="10%;"/>
		<col width="*"/>
		<col width="15%;"/>
	</colgroup>
		<tr class="retr" >
			<td class="re" colspan="3" style="background-color:#F9F9F9;">댓글</td>
		</tr>
		<c:choose>
			<c:when test="${empty lists }">
				<tr>
					<td colspan="3" align="center">
						등록된 댓글이 없습니다.
					</td>
				</tr>
			</c:when>
			<c:otherwise>
			<!-- 댓글 리스트 반복 -->
			<c:forEach items="${lists }" var="row"> 
			<c:choose>
			<c:when test="${row.show eq 'N'}">
			<tr style="border-top:1px #dee2e6 solid;">
				<td colspan="3" style="padding-top:5px;">
				<c:if test="${row.rstep ne 0 }">
					<span style="color:#783712;">&nbsp;&nbsp;&nbsp;└ </span> 
				</c:if>
					삭제된 댓글입니다.
				</td>
			</tr>
			</c:when>
			<c:when test="${row.show eq 'A'}">
			<tr style="border-top:1px #dee2e6 solid;">
				<td colspan="3" style="padding-top:5px;">
				<c:if test="${row.rstep ne 0 }">
					<span style="color:#783712;">&nbsp;&nbsp;&nbsp;└ </span> 
				</c:if>
					관리자에 의해 규제된 댓글입니다.
				</td>
			</tr>
			</c:when>
			<c:otherwise>
			<tr style="border-top:1px #dee2e6 solid;">
				<td colspan="2" style="padding-top:5px;">
					<ul style="display:inline-block; list-style-type:none; float:left; padding-right:5px; height:2px;">
						<div class="review" id="review">
						<input type="hidden" value="${bname }" name="bname"/>
						<input type="hidden" value="${idx }" name="idx"/>
						<input type="hidden" value="${nowPage }" name="nowPage"/>
						<input type="hidden" value="${row.rgroup }" />
						<input type="hidden" name="rstep" id="rstep" value="${row.rstep }" />
						<input type="hidden" value="${row.id }" />
						<input type="hidden" value="${row.show }" />
						<li style="float:left; padding-right:10px; padding-left:20px; font-weight:bold; font-size:14px;">
						<c:if test="${row.rstep ne 0 }">
						<span style="color:#783712;">└ </span> 
						</c:if>
						${row.name }
						</li>
						<li style="float:left; padding-right:5px; font-size:12px; padding-top:3px;">${row.replydate }</li>
						</div> 
					</ul>  
				</td> 
				<td style="padding-top:5px;">  
					<ul style="display:inline-block; list-style-type:none; float:right; padding-right:5px;">
						<c:if test="${sessionScope.siteUserInfo eq row.id}">
							<li id= "editbtn${row.re_idx }" style="float:left; padding-right:5px;"><button type='button' class="re_link" id='btn' onclick="javascript:editRow(${row.re_idx });" >수정</button></li>
							<li style="float:left; padding-right:5px;" ><button type='button' class="re_link"  onclick="javascript:deleteRow(${row.re_idx });">삭제</button></li>
						</c:if> 
						<c:if test="${row.rstep eq 0 }">
						<c:if test="${sessionScope.siteUserInfo ne null}">
							<li style="float:left; padding-right:5px; "><button type='button' class="re_link" onclick="javascript:reWriteRow(${row.re_idx}, ${row.rgroup }, ${row.rstep },'${name }');">댓글</button></li>
						</c:if>
						</c:if>
					</ul> 
				</td> 
			</tr> 
			<tr>   
				<td style="font-size:15px; padding-bottom:10px; padding-left:20px;" colspan="2" id="reContents">
					<div id="idno${row.re_idx }">${row.contents }</div>
					<div id="rereWrite${row.re_idx }" ></div>
				</td>
			</tr> 
			</c:otherwise>
			</c:choose>
			</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	
	<!-- 페이지 번호 -->
	<div style="width:100%;">
		<ul class="pagination pagination-sm" style="margin-left:40%; margin-top:10px;">
		 ${pagingImg }
		</ul>
	</div>
</html>












