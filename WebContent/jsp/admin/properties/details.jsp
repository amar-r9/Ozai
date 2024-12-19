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
<title>Ozai Admin Dashboard for tenants details, paymeent
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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<style>
blockquote {
  background: #f9f9f9;
  border-left: 10px solid #ccc;
  margin: 1.5em 10px;
  padding: 0.5em 10px;
  quotes: "\201C""\201D""\2018""\2019";
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
			<div class="page-breadcrumb">
				<div class="row">
					<div class="text-center">
						<h5 class="text-dark fw-bold">${propertyDetails.name }</h5>
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
					<div class="col-9 col-md-9 col-sm-12 col-12">
						<!-- ---------------------
                            start File export
                        ---------------- -->
						<div class="card">				

							<!-- Add Contact Popup Model -->

							<div class="card-body">
								<div class="justify-content-end">
									<div class="row">
										<div class="col-6">
											<img src="<%=request.getContextPath() %>/assets/img/${propertyDetails.id }/1.jpg" 
												style="max-width: 100%;" />
										</div>
										<div class="col-6">
											<img src="<%=request.getContextPath() %>/assets/img/${propertyDetails.id }/2.jpg" 
												style="max-width: 100%;" />
										</div>
									</div>
									<hr>
									<div class="card card-body text-center" style="background: #ecf3ef; border-radius: 10px;">
										<div class="row">
											<div class="col-4">
												<i class="ri-door-open-line fw-bold text-dark"></i> ${rooms.size() }
											</div>
											<div class="col-4">
												<i class="fa fa-bed fw-bold text-dark"></i> ${beds.size() }
											</div>
											<div class="col-4">
												<c:choose>
                    								<c:when test="${propertyDetails.gender eq 'Male' }">
                    									<i class="ri-men-line fw-bold text-dark"></i> <span class="text-muted">${propertyDetails.gender }</span>
                    								</c:when>
                    								<c:when test="${propertyDetails.gender eq 'Female' }">
                    									<i class="ri-women-line fw-bold text-dark"></i> <span class="text-muted">${propertyDetails.gender }</span>
                    								</c:when>
                    								<c:otherwise>
                    									<i class="fas fa-genderless fw-bold text-dark"></i> <span class="text-muted">${propertyDetails.gender }</span>
                    								</c:otherwise>
                    							</c:choose>
											</div>
										</div>
									</div>
									<div class="row card-body">
										<a href="<%=request.getContextPath() %>/admin/properties/room-revenue/${propertyDetails.id }"
											class="btn btn-rounded btn-dark w-100">GET ROOM WISE REVENUE</a>
									</div>
									<h6>Name: <span class="fw-bold text-dark">${propertyDetails.name }</span></h6>
									<small><i class="fas fa-map-marker-alt"></i> <span class="text-muted">${propertyDetails.location }, ${propertyDetails.city }</span></small>
									<blockquote>
										<small>${propertyDetails.description }</small>
									</blockquote>
									<div class="row">
										<div class="col-6">
											<a
												href="<%=request.getContextPath()%>/admin/properties/add-room/${propertyDetails.id }"
												class="card bg-success text-white w-100 card-hover" style="box-shadow: 3px 3px 3px !important;">
												<div class="card-body">
													<div class="d-flex align-items-center">
														<span class="ri-door-open-line display-6 fw-bold"></span>
														<div class="ms-auto">
															<i data-feather="arrow-right" class="fill-white"></i>
														</div>
													</div>
													<div class="mt-4">
														<h4 class="card-title mb-1 text-white">Rooms</h4>
														<h6 class="card-text fw-normal text-white-50">Add rooms here</h6>
													</div>
												</div>
											</a>
										</div>
										<div class="col-6">
											<a
												href="<%=request.getContextPath()%>/admin/properties/rooms-list/${propertyDetails.id }"
												class="card bg-info text-white w-100 card-hover" style="box-shadow: 3px 3px 3px !important;">
												<div class="card-body">
													<div class="d-flex align-items-center">
														<span class="bi bi-door-closed display-6 fw-bold"></span>
														<div class="ms-auto">
															<i data-feather="arrow-right" class="fill-white"></i>
														</div>
													</div>
													<div class="mt-4">
														<h4 class="card-title mb-1 text-white">List</h4>
														<h6 class="card-text fw-normal text-white-50">Rooms list here</h6>
													</div>
												</div>
											</a>
										</div>
									</div>
									<div class="row card-body">
										<a href="<%=request.getContextPath() %>/admin/properties/beds-list/${propertyDetails.id }"
											class="justify-content-center w-100 font-weight-medium					
                          					btn btn-primary d-flex
					                        align-items-center"><i class="fa fa-bed"></i> &nbsp;&nbsp;VIEW ALL BEDS</a>
									</div>
									<div class="row">
										<iframe src="${propertyDetails.map }"></iframe>
									</div>
								</div>
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
	<script src="<%=request.getContextPath()%>/assets/country-state.js"></script>
	<!-- Template Main JS File -->
	<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
	<script>
		$('document').ready(function() {
			populateCountries("country", "state");
			$('#country option:contains("${propertyDetails.country}")').prop('selected', true);
			populateStates("country", "state");
			$('#state option:contains("${propertyDetails.state}")').prop('selected', true);
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