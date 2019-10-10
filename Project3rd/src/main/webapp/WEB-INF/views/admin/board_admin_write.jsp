<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html lang="en">

<head>
<script type="text/javascript" src="<%=request.getContextPath() %>/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script>
	function alertcall(){
		alert("로그인후 이용해주세요.");
		location.href="./login.do";
	}
	
</script>
<script>
function setDisply(v){
	if(v='qna'){
		div1.style.display="";
		div2.style.display="";
	}
}

function noneDisply(v){
	div1.style.display="none";
	div2.style.display="none";
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

    <!-- Sidebar -->
    <%@include file="../admin/sidebar.jsp" %> 

    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- Breadcrumbs-->
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a href="member_modify.do">게시판 글 작성</a>
          </li>
        </ol>

        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header"><i class="fas fa-table"></i> 게시판 글 작성</div>
          <div class="card-body">
            <div class="table-responsive">
            <form name="personFrm" method="post" enctype="multipart/form-data" onsubmit="return writeValidate(this);" action="<c:url value="./board_write_action.do" />">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <tbody>
				    <tr>
				      <td>제목&nbsp;<span class="essential">*</span></td>
				      <td>
				      	<input type="text" value="" name="title"/>
				      </td>
				    </tr>
				    	 <!-- <table  class="table table-bordered" id="div1" style="display:none">-->
					     <tr id="div1" style="display:none">
							<td>학년&nbsp;<span class="essential">*</span></td>
					     	<td>
					      		<select name="grade" id="grade" class="form-control form-control-sm" style="width:15%;">
									<option value="">선택</option> 
									<option value="1학년"<c:if test="${row.grade eq '1학년' }">selected</c:if>>1학년</option> 
								    <option value="2학년"<c:if test="${row.grade eq '2학년' }">selected</c:if>>2학년</option>
								    <option value="3학년"<c:if test="${row.grade eq '3학년' }">selected</c:if>>3학년</option>
								</select>
					      	</td>		    
					    </tr>
					    <tr id="div2" style="display:none">
							<td>과목&nbsp;<span class="essential">*</span></td>
					     	<td>
					      		<select name="subject" id="subject" class="form-control form-control-sm" style="width:15%;">
									<option value="">선택</option> 
									<option value="국어"<c:if test="${row.subject eq '국어' }">selected</c:if>>국어</option> 
								    <option value="영어"<c:if test="${row.subject eq '영어' }">selected</c:if>>영어</option>
								    <option value="수학"<c:if test="${row.subject eq '수학' }">selected</c:if>>수학</option>
								    <option value="사회"<c:if test="${row.subject eq '사회' }">selected</c:if>>사회</option>
								    <option value="과학"<c:if test="${row.subject eq '과학' }">selected</c:if>>과학</option>
								    <option value="기타"<c:if test="${row.subject eq '기타' }">selected</c:if>>기타</option>
								</select>
					      	</td>		    
					    </tr>
				   <!--  </table>-->
			        <tr>
				      <td>내용&nbsp;<span class="essential">*</span></td>
				      <td>
				      	<%-- <input type="input" value="${row.contents }" width="150px" name="contents" /> --%>
				      	<textarea id="contents" name="contents" id="" cols="30" rows="10">${row.contents }</textarea>
				      </td>
				    </tr>
				    <tr>
				      <td>아이디&nbsp;<span class="essential">*</span></td>
				      <td>
				      	<input type="text" value="${sessionScope.siteUserInfo }" name="id" readonly="readonly"/>
				      </td>
				    </tr>
				     <tr>
				      <td>이름&nbsp;<span class="essential">*</span></td>
				      <td>
				      	<input type="text" value="${name}" name="name" readonly="readonly"/>
				      </td>
				    </tr>
				    <tr>
				      <td>파일&nbsp;<span class="essential">*</span></td>
				      <td>
						<input type="file" id="attachedfile" class="form-control" name="attachedfile"/>
				      </td>
				    </tr>
				    <tr>
				    	<td>게시판 종류&nbsp;<span class="essential">*</span></td>
				    	<td>
				    		<input type="radio" value="group" name="bname" checked onclick="noneDisply(this.value)"/>&nbsp;소모임 구함
				    		<input type="radio" value="free" name="bname" onclick="noneDisply(this.value)"/>&nbsp;공부꿀팁
				    		<input type="radio" value="notice" name="bname" onclick="noneDisply(this.value)"/>&nbsp;공지사항
				    		<input type="radio" value="unient" name="bname" onclick="noneDisply(this.value)"/>&nbsp;대입제도
				    		<input type="radio" value="qna" name="bname" onclick="setDisply(this.value)"/>&nbsp;질문있어요!
				    	</td>
				    </tr>
				  </tbody>  
              </table>
			<button type="button" id="writeBtn" class="btn btn-primary">입력</button>&nbsp;
			</form>
          </div><!-- table-responsive div end -->
          </div><!-- card-body div end -->
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

	<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	 oAppRef: oEditors,
	 elPlaceHolder: "contents",
	 sSkinURI: "<%=request.getContextPath()%>/smarteditor/SmartEditor2Skin.html",
	 fCreator: "createSEditor2"
	});	
	</script>
	<script type="text/javascript">
	window.onload = function(){
		var btn = document.getElementById("writeBtn");
		btn.onclick = function(){
	
			submitContents(btn); 
		}
	}
    
	function submitContents(elClickedObj){
		
		var f = document.personFrm;
		var st = $(":input:radio[name=bname]:checked").val();
		oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
		
		if(f.id.value==""){
			alert("작성자 이름을 입력하세요");
			f.id.focus();
			return false;
		}
		if(f.title.value==""){
			alert("제목을 입력하세요");
			f.title.focus(); 
			return false;
		} 
		if(st=='qna'){
			if(f.grade.value==""){
		         alert("학년을 선택하세요.");
		         return false;
		    }
		    if(f.subject.value==""){
		         alert("과목을 선택하세요.");
		         return false;
		    }
		}
		if(f.contents.value =="" ||f.contents.value== null || f.contents.value=='&nbsp;'||f.contents.value=='<p><br></p>'){
			alert("내용을 입력하세요");
			oEditors.getById["contents"].exec("FOCUS"); 
			return false;
		}
		
		try{
			elClickedObj.form.submit();
		}
		catch(e){
			 
		}
	}
	</script>
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
