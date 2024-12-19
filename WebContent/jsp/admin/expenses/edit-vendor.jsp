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
<title>Tikaana Admin Dashboard for tenants details, paymeent
	updates</title>
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
<style>
.mb-3 {
	
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
		<jsp:include page="/common/opsheader.jsp"></jsp:include>
		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<jsp:include page="/common/opssidebar.jsp"></jsp:include>
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
						<h4 class="page-title">Vendor Details</h4>
					</div>
					<div class="col-7 align-self-center">
						<div class="d-flex align-items-center justify-content-end">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a
										href="<%=request.getContextPath()%>/ops">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">
										Vendor Details</li>
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
				<div class="row">
					<div class="col-12">
						<div class="row">
							<div class="col-md-12">
								<div class="card">
									<div class="card-body">
										<div class="row gap-2">
							          		<div class="col-2 col-md-2 col-xs-12 col-12">
												<a href="<%=request.getContextPath() %>/ops/expenses/vendor-list"
													class="btn d-flex align-items-center
					                          				btn-info w-100 d-block font-weight-medium">
													Vendor List <span class="badge ms-auto bg-info"><i class="fa fa-list"></i></span>
												</a>
											</div>
								          	<div class="col-2 col-md-2 col-xs-12 col-12">
												<a href="<%=request.getContextPath() %>/ops/expenses/add-vendor"
													class="btn d-flex align-items-center
					                          				btn-success w-100 d-block font-weight-medium">
													Add Vendor <span class="badge ms-auto bg-success"><i class="fa fa-plus"></i></span>
												</a>
											</div>
								          	<div class="col-2 col-md-2 col-xs-12 col-12">
												<c:choose>
													<c:when test="${OpsUser.access_level eq 1 }">
														<a
															href="<%=request.getContextPath()%>/ops/expenses/payment-list"
															class="btn d-flex align-items-center
					                          				btn-warning w-100 d-block font-weight-medium">
															Expense List <span class="badge ms-auto bg-warning"><i
																class="fa fa-list"></i></span>
														</a>
													</c:when>
													<c:otherwise>
														<a
															href="<%=request.getContextPath()%>/ops/expenses/approve-list"
															class="btn d-flex align-items-center
					                          				btn-warning w-100 d-block font-weight-medium">
															Expense List <span class="badge ms-auto bg-warning"><i
																class="fa fa-list"></i></span>
														</a>
													</c:otherwise>
												</c:choose>
											</div>
								          	<div class="col-2 col-md-2 col-xs-12 col-12">
												<a href="<%=request.getContextPath() %>/ops/expenses/add"
													class="btn d-flex align-items-center
					                          				btn-primary w-100 d-block font-weight-medium">
													 Add Expense <span class="badge ms-auto bg-primary"><i class="fa fa-plus"></i></span>
												</a>
											</div>
										</div><br>
										<div class="card-header bg-dark">
											<h4 class="card-title text-white">Edit Vendor</h4>
										</div>
										<div class="card-body">
											<div class="justify-content-end">

												<form action="#" method="get" role="form" id="user-form">
													<div class="row">
														<div class="col-md-10 col-10">
															<div class="mb-3">
																<label class="control-label">NAME</label> <input
																	type="text" name="name" id="name" class="form-control"
																	value="${vendor.name }" />
															</div>
														</div>
														
								                        <input type="hidden" class="form-control" value="${vendor.code}" id="code" name="code" />
														
														<!--/span-->
														<div class="col-md-10 col-10">
								                          <div class="mb-3 ">
								                            <label class="control-label">SERVICE TYPE</label>
															<select name="vendor_type" id="vendor_type" class="form-control form-select"> 
																<option value="${vendor.vendor_type }">${vendor.vendor_type }</option>
																<c:forEach items="${services}" var="product">
																	<option value="${product.name }">${product.name }</option>
																</c:forEach>
															</select>
															
								                          </div>
								                        </div>
														<div class="col-md-10 col-10">
															<div class="mb-3 ">
																<label class="control-label">ADDRESS</label> <input
																	type="text" name="address" id="address"
																	class="form-control" value="${vendor.address }" />

															</div>
														</div>
														<!--/span-->
														<div class="col-md-10 col-10">
															<div class="mb-3 ">
																<label class="control-label">EMAIL</label> <input
																	type="email" name="email" id="email"
																	class="form-control" value="${vendor.email }" />

															</div>
														</div>
														<div class="col-md-10 col-10">
															<div class="mb-3 ">
																<label class="control-label">CITY</label> <input
																	type="text" name="city" id="city" value="${vendor.city }"
																	class="form-control" />

															</div>
														</div>
														<!--/span-->
														<div class="col-md-10 col-10">
															<div class="mb-3 ">
																<label class="control-label">STATE</label> <input
																	type="text" name="state" id="state"
																	class="form-control" value="${vendor.state }" />

															</div>
														</div>
														<!--/span-->
														<div class="col-md-10 col-10">
															<div class="mb-3 ">
																<label class="control-label">MOBILE</label> <input
																	type="text" name="contact" id="contact"
																	class="form-control" value="${vendor.contact }" />
															</div>
														</div>
														<!--/span-->
														<div class="col-md-10 col-10">
															<div class="mb-3 ">
																<label class="control-label">PAN</label> <input
																	type="text" class="form-control" value="${vendor.pan }"
																	id="pan" name="pan" />
															</div>
														</div>
														<!--/span-->
														<div class="col-md-10 col-10">
															<div class="mb-3 ">
																<label class="control-label">GST</label> <input
																	type="text" name="gst" id="gst" class="form-control"
																	value="${vendor.gst }" />

															</div>
														</div>
														<div class="col-md-10 col-10">
															<div class="mb-3">
																<label class="control-label">TDS%</label> <input
																	type="text" name="applicable_tds" id="applicable_tds"
																	class="form-control" value="${vendor.applicable_tds }" />
															</div>
														</div>
														<!--/span-->
														<div class="col-md-10 col-10">
															<div class="mb-3 ">
																<label class="control-label">TDS SECTION</label> <input
																	type="text" name="tds_section" id="tds_section"
																	class="form-control" value="${vendor.tds_section } " />

															</div>
														</div>
														<div class="col-md-10 col-10">
															<div class="mb-3 ">
																<label class="control-label">PAYMENT TERMS</label> <input
																	type="text" name="payment_terms" id="payment_terms"
																	class="form-control" value="${vendor.payment_terms }" />

															</div>
														</div>
														<!--/span-->
														<!--/span-->
														<div class="col-md-10 col-10">
															<div class="mb-3 ">
																<label class="control-label">ACCOUNT NO</label> <input
																	type="text" name="bank_account" id="bank_account"
																	class="form-control" value="${vendor.bank_account }" />

															</div>
														</div>
														<!--/span-->
														<div class="col-md-10 col-10">
															<div class="mb-3 ">
																<label class="control-label">IFSC</label> <input
																	type="text" name="ifsc" id="ifsc" class="form-control"
																	value="${vendor.ifsc }" />

															</div>
														</div>
														<!--/span-->
														<div class="col-md-10 col-10">
															<div class="mb-3 ">
																<label class="control-label">BANK IDENTIFIER</label> <input
																	type="text" name="bank_identifier" id="bank_identifier"
																	class="form-control" value="${vendor.bank_identifier }" />

															</div>
														</div>
														<!--/span-->
														<input type="hidden" name="id" id="id" value="${vendor.id }" />
														<input type="hidden" name="rent" id="rent" value="${vendor.rent }" />
													</div>
													<div class="form-actions">
														<div class="card-body border-top">
															<button type="submit" id="send" style="width: 100%;"
																class="btn btn-primary">UPDATE</button>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
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
                  text-success
                ">
								<div class="modal-body p-4">
									<div class="text-center text-success">
										<i data-feather="check-circle" class="fill-white feather-lg"></i>
										<h4 class="mt-2 text-success">Thank You!</h4>
										<p class="mt-3 text-success-50">Details have been
											submitted.</p>
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
                btn btn-light-warning
                text-warning
                font-weight-medium
                btn-lg
                px-4
                fs-4
                font-weight-medium
              "
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
										<h4 class="mt-2">Sorry</h4>
										<p class="mt-3">Submission failed, Please try again later.
										</p>
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
											data-bs-dismiss="modal">
											Close</button>
									</div>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
					</div>
					<!-- ============================================================== -->

					<button type="button"
						class="btn btn-light-danger text-danger
                		font-weight-medium btn-lg px-4 fs-4 font-weight-medium"
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
											data-bs-dismiss="modal">
											Close</button>
									</div>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
					</div></div></div>
					<!-- ============================================================== -->
					<!-- End Container fluid  -->
					<!-- ============================================================== -->
					<!-- ============================================================== -->
					<!-- footer -->
					<!-- ============================================================== -->
					<footer class="footer">All right reserved by Pradeenav
						Tikaana Private Limited.</footer>
					<!-- ============================================================== -->
					<!-- End footer -->
					<!-- ============================================================== -->
				</div>
				<!-- ============================================================== -->
				<!-- End Page wrapper  -->
				<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- customizer Panel -->
			<!-- ============================================================== -->
		</div>
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
		<script
			src="<%=request.getContextPath()%>/new/dist/js/sidebarmenu.js"></script>
		<!--Custom JavaScript -->
		<script
			src="<%=request.getContextPath()%>/new/dist/js/feather.min.js"></script>
		<script src="<%=request.getContextPath()%>/new/dist/js/custom.min.js"></script>
		<c:if test="${added eq 'true' }">
			<script>
				$('document').ready(function() {
					$('#onSuccess').click();
				});
			</script>
		</c:if>
		<c:if test="${added eq false }">
			<script>
				$('document').ready(function() {
					$('#errorMsg').click();
				});
			</script>
		</c:if>
		<!-- Template Main JS File -->
		<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
		<script>
			$('document').ready(function() {
				$("#user-form").submit(function(event) {
					event.preventDefault();
					updateTenant();
				});
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
		<script>
			function updateTenant() {
				var formData = $("#user-form").serialize();
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/ops/expenses/update-vendor",
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
							//window.location.href = '${pageContext.request.contextPath}/ops/tenant-module/list';
						} else if (data == 'failed') {
							$('#errorMsg').click();
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
</body>
</html>
