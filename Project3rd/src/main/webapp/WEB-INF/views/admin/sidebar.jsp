<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="main_page.do">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>메인</span>
        </a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-folder"></i>
          <span>게시판 관리</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <h6 class="dropdown-header">캘린더 관리:</h6>
	        <c:choose>
	        <c:when test="${not empty sessionScope.siteUserInfo }">
          		<a class="dropdown-item" href="test_schedule.do">시험 일정</a>
          	</c:when>
          	<c:otherwise>
          		<a class="dropdown-item" href="admin_login.do">Login</a>
          	</c:otherwise>
          	</c:choose>
          <div class="dropdown-divider"></div>
          <h6 class="dropdown-header">게시판 관리:</h6>
	        <c:choose>
	        <c:when test="${not empty sessionScope.siteUserInfo }">
          		<a class="dropdown-item" href="admin_board.do">게시판</a>
          		<a class="dropdown-item" href="admin_reply.do">댓글</a>
          	</c:when>
          	<c:otherwise>
          		<a class="dropdown-item" href="admin_login.do">Login</a>
          	</c:otherwise>
          	</c:choose>
          <div class="dropdown-divider"></div>
          <!-- <h6 class="dropdown-header">게시판 관리:</h6>
          <a class="dropdown-item" href="404.html">404 Page</a>
          <a class="dropdown-item" href="blank.html">Blank Page</a> -->
        </div>
      </li>
      <!-- <li class="nav-item">
        <a class="nav-link" href="admin_charts.do">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Charts</span></a>
      </li> -->
      <li class="nav-item">
        <a class="nav-link" href="admin_tables.do">
          <i class="fas fa-fw fa-table"></i>
          <span>멤버관리</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="all_library.do">
          <i class="fas fa-fw fa-table"></i>
          <span>도서관관리</span></a>
      </li>
    </ul>
</html>