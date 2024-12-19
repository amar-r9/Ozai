<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html dir="ltr">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="keywords" content="Tikaana Admin Dashboard" />
<meta name="description" content="Tikaana Admin Dashboard" />
<meta name="robots" content="noindex,nofollow" />
<title>Admin Dashboard | Ozai</title>
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
.loader {
	-webkit-animation: spin 2s linear infinite;
	animation: spin 2s linear infinite;
}

@
-webkit-keyframes spin { 0% {
	-webkit-transform: rotate(0deg);
}

100%
{
-webkit-transform




:


 


rotate




(360
deg


);
}
}
@
keyframes spin { 0% {
	transform: rotate(0deg);
}
100%
{
transform




:


 


rotate




(360
deg


);
}
}
</style>
</head>

<body>
	<!-- -------------------------------------------------------------- -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- -------------------------------------------------------------- -->
	<jsp:include page="/common/preloader.jsp"></jsp:include>
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->
		<jsp:include page="/common/coreheader.jsp"></jsp:include>
		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<jsp:include page="/common/coresidebar.jsp"></jsp:include>
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
					<div class="col-5 col-md-5 col-sm-12 col-12 align-self-center">
						<h4 class="page-title">ADD DELIVERY DETAILS</h4>
					</div>
					<div class="col-7 align-self-center d-none d-lg-block">
						<div class="d-flex align-items-center justify-content-end">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">
										Delivery</li>
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

				<!-- Row selection (multiple rows) -->
				<div class="row">
					<div class="col-md-9 col-9">
						<div class="card">
							<div class="card-body">
								<div class="row">
									<div class="col-10">
										<form
											action="<%=request.getContextPath()%>/core/saveDeliveryDetails"
											id="delivery-form" method="post" modelAttribute="delivery"
											enctype="multipart/form-data">

											
											<div class="row text-end mb-3 controls">
												<fieldset class="col-6">
													<div class="form-check text-end">
														<input type="radio" value="Buying" name="type" required
															style="float: inherit;" id="styled_radio_inline1"
															class="form-check-input" /> <label
															class="form-check-label" for="styled_radio_inline1">
															Buying </label>
													</div>
												</fieldset>
												<fieldset class="col-6">
													<div class="form-check text-center">
														<input type="radio" value="Selling" name="type" required
															style="float: inherit;" id="styled_radio_inline2"
															class="form-check-input" /> <label
															class="form-check-label" for="styled_radio_inline2">
															Selling </label>
													</div>
												</fieldset>
											</div>
											
											<div class="mb-3 row">
												<label
													class="col-sm-3 text-end control-label col-form-label">PG name</label>
												<div class="col-sm-9">
													<select class="form-select form-control" name="pg_id"
														id="select2-theme" style="width: 100%;" required>
														<option>Choose Property</option>
														<c:forEach items="${properties }" var="pg">
															<option value="${pg.id }">${pg.name }</option>
														</c:forEach>
													</select>
												</div>
											</div>
											
											<div class="mb-3 row">
												<label
													class="col-sm-3 text-end control-label col-form-label">Category</label>
												<div class="col-sm-9">
													<select class="form-select form-control" name="category"
														id="select2-language" style="width: 100%;" required>
														<option value="">Select category</option>
														<c:forEach items="${services }" var="service">
															<option value="${service.name }">${service.name }</option>
														</c:forEach>
													</select>
												</div>
											</div>

											<div class="mb-3 row">
												<label for="com1"
													class="col-sm-3 text-end control-label col-form-label">Service
													month</label>
												<div class="col-sm-9">
													<input type="month" class="form-control" id="service_month"
														name="service_month" />
												</div>
											</div>
											<input type="hidden" name="entry_by" value="${CoreUser.name }" />
											
											<div class="mb-3 row">
												<label for="com1"
													class="col-sm-3 text-end control-label col-form-label">Invoice number</label>
												<div class="col-sm-9">
													<input type="text" class="form-control" id="invoice_no"
														name="invoice_no" />
												</div>
											</div>
											
											
											<div class="row mb-3">
												<label class="col-sm-3 text-end control-label col-form-label">Invoice date</label>
												<div class="col-sm-9">
													<input
														type="date" name="invoice_date" id="invoice_date"
														class="form-control" />
												</div>
											</div>
											<div class="row mb-3">
												<label class="col-sm-3 text-end control-label col-form-label">Invoice amount</label>
												<div class="col-sm-9">
													<div class="input-group">
														<div class="input-group-prepend">
															<span class="input-group-text">&#8377;</span>
														</div>
														<input type="text" class="form-control"
															name="invoice_amount"
															aria-label="Amount (to the nearest rupee)" required />
														<div class="input-group-append">
															<span class="input-group-text">.00</span>
														</div>
													</div>
												</div>
											</div>
											<div class="row mb-3">
												<label class="col-sm-3 text-end control-label col-form-label">GST amount</label>
												<div class="col-sm-9">
													<div class="input-group">
														<div class="input-group-prepend">
															<span class="input-group-text">&#8377;</span>
														</div>
														<input type="text" class="form-control"
															name="gst_amount"
															aria-label="Amount (to the nearest rupee)" required />
														<div class="input-group-append">
															<span class="input-group-text">.00</span>
														</div>
													</div>
												</div>
											</div>
											<div class="row mb-3">
												<label class="col-sm-3 text-end control-label col-form-label">Delivery date</label>
												<div class="col-sm-9">
													<input
														type="date" name="delivery_date" id="delivery_date"
														class="form-control" required />
													<div class="validate"></div>
												</div>
											</div>
											<div class="col-12 mb-3">
												<div class="mb-3 row">
													<label
														class="col-sm-3 text-end control-label 
							                      		col-form-label">Select File</label>
													<div class="col-sm-9">
														<div class="input-group mb-3">
															<span class="input-group-text">Upload</span>
															<div class="custom-file">
																<input type="file" id="input_file" name="input_file" type="file"
																	accept="image/*" class="form-control"
																	onchange="readURL(this)" />
															</div>
														</div>
													</div>
												</div>
											</div>

											<div class="col-md-12 text-center">
												<button type="submit" class="btn btn-info btn-lg btn-wide"
													id="send">Submit</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 d-flex align-items-stretch">
						<div class="card w-100">
							<div
								class="d-flex border-bottom title-part-padding
			                    	align-items-center">
								<div>
									<h4 class="card-title mb-0">Links</h4>
								</div>
							</div>
							<div class="card-body">
								<div class="row gap-2">
									<div class="col-md-12">
										<a href="<%=request.getContextPath()%>/core/delivery/add"
											class="btn d-flex align-items-center
			                          				btn-info w-100 d-block font-weight-medium">
											Add new <span class="badge ms-auto bg-info"><i
												class="fa fa-plus"></i></span>
										</a>
									</div>
									<div class="col-md-12">
										<a href="<%=request.getContextPath()%>/core/delivery/list/all"
											class="btn d-flex align-items-center
						                          btn-success w-100 d-block
						                          font-weight-medium">
											All list <span class="badge ms-auto bg-success"><i
												class="fa fa-list"></i></span>
										</a>
									</div>
								</div>
								<div class="row gap-2 mt-2">
									<div class="col-md-12">
										<a
											href="<%=request.getContextPath()%>/core/delivery/list/Buying"
											class="btn d-flex align-items-center btn-primary
			                          			w-100 d-block font-weight-medium">
											Bought list <span class="badge ms-auto bg-primary"><i
												class="fa fa-list"></i></span>
										</a>
									</div>
									<div class="col-md-12">
										<a
											href="<%=request.getContextPath()%>/core/delivery/list/Selling"
											class="btn d-flex align-items-center btn-warning
			                          			w-100 d-block font-weight-medium">
											Sold list <span class="badge ms-auto bg-warning"><i
												class="fa fa-list"></i></span>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Form inputs -->
				<!-- row selection & deletion -->
			</div>
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<button type="button"
				class="btn btn-light-success
	        	text-success font-weight-medium
	            btn-lg px-4 fs-4 font-weight-medium"
				style="display: none;" data-bs-toggle="modal" id="onSuccess"
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
									data-bs-dismiss="modal">Close</button>
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
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/select2/dist/js/select2.full.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/select2/dist/js/select2.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/dist/js/pages/forms/select2/select2.init.js"></script>
	<c:if test="${param.success eq true }">
		<script>
			$('document').ready(function() {
				$('#onSuccess').click();
			});
		</script>
	</c:if>
	<c:if test="${param.success eq false }">
		<script>
			$('document').ready(function() {
				$('#errorMsg').click();
			});
		</script>
	</c:if>
	<script type="text/javascript">
		function readURL(input) {

			var image = input;
			var image_obj = $('#input_file');

			if ((image.files[0].size / 1024).toFixed(0) > 50 * 1024) {

				alert("Attachment must be less or equal to 50MB");
				image_obj.replaceWith(image_obj.val('').clone(true));
				return;
			}
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