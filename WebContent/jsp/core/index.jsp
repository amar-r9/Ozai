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
	content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, nice admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, material design, material dashboard bootstrap 5 dashboard template" />
<meta name="description"
	content="Tikaana Admin Dashboard" />
<meta name="robots" content="noindex,nofollow" />
<title>Ozai Admin Dashboard</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath() %>/new/assets/images/favicon.png" />
<!-- Custom CSS -->
<!-- Custom CSS -->
<link
	href="<%=request.getContextPath() %>/new/assets/libs/chartist/dist/chartist.min.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath() %>/new/dist/js/pages/chartist/chartist-init.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath() %>/new/assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath() %>/new/assets/extra-libs/css-chart/css-chart.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath() %>/new/assets/extra-libs/c3/c3.min.css"
	rel="stylesheet" />
<!-- Custom CSS -->
<link href="<%=request.getContextPath() %>/new/dist/css/style.min.css"
	rel="stylesheet" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script src="<%=request.getContextPath()%>/assets/js/maps-tikaana.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<style>
.loader {
	  border: 16px solid #f3f3f3;
	  border-radius: 50%;
	  border-top: 16px solid blue;
	  border-right: 16px solid green;
	  border-bottom: 16px solid red;
	  border-left: 16px solid pink;
	  width: 120px;
	  height: 120px;
	  -webkit-animation: spin 2s linear infinite;
	  animation: spin 2s linear infinite;
	  margin-left: 32%;
	}
	
	@-webkit-keyframes spin {
	  0% { -webkit-transform: rotate(0deg); }
	  100% { -webkit-transform: rotate(360deg); }
	}
	
	@keyframes spin {
	  0% { transform: rotate(0deg); }
	  100% { transform: rotate(360deg); }
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
					<div class="col-5 align-self-center">
						<h4 class="page-title">Dashboard</h4>
					</div>
					<div class="col-7 align-self-center">
						<div class="d-flex align-items-center justify-content-end">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">
										Dashboard</li>
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
				<div class="card-group">
					<div class="card">
						<div class="card-body">
							<div class="row">
								<div class="card-group border-bottom">
									<div class="card">
										<div class="card-body">
											<div class="row">
												<div class="col-md-12">
													<div class="d-flex no-block align-items-center">
														<div>
															<i class="fa fa-users fs-6 text-muted"></i>
															<p class="fs-4 mb-1">Operators</p>
														</div>
														<div class="ms-auto">
															<h1 class="fw-light text-end">
																<span id="tenants-strength"></span>
															</h1>
														</div>
													</div>
												</div>
												<div class="col-12">
													<div class="progress">
														<div class="progress-bar bg-info" role="progressbar"
															style="width: 75%; height: 6px" aria-valuenow="25"
															aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- Column -->
									<!-- Column -->
									<div class="card">
										<div class="card-body">
											<div class="row">
												<div class="col-md-12">
													<div class="d-flex no-block align-items-center">
														<div>
															<i class="fa fa-building fs-6 text-muted"></i>
															<p class="fs-4 mb-1">LCT</p>
														</div>
														<div class="ms-auto">
															<h1 class="fw-light text-end">
																<span id="properties-strength"></span>
															</h1>
														</div>
													</div>
												</div>
												<div class="col-12">
													<div class="progress">
														<div class="progress-bar bg-success" role="progressbar"
															style="width: 60%; height: 6px" aria-valuenow="25"
															aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- Column -->
									<!-- Column -->
									<div class="card">
										<div class="card-body">
											<div class="row">
												<div class="col-md-12">
													<div class="d-flex no-block align-items-center">
														<div>
															<i class="fa fa-globe fs-6 text-muted"></i>
															<p class="fs-4 mb-1">Residents</p>
														</div>
														<div class="ms-auto">
															<h1 class="fw-light text-end">
																<span id="cities-strength"></span>
															</h1>
														</div>
													</div>
												</div>
												<div class="col-12">
													<div class="progress">
														<div class="progress-bar bg-purple" role="progressbar"
															style="width: 65%; height: 6px" aria-valuenow="25"
															aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- Column -->
									<!-- Column -->
									<div class="card">
										<div class="card-body">
											<div class="row">
												<div class="col-md-12">
													<div class="d-flex no-block align-items-center">
														<div>
															<i class="fa fa-location-arrow fs-6 text-muted"></i>
															<p class="fs-4 mb-1">Properties</p>
														</div>
														<div class="ms-auto">
															<h1 class="fw-light text-end">
																<span id="locations-strength"></span>
															</h1>
														</div>
													</div>
												</div>
												<div class="col-12">
													<div class="progress">
														<div class="progress-bar bg-danger" role="progressbar"
															style="width: 70%; height: 6px" aria-valuenow="25"
															aria-valuemin="0" aria-valuemax="100"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- 7. Stats card -->
								
								<div
									class="d-flex border-bottom
			              			title-part-padding px-0
				              		mb-3 align-items-center">
									<div>
										<h4 class="mb-0">Quick links</h4>
									</div>
								</div>
								<div class="row">
									<div
										class="col-md-4 col-xl-2 d-flex align-items-stretch sound-button">
										<a style="margin: 10px;"
											href="<%=request.getContextPath() %>/core/orders/add"
											class="card bg-info text-white w-100 card-hover">
											<div class="card-body">
												<div class="d-flex align-items-center">
													<span class="fa fa-shopping-cart display-6 fw-bold"></span>
													<div class="ms-auto">
														<i data-feather="arrow-right" class="fill-white"></i>
													</div>
												</div>
												<div class="mt-4">
													<h4 class="card-title mb-1 text-white">Order</h4>
													<h6 class="card-text fw-normal text-white-50">Order for an operator</h6>
												</div>
											</div>
										</a>
									</div>
									<div
										class="col-md-4 col-xl-2 d-flex align-items-stretch sound-button">
										<a style="margin: 10px;"
											href="<%=request.getContextPath() %>/core/lct/list"
											class="card bg-warning text-white w-100 card-hover">
											<div class="card-body">
												<div class="d-flex align-items-center">
													<span class="fa fa-rupee-sign display-6 fw-bold"></span>
													<div class="ms-auto">
														<i data-feather="arrow-right" class="fill-white"></i>
													</div>
												</div>
												<div class="mt-4">
													<h4 class="card-title mb-1 text-white">LCT</h4>
													<h6 class="card-text fw-normal text-white-50">
														Get the list of Labor camps</h6>
												</div>
											</div>
										</a>
									</div>
									<div
										class="col-md-4 col-xl-2 d-flex align-items-stretch sound-button">
										<a style="margin: 10px;"
											href="<%=request.getContextPath() %>/core/orders/list"
											class="card bg-danger text-white w-100 card-hover">
											<div class="card-body">
												<div class="d-flex align-items-center">
													<span class="fas fa-clipboard-list display-6 fw-bold"></span>
													<div class="ms-auto">
														<i data-feather="arrow-right" class="fill-white"></i>
													</div>
												</div>
												<div class="mt-4">
													<h4 class="card-title mb-1 text-white">Orders List</h4>
													<h6 class="card-text fw-normal text-white-50">Get the list
														of orders</h6>
												</div>
											</div>
										</a>
									</div>
									<div
										class="col-md-4 col-xl-2 d-flex align-items-stretch sound-button">
										<a style="margin: 10px;"
											href="#"
											class="card bg-success text-white w-100 card-hover">
											<div class="card-body">
												<div class="d-flex align-items-center">
													<span class="fas fa-user-secret display-6 fw-bold"></span>
													<div class="ms-auto">
														<i data-feather="arrow-right" class="fill-white"></i>
													</div>
												</div>
												<div class="mt-4">
													<h4 class="card-title mb-1 text-white">Vendors</h4>
													<h6 class="card-text fw-normal text-white-50">View
														list of vendors & update(coming soon)</h6>
												</div>
											</div>
										</a>
									</div>	
									<div
										class="col-md-4 col-xl-2 d-flex align-items-stretch sound-button">
										<a style="margin: 10px;"
											href="<%=request.getContextPath() %>/core/delivery/add"
											class="card bg-dark text-white w-100 card-hover">
											<div class="card-body">
												<div class="d-flex align-items-center">
													<span class="ri-truck-line display-6 fw-bold"></span>
													<div class="ms-auto">
														<i data-feather="arrow-right" class="fill-white"></i>
													</div>
												</div>
												<div class="mt-4">
													<h4 class="card-title mb-1 text-white">Delivery</h4>
													<h6 class="card-text fw-normal text-white-50">Add buying/selling details</h6>
												</div>
											</div>
										</a>
									</div>								
								</div>
								<audio id="nav_audio">
									<source src="<%=request.getContextPath() %>/assets/beep.mp3"
										type="audio/mpeg"></source>
									<source src="<%=request.getContextPath() %>/assets/beep.mp3"
										type="audio/ogg"></source>
								</audio>
								<!-- 7. end advertise card -->
							</div>
						</div>
					</div>
				</div>
			</div>
				
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- footer -->
			<!-- ============================================================== -->
			<footer class="footer text-center"> All Rights Reserved by
				Ozai Living Private Limited. </footer>
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
		src="<%=request.getContextPath()%>/new/assets/extra-libs/sparkline/sparkline.js"></script>
	<!--Wave Effects -->
	<script src="<%=request.getContextPath()%>/new/dist/js/waves.js"></script>
	<!--Menu sidebar -->
	<script src="<%=request.getContextPath()%>/new/dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="<%=request.getContextPath()%>/new/dist/js/feather.min.js"></script>
	<script src="<%=request.getContextPath()%>/new/dist/js/custom.min.js"></script>
	<!--This page JavaScript -->
	<script
		src="<%=request.getContextPath()%>/new/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/extra-libs/jvector/jquery-jvectormap-world-mill-en.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/apexcharts/dist/apexcharts.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/dist/js/pages/dashboards/dashboard1.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/echarts/dist/echarts-en.min.js"></script>
	<script
		src="<%=request.getContextPath() %>/new/dist/js/pages/echarts/pie-doughnut/${organization }-cities.js"></script>

	<!--Morris JavaScript -->
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/raphael/raphael.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/morris.js/morris.min.js"></script>
	<script
		src="<%=request.getContextPath() %>/new/dist/js/pages/morris/${organization }-revenue-data.js"></script>
	<!-- This Page Plugins -->
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/d3/dist/d3.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/c3/c3.min.js"></script>
	<!-- Charts JS -->
	<!--This page JavaScript -->
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/chartist/dist/chartist.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/echarts/dist/echarts-en.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/flot/excanvas.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/flot/jquery.flot.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/jquery.flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/d3/dist/d3.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/c3/c3.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/gaugeJS/dist/gauge.min.js"></script>
	<script
		src="<%=request.getContextPath() %>/new/dist/js/pages/widget/${organization }-revenue-charts.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/apexcharts/dist/apexcharts.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/dist/js/pages/widget/card-custom.js"></script>
	
	
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
		$(document).ready(function() {
			$(".sound-button").hover(function() {
				nav_audio.play();
			}, function() {
				nav_audio.load();
			});
		});
	</script>
</body>
</html>