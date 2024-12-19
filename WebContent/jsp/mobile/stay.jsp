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
			class="card pt-2 ps-2" id="back1"
			style="background: #2c3c4c; z-index: 100; margin-bottom: 50px; top: 60px; position: fixed; width: 100%; border-radius: unset; box-shadow: none;">
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
				<div style="background: #F4F1ED; border-radius: 20px;"
					class="card card-body align-items-center m-2">
					<div>
						
					</div>
					<p>It is important that you know who the residents and staff in your accommodation are. Check out the verified list.</p>
					<div class="row">
						<div class="col-6 text-start">
								<a
									href="<%=request.getContextPath() %>/mobile/user/residents/list"
									class="btn btn-dark">Residents</a>
						</div>
						<div class="col-6 text-end">
							<a href="<%=request.getContextPath() %>/mobile/user/staff/list"
								class="btn btn-dark">Staff</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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