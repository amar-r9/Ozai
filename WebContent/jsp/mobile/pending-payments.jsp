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
<meta name="description"
	content="Nice is powerful and clean admin dashboard template, inpired from Google's Material Design" />
<meta name="robots" content="noindex,nofollow" />
<title>Pending Bills | Ozai</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/new/assets/images/favicon.png" />
<!-- This page css -->
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

		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper" style="display: block;">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-5 align-self-center">
						<h4 class="text-center">Pending Bills</h4>
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
				<!-- basic table -->
				<div class="col-lg-4 col-xlg-3 col-md-5">
					<c:choose>
						<c:when test="${not empty rents }">
							<c:forEach items="${rents }" var="rent">
								<div class="card" style="border-radius: 20px;">
									<div class="card-body" style="padding-bottom: 0;">
										<div class="row">
											<div class="col-auto">
												<div class="avatar avatar-44 bg-primary shadow-sm rounded-10
													text-white text-center"
													style="line-height: 44px; width: 44px; border-radius: 8px;">
													<i class="bi bi-house vm"></i>
												</div>
											</div>
											<div class="col align-self-center">
												<p class="mb-0 text-color-theme">Rent</p>
												<p><i class="fa fa-rupee-sign"></i> ${rent.amount }
													<small style="float: right;">Due on: ${rent.raised_date }</small></p>
											</div>
											<div class="col-auto">
												<div class="avatar avatar-44 rounded-10 shadow-sm
													text-white text-center"
													style="width: 44px; border-radius: 8px;">
													<a href="<%=request.getContextPath() %>/mobile/user/make-payment/${rent.id}"
														class="btn btn-success btn-44 shadow-sm"> <i
														class="bi bi-arrow-right-circle"></i>
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:when>
					<c:when test="${not empty ebills }">
						<c:forEach items="${ebills }" var="rent">
							<div class="card" style="border-radius: 20px;">
								<div class="card-body" style="padding-bottom: 0;">
									<div class="row">
										<div class="col-auto">
											<div class="avatar avatar-44 bg-warning shadow-sm rounded-10
												text-white text-center"
												style="line-height: 44px; width: 44px; border-radius: 8px;">
												<i class="bi bi-lightning-charge vm"></i>
											</div>
										</div>
										<div class="col align-self-center">
											<p class="mb-0 text-color-theme">Electricity</p>
											<p><i class="fa fa-rupee-sign"></i> ${rent.amount }
												<small style="float: right;">Due on: ${rent.raised_date }</small></p>
										</div>
										<div class="col-auto">
											<div class="avatar avatar-44 rounded-10 shadow-sm
												text-white text-center"
												style="width: 44px; border-radius: 8px;">
												<a href="<%=request.getContextPath() %>/"
													class="btn btn-success btn-44 shadow-sm"> <i
													class="bi bi-arrow-right-circle"></i>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
					
					<c:when test="${not empty sds }">
						<c:forEach items="${sds }" var="rent">
							<div class="card" style="border-radius: 20px;">
								<div class="card-body" style="padding-bottom: 0;">
									<div class="row">
										<div class="col-auto">
											<div class="avatar avatar-44 bg-danger shadow-sm rounded-10
												text-white text-center"
												style="line-height: 44px; width: 44px; border-radius: 8px;">
												<i class="bi bi-flower1 vm"></i>
											</div>
										</div>
										<div class="col align-self-center">
											<p class="mb-0 text-color-theme">SD</p>
											<p><i class="fa fa-rupee-sign"></i> ${rent.amount }
												<small style="float: right;">Due on: ${rent.raised_date }</small></p>
										</div>
										<div class="col-auto">
											<div class="avatar avatar-44 rounded-10 shadow-sm
												text-white text-center"
												style="width: 44px; border-radius: 8px;">
												<a href="<%=request.getContextPath() %>/"
													class="btn btn-success btn-44 shadow-sm"> <i
													class="bi bi-arrow-right-circle"></i>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						There are no pending bills.
					</c:otherwise>
				</c:choose>
					
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->

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
	<!--This page JavaScript -->
	<script>
		$('document').ready(function() {
			//$('.sidebartoggler').toggle();
		});
		$(function() {
			"use strict";
			$("#main-wrapper").AdminSettings({
				LogoBg : "skin6",
				HeaderPosition : true,
				Theme : false,
			});
		});
	</script>
</body>
</html>