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
	content="Tikaana admin dashboard for finacne module" />
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
<!-- This page plugin CSS -->
<link href="https://nightly.datatables.net/css/jquery.dataTables.css"
	rel="stylesheet" type="text/css" />

<link
	href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.css"
	rel="stylesheet" type="text/css" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link href="<%=request.getContextPath()%>/assets/css/user-list.css"
	rel="stylesheet" />
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<style>
html, body {
	height: 100%;
}

#sidebar {
	flex-basis: 15rem;
	flex-grow: 1;
	padding: 1rem;
	max-width: 30rem;
	height: 100%;
	box-sizing: border-box;
	overflow: auto;
}

#map {
	
}

#floating-panel {
	text-align: center;
}

#floating-panel {
	text-align: center;
}

#map {
	
}

#sidebar {
	flex: 0 1 auto;
	padding: 0;
}

#sidebar>div {
	padding: 0.5rem;
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
					<div class="col-5 col-md-5 col-sm-12 col-12 align-self-center">
						<h4 class="page-title">Worksites</h4>
					</div>
					<div class="col-7 align-self-center d-none d-lg-block">
						<div class="d-flex align-items-center justify-content-end">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">
										Worksites</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="row">
					<div class="col-6">
						<a href="<%=request.getContextPath()%>/lct/properties/add-worksite">
							<div class="card card-body bg-warning text-white" style="border-radius: 10px;">
								<i class="fas fa-plus fa-2x"></i><br>
								<small>Add Worksite </small>
							</div>
						</a>
					</div>
					<div class="col-6">
						<a href="<%=request.getContextPath()%>/lct/properties/worksites">
							<div class="card card-body bg-danger text-white" style="border-radius: 10px;">
								<i class="fas fa-industry fa-2x"></i><br>
								<small>Worksites</small>
							</div>
						</a>
					</div>
				</div>
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- -------------------------------------------------------------- -->
				<!-- Start Page Content -->
				<!-- -------------------------------------------------------------- -->

				<!-- Row selection (multiple rows) -->
				
				<div class="row">
					<div class="card">
						<div class="border-bottom title-part-padding card-header">
							<div id="floating-panel" class="row">
								<div class="col-6">
									<label>Start:</label> <select id="start"
										class="form-control form-select">
										<option>Property</option>
										<c:forEach items="${properties }" var="pg">
											<option value="${pg.lan }, ${pg.lat }">${pg.name }</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-6">
									<label>End:</label> <select id="end"
										class="form-control form-select">
										<option>Work sites</option>
										<c:forEach items="${worksites }" var="site">
											<option value="${site.lan }, ${site.lat }">${site.name }</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
						<div class="card-body">
							<div id="container">
								<div id="map"
									style="position: relative; overflow: scroll; height: 200px; width: 100%;"></div>
								<div id="sidebar"></div>
							</div>
						</div>
						<div>
							<div id="floating-panel" class="row" style="display: none;">
								<div class="col-6">
									<strong>Start:</strong> <select id="start">
										<c:forEach items="${properties }" var="pg">
											<option value="${pg.lan }, ${pg.lat }">${pg.name }</option>
										</c:forEach>
									</select>
								</div>
								<div class="col-6">
									<strong>End:</strong> <select id="end">
										<c:forEach items="${worksites }" var="site">
											<option value="${site.lan }, ${site.lat }">${site.name }</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Form inputs -->

				<!-- row selection & deletion -->

				<!-- -------------------------------------------------------------- -->
				<!-- End PAge Content -->
				<!-- -------------------------------------------------------------- -->
				<!-- -------------------------------------------------------------- -->
				<!-- Right sidebar -->
				<!-- -------------------------------------------------------------- -->
				<!-- .right-sidebar -->
				<!-- -------------------------------------------------------------- -->
				<!-- End Right sidebar -->
				<!-- -------------------------------------------------------------- -->
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBJA3FfZ_Ki0SZ2uG8fZnYH-REze0wyub4&callback=initMap&v=weekly"
		defer></script>
</body>
<script>
  /**
   * @license
   * Copyright 2019 Google LLC. All Rights Reserved.
   * SPDX-License-Identifier: Apache-2.0
   */
  function initMap() {
    const directionsRenderer = new google.maps.DirectionsRenderer();
    const directionsService = new google.maps.DirectionsService();
    const map = new google.maps.Map(document.getElementById("map"), {
      zoom: 7,
      center: { lat: 17.43, lng: 78.37 },
      disableDefaultUI: true,
    });

    directionsRenderer.setMap(map);
    directionsRenderer.setPanel(document.getElementById("sidebar"));

    const control = document.getElementById("floating-panel");

    map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);

    const onChangeHandler = function () {
      calculateAndDisplayRoute(directionsService, directionsRenderer);
    };

    document.getElementById("start").addEventListener("change", onChangeHandler);
    document.getElementById("end").addEventListener("change", onChangeHandler);
  }

  function calculateAndDisplayRoute(directionsService, directionsRenderer) {
    const start = document.getElementById("start").value;
    const end = document.getElementById("end").value;

    directionsService
      .route({
        origin: start,
        destination: end,
        travelMode: google.maps.TravelMode.DRIVING,
      })
      .then((response) => {
        directionsRenderer.setDirections(response);
      })
      .catch((e) => window.alert("Select both Property and Worksite." + status));
  }

  window.initMap = initMap;

  </script>
  <script>
	    $(function () {
	        "use strict";
	        $("#main-wrapper").AdminSettings({
	          Theme: true, // this can be true or false ( true means dark and false means light ),
	          Layout: "horizontal",
	          LogoBg: "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
	          NavbarBg: "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
	          SidebarType: "overlay", // You can change it full / mini-sidebar / iconbar / overlay
	          SidebarColor: "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
	          SidebarPosition: false, // it can be true / false ( true means Fixed and false means absolute )
	          HeaderPosition: false, // it can be true / false ( true means Fixed and false means absolute )
	          BoxedLayout: false, // it can be true / false ( true means Boxed and false means Fluid )
	        });
	    });
		$('document').ready(function(){
    		
    		
    		
    		$('.sidebartoggler').toggle();
    	});
    </script>
</html>
