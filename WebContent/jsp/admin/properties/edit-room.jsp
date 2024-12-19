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
<meta name="description" content="Tikaana Admin Dashboard " />
<meta name="robots" content="noindex,nofollow" />
<title>Ozai Admin Dashboard</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/new/assets/images/favicon.png" />
<!-- This page plugin CSS -->
<link
	href="<%=request.getContextPath()%>/new/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css"
	rel="stylesheet" />
<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/new/dist/css/style.min.css"
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
					<div class="col-5 col-ms-5 col-sm-12 col-12 align-self-center">
						<h4 class="page-title">Edit Room</h4>
					</div>
					<div class="col-7 align-self-center d-none d-lg-block">
						<div class="d-flex align-items-center justify-content-end">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a
										href="<%=request.getContextPath()%>/admin">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">
										Room Details</li>
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
				<!-- File export -->
				<div class="row">
					<div class="col-9 col-md-9 col-sm-12 col-12">
						<!-- ---------------------
                            start File export
                        ---------------- -->

						<div class="card card-body text-center"
							style="border-radius: 10px; box-shadow: 2px 2px 2px 2px #c7c4d7;">
							<span class="fw-bold">${room.property.name }</span> <i
								class="bi bi-door-closed fa-2x text-info"></i> <span><span
								class="text-muted">Room no:</span> ${room.room_no }</span>
						</div>

						<div id="openForm"
							class="card bg-success text-white w-100 card-hover"
							style="box-shadow: 3px 3px 3px !important;">
							<div class="card-body">
								<div class="d-flex align-items-center">
									<span class="display-6 fw-bold">${room.sharing }</span>
									<div class="ms-auto">
										<i data-feather="arrow-right" class="fill-white"></i>
									</div>
								</div>
								<div class="mt-4">
									<h4 class="card-title mb-1 fw-bold text-white">Sharing</h4>
									<h6 class="card-text fw-normal text-white">Click here
										to change sharing.</h6>
								</div>
							</div>
						</div>

						<div class="card card-body" id="sharingForm"
							style="display: none;">
							<span class="text-end" id="closeForm"><i
								class="fas fa-2x text-danger fa-window-close"></i></span>
							<form action="#" id="sharing-form">
								<input type="hidden" name="room_id" value="${room.id }" />
								<div class="form-group">
									<div class="mb-3 controls">
										<label class="control-label">Sharing</label> <select
											class="form-control" name="sharing" id="sharing" required>
											<option value="${room.sharing }">${room.sharing }</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
										</select>
									</div>
								</div>
								<br>
								<div class="col-12 text-center">
									<input type="submit" class="btn btn-dark" value="SUBMIT" />
								</div>
							</form>
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
	<script src="<%=request.getContextPath()%>/assets/country-state.js"></script>
	<!-- Template Main JS File -->
	<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
	<script>
		$('document').ready(function() {
			$('#openForm').click(function() {
				$('#sharingForm').slideDown();
			});
			$('#closeForm').click(function() {
				$('#sharingForm').slideUp();
			});
		});
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
	<script>
		$('document').ready(function() {
			$("#sharing-form").submit(function(event) {
				event.preventDefault();
				saveVacateNotice();
			});
		});
		function saveVacateNotice() {
			var formData = $("#sharing-form").serialize();
			$
					.ajax({
						type : "POST",
						url : "${pageContext.request.contextPath}/mobile/sendVacateNotice",
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
								$('#vacateForm').hide();
								$('#error-alert').empty();
								$('#error-alert')
										.html(
												'<div class=\"alert alert-success\">Vacate notice has been sent.</div>');
							} else if (data == 'error') {
								$('#error-alert').empty();
								$('#error-alert')
										.html(
												'<div class=\"alert alert-warning\">Technical error, Please try later.</div>');
							} else if (data == 'invalid') {
								$('#error-alert').empty();
								$('#error-alert')
										.html(
												'<div class=\"alert alert-danger\">You can only select the date after 15 days.</div>');
							}
							$("#send").button('reset');
						},
						error : function(e) {
							console.log("ERROR: ", e);
							bootbox.alert(e);
							$("#send").button('reset');
						},
						done : function(e) {
							console.log("DONE");
							$("#send").button('reset');

						}
					});
		}
	</script>
</body>
</html>
