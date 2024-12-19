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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link
      rel="stylesheet"
      type="text/css"
      href="<%=request.getContextPath()%>/new/assets/libs/quill/dist/quill.snow.css" />
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
					<div class="col-5 col-md-5 col-sm-12 col-12 align-self-center">
						<h4 class="page-title">Orders</h4>
					</div>
					<div class="col-7 align-self-center d-none d-lg-block">
						<div class="d-flex align-items-center justify-content-end">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">
										Orders</li>
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
					<div class="col-md-12 col-12">
						<!-- ---------------------
                            start Row selection (multiple rows)
                        ---------------- -->
						<c:if test="${not empty orders }">
							<div id="note-full-container" class="note-has-grid row">
								<c:forEach items="${orders}" var="order" varStatus="sno">
									<c:choose>
										<c:when test="${order.status == 'Order Received' }">
											<div class="col-md-4 single-note-item all-category">
												<div class="card card-body" style="border-radius: 20px;">
													<span class="side-stick"></span>
													<h5 class="note-title text-truncate w-75 mb-0"
														data-noteHeading="Book a Ticket for Movie">
														${order.category } 
														<i
															class="point ri-checkbox-blank-circle-fill ms-1 fs-1"></i>
													</h5>
													<p class="note-date fs-2 text-muted">${order.order_date }</p>
													<div class="note-content">
														<p class="note-inner-content text-muted"
															data-noteContent="Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.">
															Your order has been received and confirmed.</p>
													</div>
													<div class="d-flex align-items-center">
														
														<div class="ms-auto">
															<div class="category-selector btn-group">
																<a
																	class="nav-link dropdown-toggle category-dropdown label-group p-0"
																	data-bs-toggle="dropdown" href="#" role="button"
																	aria-haspopup="true" aria-expanded="true">
																	<div class="category">
																		<div class="category-business"></div>
																		<div class="category-social"></div>
																		<div class="category-important"></div>
																		<span class="more-options text-dark"><i
																			data-feather="more-vertical" class="feather-sm"></i></span>
																	</div>
																</a>
																<div
																	class="dropdown-menu dropdown-menu-right category-menu">
																	<a href="<%=request.getContextPath() %>/core/orders/details/${order.id}"
																		class="dropdown-item position-relative 
											                              text-success d-flex align-items-center">
											                        	<i class="ri-checkbox-blank-circle-line me-1"></i>View order</a> 
											                        <a class="note-social badge-group-item badge-social dropdown-item
										                              position-relative category-social text-info d-flex
										                              align-items-center" href="#">
										                              <i class="ri-checkbox-blank-circle-line me-1"></i>Track order</a>
										                            <a class="note-important badge-group-item badge-important
										                              dropdown-item position-relative category-important
										                              text-danger d-flex align-items-center" href="#">
										                              <i class="ri-checkbox-blank-circle-line me-1"></i>Cancel order</a>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:when>
										<c:when test="${order.status == 'Order Processing' }">
											<div class="col-md-4 single-note-item all-category note-important">
												<div class="card card-body" style="border-radius: 20px;">
													<span class="side-stick"></span>
													<h5 class="note-title text-truncate w-75 mb-0"
														data-noteHeading="Book a Ticket for Movie">
														${order.category } 
														<i class="point ri-checkbox-blank-circle-fill ms-1 fs-1"></i>
													</h5>
													<p class="note-date fs-2 text-muted">${order.order_date }</p>
													<div class="note-content">
														<p class="note-inner-content text-muted"
															data-noteContent="Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.">
															Your order is being processed.</p>
													</div>
													<div class="d-flex align-items-center">
														
														<div class="ms-auto">
															<div class="category-selector btn-group">
																<a
																	class="nav-link dropdown-toggle category-dropdown label-group p-0"
																	data-bs-toggle="dropdown" href="#" role="button"
																	aria-haspopup="true" aria-expanded="true">
																	<div class="category">
																		<div class="category-business"></div>
																		<div class="category-social"></div>
																		<div class="category-important"></div>
																		<span class="more-options text-dark"><i
																			data-feather="more-vertical" class="feather-sm"></i></span>
																	</div>
																</a>
																<div
																	class="dropdown-menu dropdown-menu-right category-menu">
																	<a href="<%=request.getContextPath() %>/core/orders/details/${order.id}"
																		class="dropdown-item position-relative category-business
											                              text-success d-flex align-items-center">
											                        	<i class="ri-checkbox-blank-circle-line me-1"></i>View order</a> 
											                        <a class="note-social badge-group-item badge-social dropdown-item
										                              position-relative category-social text-info d-flex
										                              align-items-center" href="javascript:void(0);">
										                              <i class="ri-checkbox-blank-circle-line me-1"></i>Track order</a>
										                            <a class="note-important badge-group-item badge-important
										                              dropdown-item position-relative category-important
										                              text-danger d-flex align-items-center" href="javascript:void(0);">
										                              <i class="ri-checkbox-blank-circle-line me-1"></i>Cancel order</a>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:when>
										<c:when test="${order.status == 'Order Shipped' }">
											<div class="col-md-4 single-note-item all-category note-social">
												<div class="card card-body" style="border-radius: 20px;">
													<span class="side-stick"></span>
													<h5 class="note-title text-truncate w-75 mb-0"
														data-noteHeading="Book a Ticket for Movie">
														${order.category }
														<i class="point ri-checkbox-blank-circle-fill ms-1 fs-1"></i>
													</h5>
													<p class="note-date fs-2 text-muted">${order.order_date }</p>
													<div class="note-content">
														<p class="note-inner-content text-muted"
															data-noteContent="Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.">
															Your order is shipped.</p>
													</div>
													<div class="d-flex align-items-center">
														
														<div class="ms-auto">
															<div class="category-selector btn-group">
																<a
																	class="nav-link dropdown-toggle category-dropdown label-group p-0"
																	data-bs-toggle="dropdown" href="#" role="button"
																	aria-haspopup="true" aria-expanded="true">
																	<div class="category">
																		<div class="category-business"></div>
																		<div class="category-social"></div>
																		<div class="category-important"></div>
																		<span class="more-options text-dark"><i
																			data-feather="more-vertical" class="feather-sm"></i></span>
																	</div>
																</a>
																<div
																	class="dropdown-menu dropdown-menu-right category-menu">
																	<a href="<%=request.getContextPath() %>/core/orders/details/${order.id}"
																		class="dropdown-item position-relative category-business
											                              text-success d-flex align-items-center">
											                        	<i class="ri-checkbox-blank-circle-line me-1"></i>View order</a> 
											                        <a class="note-social badge-group-item badge-social dropdown-item
										                              position-relative category-social text-info d-flex
										                              align-items-center" href="javascript:void(0);">
										                              <i class="ri-checkbox-blank-circle-line me-1"></i>Track order</a>
										                            <a class="note-important badge-group-item badge-important
										                              dropdown-item position-relative category-important
										                              text-danger d-flex align-items-center" href="javascript:void(0);">
										                              <i class="ri-checkbox-blank-circle-line me-1"></i>Cancel order</a>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:when>
										<c:when test="${order.status == 'Order Delivered' }">
											<div class="col-md-4 single-note-item all-category note-business">
												<div class="card card-body" style="border-radius: 20px;">
													<span class="side-stick"></span>
													<h5 class="note-title text-truncate w-75 mb-0"
														data-noteHeading="Book a Ticket for Movie">
														${order.category }
														<i class="point ri-checkbox-blank-circle-fill ms-1 fs-1"></i>
													</h5>
													<p class="note-date fs-2 text-muted">${order.order_date }</p>
													<div class="note-content">
														<p class="note-inner-content text-muted"
															data-noteContent="Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.">
															Your order is delivered.</p>
													</div>
													<div class="d-flex align-items-center">
														
														<div class="ms-auto">
															<div class="category-selector btn-group">
																<a
																	class="nav-link dropdown-toggle category-dropdown label-group p-0"
																	data-bs-toggle="dropdown" href="#" role="button"
																	aria-haspopup="true" aria-expanded="true">
																	<div class="category">
																		<div class="category-business"></div>
																		<div class="category-social"></div>
																		<div class="category-important"></div>
																		<span class="more-options text-dark"><i
																			data-feather="more-vertical" class="feather-sm"></i></span>
																	</div>
																</a>
																<div
																	class="dropdown-menu dropdown-menu-right category-menu">
																	<a href="<%=request.getContextPath() %>/core/orders/details/${order.id}"
																		class="dropdown-item position-relative category-business
											                              text-success d-flex align-items-center">
											                        	<i class="ri-checkbox-blank-circle-line me-1"></i>View order</a> 
											                        <a class="note-social badge-group-item badge-social dropdown-item
										                              position-relative category-social text-info d-flex
										                              align-items-center" href="javascript:void(0);">
										                              <i class="ri-checkbox-blank-circle-line me-1"></i>Track order</a>
										                            <a class="note-important badge-group-item badge-important
										                              dropdown-item position-relative category-important
										                              text-danger d-flex align-items-center" href="javascript:void(0);">
										                              <i class="ri-checkbox-blank-circle-line me-1"></i>Cancel order</a>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:when>
										<c:otherwise></c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</c:if>
						<c:if test="${empty orders }">
							<h5>No orders added yet.</h5>
						</c:if>
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
		src="<%=request.getContextPath()%>/new/dist/js/pages/notes/notes.js"></script>
	<!--This page plugins -->
	<script>
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
		$('document').ready(function() {
			$('.sidebartoggler').toggle();
		});
	</script>
</body>
</html>