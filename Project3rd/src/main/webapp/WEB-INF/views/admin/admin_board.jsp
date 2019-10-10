<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
<script>
	function alertcall(){
		alert("로그인후 이용해주세요.");
		location.href="./login.do";
	}
	
	function select_board(board_type){
		$.ajax({
			type: "POST",
			url: "admin_board2.do",
			dataType: "html",
			data: {param : board_type},
			success: function(result){
				$("#board_table").html(result);
			},
			error: function(){
				alert('오류 발생');
			}
		});
	}
</script>
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
            <a href="admin_board.do">게시판관리</a>
          </li>
        </ol>

        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            게시판 목록</div>
          <div class="card-body">
          <div style="width: 30%; text-align: right;">
          	<select class="form-control" id="board_type" name="board_type" onchange="select_board(this.value);">
          		<option value="all">전체</option>
          		<option value="free">공부꿀팁</option>
          		<option value="group">소모임구함</option>
          		<option value="notice">공지사항</option>
          		<option value="unient">대입제도</option>
          		<option value="qna">질문있어요!</option>
          	</select>
          </div>
            <div class="table-responsive" id="board_table">
            	
            	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		        	<thead>
		          <tr>
		          	<th>번호</th>
		            <th>제목</th>
		            <th>내용</th>
		            <th>아이디</th>
		            <th>이름</th>
		            <th>파일</th>
		            <th>조회수</th>
		            <th>게시판 종류</th>
		            <th>게시한 날짜</th>
		            <th>관리</th>
		          </tr>
		        </thead>
		        <tbody>
		        <c:forEach items="${lists }" var="row" varStatus="status">
		          <tr>
		          	<td>${status.count}</td>
		            <td>${row.title }</td>
		            <td>${row.contents }</td>
		            <td>${row.id }</td>
		            <td>${row.name }</td>
		            <td>${row.attachedfile }</td>
		            <td>${row.visitcount }</td>
		            <td>
		            <c:choose>
						<c:when test="${row.bname eq 'group'}">
							<c:out value="소모임 구함" />
						</c:when>
						<c:when test="${row.bname eq 'free'}">
							<c:out value="공부꿀팁" />
						</c:when>
						<c:when test="${row.bname eq 'notice'}">
							<c:out value="공지사항" />
						</c:when>
						<c:when test="${row.bname eq 'unient'}">
							<c:out value="대입제도" />
						</c:when>
						<c:when test="${row.bname eq 'qna'}">
							<c:out value="질문있어요!" />
						</c:when>
					</c:choose>
					</td>
		            <td>${row.postdate }</td>
		            <td>
		            	<button type="button" class="btn btn-primary" onclick = "location.href = 'admin_board_modify.do?idx=${row.idx }'">수정</button>
		            </td>
		          </tr>
		         </c:forEach>
		        </tbody>
		      </table>
          	 <button type="button" class="btn btn-warning" onclick = "location.href = 'write_board_admin.do?id=${sessionScope.siteUserInfo }'">입력</button>
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
