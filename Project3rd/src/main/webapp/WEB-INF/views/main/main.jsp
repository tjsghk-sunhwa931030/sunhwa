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
<link rel="stylesheet" href="style/schedule.css" />
<link rel="stylesheet" href="style/leftmenustyle.css" />
<link rel="stylesheet" href="style/basic.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	function recommend_ajax(value){
		$.ajax({
			type: "POST",
			url: "get_graph.do",
			dataType: "html",
			data: {value, value},
			success: function(result){
				$("#recommend").html(result);
			},
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		});
	}
	
	function load(value){
		alert("hi?");
	}
	
</script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<!-- 가져온것 -->

    <link rel="stylesheet" href="vendor/css/fullcalendar.min.css" />
	<link rel="stylesheet" href="vendor/css/bootstrap.min.css">
    <link rel="stylesheet" href='vendor/css/select2.min.css' />
	<link rel="stylesheet" href='vendor/css/bootstrap-datetimepicker.min.css' />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <link rel="stylesheet" href="css/main.css">
<style>
*{margin:0;padding:0;font-family:verdana;}
.dropdown-menu a{color:black;text-decoration:none;}
.dropdown-menu a:hover{color:black;font-weight:bold;}
.dropdown-menu a:visited{color:black;}
#contextMenu{border:1px solid black;}
#contextMenu ul{text-align:center;}
#eventModal{z-index:100000 !important;}
/* div{border:1px solid blue;} */
</style>
<script>
/* window.onload = function(){
		
	alert('${sessionScope.siteUserInfo }');
		
}
 */
</script>
</head>
<body>
	<%@include file="../main/head.jsp" %> 
	
	<div class="contents" style="width:80%;height:1000px;">
			<div class="rightcontents" style="float:left">
				<!-- 일자 클릭시 메뉴오픈 -->
		        <div id="contextMenu" class="dropdown clearfix">
		            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
		                style="display:block;position:static;margin-bottom:5px;">
		                <li><a tabindex="-1" href="#" data-toggle="modal" data-target="#eventModal">개인일정</a></li>
		                <li><a tabindex="-1" href="#" data-toggle="modal" data-target="#eventModal">면접일정</a></li>
		                <li><a tabindex="-1" href="#" data-toggle="modal" data-target="#eventModal">서류일정</a></li>
		                <li><a tabindex="-1" href="#" data-toggle="modal" data-target="#eventModal">시험일정</a></li>
		                
		                <li class="divider"></li>
		                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
		            </ul>
		        </div>
		
				<!-- 달력나오는 부분 -->
		        <div id="wrapper">
		            <div id="loading"></div>
		            <div id="calendar"></div>
		        </div>
		
		
		        <!-- 일정 추가 MODAL -->
		        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal" >
		            <div class="modal-dialog" role="document">
		                <div class="modal-content">
		                    <div class="modal-header">
		                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
		                                aria-hidden="true">&times;</span></button>
		                        <h4 class="modal-title"></h4>
		                    </div>
		                    <div class="modal-body">
								<input type="hidden" name="edit-id" id="edit-id"/> <!-- 출력시 일정의 고유아이디를 저장할곳 -->
		        				<input type="hidden" name="userId" id="userId" value="${sessionScope.siteUserInfo }" />
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
		                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox">
		                            </div>
		                        </div>
		
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-title">일정명</label>
		                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
		                                    required="required" />
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-start">시작</label>
		                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-end">끝</label>
		                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-type">구분</label>
		                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
		                                   <option value="개인일정">개인일정</option>
		                                   <option value="면접일정">면접일정</option>
		                                   <option value="서류일정">서류일정</option>
		                                   <option value="시험일정">시험일정</option>
		                                </select>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-color">색상</label>
		                                <select class="inputModal" name="color" id="edit-color">
		                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
		                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
		                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
		                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
		                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
		                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
		                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
		                                    <option value="#495057" style="color:#495057;">검정색</option>
		                                </select>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-xs-12">
		                                <label class="col-xs-4" for="edit-desc">설명</label>
		                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
		                                    id="edit-desc"></textarea>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="modal-footer modalBtnContainer-addEvent">
		                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
		                    </div>
		                    <div class="modal-footer modalBtnContainer-modifyEvent">
		                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
		                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
		                    </div>
		                </div><!-- /.modal-content -->
		            </div><!-- /.modal-dialog -->
		        </div><!-- /.modal -->
		
		        <div class="panel panel-default">
		
		            <div class="panel-heading">
		                <h3 class="panel-title">필터</h3>
		            </div>
		
		            <div class="panel-body">
		
		                <div class="col-lg-6">
		                    <label for="calendar_view">구분별</label>
		                    <div class="input-group">
		                        <select class="filter" id="type_filter" multiple="multiple">
		                            <option value="개인일정">개인일정</option>
		                            <option value="면접일정">면접일정</option>
		                            <option value="서류일정">서류일정</option>
		                            <option value="시험일정">시험일정</option>
		                        </select>
		                    </div>
		                </div>
		
		                 <div class="col-lg-6">
		                    <label for="calendar_view">등록자별</label>
		                    <div class="input-group">
		                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="공통일정"
		                                checked>공통일정</label>
		                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="관심대학일정"
		                                checked>관심대학일정</label>
		                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="me"
		                                checked>me</label>
		                        <!-- <label class="checkbox-inline"><input class='filter' type="checkbox" value="사나"
		                                checked>사나</label>
		                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="나연"
		                                checked>나연</label>
		                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="지효"
		                                checked>지효</label> -->
		                    </div>
		                </div> 
		            </div>
		        </div>
		        <!-- /.filter panel -->
	        </div>
	        <!-- 그래프1 -->
	        <div style="border:1px solid red; float:left;width:500px;margin-top:20px;margin-left:15px;height:480px; text-align: center;">
	        	<c:choose>
				<c:when test="${not empty sessionScope.siteUserInfo }">
					<h2>로그인 후</h2>
				</c:when>
				<c:otherwise>
					<img src="images/login_2.PNG" alt="" style="display: inline-block; float:none; width:80%; height: 80%; border-radius: 25px;"/>
				</c:otherwise>
				</c:choose>
	        </div>
	        <!-- 그래프2 -->
	        <div style="border:1px solid red; float:left;width:500px;margin-top:20px;margin-left:15px;height:480px; text-align: center;">
	        	<c:choose>
				<c:when test="${not empty sessionScope.siteUserInfo }">
				<span style="font-weight: bold !important;">${sessionScope.siteUserInfo }</span>님의 
						<select name="exam" id="exam" onchange="recommend_ajax(this.value);" onload="load(this.value);" >
						<c:forEach items="${lists }" var="row">
							<option value="${row.idx }" selected="selected">${row.years }년 ${row.dates} ${row.ex_name }</option>
						</c:forEach>
						</select>
				를 바탕으로 <br /> 추천한 대학입니다. <br />
				<div id="recommend"></div>
				</c:when>
				<c:otherwise>
					<img src="images/login_1.PNG" alt="" style="display: inline-block; float:none; width:80%; height: 80%; border-radius: 25px;"/>
				</c:otherwise>
				</c:choose>
	        </div>
        </div>
    <!-- /.container -->
			
	
	<%@include file="../main/bottom.jsp" %>	
	
	<script src="vendor/js/jquery.min.js"></script>
	<script src="vendor/js/bootstrap.min.js"></script>
    <script src="vendor/js/moment.min.js"></script>
    <script src="vendor/js/fullcalendar.min.js"></script>
    <script src="vendor/js/ko.js"></script>
    <script src="vendor/js/select2.min.js"></script>
    <script src="vendor/js/bootstrap-datetimepicker.js"></script>
    <script src="js/main.js"></script>
    <script src="js/addEvent.js"></script>
    <script src="js/editEvent.js"></script>
    <script src="js/etcSetting.js"></script>
</body>
</html>