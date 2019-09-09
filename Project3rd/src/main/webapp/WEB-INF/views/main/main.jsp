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
<link rel="stylesheet" href="style/mainstyle.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="./head.jsp" %> 
	<div class="contents1">
		<div class="calendar">
			<div class="cal_top">
				<table cellpadding="0" cellspacing="0" border="0">
					<colgroup>
						<col width="13px;" />
						<col width="*" />
						<col width="13px;" />
					</colgroup>
					<tr>
						<td><a href=""><img src="images/cal_a01.gif" style="margin-top:3px;" width="20px" height="20px"/></a></td>
						<td>&nbsp;&nbsp;2019년&nbsp;&nbsp;9월&nbsp;&nbsp;</td>
						<td><a href=""><img src="images/cal_a02.gif" style="margin-top:3px;" width="20px" height="20px"/></a></td>
					</tr>
				</table>
			</div>
			<div class="cal_bottom">
				<table   border="0" class="calendar_in">
					<colgroup>
						<col width="14%"/>
						<col width="14%" />
						<col width="14%" />
						<col width="14%" />
						<col width="14%" />
						<col width="14%" />
						<col width="14%" />
					</colgroup>
					<tr>
						<th><img src="./images/day01.gif" alt="S" /></th>
						<th><img src="./images/day02.gif" alt="M" /></th>
						<th><img src="./images/day03.gif" alt="T" /></th>
						<th><img src="./images/day04.gif" alt="W" /></th>
						<th><img src="./images/day05.gif" alt="T" /></th>
						<th><img src="./images/day06.gif" alt="F" /></th>
						<th><img src="./images/day07.gif" alt="S" /></th>
					</tr>
					<tr>
						<td align=left valign=top height=73><a href="">&nbsp;</a></td>
						<td align=left valign=top height=73><a href="">&nbsp;</a></td>
						<td align=left valign=top height=73><a href="">&nbsp;</a></td>
						<td align=left valign=top height=73><a href="">&nbsp;</a></td>
						<td align=left valign=top height=73><a href="">1</a></td>
						<td align=left valign=top height=73><a href="">2</a></td>
						<td align=left valign=top height=73><a href="">3</a></td>
					</tr>
					<tr>
						<td align=left valign=top height=73><a href="">4</a></td>
						<td align=left valign=top height=73><a href="">5</a></td>
						<td align=left valign=top height=73><a href="">6</a></td>
						<td align=left valign=top height=73><a href="">7</a></td>
						<td align=left valign=top height=73><a href="">8</a></td>
						<td align=left valign=top height=73><a href="">9</a></td>
						<td align=left valign=top height=73><a href="">10</a></td>
					</tr>
					<tr>
						<td align=left valign=top height=73><a href="">11</a></td>
						<td align=left valign=top height=73><a href="">12</a></td>
						<td align=left valign=top height=73><a href="">13</a></td>
						<td align=left valign=top height=73><a href="">14</a></td>
						<td align=left valign=top height=73><a href="">15</a></td>
						<td align=left valign=top height=73><a href="">16</a></td>
						<td align=left valign=top height=73><a href="">17</a></td>
					</tr>
					<tr>
						<td align=left valign=top height=73><a href="">18</a></td>
						<td align=left valign=top height=73><a href="">19</a></td>
						<td align=left valign=top height=73><a href="">20</a></td>
						<td align=left valign=top height=73><a href="">21</a></td>
						<td align=left valign=top height=73><a href="">22</a></td>
						<td align=left valign=top height=73><a href="">23</a></td>
						<td align=left valign=top height=73><a href="">24</a></td>
					</tr>
					<tr>
						<td align=left valign=top height=73><a href="">25</a></td>
						<td align=left valign=top height=73><a href="">26</a></td>
						<td align=left valign=top height=73><a href="">27</a></td>
						<td align=left valign=top height=73><a href="">28</a></td>
						<td align=left valign=top height=73><a href="">29</a></td>
						<td align=left valign=top height=73><a href="">30</a></td>
						<td align=left valign=top height=73><a href="">31</a></td>
					</tr>
					<tr>
						<td align=left valign=top height=73><a href="">&nbsp;</a></td>
						<td align=left valign=top height=73><a href="">&nbsp;</a></td>
						<td align=left valign=top height=73><a href="">&nbsp;</a></td>
						<td align=left valign=top height=73><a href="">&nbsp;</a></td>
						<td align=left valign=top height=73><a href="">&nbsp;</a></td>
						<td align=left valign=top height=73><a href="">&nbsp;</a></td>
						<td align=left valign=top height=73><a href="">&nbsp;</a></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="timetable"> 
			<table>
				<tr class="timetr">
					<td>00:00-01:00</td>
					<td></td>
				</tr>
				<tr>
					<td>01:00-02:00</td>
					<td></td>
				</tr>
				<tr>
					<td>02:00-03:00</td>
					<td></td>
				</tr>
				<tr>
					<td>03:00-04:00</td>
					<td></td>
				</tr>
				<tr>
					<td>04:00-05:00</td>
					<td></td>
				</tr>
				<tr>
					<td>05:00-06:00</td>
					<td></td>
				</tr>
				<tr>
					<td>06:00-07:00</td>
					<td></td>
				</tr>
				<tr>
					<td>07:00-08:00</td>
					<td></td>
				</tr>
				<tr>
					<td>08:00-09:00</td>
					<td></td>
				</tr>
				<tr>
					<td>09:00-10:00</td>
					<td></td>
				</tr>
				<tr>
					<td>10:00-11:00</td>
					<td></td>
				</tr>
				<tr>
					<td>11:00-12:00</td>
					<td></td>
				</tr>
				<tr>
					<td>12:00-13:00</td>
					<td></td>
				</tr>
				<tr>
					<td>13:00-14:00</td>
					<td></td>
				</tr>
				<tr>
					<td>14:00-15:00</td>
					<td></td>
				</tr>
				<tr>
					<td>15:00-16:00</td>
					<td></td>
				</tr>
				<tr>
					<td>16:00-17:00</td>
					<td></td>
				</tr>
				<tr>
					<td>17:00-18:00</td>
					<td></td>
				</tr>
				<tr>
					<td>18:00-19:00</td>
					<td></td>
				</tr>
				<tr>
					<td>19:00-20:00</td>
					<td></td>
				</tr>
				<tr>
					<td>20:00-21:00</td>
					<td></td>
				</tr>
				<tr>
					<td>21:00-22:00</td>
					<td></td>
				</tr>
				<tr>
					<td>22:00-23:00</td>
					<td></td>
				</tr>
				<tr>
					<td>23:00-00:00</td>
					<td></td>
				</tr>
			</table>
		</div>
		<div class="todolist">
			<p class="main_title" style="text-align:center;">[오늘의할일]</p>
			<table class="dolistcheck">
				<tr>
					<td>
						<input type="checkbox" value="" id="a1"/><label for="a1" class="dolistvalue"></label><span class="dowrite">면접준비하기</span>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="divide">
		 <!-- 영역구분선 --> 
	</div>
	<div class="contents2">
	 	<div class="graph" >
	 		&lt;그래프영역&gt;
	 	</div>
	 	<div class="result">
	 		&lt;대학추천결과&gt;
	 	</div>
	 	<div class="myqa">
	 		<p class="main_title" style="text-align:center">[내질문사항]</p>
	 		<ul class="main_board_list">
	 			<li><p><a href="">내질문사항</a><span>2019.08.31</span></p></li>
	 			<li><p><a href="">내질문사항</a><span>2019.08.31</span></p></li>
	 		</ul>
	 	</div>
	</div>
	<%@include file="./bottom.jsp" %>
</body>
</html>