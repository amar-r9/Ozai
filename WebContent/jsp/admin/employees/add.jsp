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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/js/standalone/selectize.min.js" integrity="sha256-+C0A5Ilqmu4QcSPxrlGpaZxJ04VjsRjKu+G82kl5UJk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/css/selectize.bootstrap3.min.css" integrity="sha256-ze/OEYGcFbPRmvCnrSeKbRTtjG4vGLHXgOqsyLFTRjg=" crossorigin="anonymous" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
.form-control {
	border-radius: 20px !important;
	border: 1px solid #000 !important;
}
.select2 {
	border-radius: 20px !important;
	border: 1px solid #000 !important;
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
					<div class="col-5 align-self-center">
						<h4 class="page-title"></h4>
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
            		<div class="col-md-12 col-12">
            			<div class="row">
							<div class="col-4 text-start">
								<a href="<%=request.getContextPath()%>/admin/employees/list">
									<div class="card card-body bg-info text-white" style="border-radius: 10px;">
										<i class="fas fa-users fa-2x"></i><br>
										<small>Employ List</small>
									</div>
								</a>
							</div>
							<div class="col-4">
								<a href="<%=request.getContextPath()%>/admin/employees/salary-list">
									<div class="card card-body bg-warning text-white" style="border-radius: 10px;">
										<i class="fas fa-rupee-sign fa-2x"></i><br>
										<small>Pay Salary</small>
									</div>
								</a>
							</div>
							<div class="col-4">
								<a href="<%=request.getContextPath()%>/admin/employees/salary-paid">
									<div class="card card-body bg-danger text-white" style="border-radius: 10px;">
										<i class="fas fa-rupee-sign fa-2x"></i><br>
										<small>Paid Salary</small>
									</div>
								</a>
							</div>
						</div>
						<div class="card card-header bg-info" style="border-radius: 10px;">
							<h4 class="text-center text-white fw-bold">ADD EMPLOY</h4>
						</div>
						<div class="card" style="border-radius: 10px;">
							<div class="card-body ">
								<c:choose>
									<c:when test="${AdminUser.access_level eq 1 }">
										<form action="#" method="post" role="form" id="employ-form"
											class="php-email-form p-0">
											<div class="row">
												<div class="mb-3">
													<label class="control-label">First Name</label> <input
														class="form-control" type="text" name="first_name" id="first_name"
														required />
												</div>
												<div class="mb-3">
													<label class="control-label">Last Name</label> <input
														class="form-control" type="text" name="last_name" id="last_name"
														required />
												</div>
												<div class="mb-3">
													<label class="control-label">Mobile</label> <input
														class="form-control" type="text" name="mobile" minlength="6" maxlength="10"
														id="mobile" required />
												</div>
												<input type="hidden" name="admin_id" value="${AdminUser.client_code }" />
												<div class="mb-3">
													<label class="control-label">Email</label>
													<input
														class="form-control" type="email" name="email" id="email"
														required />
												</div>
												<div class="mb-3">
													<label class="control-label">Job Role</label> 
													<input type="text"
														class="form-control" name="role" id="role"
														required />
												</div>
												<div class="mb-3">
													<label class="control-label">Property</label>
													<select name="property" id="select-state"
														required class="form-control form-select"
														style="width: 100%;"
														data-placeholder="Choose a Property">
														<option value="">Select Property</option>
														<c:forEach items="${properties }" var="property">
															<option value="${property.id }">${property.name }
																--- ${property.location} --- ${property.city } ---
																 ${property.gender }</option>
														</c:forEach>
													</select>
												</div>
												<div class="mb-3">
													<label class="control-label">Salary</label> <input minlength="3"
														class="form-control" type="text" name="salary"
														id="salary" required />
												</div>
												<div class="mb-3">
													<label class="control-label">PAN</label> <input minlength="5"
														class="form-control text-uppercase" type="text" name="pan" id="pan"
														required />
												</div>
												<div class="mb-3">
													<label class="control-label">Account No.</label> <input minlength="3"
														type="text" name="account" id="account" class="form-control"
														required />
												</div>
											</div>
											<!--/row-->
											<div class="row pt-3">
												<div class="col-md-12">
													<div class="mb-3">
														<label class="control-label">IFSC</label> <input minlength="3"
															class="form-control text-uppercase" type="text"
															name="ifsc" id="ifsc" required />
													</div>
												</div>
												<!--/span-->
												<div class="col-md-12">
													<div class="mb-3">
														<label class="control-label">Join Date</label> 
														<input class="form-control text-uppercase" type="date"
															name="join_date" id="join_date" required />
													</div>
												</div>
												<!--/span-->
												<div class="col-md-12">
													<div class="mb-3">
														<label class="control-label">Employ ID</label> <input
															class="form-control" type="text" name="employ_id"
															id="employ_id" required />
													</div>
												</div>
												<div class="col-md-12">
													<div class="mb-3">
														<label class="control-label">Bank Identifier</label> <input
															class="form-control" type="text" name="identifier"
															id="identifier" required />
													</div>
												</div>
											</div>
											<!--/row-->
											
											<div class="form-actions">
												<div class="card-body border-top text-center">
													<button type="submit" id="send1"
														class="btn btn-dark btn-lg rounded-pill px-4">
														<div class="d-flex align-items-center">
															<i data-feather="save" class="feather-sm me-1 fill-icon"></i>
															Save
														</div>
													</button>
												</div>
											</div>
										</form>
									</c:when>
									<c:otherwise>
										You do not have access to this.
									</c:otherwise>
								</c:choose>
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
				data-bs-target="#al-warning-alert">Warning
				Alert</button>

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
									data-bs-dismiss="modal">Close
								</button>
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
				data-bs-target="#al-danger-alert">Danger
				Alert</button>

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
									data-bs-dismiss="modal">Close
								</button>
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
				data-bs-target="#al-danger-alert1">Danger
				Alert</button>

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
									data-bs-dismiss="modal">Close
								</button>
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
			<footer class="footer text-center"> All Rights Reserved by
				Ozai Living Private Limited. </footer>
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
	<script
		src="<%=request.getContextPath()%>/new/dist/js/app.init.js"></script>
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
	<script>
		$('document').ready(function() {
			$("#employ-form").submit(function(event) {
				event.preventDefault();
				saveEmploy();
			});

		});
		function saveEmploy() {
			var formData = $("#employ-form").serialize();
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/addEmploy",
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
						$("#employ-form").reset();
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
					alert(e);
					$("#send1").button('reset');
				},
				done : function(e) {
					console.log("DONE");
					$("#send1").button('reset');

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