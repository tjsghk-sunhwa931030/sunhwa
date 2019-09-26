<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin - Tables</title>

  <!-- Custom fonts for this template-->
  <link href="admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="admin/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="admin/css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="index.html">나만따 코코넛 관리자 페이지</a>

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
            <a href="member_modify.do">도서관 입력</a>
          </li>
        </ol>

        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header"><i class="fas fa-table"></i> 도서관 입력</div>
          <div class="card-body">
            <div class="table-responsive">
            <form name="personFrm" method="post" action="library_insert_action.do">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <tbody>
				    <tr>
				      <td>도서관 이름&nbsp;<span class="essential"></span></td>
				      <td>
				      	<input type="text" value="" name="l_name"/>
				      </td>
				    </tr>
				    <tr>
				      <td>시군&nbsp;<span class="essential"></span></td>
				      <td>
				      	<input type="text" value="" name="sido" />
				      </td>
				    </tr>
				    <tr>
				      <td>시군구&nbsp;<span class="essential"></span></td>
				      <td>
				      	<input type="text" value="" name="sigungu" />
				      </td>
				    </tr>
				    <tr>
				      <td>상세주소&nbsp;<span class="essential"></span></td>
				      <td>
				      	<input type="text" value="" name="addr" style="width: 400px"/>
				      </td>
				    </tr>
				    <tr>
				      <td>평일 운영 시작 시간&nbsp;<span class="essential"></span></td>
				      <td>
				      	<input type="time" value="" name="weekday_start"/>
				      </td>
				    </tr>
				    <tr>
				      <td>평일 운영 종료 시간&nbsp;<span class="essential"></span></td>
				      <td>
				      	<input type="time" value="" name="weekday_end"/>
				      </td>
				    </tr>
				    <tr>
				      <td>토요일 운영 시작 시간&nbsp;<span class="essential"></span></td>
				      <td>
				      	<input type="time" value="" name="saturday_start"/>
				      </td>
				    </tr>
				    <tr>
				      <td>토요일 운영 종료 시간&nbsp;<span class="essential"></span></td>
				      <td>
				      	<input type="time" value="" name="saturday_end"/>
				      </td>
				    </tr>
				    <tr>
				      <td>공휴일 운영 시작 시간&nbsp;<span class="essential"></span></td>
				      <td>
				      	<input type="time" value="" name="holiday_start"/>
				      </td>
				    </tr>
				    <tr>
				      <td>공휴일 운영 종료 시간&nbsp;<span class="essential"></span></td>
				      <td>
				      	<input type="time" value="" name="holiday_end"/>
				      </td>
				    </tr>
				    <tr>
				      <td>휴관일&nbsp;<span class="essential"></span></td>
				      <td>
				      	<input type="text" value="" name="rest_day" style="width: 400px"/>
				      </td>
				    </tr>
				    <tr>
				      <td>전화번호&nbsp;<span class="essential"></span></td>
				      <td>
				      	<input type="text" value="" name="phone_num" />
				      </td>
				    </tr>
				    <tr>
				    <tr>
				      <td>경도&nbsp;<span class="essential"></span></td>
				      <td>
				      	<input type="text" value="" name="hp_latitude" />
				      </td>
				    </tr>
				    <tr>
				    <tr>
				      <td>위도&nbsp;<span class="essential"></span></td>
				      <td>
				      	<input type="text" value="" name="hp_longitude" />
				      </td>
				    </tr>
				    <tr>
				      <td>추천수&nbsp;<span class="essential"></span></td>
				      <td>
				      	<input type="text" value="" name="l_like" />
				      </td>
				    </tr>
				  </tbody>
              </table>
			<button type="submit" class="btn btn-primary">입력</button>&nbsp;
			</form>
          </div>
          </div>
          <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
        </div>

        <p class="small text-center text-muted my-5">
          <em>More table examples coming soon...</em>
        </p>

      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright Â© Your Website 2019</span>
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
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">Ã</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
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
  <script src="admin/vendor/datatables/jquery.dataTables.js"></script>
  <script src="admin/vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="admin/js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="admin/js/demo/datatables-demo.js"></script>

</body>

</html>
