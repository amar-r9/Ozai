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
						<h4 class="page-title">Property Details</h4>
					</div>
					<div class="col-7 align-self-center d-none d-lg-block">
						<div class="d-flex align-items-center justify-content-end">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a
										href="<%=request.getContextPath()%>/admin">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">
										Property Details</li>
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
						<div class="card">
							<div class="border-bottom title-part-padding">
								<h4 class="card-title mb-0 text-success">${propertyDetails.name }</h4>
								<small class="text-danger">Edit/Update Property.</small>
							</div>

							<!-- Add Contact Popup Model -->

							<div class="card-body">
								<div class="justify-content-end">

									<form
										action="<%=request.getContextPath()%>/admin/updateProperty"
										id="tenant-form" method="post">
										<div class="row">
											<div class="form-group">
												<div class="mb-3 controls">
													<label class="control-label">Name</label> <input
														class="form-control" type="text" name="name" id="name"
														required value="${propertyDetails.name }" />
												</div>
											</div>
											<!--/span-->
											<div class="form-group">
												<div class="mb-3 controls">
													<label class="control-label">Location</label> <input
														class="form-control" type="text" name="location"
														minlength="3" id="location" required
														value="${propertyDetails.location }" />
												</div>
											</div>
											<div class="form-group">
												<div class="mb-3 controls">
													<label class="control-label">City</label> <input
														minlength="3" class="form-control" type="text" name="city"
														id="city" required value="${propertyDetails.city }" />
												</div>
											</div>
											<div class="form-group">
												<div class="mb-3 controls">
													<label for="register-form-repassword">Country:</label> <select
														id="country" name="country" required
														class="form-control form-select">
													</select>
												</div>
											</div>
											<div class="form-group">
												<div class="mb-3 controls">
													<label class="control-label">State</label> <select
														class="form-control form-select" name="state" id="state"
														required>
													</select>
												</div>
											</div>
											<!--/span-->
											<div class="form-group">
												<div class="mb-3 controls">
													<label class="control-label">Description</label>
													<textarea class="form-control" name="description"
														id="description" required>
														${propertyDetails.description }</textarea>
												</div>
											</div>
											<div class="form-group">
												<div class="mb-3 controls">
													<label class="control-label">Single Occupancy</label> <input
														class="form-control" type="text" name="single_share"
														id="single_share" required
														value="${propertyDetails.single_share }" />
												</div>
											</div>
											<div class="form-group">
												<div class="mb-3 controls">
													<label class="control-label">Double Occupancy</label> <input
														type="text" name="double_share" id="double_share"
														class="form-control"
														value="${propertyDetails.double_share }" />
												</div>
											</div>
											<div class="form-group">
												<div class="mb-3 controls">
													<label class="control-label">Triple Occupancy</label> <input
														class="form-control" type="text" name="triple_share"
														id="triple_share" value="${propertyDetails.triple_share }" />
												</div>
											</div>
											<!--/span-->
											<div class="form-group">
												<div class="mb-3 controls">
													<label class="control-label">Four Sharing</label> <input
														class="form-control" type="text" name="four_share"
														id="four_share" value="${propertyDetails.four_share }" />
												</div>
											</div>
											<!--/span-->
											<div class="form-group">
												<div class="mb-3 controls">
													<label class="control-label">Map Location</label> <input
														class="form-control" type="text" name="map" id="map"
														required value="${propertyDetails.map }" />
												</div>
											</div>
											<div class="form-group">
												<div class="mb-3 controls">
													<label class="control-label">Gender</label> <select
														class="form-control" name="gender" id="gender" required
														data-validation-required-message="This field is required">
														<option value="${propertyDetails.gender }">${propertyDetails.gender }</option>
														<option value="Male">Male</option>
														<option value="Female">Female</option>
														<option value="Unisex">Unisex</option>
													</select>
												</div>
											</div>
											<!--/span-->
											<div class="form-group">
												<div class="mb-3 controls">
													<label class="control-label">Client Type</label> <select
														class="form-control" name="client_type" id="client_type"
														required
														data-validation-required-message="This field is required">
														<option value="${propertyDetails.client_type }">${propertyDetails.client_type }</option>
														<option value="B2C">B2C</option>
														<option value="B2B">B2B</option>
													</select>
												</div>
											</div>
											<input type="hidden" name="status" id="status" value="OPEN" />
											<input type="hidden" name="id" id="id" value="${propertyDetails.id }" />
											<input type="hidden" name="admin_id" id="admin_id" value="${propertyDetails.admin_id }" />
											<div class="form-group">
												<div class="mb-3 controls">
													<label class="control-label">No of Rooms</label> <input
														class="form-control" type="text" name="rooms" id="rooms"
														required value="${propertyDetails.rooms }" />
												</div>
											</div>
										</div>
										<div class="form-actions">
											<div class="card-body border-top">
												<button type="submit" id="send" class="btn btn-success">SAVE</button>
											</div>
										</div>
									</form>
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
	<script src="<%=request.getContextPath()%>/assets/country-state.js"></script>
	<!-- Template Main JS File -->
	<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
	<script>
		$('document').ready(function() {
			populateCountries("country", "state");
			$('#country option:contains("${propertyDetails.country}")').prop('selected', true);
			populateStates("country", "state");
			$('#state option:contains("${propertyDetails.state}")').prop('selected', true);
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
</body>
</html>
