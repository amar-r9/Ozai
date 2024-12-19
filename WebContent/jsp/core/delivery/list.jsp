<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="keywords"
	content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, nice admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, " />
<meta name="description"
	content="Tikaana admin dashboard for finacne module" />
<meta name="robots" content="noindex,nofollow" />
<title>Admin Dashboard | Ozai</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/new/assets/images/favicon.png" />
<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/new/dist/css/style.min.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/new/assets/libs/select2/dist/css/select2.min.css" />
<!-- This page plugin CSS -->
<link href="https://nightly.datatables.net/css/jquery.dataTables.css"
	rel="stylesheet" type="text/css" />

<link
	href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.css"
	rel="stylesheet" type="text/css" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link href="<%=request.getContextPath()%>/assets/css/user-list.css"
	rel="stylesheet" />
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>

<body>
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->
	<jsp:include page="/common/preloader.jsp"></jsp:include>
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->
		<jsp:include page="/common/coreheader.jsp"></jsp:include>
		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<jsp:include page="/common/coresidebar.jsp"></jsp:include>
		<!-- ============================================================== -->
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-5 col-md-5 col-sm-12 col-12 align-self-center">
						<h4 class="page-title">List</h4>
					</div>
					<div class="col-7 align-self-center d-none d-lg-block">
						<div class="d-flex align-items-center justify-content-end">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">
										Delivery</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- -------------------------------------------------------------- -->
				<!-- Start Page Content -->
				<!-- -------------------------------------------------------------- -->

				<!-- Row selection (multiple rows) -->
				<div class="row">
					<div class="col-md-9 col-9">
						<div class="card">
							<div class="border-bottom bg-primary text-white title-part-padding">
								<h4 class="card-title mb-0">
									<c:if test="${not empty category }">
										${category }
									</c:if>
								</h4>
							</div>
							<div class="card-body">
								<c:if test="${not empty dels }">
									<table class="table display" id="delivery-table">
										<thead>
											<tr>
												<th>SNo</th>
												<th>Action</th>
												<th>Type</th>
												<th>Category</th>
												<th>PG</th>
												<th>Amount</th>
												<th>Delivery date</th>
										</thead>
										<tbody>
											<c:forEach items="${dels}" var="del" varStatus="sno">
												<tr>
													<td>${sno.index+1 }</td>
													<td><a
														href="<%=request.getContextPath() %>/core/delivery/view/${del.id }"
														class="btn btn-sm btn-info">VIEW</a></td>
													<td>${del.type }</td>
													<td>${del.category }</td>
													<td>${del.pg.name }</td>
													<td>${del.total }</td>
													<td>${del.delivery_date }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
								<c:if test="${empty dels }">
									<h5>No results found.</h5>
								</c:if>
							</div>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="card w-100">
							<div
								class="d-flex border-bottom title-part-padding
			                    	align-items-center">
								<div>
									<h4 class="card-title mb-0">Choose category</h4>
								</div>
							</div>
							<div class="card-body">
								<div class="row gap-2">
									<select class="form-select form-control category" name="category"
										id="select2-language" style="width: 100%;" required>
										<option>Select</option>
										<c:forEach items="${services }" var="service">
											<option value="${service.name }">${service.name }</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
						
						<div class="card w-100">
							<div
								class="d-flex border-bottom title-part-padding
			                    	align-items-center">
								<div>
									<h4 class="card-title mb-0">Links</h4>
								</div>
							</div>
							<div class="card-body">
								<div class="row gap-2">
									<div class="col-md-12">
										<a href="<%=request.getContextPath()%>/core/delivery/add"
											class="btn d-flex align-items-center
			                          				btn-info w-100 d-block font-weight-medium">
											Add new <span class="badge ms-auto bg-info"><i
												class="fa fa-plus"></i></span>
										</a>
									</div>
									<div class="col-md-12">
										<a href="<%=request.getContextPath()%>/core/delivery/list/all"
											class="btn d-flex align-items-center
						                          btn-success w-100 d-block
						                          font-weight-medium">
											All list <span class="badge ms-auto bg-success"><i
												class="fa fa-list"></i></span>
										</a>
									</div>
								</div>
								<div class="row gap-2 mt-2">
									<div class="col-md-12">
										<a
											href="<%=request.getContextPath()%>/core/delivery/list/Buying"
											class="btn d-flex align-items-center btn-primary
			                          			w-100 d-block font-weight-medium">
											Bought list <span class="badge ms-auto bg-primary"><i
												class="fa fa-list"></i></span>
										</a>
									</div>
									<div class="col-md-12">
										<a
											href="<%=request.getContextPath()%>/core/delivery/list/Selling"
											class="btn d-flex align-items-center btn-warning
			                          			w-100 d-block font-weight-medium">
											Sold list <span class="badge ms-auto bg-warning"><i
												class="fa fa-list"></i></span>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- footer -->
			<!-- ============================================================== -->
			<footer class="footer">All right reserved by Ozai.</footer>
			<!-- ============================================================== -->
			<!-- End footer -->
			<!-- ============================================================== -->
		</div>
		<!-- ============================================================== -->
		<!-- End Page wrapper  -->
		<!-- ============================================================== -->
	</div>
	<!-- ============================================================== -->
	<!-- End Wrapper -->
	<!-- ============================================================== -->
	<!-- ============================================================== -->
	<!-- customizer Panel -->
	<!-- ============================================================== -->

	<div class="chat-windows"></div>
	<!-- ============================================================== -->
	<!-- All Jquery -->
	<!-- ============================================================== -->
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!-- apps -->
	<script src="<%=request.getContextPath()%>/new/dist/js/app.min.js"></script>
	<script src="<%=request.getContextPath()%>/new/dist/js/app.init.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/dist/js/app-style-switcher.js"></script>
	<!-- slimscrollbar scrollbar JavaScript -->
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/jquery-sparkline/jquery.sparkline.min.js"></script>
	<!--Wave Effects -->
	<script src="<%=request.getContextPath()%>/new/dist/js/waves.js"></script>
	<!--Menu sidebar -->
	<script src="<%=request.getContextPath()%>/new/dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="<%=request.getContextPath()%>/new/dist/js/feather.min.js"></script>
	<script src="<%=request.getContextPath()%>/new/dist/js/custom.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/select2/dist/js/select2.full.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/select2/dist/js/select2.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/dist/js/pages/forms/select2/select2.init.js"></script>
    <!--This page plugins -->
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <!-- start - This is for export functionality only -->
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
	<!--This page plugins -->
	<script>
		$('document').ready(function() {
			$('.sidebartoggler').toggle();
			$('#delivery-table').DataTable();
			$('[data-toggle="tooltip"]').tooltip();
			$('.category').change(function() {
				window.location.href = '${pageContext.request.contextPath}/core/delivery/list-category/'+$(this).val()+'';
			});
		});
	</script>
	<script>
		$(function() {
			"use strict";
			$("#main-wrapper").AdminSettings({
				Theme : true, // this can be true or false ( true means dark and false means light ),
				Layout : "horizontal",
				LogoBg : "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
				NavbarBg : "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
				SidebarType : "overlay", // You can change it full / mini-sidebar / iconbar / overlay
				SidebarColor : "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
				SidebarPosition : false, // it can be true / false ( true means Fixed and false means absolute )
				HeaderPosition : false, // it can be true / false ( true means Fixed and false means absolute )
				BoxedLayout : false, // it can be true / false ( true means Boxed and false means Fluid )
			});
		});
	</script>
</body>
</html>