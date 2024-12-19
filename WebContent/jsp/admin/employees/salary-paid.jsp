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
					<div class="col-12 align-self-center">
						<h4 class="page-title">Employ Module</h4>
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
					<div class="col-12">
						<!-- ---------------------
                            start File export
                        ---------------- -->
						<div class="card">
							<div class="border-bottom title-part-padding">
								<h4 class="card-title mb-0">Paid List</h4>
							</div>
							<div class="card-body row">
								<c:if test="${saved eq true }">
									<h4 class="alert alert-success">Success.</h4>
								</c:if>
								<ul class="nav nav-pills justify-content-end" role="tablist">
									<li class="nav-item"><a class="nav-link"
										href="<%=request.getContextPath()%>/admin/employees/salary-list">
											<span>Pending</span>
									</a></li>
									<li class="nav-item"><a class="nav-link active"
										href="<%=request.getContextPath()%>/admin/employees/salary-paid">
											<span>Cleared</span>
									</a></li>
								</ul>
							</div>
						</div>
						<div class="row">
							<c:if test="${AdminUser.access_level eq 1 }">
								<div class="table-responsive">
									<table id="tenants">
										<thead>
										</thead>
										<tbody>
											<!-- start row -->
											<c:if test="${not empty salaryPaid }">
												<c:forEach items="${salaryPaid}" var="rent">
													<div class="card" style="border-radius: 20px;">
														<div class="card-body">
															<div class="row mb-3">
																<div class="col-auto">
																	<div class="avatar avatar-44 shadow-sm rounded-10">
																		<img
																			src="http://www.ozailiving.com/assets/images/default-user.png"
																			style="width: 44px; border-radius: 5px;">
																	</div>
																</div>
																<div class="col align-self-center ps-0">
																	<p class="mb-0 text-color-theme">${rent.employ.first_name }</p>
																	<p class="text-muted small">${rent.employ.role }</p>
																</div>
																<div class="col-auto">
																	<a href="#" class="btn btn-default btn-44 shadow-sm">
																		<i class="bi bi-arrow-up-right-circle"></i>
																	</a>
																</div>
															</div>
															<div class="card bg-light" style="border-radius: 20px;">
																<div class="card-body">
																	<div class="row">
																		<div class="col-auto">
																			<div
																				class="avatar avatar-60 shadow-sm rounded-10 text-white">
																				<img style="width: 60px; height: 60px;"
																					src="<%=request.getContextPath()%>/assets/images/rupee.png" />
																			</div>
																		</div>
																		<div class="col align-self-center ps-0">

																			<p class="text-color-theme">
																				${rent.service_month } <a
																					href="<%=request.getContextPath() %>/admin/employees/salary/${rent.id }"
																					class="btn btn-sm btn-warning text-white px-2 float-end">VIEW
																					<i class="fas fa-arrow-alt-circle-right"></i>
																				</a>
																			</p>

																			<div class="row">
																				<div class="col">${rent.amount_to_be_paid }</div>
																				<div class="col-auto align-self-center text-end">
																					<span class="text-muted size-12 ">Date:
																						${rent.cleared_on }</span>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</c:forEach>
											</c:if>
											<!-- end row -->
										</tbody>
									</table>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<!-- End Row -->
			<!-- Row -->
		</div>
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
                  text-success
                ">
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
		<!-- End Container fluid  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- footer -->
		<!-- ============================================================== -->
		<footer class="footer text-center"> All Rights Reserved by
			Nice admin. </footer>
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
	<!--This page plugins -->
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/datatables/media/js/jquery.dataTables.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/dist/js/pages/datatable/custom-datatable.js"></script>
	<!-- start - This is for export functionality only -->
	<script
		src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/dist/js/pages/datatable/datatable-advanced.init.js"></script>
	<!-- Template Main JS File -->
	<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
	<script>
		$('document')
				.ready(
						function() {
							$('#tenants').DataTable(
									{
										"paging" : true,
										dom : "Bfrtip",
										buttons : [ "copy", "csv", "excel",
												"pdf", "print" ]
									});
							$(
									".buttons-copy, .buttons-csv, .buttons-print, .buttons-pdf, .buttons-excel")
									.addClass("btn btn-warning btn-sm mr-1");
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