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
<title>Ozai Admin Dashboard for Employees</title>
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
		<div class="page-wrapper" style="margin-top: 120px;">
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
				<!-- File export -->
				<div class="row">
					<div class="col-12">
						<div class="border-bottom title-part-padding">
							<h4 class="text-center text-dark fw-bold mb-0">Employees List</h4>
						</div>
						<div class="card">
							<div class="card-body">
								<div class="alert alert-success" id="successMsg"
									style="display: none;">
									<i class="fa fa-check-circle text-white"></i>&nbsp;Updated
									successfully.
								</div>
								<div class="alert alert-warning" id="existMsg"
									style="display: none;">
									<i class="fas fa-exclamation-triangle text-white"></i>&nbsp;Already
									been generated for the month.
								</div>
								<div class="alert alert-danger" id="failMsg"
									style="display: none;">
									<i class="fas fa-exclamation-triangle text-white"></i>&nbsp;Updating
									failed, Try again.
								</div>
								<c:if test="${AdminUser.access_level le 1 }">
									<form id="month-form"
										action="<%=request.getContextPath()%>/admin/employees/salaries-to-be-generated/month"
										role="form" method="get">
										<label class="control-label col-md-3">Choose month to generate salary expenses.</label>
										<div class="row">
											<div class="col-8">
												<div class="mb-3 row">
													<div class="col-md-9">
														<input type="month" name="month" id="month"
															class="form-control" style="border-radius: unset;" />
													</div>
												</div>
											</div>
											<div class="col-4">
												<input class="btn btn-dark text-white btn-lg"
													type="submit" id="submitThis" value="GO" />
											</div>
										</div>
									</form>
								</c:if>
							</div>
						</div>
						<div class="row">
							<div class="col-4 text-start">
								<a href="<%=request.getContextPath()%>/admin/employees/list">
									<div class="card card-body bg-info text-white" style="border-radius: 10px;">
										<i class="fas fa-users fa-2x"></i><br>
										<small>Employ List</small>
									</div>
								</a>
							</div>
							<div class="col-4">
								<a href="<%=request.getContextPath()%>/admin/employees/salary-list">
									<div class="card card-body bg-warning text-white" style="border-radius: 10px;">
										<i class="fas fa-rupee-sign fa-2x"></i><br>
										<small>Pay Salary</small>
									</div>
								</a>
							</div>
							<div class="col-4">
								<a href="<%=request.getContextPath()%>/admin/employees/salary-paid">
									<div class="card card-body bg-danger text-white" style="border-radius: 10px;">
										<i class="fas fa-rupee-sign fa-2x"></i><br>
										<small>Paid Salary</small>
									</div>
								</a>
							</div>
						</div>
						<div class="row">
							<c:if test="${not empty employees }">
								<table id="tenants">
									<thead>
									</thead>
									<tbody>
										<c:forEach items="${employees}" var="employ">
											<tr>
												<td>
													<div class="card" style="border-radius: 20px;">
														<div class="card-body">
															<div class="row">
																<div class="col-auto">
																	<div class="avatar avatar-44 shadow-sm rounded-10">
																		<img
																			src="http://www.ozailiving.com/assets/images/default-user.png"
																			style="width: 44px; border-radius: 5px;">
																	</div>
																</div>
																<div class="col align-self-center ps-0">
																	<p class="mb-n2 text-color-theme fw-bold">${employ.first_name }</p>
																	<small class="mt-n2 text-muted small">${employ.role }</small>
																</div>
																<div class="col-auto">
																	<a href="<%=request.getContextPath() %>/admin/employees/edit/${employ.id }"
																		class="btn btn-default btn-44 shadow-sm"> <i
																		class="far fa-edit"></i>
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
																			<div class="row">
																				<div class="col">${employ.salary }/-</div>
																				<div class="col-auto align-self-center text-end">
																					<span class="text-muted size-12 ">Date:
																						${employ.join_date }</span>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</td>
											</tr>
										</c:forEach>
										<!-- end row -->
									</tbody>
								</table>
							</c:if>
						</div>
					
						<div class="row">
							<div class="col-6">
								<a
									href="<%=request.getContextPath()%>/admin/employees/add"
									class="card bg-primary text-white w-100 card-hover" style="box-shadow: 3px 3px 3px !important;">
									<div class="card-body">
										<div class="d-flex align-items-center">
											<span class="fas fa-user-plus display-6 fw-bold"></span>
											<div class="ms-auto">
												<i data-feather="arrow-right" class="fill-white"></i>
											</div>
										</div>
										<div class="mt-4">
											<h4 class="card-title mb-1 text-white">Add Employ</h4>
											<h6 class="card-text fw-normal text-white-50">Add new employ here</h6>
										</div>
									</div>
								</a>
							</div>
							<div class="col-6">
								<a
									href="<%=request.getContextPath()%>/admin/employees/salary-list"
									class="card bg-success text-white w-100 card-hover" style="box-shadow: 3px 3px 3px !important;">
									<div class="card-body">
										<div class="d-flex align-items-center">
											<span class="fa fa-rupee-sign display-6 fw-bold"></span>
											<div class="ms-auto">
												<i data-feather="arrow-right" class="fill-white"></i>
											</div>
										</div>
										<div class="mt-4">
											<h4 class="card-title mb-1 text-white">Pay Salary</h4>
											<h6 class="card-text fw-normal text-white-50">Add salary payments</h6>
										</div>
									</div>
								</a>
							</div>
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
			<footer class="footer">All right reserved by Ozai
				Living Private Limited.</footer>
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
		$('document').ready(function() {
			$('#tenants').DataTable({
				bSearch: true	
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
				SidebarPosition : true, // it can be true / false ( true means Fixed and false means absolute )
				HeaderPosition : false, // it can be true / false ( true means Fixed and false means absolute )
				BoxedLayout : false, // it can be true / false ( true means Boxed and false means Fluid )
			});
		});
	</script>
</body>
</html>