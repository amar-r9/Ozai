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
	content="Nice is powerful and clean admin dashboard template, inpired from Google's Material Design" />
<meta name="robots" content="noindex,nofollow" />
<title>User Details | Ozai</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/new/assets/images/favicon.png" />
<!-- This page css -->
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
.card {
	box-shadow: 2px 2px 2px #c7c4d7;
	border-radius: 10px;
}
p {
	color: #000;
	overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
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
		<jsp:include page="/common/mobileheader.jsp"></jsp:include>
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper" style="display: block;">
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid mt-n4" style="padding: 0px !important;">
				<!-- -------------------------------------------------------------- -->
				<!-- Start Page Content -->
				<!-- -------------------------------------------------------------- -->
				<!-- basic table -->
				<div class="card" style="box-shadow: unset;">
					<div class="card-body border-bottom"
						style="background: #fff9ea; border-top-left-radius: 10px; border-top-right-radius: 10px;">
						<div class="row">
							<div>
								<c:if test="${not empty User }">
									<div class="text-center">
										<img
											src="<%=request.getContextPath()%>/resources/DisplayUserProfileImage"
											class="rounded-circle" width="120">
										<h4 class="card-title mt-2 fw-bold text-dark">${User.name }</h4>
										<font class="font-weight-small"> ${User.city } </font>

									</div>
								</c:if>
							</div>
						</div>
					</div>
					<div class="alert border-bottom">
						<div class="row">
							<h5 class="col-8 text-dark fw-bold">PROFILE</h5>
							<span class="col-4 text-end">
								<a href="<%=request.getContextPath() %>/mobile/user/edit"
									class="btn btn-sm btn-info">Edit</a>
							</span>
						<div class="row">
							<div class="col-6">
								<small class="text-muted mb-0">Name</small>
								<p>${user.name }</p>
								<small class="text-muted mb-0">Mobile</small>
								<p>${user.mobile }</p>
								<small class="text-muted mb-0">Email</small>
								<p class="">${user.email }</p>
								<small class="text-muted mb-0">DOB</small>
								<p class="">
									${user.dob }
								</p>
								<small class="text-muted mb-0">Language</small>
								<p class="mb-0">${user.language }</p>								
							</div>
							<div class="col-6">
								<small class="text-muted mb-0">City</small>
								<p>${user.city }</p>								
								<small class="text-muted mb-0">State</small>
								<p>${user.state }</p>								
								<small class="text-muted mb-0">Company</small>
								<p class="">${user.company }</p>
								<small class="text-muted mb-0">Qualification</small>
								<p class="">${user.qualification }</p>
								<small class="text-muted mb-0">Food Preference</small>
								<p class="mb-0">${user.food_preferences }</p>
							</div>
						</div>
					</div>
					<div class="alert mb-0 pb-0">
						<h6 class="text-dark fw-bold">Interests</h6>
						<div class="card-body mt-0 pt-0">
							<c:if test="${user.sports eq 1 }">
								<label class="btn btn-outline-info btn-rounded btn-sm" style="width: auto;">Sports</label>
							</c:if>
							<c:if test="${user.movies eq 1 }">
								<label class="btn btn-outline-info btn-rounded btn-sm" style="width: auto;">Movies</label>
							</c:if>
							<c:if test="${user.arts eq 1 }">
								<label class="btn btn-outline-info btn-rounded btn-sm" style="width: auto;">Arts</label>
							</c:if>
							<c:if test="${user.news eq 1 }">
								<label class="btn btn-outline-info btn-rounded btn-sm" style="width: auto;">News</label>
							</c:if>
							<c:if test="${user.technology eq 1 }">
								<label class="btn btn-outline-info btn-rounded btn-sm" style="width: auto;">Technology</label>
							</c:if>
						</div>
					</div>
					<c:choose>
						<c:when test="${user.is_resident eq 'YES' }">
							<h6 class="bg-warning text-white text-center">REGISTERED AS ${user.resident_type } RESIDENT</h6>
							<div class="alert">
								<h5 class="text-dark fw-bold">DETAILS</h5>
								<div class="row">
									<div class="col-6">
										<small class="text-muted mb-0">Property</small>
										<p>${details.property.name }</p>
										<small class="text-muted mb-0">Room</small>
										<p>${details.room.room_no }</p>
										<small class="text-muted mb-0">Bed</small>
										<p class="mb-0">${details.bed.bed_no }</p>								
									</div>
									<div class="col-6">
										<c:choose>
											<c:when test="${user.resident_type eq 'B2C' }">
												<small class="text-muted mb-0">Rent</small>
												<p>${details.rent }</p>								
												<small class="text-muted mb-0">Sharing</small>
												<p>${details.sharing }</p>								
												<small class="text-muted mb-0">Job</small>
												<p class="mb-0">${user.job_role }</p>											
											</c:when>
											<c:otherwise>
												<small class="text-muted mb-0">Work site</small>
												<p>${details.worksite }</p>								
												<small class="text-muted mb-0">Sharing</small>
												<p>${details.sharing }</p>								
												<small class="text-muted mb-0">Employ ID</small>
												<p class="mb-0">${details.employ_id }</p>											
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
						
						</c:otherwise>
					</c:choose>								
				</div>
			</div>
			
			<div class="card">
           		<div class="card-body">
           			<h4>Badges
           				<span style="float: right;">
           					<a href="<%=request.getContextPath() %>/mobile/badges">View all</a>
           				</span>
           			</h4>
           			<div class="row">
           				<c:forEach items="${badges }" var="badge">
            				<div class="col-4">
            					<img src="<%=request.getContextPath() %>/assets/images/badges/${badge.title}.jpg"
            						style="width: 100px;" />
            					<p class="text-center" style="font-weight: 700;">${badge.title }(${badge.month })</p>
            				</div>
            			</c:forEach>
           			</div>
           		</div>
           	</div>
			
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->

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
	<div class="modal fade" id="vertical-center-modal" tabindex="-1"
		aria-labelledby="vertical-center-modal" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header d-flex align-items-center">
					<h4 class="modal-title" id="myLargeModalLabel">Rental
						Agreement</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<h4></h4>
					<p></p>
					<p></p>
				</div>
				<div class="modal-footer">
					<button type="button"
						class="btn btn-light-danger
                    	text-danger font-weight-medium
                        waves-effect text-start"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- All Jquery -->
	<!-- ============================================================== -->
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/jquery/dist/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/extra-libs/taskboard/js/jquery.ui.touch-punch-improved.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/extra-libs/taskboard/js/jquery-ui.min.js"></script>
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
	<!--This page JavaScript -->
	<script
		src="<%=request.getContextPath()%>/new/dist/js/pages/notes/notes.js"></script>
	<!--This page JavaScript -->
	<script>
		$('document').ready(function() {
			$('#hideBack').hide();
			$('#showVacateForm').click(function() {
				$('#vacateForm').slideDown();
			});
			$('#closeForm').click(function() {
				$('#vacateForm').slideUp();
			});
		});
		$(function() {
			"use strict";
			$("#main-wrapper").AdminSettings({
				LogoBg : "skin6",
				HeaderPosition : true,
				Theme : false,
			});
		});
	</script>
	<script>
		$('document').ready(function() {
			$("#vacate-form").submit(function(event) {
				event.preventDefault();
				saveVacateNotice();
			});
		});
		function saveVacateNotice() {
			var formData = $("#vacate-form").serialize();
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