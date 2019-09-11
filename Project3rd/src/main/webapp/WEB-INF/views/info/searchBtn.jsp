<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%











%>
<script type="text/javascript">
	
	//페이징 처리  -> 왜하는 거지 
	$('#paginationholder').html('');
	$('#paginationholder').html('<ul id="pagination" class="pages"></ul>');
	
	//이중 체크된 항목 담는 객체 선언
	var locations_list= [];
	var ptypes_list= [];
	
	//체크된 항목만 담기
	var chk_location_list = $("input[id^='chk_location']:checked").get();
	var chk_ptype_list = $("input[id^='chk_ptype']:checked").get();
	var chk_jobrate_list = $("input[id^='rdo_jobrate']:checked").get();
	var chk_tuition_list = $("input[id^='rdo_tuition']:checked").get();
	
	//다중 체크 값 가져오기
	$.each(chk_location_list, function(index,item){
		 var location = item.value.toString(); 
		 //체크리스트의 value값을 찾아 문자열로 저장
		 locations_list[index] = location;
				 
	});
	
	$.each(chk_ptype_list, function(index,item){
		 var ptype = item.value.toString(); 
		 //체크리스트의 value값을 찾아 문자열로 저장
		 ptypes_list[index] = ptype;
				 
	});



</script>