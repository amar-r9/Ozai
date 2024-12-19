<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
	content="Tikaana Admin Dashboard" />
<meta name="robots" content="noindex,nofollow" />
<title>Ozai Admin Dashboard</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/new/assets/images/favicon.png" />
<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/new/dist/css/style.min.css"
	rel="stylesheet" />
<link href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css"
    rel="stylesheet" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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
		<jsp:include page="/common/adminheader.jsp"></jsp:include>
		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<jsp:include page="/common/adminsidebar.jsp"></jsp:include>
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
						<h4 class="page-title">Finance Module</h4>
					</div>
					<div class="col-7 align-self-center d-none d-lg-block">
						<div class="d-flex align-items-center justify-content-end">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a
										href="<%=request.getContextPath()%>/ops">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">
										Finance Module</li>
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
				<div class="row">
					<div class="col-12">
						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<div class="card-body row">
										<div class="row gap-2 d-none d-lg-block">
											<div class="col-2 col-md-2 col-xs-12 col-12">
												<a
													href="<%=request.getContextPath()%>/admin/expenses/vendor-list"
													class="btn d-flex align-items-center
			                          				btn-info w-100 d-block font-weight-medium">
													Vendor List <span class="badge ms-auto bg-info"><i
														class="fa fa-list"></i></span>
												</a>
											</div>
											<div class="col-2 col-md-2 col-xs-12 col-12">
												<a
													href="<%=request.getContextPath()%>/admin/expenses/add-vendor"
													class="btn d-flex align-items-center
			                          				btn-success w-100 d-block font-weight-medium">
													Add Vendor <span class="badge ms-auto bg-success"><i
														class="fa fa-plus"></i></span>
												</a>
											</div>
											<div class="col-2 col-md-2 col-xs-12 col-12">
												<a
													href="<%=request.getContextPath()%>/admin/expenses/list"
													class="btn d-flex align-items-center
	                          						btn-warning w-100 d-block font-weight-medium">
													Expense List <span class="badge ms-auto bg-warning"><i
														class="fa fa-list"></i></span>
												</a>
											</div>
											<div class="col-2 col-md-2 col-xs-12 col-12">
												<a
													href="<%=request.getContextPath()%>/admin/expenses/add"
													class="btn d-flex align-items-center
			                          				btn-primary w-100 d-block font-weight-medium">
													Add Expense <span class="badge ms-auto bg-primary"><i
														class="fa fa-plus"></i></span>
												</a>
											</div>
										</div>
									</div>
									<div class="card-body">
										<div class="card-header bg-info">
											<h4 class="card-title text-white">Vendor List</h4>
										</div>
										<div class="table-responsive mt-4">
											<table class="table table-bordered display table-striped" id="tenants"
												style="width: 100%;">
												<thead>
													<tr>
														<th>Action</th>
														<th>Name</th>
														<th>Vendor Type</th>
														<th>City</th>
														<th>Account</th>
														<th>IFSC</th>
														<th>Payment Terms</th>
														<th>Bank Identifier</th>
														<th>Contact</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${vendors}" var="vendor">
														<tr>
															<td><a href="<%=request.getContextPath() %>/ops/expenses/edit-vendor/${vendor.id }"
																class="btn btn-xs btn-danger">EDIT</a>
															<td>${vendor.name }</td>
															<td>${vendor.vendor_type }</td>
															<td>${vendor.city }</td>
															<td>${vendor.bank_account }</td>
															<td>${vendor.ifsc }</td>
															<td>${vendor.payment_terms }</td>
															<td>${vendor.bank_identifier }</td>
															<td>${vendor.contact }</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- -------------------------------------------------------------- -->
				<!-- End PAge Content -->
				<!-- -------------------------------------------------------------- -->
			</div>

			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- footer -->
			<!-- ============================================================== -->
			<footer class="footer text-center"> All Rights Reserved by
				Ozai. </footer>
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
	<!--This page plugins -->
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
	<!-- start - This is for export functionality only -->
	<script
		src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
	<script>
		$('document').ready(function() {
			$('#tenants').DataTable({
				"paging" : true
			});
			$("#vendor-form").submit(function(event) {
				event.preventDefault();
				saveVendor();
			});

			$("#product-form").submit(function(event) {
				event.preventDefault();
				saveProduct();
			});

		});
		function saveVendor() {
			var formData = $("#vendor-form").serialize();
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/addVendor",
				data : formData,
				//contentType: "text/json; charset=utf-8",
				//dataType: "json",
				timeout : 100000,
				beforeSend : function() {
					$(".loading").show();
				},
				success : function(data) {

					console.log("SUCCESS: ", data);

					if (data == 'success') {
						$('#onSuccess').click();
					} else if (data == 'error') {
						$('#errorMsg').click();
					} else if (data == 'empty') {
						$('#emptyMsg').click();
					} else if (data == 'already-updated') {
						$('#alreadyMsg').click();
					}
					$("#send1").button('reset');
				},
				error : function(e) {
					console.log("ERROR: ", e);
					bootbox.alert(e);
					$("#send1").button('reset');
				},
				done : function(e) {
					console.log("DONE");
					$("#send1").button('reset');

				}
			});
		}
		function saveProduct() {
			var formData = $("#product-form").serialize();
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/addProduct",
				data : formData,
				//contentType: "text/json; charset=utf-8",
				//dataType: "json",
				timeout : 100000,
				beforeSend : function() {
					$(".loading").show();
				},
				success : function(data) {

					console.log("SUCCESS: ", data);

					if (data == 'success') {
						$('#onSuccess').click();
					} else if (data == 'error') {
						$('#errorMsg').click();
					} else if (data == 'empty') {
						$('#emptyMsg').click();
					} else if (data == 'already-updated') {
						$('#alreadyMsg').click();
					}
					$("#send2").button('reset');
				},
				error : function(e) {
					console.log("ERROR: ", e);
					bootbox.alert(e);
					$("#send2").button('reset');
				},
				done : function(e) {
					console.log("DONE");
					$("#send2").button('reset');

				}
			});
		}
	</script>
	<script>
		$('document').ready(function() {
			$('.sidebartoggler').toggle();
		});
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