<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	function alertcall(){
		alert("로그인후 이용해주세요.");
		location.href="./login.do";
	}
	
	google.charts.load('current', {packages: ['corechart']});
	google.charts.setOnLoadCallback(drawMultSeries);
	
	function drawMultSeries() {
	      var data = google.visualization.arrayToDataTable([
	        ['월', '방문자수'],
		        ['1', ${month_1}],
	        	['2', ${month_2}],
	        	['3', ${month_3}],
	        	['4', ${month_4}],
	        	['5', ${month_5}],
	        	['6', ${month_6}],
	        	['7', ${month_7}],
	        	['8', ${month_8}],
	        	['9', ${month_9}],
	        	['10', ${month_10}],
	        	['11', ${month_11}],
	        	['12', ${month_12}]
	        ]); 
	 
	      var options = {
	        title: '2019 월별 방문자수 비교',
	        chartArea: {width: '50%'},
	        hAxis: {
	          title: '월',
	          minValue: 0
	        },
	        vAxis: {
	          title: '명'
	        }
	      };
	 
	      var chart = new google.visualization.ColumnChart(document.getElementById('chart'));
	      chart.draw(data, options);
	}
	
</script>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin - Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="admin/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="admin/css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="main_page.do">나만따 코코넛 관리자 페이지</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <button class="btn btn-primary" type="button">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>

    <!-- Navbar -->
    <%@include file="../admin/navbar.jsp" %>

  </nav>

  <div id="wrapper">

    <%@include file="../admin/sidebar.jsp" %> 

    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="">관리자 페이지 메인</a>
          </li>
          <li class="breadcrumb-item active">Overview</li>
        </ol>

        <!-- Icon Cards-->
        <div class="row">
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-primary o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-comments"></i>
                </div>
                <div class="mr-5">26 New Messages!</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="#">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
          <!-- <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-warning o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-list"></i>
                </div>
                <div class="mr-5">11 New Tasks!</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="#">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-success o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-shopping-cart"></i>
                </div>
                <div class="mr-5">123 New Orders!</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="#">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div>
          <div class="col-xl-3 col-sm-6 mb-3">
            <div class="card text-white bg-danger o-hidden h-100">
              <div class="card-body">
                <div class="card-body-icon">
                  <i class="fas fa-fw fa-life-ring"></i>
                </div>
                <div class="mr-5">13 New Tickets!</div>
              </div>
              <a class="card-footer text-white clearfix small z-1" href="#">
                <span class="float-left">View Details</span>
                <span class="float-right">
                  <i class="fas fa-angle-right"></i>
                </span>
              </a>
            </div>
          </div> -->
        </div>

        <!-- Area Chart Example-->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-chart-area"></i>
            Area Chart Example</div>
          <div class="card-body">
            <div id="chart" width="100%" height="800px"></div>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>

        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            멤버 목록</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                  	<th>번호</th>
                    <th>이름</th>
                    <th>아이디</th>
                    <th>비밀번호</th>
                    <th>이메일</th>
                    <th>핸드폰</th>
                    <th>문자<br />수신</th>
                    <th>이메일<br />수신</th>
                    <th>가입<br />날짜</th>
                    <th>계정 타입</th>
                    <th>관리</th>
                  </tr>
                </thead>
                <tbody>
                <c:forEach items="${vo }" var="row" varStatus="status">
                  <tr>
                  	<td>${status.count}</td>
                    <td>${row.name }</td>
                    <td>${row.ID }</td>
                    <td>${row.PASS1 }</td>
                    <td>${row.EMAIL }</td>
                    <td>${row.PHONE }</td>
					<td>
						<c:choose>
							<c:when test="${row.SMS_OK eq 1}">
								<c:out value="YES" />
							</c:when>
							<c:when test="${row.SMS_OK eq 0}">
								<c:out value="NO" />
							</c:when>
						</c:choose>
                    </td>
                    <td>
						<c:choose>
							<c:when test="${row.EMAIL_OK eq 1}">
								<c:out value="YES" />
							</c:when>
							<c:when test="${row.EMAIL_OK eq 0}">
								<c:out value="NO" />
							</c:when>
						</c:choose>
                    </td>
                    <td>${row.REGIDATE }</td>
                    <td>${row.AUTH }</td>
                    <td>
                    	<button type="button" class="btn btn-primary" onclick = "location.href = 'member_modify.do?id=${row.ID }'">수정</button>
                    </td>
                  </tr>
                 </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>

      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>2이3김 © 나만따 코코넛 2019</span>
          </div>
        </div>
      </footer>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
          </button>
        </div>
        <div class="modal-body">로그아웃을 하고싶으시면 로그아웃 버튼을 누르세요.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
          <a class="btn btn-primary" href="admin_login.do">로그아웃</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="admin/vendor/jquery/jquery.min.js"></script>
  <script src="admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="admin/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="admin/vendor/chart.js/Chart.min.js"></script>
  <script src="admin/vendor/datatables/jquery.dataTables.js"></script>
  <script src="admin/vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="admin/js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="admin/js/demo/datatables-demo.js"></script>
  <script src="admin/js/demo/chart-area-demo.js"></script>

</body>

</html>
