
<%@page import="org.springframework.ui.Model"%>
<%@page import="mybatis.UInfoDTO"%>
<%@page import="mybatis.UInfoDAOImpl"%>
<%@page import="mybatis.AllInfoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach var="col" items="${listsMj3}">
	<a class="dropdown-item" onclick="ch_major3('${col.major}');">${col.major}</a>
</c:forEach> 
	
	
	

