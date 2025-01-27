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
	content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, nice admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, " />
<meta name="description"
	content="Nice is powerful and clean admin dashboard template, inpired from Google's Material Design" />
<meta name="robots" content="noindex,nofollow" />
<title>Finance Module | Admin | Ozai</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/new/assets/images/favicon.png" />
<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/new/dist/css/style.min.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/new/assets/libs/select2/dist/css/select2.min.css" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
.form-control {
	border-radius: 50px !important;
	background: #FFF !important;
	min-height: calc(1.5em + 1rem + 2px) !important;
    padding: 0.5rem 1rem !important;
    font-size: 1.09375rem !important;
}
.select2-selection {
	border-radius: 50px !important;
	min-height: calc(1.5em + 1rem + 2px) !important;
    padding: 0.5rem 1rem !important;
    font-size: 1.09375rem !important;
}
.control-label {
	color: #000 !important;
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
					<div class="col-5 col-md-5 col-sm-12 col-12 text-center">
						<h5 class="text-dark" style="font-weight: 900;">ADD EXPENSE</h5>
					</div>
					<div class="col-7 align-self-center d-none d-lg-block">
						<div class="d-flex align-items-center justify-content-end">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a
										href="<%=request.getContextPath()%>/lct">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">
										ADD EXPENSE</li>
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
				<!-- Row -->
				<c:choose>
					<c:when test="${ClientUser.premium eq 1 }">
						<div class="col-12">
							<div class="row">
								<div class="col-4 text-start">
									<a href="<%=request.getContextPath()%>/lct/expenses/list">
										<div class="card card-body bg-info text-white" style="border-radius: 10px;">
											<i class="fas fa-list fa-2x"></i><br>
											<small>Expense List</small>
										</div>
									</a>
								</div>
								<div class="col-4">
									<a href="<%=request.getContextPath()%>/lct/expenses/vendor-list">
										<div class="card card-body bg-warning text-white" style="border-radius: 10px;">
											<i class="fas fa-user fa-2x"></i><br>
											<small>Vendors</small>
										</div>
									</a>
								</div>
								<div class="col-4">
									<a href="<%=request.getContextPath()%>/lct/expenses/approve-list">
										<div class="card card-body bg-danger text-white" style="border-radius: 10px;">
											<i class="fas fa-check-circle fa-2x"></i><br>
											<small>Approve List</small>
										</div>
									</a>
								</div>
							</div>
				            <div class="card">
				             	<div class="card-body">
									<form class="mt-4"
										action="<%=request.getContextPath()%>/lct/savePurchase"
										id="finance-form" method="post" modelAttribute="finance"
										enctype="multipart/form-data" novalidate>
										
										<div class="row">
											<div class="form-group">
												<div class="mb-3 controls">
													<label class="control-label">Service
														month</label>
													<input type="month" name="service_month" id="service_month" 
														class=" form-control  form-control-lg" required />
												</div>
											</div>
											<!--/span-->
											<c:choose>
												<c:when test="${not empty properties }">
													<div class="form-group">
														<div class="mb-3 controls">
															<label class="control-label">Property</label>
															<select name="property_code" id="select2-theme"
																required class=" form-control  form-control-lg form-select"
																style="width: 100%; height: 46px;"
																data-placeholder="Choose a Property">
																<option value="">Select Property</option>
																<c:forEach items="${properties }" var="property">
																	<option value="${property.id }">${property.name }----City/${property.city }</option>
																</c:forEach>
															</select>
														</div>
													</div>
												</c:when>
												<c:otherwise>
													<input type="hidden" name="property_code" value="${property }" />
												</c:otherwise>
											</c:choose>
											<div class="form-group">
												<div class="mb-3 controls">
													<label
														class="control-label">Service</label>
													<select name="service_type" id="select1-language"
														class=" form-control  form-control-lg form-select" required
														style="width: 100%; height: 36px;"
														data-placeholder="Choose a service">
														<option value="">Select service</option>
														<c:forEach items="${services }" var="service">
															<option value="${service.name }">${service.name }</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="form-group">
												<div class="mb-3 controls">
													<label
														class="control-label">Vendor</label>
													<select name="vendor_id" id="select2-language"
														class=" form-control  form-control-lg form-select" required
														style="width: 100%; border-radius: 50px;"
														data-placeholder="Choose a Vendor">
														<option value="">Select Vendor</option>
														<c:forEach items="${vendors }" var="vendor">
															<option value="${vendor.id }">${vendor.name }----City/${vendor.city }</option>
														</c:forEach>
													</select>
												</div>
											</div>
											<input type="hidden" name="client_code" id="client_code"
												value="${ClientUser.client_code }" />
											<input type="hidden" name="admin_id" id="admin_id"
												value="0" />
											
											<input type="hidden" name="entry_by" id="entry_by"
												value="${ClientUser.username }" />
											<!--/span-->
											<div class="form-group">
												<div class="mb-3 controls">
													<label class="control-label col-md-3">Vendor
														Invoice No</label>
													<input type="text" name="vendor_invoice_no"
														id="vendor_invoice_no" class=" form-control  form-control-lg" />
												</div>
											</div>
											<div class="form-group">
												<div class="mb-3 controls">
													<label class="control-label col-md-3">Vendor
														Invoice Date</label>
													<input type="date"
														name="vendor_invoice_date" id="vendor_invoice_date"
														class=" form-control  form-control-lg" />
												</div>
											</div>
											<!--/span-->
											<div class="form-group">
												<div class="mb-3 controls">
													<label class="control-label col-md-3">Invoice
														Amount</label>
													<input type="text" name="invoice_amount"
														id="invoice_amount" required class=" form-control  form-control-lg" />
		
												</div>
											</div>
											<!--/span-->
											<div class="form-group">
											    <div class="mb-3 controls">
											        <label class="control-label col-md-3">VAT (if applicable)</label>
											        <input type="number" name="vat" id="vat" class="form-control form-control-lg"
											               step="0.01" min="0" placeholder="0.00" />
											    </div>
											</div>

											<input type="hidden"
												name="gst_amount" id="gst_amount"
												value="0" />
											<!--/span-->
											<div class="form-group">
												<div class="mb-3 controls">
													<label class="control-label col-md-3">Payment
														Due Date</label>
													<input type="date" name="payment_due_date"
														id="payment_due_date" class=" form-control  form-control-lg" />
												</div>
											</div>
											<!--/span-->
											<div class="form-group">
												<div class="mb-3 controls">
													<label class="control-label col-md-3">Material
														or service purchased</label>
													<input type="text"
														name="material_purchased" id="material_purchased"
													 class=" form-control  form-control-lg" />
												</div>
											</div>
										</div>
										<!--/row-->
										<div class="row">
											<div class="form-group">
												<div class="mb-3 controls">
													<label class="control-label">Select
														File Attachment</label>
													<input name="expense_file"
														id="expense_file" type="file" accept="image/*"
														class=" form-control  form-control-lg" onchange="readURL(this)" />
												</div>
											</div>
										</div>
										<div class="p-3 border-top">
											<div class="text-center">
												<button type="submit"
													class="btn btn-dark btn-lg
						                            px-4 waves-effect waves-light">
													SUBMIT</button>
											</div>
										</div>
									</form>							
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="row m-2">
							<div class="card card-body text-dark mb-2" style="box-shadow: unset;">
								<h4>Sorry, your subscription doesn't include premiumÂ features.</h4>
								<h6>Please upgrade to premium account.</h6>
							</div>
							<div class="card card-body text-dark" style="box-shadow: unset;">
								<h3>Benefits of premium account :</h3>
								<div class="row mt-3">
									<div class="col-4">
										<div class="card bg-warning text-white w-100 text-center"
											style="box-shadow: unset;">
											<div class="text-center">
												<span class="fab fa-stack-overflow display-6 fw-bold"></span>														
											</div>
											<div class="mt-3">
												<h4 class="card-title mb-1 text-white">Expenses</h4>
											</div>
										</div>
									</div>
									<div class="col-4">
										<div class="card bg-danger text-white w-100 text-center"
											style="box-shadow: unset;">
											<div class="">
												<div class="text-center">
													<span class="bi bi-building display-6 fw-bold"></span>
												</div>
												<div class="mt-3">
													<h4 class="card-title mb-1 text-white">Inventory</h4>
												</div>
											</div>
										</div>
									</div>
									<div class="col-4">
										<div class="card bg-primary text-white w-100 text-center"
											style="box-shadow: unset;">
											<div class="">
												<div class="text-center">
													<span class="fas fa-bus display-6 fw-bold"></span>
												</div>
												<div class="mt-3">
													<h4 class="card-title mb-1 text-white">Transport</h4>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			<!-- -------------------------------------------------------------- -->
			<!-- End PAge Content -->
			<!-- -------------------------------------------------------------- -->
			<button type="button"
				class="btn btn-light-success
	        	text-success font-weight-medium
	            btn-lg px-4 fs-4 font-weight-medium"
				style="display: none;" data-bs-toggle="modal" id="onSuccess"
				data-bs-target="#al-success-alert">Success Alert</button>

			<div class="modal fade mt-4 pt-4" id="al-success-alert" tabindex="-1"
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
				class="btn btn-light-warning text-warning
	              font-weight-medium btn-lg
	              px-4 fs-4 font-weight-medium"
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
				class="btn btn-light-danger
                       text-danger font-weight-medium
                       btn-lg px-4 fs-4 font-weight-medium"
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
					<!-- /.modal-content -->
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- footer -->
			<!-- ============================================================== -->
			<footer class="footer text-center"> All Rights Reserved by Ozai.</footer>
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
		src="<%=request.getContextPath()%>/new/assets/libs/select2/dist/js/select2.full.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/select2/dist/js/select2.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/dist/js/pages/forms/select2/select2.init.js"></script>
    <script src="<%=request.getContextPath() %>/new/assets/extra-libs/jqbootstrapvalidation/validation.js"></script>
    <script>
      !(function (window, document, $) {
        "use strict";
        $("input,select,textarea").not("[type=submit]").jqBootstrapValidation();
      })(window, document, jQuery);
    </script>
	<c:if test="${success eq true }">
		<script>
			$('document').ready(function() {
				$('#onSuccess').click();
			});
		</script>
	</c:if>
	<c:if test="${success eq false }">
		<script>
			$('document').ready(function() {
				$('#errorMsg').click();
			});
		</script>
	</c:if>
	<script type="text/javascript">
		function readURL(input) {

			var image = input;
			var image_obj = $('#expense_file');

			if ((image.files[0].size / 1024).toFixed(0) > 50 * 1024) {

				alert("Attachment must be less or equal to 50MB");
				image_obj.replaceWith(image_obj.val('').clone(true));
				return;
			}
		}
	</script>
	<script>
		$('document').ready(function() {
			$("#expense-form").submit(function(e) {
				//e.preventDefault();
				//saveVendor();
				//$('#send').prop('disabled', true);
			});

		});
		function saveVendor() {
			var formData = $("#expense-form").serialize();
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/savePurchase",
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
					} else if (data == 'already-updated') {
						$('#alreadyMsg').click();
					}
					$("#send").button('reset');
				},
				error : function(e) {
					console.log("ERROR: ", e);
					alert(e);
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
				SidebarType : "full", // You can change it full / mini-sidebar / iconbar / overlay
				SidebarColor : "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
				SidebarPosition : false, // it can be true / false ( true means Fixed and false means absolute )
				HeaderPosition : false, // it can be true / false ( true means Fixed and false means absolute )
				BoxedLayout : false, // it can be true / false ( true means Boxed and false means Fluid )
			});
		});
	</script>
</body>
</html>