<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<title>Transport | Ozai Admin Dashboard</title>
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
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/new/assets/libs/select2/dist/css/select2.min.css" />
<style type="text/css">
body {
	font-size: 0.8rem;
	font-weight: 600;
}

small {
	font-size: .775em;
	font-weight: 500;
}
.small {
	font-size: .375em;
	vertical-align: middle;
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
		<jsp:include page="/common/lctheader.jsp"></jsp:include>
		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<jsp:include page="/common/lctsidebar.jsp"></jsp:include>
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
					<div class="col-12 align-self-center">
						<h4 class="page-title">Transport</h4>
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
				<div class="col-12">
					<div class="card" style="border-radius: 10px;">
						<div class="card-body">
							<button class="btn-lg btn btn-info w-100" id="openForm">ADD
								ROUTE</button>
							<form action="#" method="post" role="form" id="route-form"
								class="php-email-form" style="display: none;">
								<div class="card-body">
									<h4 class="card-title"></h4>
									<div class="row pt-3">
										<div class="col-md-6 col-sm-12 col-12">
											<div class="mb-3">
												<label class="control-label">Pick Up Point</label> <input
													type="text" id="pickup" name="pickup" class="form-control"
													placeholder="Enter Pick Up Point" required />
											</div>
										</div>
										<!--/span-->
										<div class="col-md-6 col-sm-12 col-12">
											<div class="mb-3">
												<label class="control-label">Drop off Point</label> <input
													type="text" id="dropoff" name="dropoff"
													class="form-control" placeholder="Enter Drop off Point"
													required />
											</div>
										</div>
										<div class="col-md-6 col-sm-12 col-12">
											<div class="mb-3">
												<label class="control-label">Boarding Date</label> <input
													type="date" id="date" name="date" class="form-control"
													required />
											</div>
										</div>
										<div class="col-md-6 col-sm-12 col-12">
											<div class="mb-3">
												<label class="control-label">Boarding Time</label> <input
													type="time" id="time" name="time" class="form-control"
													required />
											</div>
										</div>
										<div class="col-md-6 col-sm-12 col-12">
											<div class="mb-3">
												<label class="control-label">Available Seats</label> <input
													type="number" id="seats" name="seats" class="form-control"
													required />
											</div>
										</div>

										<input type="hidden" name="client_code"
											value="${ClientUser.client_code }" />
									</div>
									<!--/row-->

								</div>
								<hr />
								<div class="form-actions">
									<div class="card-body border-top">
										<button id="send" type="submit"
											class="btn btn-success rounded-pill px-4">
											<div class="d-flex align-items-center">
												<i data-feather="save" class="feather-sm me-1 fill-icon"></i>
												Save
											</div>
										</button>
										<button type="button" id="closeForm"
											class="btn btn-danger rounded-pill px-4 ms-2 text-white ">
											Cancel</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-12">
					<c:choose>
						<c:when test="${not empty trips }">
							<c:forEach items="${trips }" var="trip">
            					<div class="card card-body" style="background: #e8e8e8ee; color: #393939; 
									box-shadow: 5px 5px 5px #c7c4d7; border-radius: 10px;">
									<div class="row">
										<div class="col-3">
											<small class="text-muted"><fmt:formatDate value="${trip.date }" pattern="MMM dd, yyyy"/></small></div>
										<div class="col-6 text-center">
											<small>${trip.time } AM</small>
										</div>
										<div class="col-3">
											<a href="<%=request.getContextPath() %>/lct/properties/trip-bookings/${trip.id }"
												class="badge bg-success">Bookings</a>
										</div>
									</div>
									<div class="row">
										<div class="col-3">${trip.pickup }</div>											
										<div class="col-6 text-center">
											<i class="fas fa-circle small"></i> ----------- <i class="fa fa-bus text-success"></i> ----------- <i class="small fas fa-circle"></i>
										</div>
										<div class="col-3 text-end">${trip.dropoff }</div>
									</div>
									<div class="row">
										<div class="col-3">
											<small class="text-muted">
												
											</small>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<h4>There are no active trips.</h4>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- -------------------------------------------------------------- -->
				<!-- End PAge Content -->
				<!-- -------------------------------------------------------------- -->
			</div>
			<!-- ============================================================== -->
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
                  text-success
                ">
				<div class="modal-body p-4">
					<div class="text-center text-success">
						<i data-feather="check-circle" class="fill-white feather-lg"></i>
						<h4 class="mt-2 text-success">Thank You!</h4>
						<p class="mt-3 text-success-50">Trip has been added.
						</p>
						<button type="button" class="btn btn-light my-2"
							data-bs-dismiss="modal" id="reloadNow">Close</button>
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
                        font-weight-medium
                      "
		id="errorMsg" data-bs-toggle="modal" style="display: none;"
		data-bs-target="#al-warning-alert">
		Warning Alert</button>

	<!-- Vertically centered modal -->
	<div class="modal fade" id="al-warning-alert" tabindex="-1"
		aria-labelledby="vertical-center-modal" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content modal-filled bg-light-warning">
				<div class="modal-body p-4">
					<div class="text-center text-warning">
						<i data-feather="alert-octagon" class="fill-white feather-lg"></i>
						<h4 class="mt-2">Sorry</h4>
						<p class="mt-3">Submission failed, Please try again later.</p>
						<button type="button" class="btn btn-light my-2"
							data-bs-dismiss="modal">
							Close</button>
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
		data-bs-target="#al-danger-alert">
		Danger Alert</button>

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
							data-bs-dismiss="modal">
							Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
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
	<script>
		$('document').ready(function() {
			$('#openForm').click(function() {
				$('#route-form').slideDown();
			});
			$('#closeForm').click(function(){
				$('#route-form').slideUp();
			});
			$("#route-form").submit(function(event) {
				event.preventDefault();
				saveEnquiry();
			});
			$('#reloadNow').click(function(){
				location.reload();
			});
		});
		function saveEnquiry() {
			var formData = $("#route-form").serialize();
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/lct/saveRoute",
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