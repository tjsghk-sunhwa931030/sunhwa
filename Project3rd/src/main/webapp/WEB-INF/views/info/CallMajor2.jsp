
<%@page import="org.springframework.ui.Model"%>
<%@page import="mybatis.UInfoDTO"%>
<%@page import="mybatis.UInfoDAOImpl"%>
<%@page import="mybatis.AllInfoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="col" items="${listsMj2}">
	<a class="dropdown-item" id="major" onclick="ch_major();">${col.major2}</a>
</c:forEach> 
	<input type="text" id="major2" name="major2" /> 
	
	

