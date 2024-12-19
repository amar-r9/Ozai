<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<title>Event | Ozai</title>
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
		<jsp:include page="/common/lctsidebar.jsp"></jsp:include>
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<div class="page-wrapper" style="margin-top: 120px;">
			<!-- ============================================================== -->
			<!-- End Left Sidebar - style you can find in sidebar.scss  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Page wrapper  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<div class="row">
					<div
						class="col-12">
						<c:if test="${not empty event }">
							<div class="card">
								<div class="card-body">
									<h3 class="card-title">${event.title }</h3>
									<h6 class="card-subtitle">On: ${event.date }  </h6>
									<div class="row">
										<div class="col-lg-9 col-md-9 col-sm-6">
											<h4 class="box-title mt-5"></h4>
											<h2 class="mt-5">
												${event.status } 
											</h2>
											
											<a href="<%=request.getContextPath() %>/lct/events/list" 
												class="btn btn-primary btn-rounded">See All</a>
										</div>
										<div class="col-lg-12 col-md-12 col-sm-12">
											<h3 class="box-title mt-5">Details</h3>
											<div class="row">
												<div class="col-6">
													<small class="text-muted mb-0">PROPERTY</small>
													<p class="text-dark">${event.property.name }</p>
													<small class="text-muted mb-0">LOCATION</small>
													<p class="text-dark">${event.location }</p>
												</div>
												<div class="col-6">
													<small class="text-muted mb-0">DATE</small>
													<p class="text-dark">${event.date }</p>
												</div>
											</div>
										</div>
										<div class="col-12">
											${event.summary }
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</div>
					<!-- -------------------------------------------------------------- -->
					<!-- Login box.scss -->
					<!-- -------------------------------------------------------------- -->
				</div>
			</div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- End footer -->
	<!-- ============================================================== -->
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
	<!-- This Page JS -->
	<script
		src="<%=request.getContextPath()%>/new/assets/extra-libs/prism/prism.js"></script>
	
</body>

</html>