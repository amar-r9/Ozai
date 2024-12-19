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
		background-color: transparent;
		border-radius: 20px;
		
	}

    #profilepic {
        width: 100px; /* Fixed width */
        height: 100px; /* Fixed height */
        object-fit: cover; /* Ensures the image covers the entire container without stretching */
        border-radius: 50%; /* Makes the image appear as a circle */
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
		<a href="<%=request.getContextPath()%>/mobile"
			class="card pt-2 bg-light" id="back1"
			style="z-index: 100; margin-bottom: 50px; top: 60px; position: fixed; width: 100%; border-radius: unset; box-shadow: none;">
			<i class="bi bi-arrow-left fa-2x text-secondary"
			style="vertical-align: bottom;"></i>
		</a>
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper" style="margin-top: 150px !important;">

			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid mt-n4">
				<!-- -------------------------------------------------------------- -->
				<!-- Start Page Content -->
				<!-- -------------------------------------------------------------- -->
				<!-- basic table -->

				<div class="card" >
					<div class="card-body border-bottom"
						style="background: #f4f1ed; border-radius: 20px; box-shadow: 5px 5px 5px #c7c4d7; margin-bottom: 20px;">
						<div class="row">
							<div>
								<c:if test="${not empty User }">
									<div class="text-center">
										<img alt="Profile Picture"
										src="<%=request.getContextPath()%>/resources/DisplayUserProfileImage"
										class="img-circle img-thumbnail" id="profilepic">
										<h4 class="card-title mt-2 fw-bold text-dark" style="font-size: 17px;">${User.name }</h4>
										<font class="font-weight-small" style="font-size: 15px;"> ${User.city } </font>

									</div>
								</c:if>
							</div>
						</div>
					</div>
					<div class="card-body border-bottom"
							style="background: #f4f1ed; border-radius: 20px; box-shadow: 5px 5px 5px #c7c4d7">
						<div class="row mt-4">
							<c:choose>
								<c:when
									test="${User.is_resident eq 'YES' && User.resident_type eq 'B2C' }">
									<div class="col border-end text-center">
										<h3 class="text-info">${details.room.room_no }</h3>
										<h6>Room</h6>
									</div>
									<div class="col border-end text-center">
										<h3 class="text-success">${details.property.name }</h3>
										<h6>Property</h6>
									</div>
									<div class="col text-center">
										<h3 class="text-warning">${details.rent }</h3>
										<h6>Rent</h6>
									</div>
								</c:when>
								<c:when
									test="${User.is_resident eq 'YES' && User.resident_type eq 'B2B' }">
									<div class="col border-end text-center">
										<h3 class="text-info">${details.room.room_no }</h3>
										<h6>Room</h6>
									</div>
									<div class="col border-end text-center">
										<h3 class="text-success">${details.property.name }</h3>
										<h6>Property</h6>
									</div>
									<div class="col text-center">
										<h3 class="text-warning">${details.employ_id }</h3>
										<h6>Employ id</h6>
									</div>
								</c:when>
								<c:otherwise>
									<div class="col border-end text-center">
										<h3 class="text-info">${User.country }</h3>
										<h6>Country</h6>
									</div>
									<div class="col border-end text-center">
										<h3 class="text-success">${User.state }</h3>
										<h6>State</h6>
									</div>
									<div class="col text-center">
										<h3 class="text-warning">${User.city }</h3>
										<h6>City</h6>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="earnings-month mt-1"></div>
					<div class="card-body">
						<div class="row pb-3" style="font-size: 17px; color: #000;">
							<a class="text-dark" style="font-weight: 600;"
								href="<%=request.getContextPath()%>/mobile/user/edit"> <span
								class="btn btn-circle btn btn-light-success"><i
									class="far fa-user"></i></span> <span class="ps-2">Edit Profile</span>
								<span style="float: right;"><i class="fas fa-angle-right"></i></span>
							</a>
						</div>
						<div class="row pb-3 pt-2" style="font-size: 17px; color: #000;">
							<a class="text-dark" style="font-weight: 600;"
								href="<%=request.getContextPath()%>/mobile/user/notifications/list">
								<span class="btn btn-circle btn btn-light-success"><i
									class="far fa-bell"></i></span> <span class="ps-2">Notifications</span>
								<span style="float: right;"><i class="fas fa-angle-right"></i></span>
							</a>
						</div>
						<c:if
							test="${User.is_resident eq 'YES' && User.resident_type eq 'B2C' }">
							<div class="row pb-3 pt-2" style="font-size: 17px; color: #000;">
								<a class="text-dark" style="font-weight: 600;"
									href="<%=request.getContextPath()%>/mobile/user/pending-payments">
									<span class="btn btn-circle btn btn-light-success"><i
										class="fa fa-rupee-sign"></i></span> <span class="ps-2">Payments</span>
									<span style="float: right;"><i
										class="fas fa-angle-right"></i></span>
								</a>
							</div>
						</c:if>
						<div class="row pb-3 pt-2" style="font-size: 17px; color: #000;">
							<a class="text-dark" style="font-weight: 600;"
								href="<%=request.getContextPath()%>/mobile/user/notifications/list"
								data-bs-toggle="modal" data-bs-target="#vertical-center-modal">
								<span class="btn btn-circle btn btn-light-success"><i
									class="fas fa-clipboard-list"></i></span> <span class="ps-2">Rental
									Agreement</span> <span style="float: right;"><i
									class="fas fa-angle-right"></i></span>
							</a>
						</div>
						<div class="row pb-3 pt-2" style="font-size: 17px; color: #000;">
							<a class="text-dark clearSession" onclick="clearCookie()" style="font-weight: 600;"
								href="#"> <span
								class="btn btn-circle btn btn-light-success"><i
									class="fas fa-sign-in-alt"></i></span> <span class="ps-2">Log
									Out</span> <span style="float: right;"><i
									class="fas fa-angle-right"></i></span>
							</a>
						</div>
						
						<div class="row pb-3 pt-2" style="font-size: 17px; color: #000;">
							<a class="text-dark" style="font-weight: 600;" onclick="clearCookie1()"
								href="#"> <span
								class="btn btn-circle btn btn-light-danger"><i
									class="fa fa-minus"></i></span> <span class="ps-2">Delete
									Account</span> <span style="float: right;"><i
									class="fas fa-angle-right"></i></span>
							</a>
						</div>
						
					</div>
				</div>
				
				
				<div class="card" style="background: #FFF; border-radius: 10px;">
	           		<div class="card-body">
	           			<h4>Badges
	           				<span style="float: right;">
	           					<a href="<%=request.getContextPath() %>/mobile/user/badges">View all</a>
	           				</span>
	           			</h4>
	           			<div class="row">
	           				<c:forEach items="${badges }" var="badge">
	            				<div class="col-4">
	            					<img src="<%=request.getContextPath() %>/assets/images/badges/${badge.title}.jpg"
	            						style="width: 100px;" />
	            					<div class="text-center">
	            						<p class="mb-0" style="font-weight: 700;">${badge.title }</p>
	            						<small class="text-center">${badge.month }</small>
	            					</div>
	            				</div>
	            			</c:forEach>
	           			</div>
	           		</div>
	           	</div>
				
				
				<c:choose>
					<c:when test="${underNotice eq true }">
						<div class="alert alert-info">You are under notice period.</div>
					</c:when>
					<c:otherwise>
						<div id="error-alert"></div>
						<button id="showVacateForm" class="btn btn-lg btn-outline-primary w-100">
							SEND VACATE NOTICE &nbsp;&nbsp; <i class="fas fa-angle-down"></i>
						</button>
						<hr>
						<div class="card card-body" id="vacateForm" style="display: none;">
							<span class="text-end" id="closeForm"><i
								class="fas fa-2x text-danger fa-window-close"></i></span>
							<form action="#" id="vacate-form">
								<input type="hidden" name="user_id" value="${User.id }" /> <input
									type="date" class="form-control" name="vacate_date"
									value="${vacateDate }" /> <br>
								<div class="col-12 text-center">
									<input type="submit" class="btn btn-dark" value="SUBMIT" />
								</div>
							</form>
						</div>
						<hr>
					</c:otherwise>
				</c:choose>





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
	<script>
		$('document').ready(function() {
			$('.clearSession').click(function(){
				clearCookie();
			});
		});		
		function clearCookie() {
			localStorage.clear();
			window.location.href = "<%=request.getContextPath() %>/logout";
		}
		function clearCookie1() {
			localStorage.clear();
			window.location.href = "<%=request.getContextPath() %>/mobile/user/delete-account";
		}
</script>
</body>
</html>