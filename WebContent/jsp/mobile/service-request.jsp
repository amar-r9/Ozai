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
<title>Service Request | Ozai Living</title>
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

small {
	color: #000;
	text-align: center;
}
</style>
</head>

<body style=" background: #fff;">
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->
	<jsp:include page="/common/preloader.jsp"></jsp:include>
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper">
		
		<div class="card pt-2 ps-2" style="z-index: 100;
		    margin-bottom: 50px; position: fixed; width: 100%;
			border-radius: unset; box-shadow: none; background: teal;">
			<div class="row">
				<a class="col-4" href="<%=request.getContextPath()%>/mobile">
				<i class="bi bi-arrow-left fa-2x text-white" style="vertical-align: bottom;"></i></a>
				<span class="col-8 mt-2"><span style="vertical-align: bottom; margin-top: 10px;
		    		font-size: 1.5rem; color: #fff;">Services</span></span>
		    </div>
		  </div>
		<!-- ============================================================== -->
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper" style="margin-top: 60px; background: #fff;">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->

			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid ">
				<!-- -------------------------------------------------------------- -->
				<!-- Start Page Content -->
				<!-- -------------------------------------------------------------- -->
				<div class="row">
					<div class="col-12">
						<div class="row">
							<div class="card-body" style="display: none;" id="successScreen">
								<div class="card-img">
									<img class="img-fluid"
										src="<%=request.getContextPath()%>/assets/img/success.gif">
								</div>
								<div class="card-title text-center">
									<p>YOUR REQUEST HAS BEEN SUBMITTED.</p>
								</div>
								<button class="btn btn-dark btn-lg">Thank you.</button>
							</div>

							<div class="alert" id="formScreen">
								<div class="text-center">
									<form
										action="<%=request.getContextPath()%>/mobile/saveServiceRequest"
										method="post" role="form" id="request-form" class=""
										novalidate>
										<div class="row">
											<!--/span-->
											<!-- <h4 class="card-title">Categories</h4> -->

											<div class=" row text-center">
												<h4 class="card-title"></h4>
												<p class="mb-3">Save money on a lot of products and services through our partners.</p>
												<div class="col-3 text-center mb-3">
													<a href="<%=request.getContextPath() %>/mobile/user/apply-loan">
													<label class="form-check-label img-circle" for="radio1">
														<img style="height: 40px;"
														src="<%=request.getContextPath()%>/assets/img/services/loans.png" />
													</label><br> <small>Loans</small></a>
												</div>
												<div class="col-3 text-center mb-3 chooseFrom">
													<a href="<%=request.getContextPath() %>/mobile/user/insurance">
														<label class="form-check-label img-circle" for="radio2">
															<img style="height: 40px;"
															src="<%=request.getContextPath()%>/assets/img/services/insurance.png" />
														</label><br> <small style="font-size: .775em;">Insurance</small>
													</a>
												</div>
												<div class="col-3 mb-3 chooseFrom">
													<div class="text-center">
														<input type="radio" id="category3" name="category"
															value="Tickets" required />
													</div>
													<label class="form-check-label img-circle" for="radio3"><img
														style="height: 40px;"
														src="<%=request.getContextPath()%>/assets/img/services/tickets.png" />
													</label><br> <small style="font-size: .775em;">Tickets</small>
												</div>
												<div class="col-3 mb-3">
													<a href="<%=request.getContextPath() %>/mobile/user/shop">
														<div class="text-center">														
														</div>
														<label class="form-check-label img-circle" for="radio4">
															<img style="height: 40px;"
															src="<%=request.getContextPath()%>/assets/img/services/mobiles.png" />
														</label><br> <small style="font-size: .775em;">Mobiles</small>
													</a>
												</div>
												<div class="col-3 mb-3 chooseFrom">
													<div class="text-center">
														<input type="radio" id="category5" name="category"
															value="Up Skilling" required />
													</div>
													<label class="form-check-label img-circle" for="radio5">
														<img style="height: 40px;"
														src="<%=request.getContextPath()%>/assets/img/services/upskilling.png" />
													</label><br> <small style="font-size: .775em;">Up
														Skilling</small>
												</div>
												<div class="col-3 mb-3 chooseFrom">
													<div class="text-center">
														<input type="radio" id="category6" name="category"
															value="Clothes" required />
													</div>
													<label class="form-check-label img-circle" for="radio6">
														<img style="height: 40px;"
														src="<%=request.getContextPath()%>/assets/img/services/clothes.png" />
													</label><br> <small style="font-size: .775em;">Clothes</small>
												</div>
												<div class="col-3 mb-3 chooseFrom">
													<div class="text-center">
														<input type="radio" id="category7" name="category"
															value="Money Transfer" required />
													</div>
													<label class="img-circle"> <img
														style="height: 40px;"
														src="<%=request.getContextPath()%>/assets/img/services/money-transfer.png" />
													</label><br> <small style="font-size: .775em;">Transfer</small>
												</div>
												<div class="col-3 mb-3 chooseFrom">
													<div class="text-center">
														<input type="radio" id="category8" name="category"
															value="Vehicles" required />
													</div>
													<label class="img-circle"> <img
														style="height: 40px;"
														src="<%=request.getContextPath()%>/assets/img/services/vehicles.png" />
													</label><br> <small style="font-size: .775em;">Vehicles</small>
												</div>
												<div class="col-3 mb-3">
													<a href="<%=request.getContextPath() %>/mobile/user/virtual-doctor">
														<label class="form-check-label img-circle" for="radio4">
														<img style="height: 40px;"
															src="<%=request.getContextPath()%>/assets/img/services/doctor.png" />
														</label><br> <small style="font-size: .775em;">Doctor</small>
													</a>
												</div>
											</div>
											<button type="button" style="display: none;"
												data-bs-toggle="modal" data-bs-target="#signup-modal"
												id="openForm"></button>
											<div id="signup-modal" class="modal fade" tabindex="-1"
												aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-body">
															<div class="text-center mt-2 mb-4">
																<a href="#" class="text-success"> <span
																	id="categoryTitle"></span>
																</a>
															</div>
															<h4>Coming soon....</h4>
															<!-- <div class="form-group">
																<div class="mb-3 controls">
																	<label class="control-label">Your Requirement</label> <input
																		class="form-control" type="text" name="item"
																		minlength="2" id="item" required />
																</div>
															</div> -->
															<input type="hidden" value="${User.id }" name="user_id"
																id="user_id" />
															<!--/span-->
															<!-- <div class="form-group">
																<div class="mb-3 controls">
																	<label class="control-label">Description</label>
																	<textarea class="form-control" name="description"
																		id="description" required></textarea>
																</div>
															</div> -->
															<!--/row-->
															<!-- <div class="form-actions text-center">
																<div class="card-body border-top">
																	<button type="submit" id="send1"
																		class="btn btn-dark btn-lg px-4">
																		<div class="d-flex align-items-center">
																			<i data-feather="save"
																				class="feather-sm me-1 fill-icon"></i> SAVE
																		</div>
																	</button>
																</div>
															</div> -->
														</div>
													</div>
													<!-- /.modal-content -->
												</div>
											</div>
											<!-- <select
												class="form-control" name="vendor_type" id="vendor_type"
												required>
												<option value="">Select</option>
												<option value="Food">Food</option>
												<option value="Food">Groceries</option>
												<option value="Food">Vegetables</option>
												<option value="Food">Furniture</option>
												<option value="Food">Electronics</option>
												<option value="Food">Electrical</option>
												<option value="Food">HK & Security</option>
												<option value="Food">CC TV</option>
												<option value="Food">Dairy</option>
												<option value="Food">Poultry</option>
												<option value="Food">Water</option>
												<option value="Food">Lift Service & Maintenance</option>
												<option value="Food">Laundry</option>
												<option value="Food">Kitchen equipment</option>
												<option value="Food">Plumber|Electrician|Carpenter</option>
												<option value="Food">Marketing</option>
												<option value="Food">Software</option>
												<option value="Food">Manpower supply</option>
												<option value="Food">Accountants</option>
											</select> -->
										</div>
									</form>
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
	<c:if test="${success eq true }">
		<script>
			$('document').ready(function() {
				$('#successScreen').show();
				$('#formScreen').hide();
			});
		</script>
	</c:if>
	<script>
		!(function(window, document, $) {
			"use strict";
			$("input,select,textarea").not("[type=submit]")
					.jqBootstrapValidation();
		})(window, document, jQuery);
	</script>
	<script>
		$('document').ready(
				function() {
					$(".chooseFrom").click(
							function(event) {
								$(this).find('input').prop('checked', true)
								$('#openForm').click();
								$('#categoryTitle').html(
										$('input[name=category]:checked',
												'#request-form').val());
							});
				});
	</script>
	<script>
		$('document').ready(function() {
			$('#hideBack').hide();
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