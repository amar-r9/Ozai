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
<meta name="description" content="Tikaana Admin Dashboard" />
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
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
.error .help-block {
	width: max-content;
}

.chooseFrom {
	border-radius: 50%;
	border-color: #94b9de !important;
}
.img-circle {
	border-radius: 50%;
	background: #00000012;
    padding: 15px;
}
.chechedClass {
}

[type=radio] {
	position: absolute;
	opacity: 0;
}
</style>
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
					<div class="col-5 align-self-center">
						<h4 class="page-title">Rules</h4>
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
							<div class="card">
								<div class="card-header text-center">
									Hostel Premier League rules for Guest Registration
								</div>
								<div class="card-body">
									<p>This is a doubles tournament. We have both men’s and women’s tournament. There is NO registration fees.</p>
									<h6>Terms and conditions to participate in the tournament :</h6>
									<ol>
										<li>
											<p>Both the teammates should register on the following app :</p>
											<img src="<%=request.getContextPath() %>/assets/img/qr1.png" />
										</li>
										<li>Both the teammates should be residents of the same hostel before 15th Feb, 2023.</li>
										<li>
											<p>Your hostel owner should be a registered member of the Ozai Operator app. Ozai Operator
												app can be downloaded here :</p>
											<img src="<%=request.getContextPath() %>/assets/img/qr2.png" />
										</li>
										<li>We will inform the schedule of the tournament through SMS and Email. Please check your
											messages and emails for updates.</li>
										<li>We will provide shuttle cocks, but you will have to get your own shoes, racquets and any
											other items needed by you.</li>
										<li>Organizers and Judges decision will be final in all aspects.</li>
										<li>Please carry valid ID proof and hostel membership proof.</li>																					
									</ol>
									<div class="text-center">
										<b>raghu@ozailiving.com | +91 79977 62999</b>
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
			<button type="button"
				class="btn btn-light-success
	        	text-success font-weight-medium
	            btn-lg px-4 fs-4 font-weight-medium"
				data-bs-toggle="modal" id="onSuccess" style="display: none;"
				data-bs-target="#al-success-alert">Success Alert</button>
			<div class="modal fade" id="al-success-alert" tabindex="-1"
				aria-labelledby="vertical-center-modal" aria-hidden="true">
				<div class="modal-dialog modal-sm">
					<div
						class="
		                  modal-content modal-filled
		                  bg-light-success
		                  text-success">
						<div class="modal-body p-4">
							<div class="text-center text-success">
								<i data-feather="check-circle" class="fill-white feather-lg"></i>
								<h4 class="mt-2 text-success">Thank You!</h4>
								<p class="mt-3 text-success-50">Details have been submitted.
								</p>
								<button type="button" class="btn btn-light my-2"
									data-bs-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
			</div>

			<button type="button"
				class="
                btn btn-light-warning
                text-warning
                font-weight-medium
                btn-lg
                px-4
                fs-4
                font-weight-medium"
				id="errorMsg" data-bs-toggle="modal" style="display: none;"
				data-bs-target="#al-warning-alert">Warning Alert</button>

			<!-- Vertically centered modal -->
			<div class="modal fade" id="al-warning-alert" tabindex="-1"
				aria-labelledby="vertical-center-modal" aria-hidden="true">
				<div class="modal-dialog modal-sm">
					<div class="modal-content modal-filled bg-light-warning">
						<div class="modal-body p-4">
							<div class="text-center text-warning">
								<i data-feather="alert-octagon" class="fill-white feather-lg"></i>
								<h4 class="mt-2">Soory</h4>
								<p class="mt-3">Submission failed, Please try again later.</p>
								<button type="button" class="btn btn-light my-2"
									data-bs-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
			</div>

			<button type="button"
				class="
                btn btn-light-danger
                text-danger
                font-weight-medium
                btn-lg
                px-4
                fs-4
                font-weight-medium"
				style="display: none;" data-bs-toggle="modal" id="emptyMsg"
				data-bs-target="#al-danger-alert">Danger Alert</button>

			<!-- Vertically centered modal -->
			<div class="modal fade" id="al-danger-alert" tabindex="-1"
				aria-labelledby="vertical-center-modal" aria-hidden="true">
				<div class="modal-dialog modal-sm">
					<div class="modal-content modal-filled bg-light-danger">
						<div class="modal-body p-4">
							<div class="text-center text-danger">
								<i data-feather="x-octagon" class="fill-white feather-lg"></i>
								<h4 class="mt-2">Oh snap!</h4>
								<p class="mt-3">Please fill in all the fields to submit.</p>
								<button type="button" class="btn btn-light my-2"
									data-bs-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
			</div>
			<!-- ============================================================== -->

			<button type="button"
				class="
                btn btn-light-danger
                text-danger
                font-weight-medium
                btn-lg
                px-4
                fs-4
                font-weight-medium"
				style="display: none;" data-bs-toggle="modal" id="alreadyMsg"
				data-bs-target="#al-danger-alert1">Danger Alert</button>

			<!-- Vertically centered modal -->
			<div class="modal fade" id="al-danger-alert1" tabindex="-1"
				aria-labelledby="vertical-center-modal" aria-hidden="true">
				<div class="modal-dialog modal-sm">
					<div class="modal-content modal-filled bg-light-danger">
						<div class="modal-body p-4">
							<div class="text-center text-danger">
								<i data-feather="x-octagon" class="fill-white feather-lg"></i>
								<h4 class="mt-2">Oh snap!</h4>
								<p class="mt-3">This payment details are already been
									updated.</p>
								<button type="button" class="btn btn-light my-2"
									data-bs-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
			</div>
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- footer -->
			<!-- ============================================================== -->
			<footer class="footer text-center">All Rights Reserved by
				Ozai.</footer>
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
		src="<%=request.getContextPath()%>/new/assets/extra-libs/jqbootstrapvalidation/validation.js"></script>
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