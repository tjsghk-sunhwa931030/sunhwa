
<%@page import="org.springframework.ui.Model"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="col" items="${listsMj2}">
	<a class="dropdown-item" onclick="ch_major2('${col.major2}');" >${col.major2}</a>
</c:forEach> 
	
	
	

