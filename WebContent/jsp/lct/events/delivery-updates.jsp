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
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="keywords"
	content="Loan, Loan application, easy loan, tikaana" />
<meta name="description"
	content="Please fill out the details below to apply." />
<meta name="robots" content="noindex,nofollow" />
<title>Delivery Updates | Ozai</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/new/assets/images/favicon.png" />
<!-- This page css -->
<link
	href="<%=request.getContextPath()%>/new/assets/extra-libs/toastr/dist/build/toastr.min.css"
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
				<!-- basic table -->

				<div class="row" id="formScreen">
					<div class="col-12">
						<div class="card" style="width: 100%;">
							<div class="card-body">
								<h5 class="text-dark fw-bold">Delivery Updates</h5>
								<!-- <div class="row mt-4">
									<c:if test="${ClientUser.access_level ge 2 }">
										<div class=" d-flex align-items-stretch">
											<form action="#" method="post" role="form" id="daily-form"
												class="php-email-form">
												<div class="row">
													<div class="col-md-6 mb-3">
														<div class="form-group">
															<label class="control-label">Property</label>
															<select class="form-control form-select"
							                    				style="width: 100%; height: 36px;"
												                data-placeholder="Choose a Property" name="property_id"
																id="select2-theme" required>
																<option value="">Property</option>
																<c:forEach items="${pgs }" var="pg">
																	<option value="${pg.id }">${pg.name } | ${pg.location } | ${pg.city }</option>
																</c:forEach>
															</select>
															<div class="validate"></div>
														</div>
													</div>
													<div class="col-md-6 mb-3">
														<div class="form-group">
															<label class="control-label">Source</label>
															<select name="house_keeping" id="house_keeping" required
																class="form-control"
																data-msg="Please select option">
																<option value="">Select Option</option>
																<option value="Amazon">Amazon</option>
																<option value="Flipkart">Flipkart</option>
															</select>
															<div class="validate"></div>
														</div>
													</div>
													<div class="col-md-6 mb-3">
														<div class="form-group">
															<label class="control-label">Resident</label>
															<input type="text" name="name" id="name" required
																class="form-control" />
															<div class="validate"></div>
														</div>
													</div>
													<input type="hidden" name="client_code" id="client_code"
														value="${ClientUser.client_code }" />													
													<input type="hidden" name="entry_by" id="entry_by"
														value="${ClientUser.username }" />

													<div class="form-actions text-center">
														<div class="card-body border-top">
															<button type="submit" id="send"
																class="btn btn-dark rounded-pill px-4">
																<div class="d-flex align-items-center">
																	<i data-feather="save"
																		class="feather-sm me-1 fill-icon"></i>
																	Save
																</div>
															</button>
														</div>
													</div>
												</div>
											</form>
										</div>										
									</c:if>
								</div> -->
							</div>
						</div>
						<div class="card alert">
							<c:choose>
								<c:when test="${not empty dels }">
									<table class="table display">
										<thead>
											<tr>
												<th>Name</th>
												<th>Property</th>
												<th>From</th>
												<th>Date</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${dels }" var="del">
											<tr>
												<th>${del.name }</th>
												<td>${del.pg.name }</td>
												<td>${del.entry_by }</td>
												<td>${del.submit_date }</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:when>
								<c:otherwise>
									<h5 class="text-center">No records found.</h5>
								</c:otherwise>
							</c:choose>
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
	<script
		src="<%=request.getContextPath()%>/new/assets/extra-libs/toastr/dist/build/toastr.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/extra-libs/toastr/toastr-init.js"></script>
	<script>
		$('document').ready(function() {
			$("#success-alert").on("click", function() {
				toastr.success("Message sent", {
					showMethod : "slideDown",
					hideMethod : "slideUp",
					timeOut : 2000
				});
			});
			$("#error-alert").on("click", function() {
				toastr.error("Error, Please try again later.", {
					showMethod : "slideDown",
					hideMethod : "slideUp",
					timeOut : 2000
				});
			});
			$("#empty-alert").on("click", function() {
				toastr.warning("Please fill in all the details.", {
					showMethod : "slideDown",
					hideMethod : "slideUp",
					timeOut : 2000
				});
			});
			$("#daily-form").submit(function(event) {
				event.preventDefault();
				saveEnquiry();
			});
		});
		function saveEnquiry() {
			var formData = $("#daily-form").serialize();
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/lct/addDailyUpdate",
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
						$('#success-alert').click();
					} else if (data == 'error') {
						$('#error-alert').click();
					} else if (data == 'empty') {
						$('#empty-alert').click();
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