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
<link rel="stylesheet" href="style/grade.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<style type="text/css">
        .hidden
        {
            display: none;
        }
        .bold
        {
            font-weight: bold;
        }
        .DivCss
        {
            background-color: #FFFFCC; border: thin dotted #000000; padding: 2px; margin: 0px; width: 200px;
        }
    </style>
</head>
<body>
	<%@include file="../main/head.jsp" %>
	
	<div class="topcontents">
		<div class="lefttop">
			성적분석
		</div>
		<div class="righttop">
			대학별 성적 분석
		</div>
	</div>
	<div class="contents">
		<div class="leftmenu">
			<nav class="left1" >
				<ul class="navbar-nav1  bg-light ">
					<li class="nav-item1"><a class="nav-link" href="s_grade.do">학생부 성적 분석<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="j_grade.do">수능 성적 분석<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
					<li class="nav-item1"><a class="nav-link" href="u_grade.do">대학별 성적 분석<i class='fas fa-chevron-circle-right' style='margin-top:4px;'></i></a></li>
				</ul>
			</nav>
		</div>
		<div class="rightcontents">
		<script language="javascript" type="text/javascript">
        $(document).ready(function () {
        });
        $(document).ready(function () {
            var toggleStyleSwitcher = function () {
           		$('#div1').addClass('bold');
            };
            $('.table').addClass('hidden');
 
            $('#button').click(function (event) {
                $('.table').toggleClass('hidden');
            });
 
       
        });
    </script>
		<div class="univ_choice">
			<form action="">
				<div id="div1"><input type="button" value="펼치기와 접기" id="button" /></div>
				<table class="table">
				    <thead class="thead-dark">
				      <tr>
				        <th>Firstname</th>
				        <th>Lastname</th>
				        <th>Email</th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr>
				        <td>John</td>
				        <td>Doe</td>
				        <td>john@example.com</td>
				      </tr>
				      <tr>
				        <td>Mary</td>
				        <td>Moe</td>
				        <td>mary@example.com</td>
				      </tr>
				      <tr>
				        <td>July</td>
				        <td>Dooley</td>
				        <td>july@example.com</td>
				      </tr>
				    </tbody>
				  </table>
			</form>
		</div>
		
		</div> <!-- rightcontents -->
	</div> <!-- contents -->
	<%@include file="../main/bottom.jsp" %>
</body>
</html>