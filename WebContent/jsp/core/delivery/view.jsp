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
					<div class="col-12 align-self-center">
						<h4 class="page-title"></h4>
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
					<div class="col-lg-9">
						<div class="card">
							<div class="card-header bg-info">
								<h4 class="mb-0 row text-white">
									<span class="col-6">Type : ${del.type }</span>
									<span class="col-6 text-end">Category : ${del.category }</span>
								</h4>
							</div>
							<form class="form-horizontal">
								<div class="form-body">
									<div class="card-body">
										<h4 class="card-title mb-0">Goods Info</h4>
									</div>
									<div class="card-body border-top">
										<div class="row card-body">
											<div class="col-md-6">
												<div class="form-group row col-12 py-3 bg-light-secondary">
													<label
														class="control-label text-end col-md-4
                                						font-weight-medium">Month:</label>
													<div class="col-md-8">
														<p class="form-control-static">${del.service_month }</p>
													</div>
												</div>
											</div>
											<!--/span-->
											<div class="col-md-6">
												<div class="form-group row col-12  py-3 bg-light-secondary">
													<label
														class="control-label text-end
                                						col-md-4 font-weight-medium">Delivery date:</label>
													<div class="col-md-8">
														<p class="form-control-static">${del.delivery_date }</p>
													</div>
												</div>
											</div>
											<!--/span-->
										</div>
										<!--/row-->
										<div class="row card-body">
											<div class="col-md-6">
												<div class="form-group row col-12 py-3 bg-light-secondary">
													<label
														class="control-label text-end
                                						col-md-4 font-weight-medium">Invoice amount:</label>
													<div class="col-md-8">
														<p class="form-control-static">${del.invoice_amount }</p>
													</div>
												</div>
											</div>
											<!--/span-->
											<div class="col-md-6">
												<div class="form-group row col-12 py-3 bg-light-secondary">
													<label
														class="control-label text-end
                                						col-md-4 font-weight-medium">GST amount:</label>
													<div class="col-md-8">
														<p class="form-control-static">${del.gst_amount }</p>
													</div>
												</div>
											</div>
											<!--/span-->											
										</div>
										<!--/row-->
										<div class="row card-body">
											<div class="col-md-6">
												<div class="form-group row col-12 py-3 bg-light-secondary">
													<label
														class="control-label text-end
                                						col-md-4 font-weight-medium">${del.type } price:</label>
													<div class="col-md-8">
														<p class="form-control-static">${del.total }</p>
													</div>
												</div>
											</div>
											<!--/span-->
											<div class="col-md-6">
												<div class="form-group row col-12 py-3 bg-light-secondary">
													<label
														class="control-label text-end
                                						col-md-4 font-weight-medium">Attachment:</label>
													<div class="col-md-8">
														<a href="<%=request.getContextPath() %>/uploaded_files/DOC/DELIVERY/${del.filename }" 
															target="_blank" class="btn btn-sm btn-danger">
															<i class="fas fa-paperclip"></i>
															View
														</a>
													</div>
												</div>
											</div>
											<!--/span-->											
										</div>
										<!--/row-->
									</div>
									<div class="card-body">
										<h4 class="card-title mb-0">Property Info</h4>
									</div>
									<div class="card-body border-top">
										<div class="row card-body">
											<div class="col-md-6">
												<div class="form-group row col-12 py-3 bg-light-secondary">
													<label
														class="control-label text-end
                                						col-md-4 font-weight-medium">Property:</label>
													<div class="col-md-8">
														<p class="form-control-static">${del.pg.name }</p>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row col-12 py-3 bg-light-secondary">
													<label
														class="control-label text-end col-md-4
						                                font-weight-medium">Client
														Code:</label>
													<div class="col-md-8">
														<p class="form-control-static">${del.pg.admin_id }</p>
													</div>
												</div>
											</div>
											<!--/span-->
										</div>
										<div class="row card-body">
											<div class="col-md-6">
												<div class="form-group row col-12 py-3 bg-light-secondary">
													<label
														class="control-label text-end col-md-4
                                						font-weight-medium">City:</label>
													<div class="col-md-8">
														<p class="form-control-static">${del.pg.city }</p>
													</div>
												</div>
											</div>
											<!--/span-->
											<div class="col-md-6">
												<div class="form-group row col-12 py-3 bg-light-secondary">
													<label
														class="control-label text-end
						                                col-md-4 font-weight-medium ">State:</label>
													<div class="col-md-8">
														<p class="form-control-static">${del.pg.state }</p>
													</div>
												</div>
											</div>
											<!--/span-->
										</div>
										<!--/row-->
									</div>
									<hr />
								</div>
							</form>
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
				<!-- ============================================================== -->
				<!-- End Page wrapper  -->
				<!-- ============================================================== -->
				<footer class="footer">All right reserved by Ozai.</footer>
			</div>
			<!-- ============================================================== -->
			<!-- End Wrapper -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- customizer Panel -->
			<!-- ============================================================== -->
		</div>
		<div class="chat-windows"></div>
	</div>
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
			$
					.ajax({
						type : "GET",
						url : "${pageContext.request.contextPath}/core/updateAdmin",
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
								window.location.href = '${pageContext.request.contextPath}/core/operators/list';
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
