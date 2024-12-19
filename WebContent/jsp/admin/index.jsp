<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="keywords"
	content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, nice admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, material design, material dashboard bootstrap 5 dashboard template" />
<meta name="description" content="Tikaana Admin Dashboard" />
<meta name="robots" content="noindex,nofollow" />
<title>Ozai Admin Dashboard</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/new/assets/images/favicon.png" />
<!-- Custom CSS -->
<!-- Custom CSS -->
<link
	href="<%=request.getContextPath()%>/new/assets/libs/chartist/dist/chartist.min.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/new/dist/js/pages/chartist/chartist-init.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/new/assets/libs/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/new/assets/extra-libs/css-chart/css-chart.css"
	rel="stylesheet" />
<link
	href="<%=request.getContextPath()%>/new/assets/extra-libs/c3/c3.min.css"
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
<script src="<%=request.getContextPath()%>/assets/js/maps-tikaana.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<!-- Link Swiper's CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
<!-- Demo styles -->
<style>
.swiper {
	width: 100%;
	height: 250px;
}

.swiper-slide {
	text-align: center;
	width: 40% !important;
	margin-right: 10px !important;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.swiper-slide img {
	display: block;
	width: 100%;
	/*height: 100%;*/
	object-fit: cover;
}
</style>
<style>
.loader {
	-webkit-animation: spin 2s linear infinite;
	animation: spin 2s linear infinite;
	/*margin-left: 32%;*/
}

@
-webkit-keyframes spin { 0% {
	-webkit-transform: rotate(0deg);
}

100%
{
-webkit-transform
:
 
rotate
(360deg);
 
}
}
@
keyframes spin { 0% {
	transform: rotate(0deg);
}

100%
{
transform
:
 
rotate
(360deg);
 
}
}
.list-task .task-done span {
	text-decoration: none;
}

.list-group-item {
	background: none !important;
}

body {
	font-size: 1rem;
}

small {
	font-size: .775em;
	font-weight: 500;
}

.small {
	font-size: .475em;
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
		<div class="page-wrapper" style="margin-top: 50px;">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-5 align-self-center">
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


				<div class="d-none d-lg-block">
					<p>&nbsp;</p>
					<p>&nbsp;</p>
				</div>
				<div class="d-none d-lg-block">
					<c:if test="${not empty AdminUser}">
						<div class=" card card-body"
							style="width: 100%; border-radius: 10px;">
							<div class=" text-dark"
								style="border-radius: 30px; font-weight: 700;">
								<h2>Hi, ${AdminUser.name}</h2>
							</div>
						</div>
					</c:if>
				</div>
				<div class="card-group">
					<div class="d-block d-lg-none">
						<c:if test="${not empty AdminUser}">
							<div class="" style="border-radius: 10px;">
								<div class=" text-dark"
									style="border-radius: 30px; font-weight: 700;">
									<h2>Hi, ${AdminUser.name}</h2>
								</div>
							</div>
						</c:if>
					</div>

					<%-- <div class="card card-body pt-2 pb-0"
						style="border-radius: 20px; box-shadow: 2px 2px 2px #c7c4d7; background: #e4d4d4;">
						<div class="row">
							<div class="col-8">
								<div class="row">
									<div class="col-5 text-start">
										<img
											src="<%=request.getContextPath() %>/assets/images/statsicons/1.png"
											style="width: 100%;" />
									</div>
									<div class="col-7 text-end">
										<div class="text-center">
											<h3 class="text-dark fw-bold mb-n1 pt-1" id="residents-count">00</h3>
											<p>Residents</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-4 text-end">
								<a href="<%=request.getContextPath() %>/admin/residents/list">
									<i class="text-dark fa-3x fw-bold fas fa-caret-right pt-1"></i>
								</a>
							</div>
						</div>
					</div> --%>
					<%-- <div class="card card-body pt-2 pb-0"
						style="border-radius: 20px; box-shadow: 2px 2px 2px #c7c4d7; background: #e4d4d4;">
						<div class="row">
							<div class="col-8">
								<div class="row">
									<div class="col-5 text-start">
										<img
											src="<%=request.getContextPath() %>/assets/images/statsicons/2.png"
											style="width: 100%;" />
									</div>
									<div class="col-7 text-end">
										<div class="text-center">
											<h3 class="text-dark fw-bold mb-n1 pt-1" id="tickets-count">00</h3>
											<p>Tickets</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-4 text-end">
								<a href="<%=request.getContextPath() %>/admin/tickets/list">
									<i class="text-dark fa-3x fw-bold fas fa-caret-right pt-1"></i>
								</a>
							</div>
						</div>
					</div> --%>
					<%-- <div class="card card-body pt-2 pb-0"
						style="border-radius: 20px; box-shadow: 2px 2px 2px #c7c4d7; background: #e4d4d4;">
						<div class="row">
							<div class="col-8">
								<div class="row">
									<div class="col-5 text-start">
										<img
											src="<%=request.getContextPath() %>/assets/images/statsicons/3.png"
											style="width: 100%;" />
									</div>
									<div class="col-7 text-end">
										<div class="text-center">
											<h3 class="text-dark fw-bold mb-n1 pt-1" id="expenses-count">00</h3>
											<p>Expenses</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-4 text-end">
								<a href="<%=request.getContextPath() %>/admin/expenses/list">
									<i class="text-dark fa-3x fw-bold fas fa-caret-right pt-1"></i>
								</a>
							</div>
						</div>
					</div> --%>
					<%-- <div class="card card-body pt-2 pb-0"
						style="border-radius: 20px; box-shadow: 2px 2px 2px #c7c4d7; background: #e4d4d4;">
						<div class="row">
							<div class="col-8">
								<div class="row">
									<div class="col-5 text-start">
										<img
											src="<%=request.getContextPath() %>/assets/images/statsicons/4.png"
											style="width: 100%;" />
									</div>
									<div class="col-7 text-end">
										<div class="text-center">
											<h3 class="text-dark fw-bold mb-n1 pt-1"
												id="notifications-count">00</h3>
											<p>Notifications</p>
										</div>
									</div>
								</div>
							</div>
							<div class="col-4 text-end">
								<a href="#"> <i
									class="text-dark fa-3x fw-bold fas fa-caret-right pt-1"></i>
								</a>
							</div>
						</div>
					</div> --%>

					<%-- <div class="card card-body" style="border-radius: 10px; padding: 23px; box-shadow: 3px 3px 3px #c7c4d7;">
						<h4 class="fw-bold text-dark">Key Stats</h4>
						<div class="row">	
							<!-- Column -->
							<div class="col-3 col-md-3 col-6 col-sm-6 text-center">
								<a href="<%=request.getContextPath() %>/admin/residents/list">
									<div class="card" style="border-radius: 10px; 
										margin-bottom: 5px; background: #e4eaf2; box-shadow: none;">
										<div class="card-body">
											<div class="row" style="color: #397c93;">
												<i class="fas fa-users fa-2x"></i>
											</div>
											<div class="row" style="padding-top: 5px;">
												<h5 style="font-weight: 900; color: #000;" id="residents-count">00</h5>
											</div>
										</div>
									</div>
									<p style="font-weight: 600; color: #000;">Residents</p>
								</a>
							</div>
							<!-- Column -->
							<!-- Column -->
							<div class="col-3 col-md-3 col-6 col-sm-6 text-center">
								<a href="<%=request.getContextPath() %>/admin/tickets/list">
									<div class="card" style="border-radius: 10px; 
										margin-bottom: 5px; background: #e4eaf2; box-shadow: none;">
										<div class="card-body">
											<div class="row" style="color: #397c93;">
												<i class="fa fa-ticket-alt fa-2x"></i>
											</div>
											<div class="row" style="margin-top: 5px;">
												<h5 style="font-weight: 900; color: #000;" id="tickets-count">00</h5>
											</div>
										</div>
									</div>
									<p style="font-weight: 600; color: #000;">Tickets</p>
								</a>
							</div>							
							<!-- Column -->
							<!-- Column -->
							<div class="col-3 col-md-3 col-6 col-sm-6 text-center">
								<a href="<%=request.getContextPath() %>/admin/properties/list">
									<div class="card" style="border-radius: 10px; 
										margin-bottom: 5px; background: #e4eaf2; box-shadow: none;">
										<div class="card-body">
											<div class="row" style="color: #397c93;">
												<i class="fas fa-building fa-2x"></i>
											</div>
											<div class="row" style="padding-top: 5px;">
												<h5 style="font-weight: 900; color: #000;" id="properties-count">00</h5>
											</div>
										</div>
									</div>
									<p style="font-weight: 600; color: #000;">Properties</p>
								</a>
							</div>
							<!-- Column -->
							<!-- Column -->
							<div class="col-3 col-md-3 col-6 col-sm-6 text-center">
								<a href="<%=request.getContextPath() %>/admin/properties/property-revenue">
									<div class="card" style="border-radius: 10px; 
										margin-bottom: 5px; background: #e4eaf2; box-shadow: none;">
										<div class="card-body"> <!--  style="padding: 0.5rem 0.5rem;"> -->
											<div class="row" style="color: #397c93;">
												<i class="fas fa-rupee-sign fa-2x"></i>
											</div>
											<div class="row" style="padding-top: 5px;">
												<h5 style="font-weight: 900; color: #000;" id="payments-sum">00</h5>
											</div>
										</div>
									</div>
									<p style="font-weight: 600; color: #000;">Revenue</p>
								</a>
							</div>
							<!-- Column -->
						</div>
					</div> --%>
				</div>

				<%-- <div class="card"
					style="border-radius: 10px; box-shadow: 3px 3px 3px #c7c4d7;">
					<div class="card-body">
						<div class="row">
							<div class="">
								<h5 style="font-weight: 700; color: #474040;">Walk-Ins</h5>
								<div class="">
									<div class="row text-center">
										<div class="col-sm-4 col-4">
											<a
												href="<%=request.getContextPath()%>/admin/bookings/add-walkin"
												class="btn btn-circle btn-warning btn-lg text-white"
												style="background:;"><i class="ri-walk-line"></i></a> <br>
											<small style="font-size: .775em !important;">Add
												Walk-in</small>
										</div>
										<div class="col-sm-4 col-4">
											<a
												href="<%=request.getContextPath()%>/admin/bookings/walkins-list"
												class="btn btn-circle btn-dark btn-lg text-white"
												style="background:;"><i class="ri-list-check"></i></a> <br>
											<small style="font-size: .775em !important;">Walk-in
												List</small>
										</div>
										<div class="col-sm-4 col-4">
											<a
												href="<%=request.getContextPath()%>/admin/bookings/bookings-list"
												class="btn btn-circle btn-info btn-lg text-white"
												style="background:;"><i class="fas fa-bookmark"></i></a> <br>
											<small style="font-size: .775em !important;">Booking
												List</small>
										</div>
									</div>
								</div>
							</div>
							<!-- 7. Stats card -->

						</div>
					</div>
				</div> --%>

				<%-- <div class="row">
					<h5 class="text-dark fw-bold">Events</h5>
					<div class="col-6">
						<a href="<%=request.getContextPath()%>/admin/events/add"
							class="card text-white w-100 card-hover"
							style="box-shadow: 3px 3px 3px #c7c4d7 !important; background: #453952;">
							<div class="card-body">
								<div class="d-flex align-items-center">
									<span class="fa fa-plus display-6 fw-bold"></span>
									<div class="ms-auto">
										<i data-feather="arrow-right" class="fill-white"></i>
									</div>
								</div>
								<div class="mt-4">
									<h4 class="card-title mb-1 text-white">Add</h4>
									<h6 class="card-text fw-normal text-white-50">Add event
										here</h6>
								</div>
							</div>
						</a>
					</div>
					<div class="col-6">
						<a href="<%=request.getContextPath()%>/admin/events/list"
							class="card text-white w-100 card-hover"
							style="box-shadow: 3px 3px 3px #c7c4d7 !important; background: #033167;">
							<div class="card-body">
								<div class="d-flex align-items-center">
									<span class="fas fa-clipboard-list display-6 fw-bold"></span>
									<div class="ms-auto">
										<i data-feather="arrow-right" class="fill-white"></i>
									</div>
								</div>
								<div class="mt-4">
									<h4 class="card-title mb-1 text-white">List</h4>
									<h6 class="card-text fw-normal text-white-50">View events
										list</h6>
								</div>
							</div>
						</a>
					</div>
				</div> --%>

				<%-- <div class="card" style="border-radius: 10px;">
					<div class="card-body">
						<p style="font-weight: 900; color: #000;">Send Notification</p>
						<form id="notice-form" method="post">
							<div class="mb-3">
								<input type="text" name="title" id="title"
									style="border-radius: 50px;" class="form-control"
									id="exampleInputname2" placeholder="Title" required />
							</div>
							<input type="hidden" name="admin_id"
								value="${AdminUser.client_code }" />
							<div class="mb-3">
								<textarea id="message" style="border-radius: 20px;"
									class="form-control" name="message" rows="4"
									placeholder="Message" required></textarea>
							</div>
							<div class="text-center">
								<button type="submit" id="send"
									class="btn btn-dark btn-rounded 
	                        	font-weight-medium">
									SUBMIT</button>
							</div>
						</form>
						<div class="alert alert-success" id="successMsg"
							style="display: none;">
							<i class="fas fa-check-circle"></i> Notification sent.
						</div>
					</div>
				</div> --%>

				<%-- <div class="card"
					style="border-radius: 10px; box-shadow: 3px 3px 3px #c7c4d7;">
					<div class="card-body">
						<div class="row">
							<div class="">
								<h5 style="font-weight: 700; color: #474040;">Residents</h5>
								<div class="">
									<div class="row text-center">
										<div class="col-sm-4 col-4">
											<a href="<%=request.getContextPath()%>/admin/residents/add"
												class="btn btn-circle btn-lg text-white"
												style="background: #e55e1e;"><i class="fas fa-user"></i></a>
											<br> <small style="font-size: .775em !important;">Add
												Resident</small>
										</div>
										<div class="col-sm-4 col-4">
											<a href="<%=request.getContextPath()%>/admin/residents/list"
												class="btn btn-circle btn-lg text-white"
												style="background: #1ee57d;"><i class="fas fa-users"></i></a>
											<br> <small style="font-size: .775em !important;">Residents
												List</small>
										</div>
										<div class="col-sm-4 col-4">
											<a
												href="<%=request.getContextPath()%>/admin/residents/pending-rents"
												class="btn btn-circle btn-lg text-white"
												style="background: #581ee5;"><i
												class="fas fa-rupee-sign"></i></a> <br>
											<small style="font-size: .775em !important;">Pending
												Rents</small>
										</div>
									</div>
								</div>
							</div>
							<!-- 7. Stats card -->

						</div>
					</div>
				</div> --%>

				<%-- <div class="alert d-block d-lg-none">
					<div class="">
						<div class="row">
							<div class="swiper mySwiper">
								<div class="swiper-wrapper">
									<div class="swiper-slide">
										<img
											src="<%=request.getContextPath() %>/assets/images/ozaismall1.png"
											style="border-radius: 10px;" />
									</div>
									<div class="swiper-slide">
										<img
											src="<%=request.getContextPath() %>/assets/images/ozaismall2.png"
											style="border-radius: 10px;" />
									</div>
									<div class="swiper-slide">
										<img
											src="<%=request.getContextPath() %>/assets/images/ozaismall3.png"
											style="border-radius: 10px;" />
									</div>
								</div>
								<div class="swiper-pagination"></div>
							</div>
						</div>
					</div>
				</div> --%>

				<%-- <div class="row">
					<div class="col-md-6 col-6 col-sm-12 col-12">
						<div class="card" style="border-radius: 10px;">
							<div class="card-body" style="margin-bottom: 15px;">
								<p style="font-weight: 900; color: #000;">Resident Breakup</p>
								<br>
								<div id="basic-pie" style="width: 100%;"></div>
								<br>
								<!-- <div id="cities-stats" style="height: 400px;"></div> -->
							</div>
						</div>
					</div>


					<!-- Swiper -->


					<!-- <div class="row" style="margin-bottom: 10px; ">
					<a href="<%=request.getContextPath() %>/admin/badminton-league">
						<img src="<%=request.getContextPath() %>/assets/img/badminton.jpeg"
							style="border-radius: 10px; width: 100%; box-shadow: 5px 5px 5px #c7c4d7;" />
					</a>
				</div> -->


					<div class="col-md-6 col-6 col-sm-12 col-12">
						<div class="card"
							style="border-radius: 10px; box-shadow: 5px 5px 5px #c7c4d7;">
							<div class="card-body">
								<p style="font-weight: 700;">
									<span style="color: #000;">Recent Tickets</span>
								</p>
								<c:choose>
									<c:when test="${not empty tickets}">
										<div class="todo-widget">
											<ul class="list-task todo-list list-group mb-0"
												data-role="tasklist">
												<c:forEach items="${tickets }" var="ticket">
													<li
														class="list-group-item todo-item border-0
											mb-2 py-3 pe-3 ps-0 border-bottom"
														data-role="task">
														<div class="form-check">
															<c:if test="${ticket.status eq 'Raised' }">
																<input type="checkbox"
																	class="form-check-input info check-light-info"
																	id="newc1">
															</c:if>
															<c:if test="${ticket.status eq 'Opened' }">
																<input type="checkbox"
																	class="form-check-input success check-light-success"
																	id="newc1">
															</c:if>
															<c:if test="${ticket.status eq 'In Progress' }">
																<input type="checkbox"
																	class="form-check-input warning check-light-warning"
																	id="newc1">
															</c:if>
															<c:if test="${ticket.status eq 'Closed' }">
																<input type="checkbox"
																	class="form-check-input danger check-light-danger"
																	id="newc1">
															</c:if>
															<div
																class="form-check-label todo-label align-items-center ps-2"
																for="newc1">
																<div>
																	<h5 class="todo-desc mb-0 fs-3 font-weight-medium">
																		${ticket.title }</h5>
																	<div class="todo-desc text-muted fw-normal fs-2">
																		<i class="fa fa-calendar"></i>
																		<fmt:formatDate value="${ticket.raised_date }"
																			pattern="MMM dd, yyyy" />
																	</div>
																	<div class="row">
																		<span
																			class="col-6 todo-desc 
																fw-normal fs-2">Room
																			: ${ticket.details.room.room_no }</span> <span
																			class="col-6 todo-desc 
																fw-normal fs-2">Property
																			: ${ticket.details.property.name }</span>
																	</div>
																</div>
															</div>

														</div>
													</li>
												</c:forEach>
											</ul>
										</div>
										<div class="text-center">
											<a href="<%=request.getContextPath()%>/admin/tickets/list"
												class="btn btn-dark btn-wide">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												View All&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
										</div>
							</c:when>
							<c:otherwise>
								<div class="row col-12 pt-3  mt-3 mb-3">
									<div class="d-none d-lg-block">
										<p>&nbsp;</p>
										<p>&nbsp;</p>
									</div>
									<h4>No tickets listed so far.</h4>
									<div class="d-none d-lg-block">
										<p>&nbsp;</p>
										<p>&nbsp;</p>
										<p>&nbsp;</p>
									</div>
								</div>
							</c:otherwise>
							</c:choose>
							</div>
						</div>
					</div>
				</div> --%>

				<%-- <div class="card"
					style="background: #F3F1F0; border-radius: 10px; box-shadow: 3px 3px 3px #c7c4d7;">
					<div class="card-body">
						<div class="row">
							<div class="">
								<h5 style="font-weight: 700; color: #474040;">Properties</h5>
								<div class="">
									<div class="row text-center">
										<div class="col-sm-4 col-4">
											<a
												href="<%=request.getContextPath()%>/admin/properties/add-property"
												class="btn btn-circle btn-lg btn-light-primary"> <i
												class="fas fa-plus"></i></a> <br> <span
												class="text-dark fw-bold">Add</span>
										</div>
										<div class="col-sm-4 col-4">
											<a href="<%=request.getContextPath()%>/admin/properties/list"
												class="btn btn-circle btn-lg btn-light-primary"> <i
												class="fas fa-list"></i></a><br> <span
												class="text-dark fw-bold">List</span>
										</div>
										<div class="col-sm-4 col-4">
											<a
												href="<%=request.getContextPath()%>/admin/properties/beds-list"
												class="btn btn-circle btn-lg btn-light-primary"> <i
												class="fas fa-bed"></i></a><br> <span
												class="text-dark fw-bold">Beds</span>
										</div>
									</div>
								</div>
							</div>
							<!-- 7. Stats card -->

						</div>
					</div>
				</div> --%>
				<%-- <div class="row">
					<div class="col-sm-12 col-md-6">
						<div class="card card-body"
							style="border-radius: 10px; box-shadow: 5px 5px 5px #c7c4d7;">
							<h5 style="font-weight: 700; color: #474040;">Invite A
								Friend</h5>
							<div class="row">
								<div class="d-block d-lg-none">
									<img
										src="<%=request.getContextPath()%>/assets/images/referfriend.png"
										style="width: 100%;" alt="Refer a friend" />
								</div>
								<div class="d-none d-lg-block">
									<img
										src="<%=request.getContextPath()%>/assets/images/referfriend.png"
										style="height: 150px;" alt="Refer a friend" />
								</div>
								<p>Invite your friend to Ozai.</p>
								<p class="text-center">
									<a href="<%=request.getContextPath()%>/admin/invite-friend"
										class="btn btn-dark">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										INVITE NOW&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
								</p>
							</div>
						</div>
					</div>
					<div class="col-sm-12 col-md-6">
						<div class="card card-body"
							style="border-radius: 10px; box-shadow: 5px 5px 5px #c7c4d7;">
							<h5 style="font-weight: 700; color: #474040;">Loan</h5>
							<div class="row">
								<div class="col-md-4 col-4">
									<span class="pull-right"><img
										src="<%=request.getContextPath()%>/assets/img/loan1.png"
										style="width: 100%;" /></span>
								</div>
								<div class="col-md-8 col-8 text-justify">
									<p style="color: #353535; font-size: .875rem;">We
										understand that you might need a loan at anytime. We work with
										NBFCs who are willing to support you during such times. Apply
										for a loan now!</p>
								</div>
							</div>
							<div class="text-center">
								<a href="<%=request.getContextPath()%>/admin/apply-loan"
									class="btn btn-dark">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									APPLY NOW&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> <br>
								<br>
							</div>
						</div>
					</div>
				</div> --%>

				<!-- <div class="card"
					style="background: #dae1e0; border-radius: 10px; box-shadow: 5px 5px 5px #c7c4d7;">
					<div class="card-body">
						<h5 style="font-weight: 700; color: #474040;">Collections</h5>
						<div class="form-group card-body row">
							<label class="col-6">Select Month</label> <span class="col-6">
								<input type="month" id="month" class="d-block w-100 form-select"
								style="width: 100%;" value="This month" />
							</span>
						</div>
					</div>
					<div id="pullData">
						<div class="card-body bg-extra-light text-center">
							<div class="progress bg-danger" style="height: 25px">
		                    	<div class="progress-bar bg-success" style="width: 33%" role="progressbar">
		                      		33%
		                    	</div>
		                  	</div>
						</div>
						<div class="card-body text-center">
							<h6 style="font-weight: 600;">
								Collected : <span id="collected-sum"></span>
							</h6>
							<h6 style="font-weight: 600;">
								Pending : <span id="pending-sum"></span>
							</h6>
						</div>
					</div>
				</div> -->


				<%-- <div class="card" style="border-radius: 10px; background: #fff; box-shadow: 5px 5px 5px #c7c4d7;">
					<div class="card-body">
						<p style="font-weight: 900; color: #000;">Properties</p>
						<div class="row">									
							<ul class="list-group list-group-flush">
                   				<li class="list-group-item">                      
									<a href="<%=request.getContextPath() %>/admin/properties/list"
								 		style="color: #000 !important;">
										<span>Property List</span><span style="float: right;">
										<i class="fas fa-angle-right"></i></span></a>
                   				</li>
                   				<li class="list-group-item">                      
									<a href="<%=request.getContextPath() %>/admin/properties/add-property"
								 		style="color: #000 !important;">
										<span>Add Property</span><span style="float: right;">
										<i class="fas fa-angle-right"></i></span></a>
                   				</li>
								<li class="list-group-item">                      
									<a href="<%=request.getContextPath() %>/admin/properties/add-room"
								 		style="color: #000 !important;">
										<span>Add Room</span><span style="float: right;">
										<i class="fas fa-angle-right"></i></span></a>
                   				</li>
                   				<li class="list-group-item">                      
									<a href="<%=request.getContextPath() %>/admin/properties/beds-stats"
								 		style="color: #000 !important;">
										<span>Beds List</span><span style="float: right;">
										<i class="fas fa-angle-right"></i></span></a>
                   				</li>
                   				<li class="list-group-item">
			                      
                   				</li>
                 				</ul>
						</div>
					</div>
				</div> --%>


				<%-- <div class="card"
					style="background: #B3B1AC; border-radius: 10px; box-shadow: 3px 3px 3px #c7c4d7;">
					<div class="card-body">
						<div class="row">
							<div class="">
								<h5 style="font-weight: 700; color: #000;">Expenses</h5>
								<div class="">
									<div class="row text-center">
										<div class="col-sm-4 col-4">
											<a href="<%=request.getContextPath()%>/admin/expenses/add"
												class="btn btn-circle btn-lg btn-light-warning"> <i
												class="fas fa-plus"></i></a> <br> <span class="text-dark ">Add</span>
										</div>
										<div class="col-sm-4 col-4">
											<a href="<%=request.getContextPath()%>/admin/expenses/list"
												class="btn btn-circle btn-lg btn-light-warning"> <i
												class="fas fa-list"></i></a><br> <span class="text-dark">List</span>
										</div>
										<div class="col-sm-4 col-4">
											<a
												href="<%=request.getContextPath()%>/admin/expenses/vendor-list"
												class="btn btn-circle btn-lg btn-light-warning"> <i
												class="fas fa-users"></i></a><br> <span class="text-dark">Vendors</span>
										</div>
									</div>
								</div>
							</div>
							<!-- 7. Stats card -->

						</div>
					</div>
				</div> --%>


				<%-- <div class="card" style="border-radius: 10px; background: #B3B1AC; box-shadow: 3px 3px 3px #c7c4d7;">
					<div class="card-body">
						<p style="font-weight: 900; color: #fff;">Expenses</p>
						<div class="col-12 text-end">
							<a href="<%=request.getContextPath() %>/admin/expenses/add"
								 class="btn btn-circle btn-light">													
								<i class="fas fa-plus"></i></a>
							<a href="<%=request.getContextPath() %>/admin/expenses/list"
								class="btn btn-circle btn-light-info">
								<i class="fas fa-list"></i></a>
							<a href="<%=request.getContextPath() %>/admin/expenses/vendor-list"
								class="btn btn-circle btn-light-warning">
								<i class="fas fa-users"></i></a>
						</div>
					</div>
				</div> --%>

				<%-- <div class="card"
					style="border-radius: 10px; background: #fff; box-shadow: 5px 5px 5px #c7c4d7;">
					<div class="card-body">
						<p style="font-weight: 900; color: #000;">Employees</p>
						<div class="row">
							<ul class="list-group list-group-flush">
								<li class="list-group-item"><a
									href="<%=request.getContextPath()%>/admin/employees/list"
									style="color: #000 !important;"> <span>Employees
											List</span><span style="float: right;"> <i
											class="fas fa-angle-right"></i></span></a></li>
								<li class="list-group-item"><a
									href="<%=request.getContextPath()%>/admin/employees/add"
									style="color: #000 !important;"> <span>Add Employ</span><span
										style="float: right;"> <i class="fas fa-angle-right"></i></span></a>
								</li>
								<li class="list-group-item"><a
									href="<%=request.getContextPath()%>/admin/employees/salary-list"
									style="color: #000 !important;"> <span>Pay Salary</span><span
										style="float: right;"> <i class="fas fa-angle-right"></i></span></a>
								</li>
								<li class="list-group-item"><a
									href="<%=request.getContextPath()%>/admin/employees/salary-paid"
									style="color: #000 !important;"> <span>Paid List</span><span
										style="float: right;"> <i class="fas fa-angle-right"></i></span></a>
								</li>
								<li class="list-group-item"></li>
							</ul>
						</div>
					</div>
				</div> --%>
				<div class="row">                  
                	<c:forEach items="${groceries }" var="gr">
						<div class="form-group card alert">
	                    	<div class="row">
	                        	<div class="col-2 mt-2">
	                            	<i class="fas fa-2x fa-clipboard-list"></i>
	                          	</div>
	                          	<div class="col-4">
	                            	<h5 class="font-500">${gr.name }</h5>
	                          	</div>
	                          	<div class="col-3 mt-3"><i class="fas fa-rupee-sign"></i>&nbsp; ${gr.price }</div>
	                          	<div class="col-3 mt-3">
	                            	<input type="number" name="quantity" id="quantity" class="form-control" placeholder="0" />
	                          	</div>
	                        </div>
                    	</div>
	                </c:forEach>
                    <hr>
                    <div class="d-flex no-block align-items-center">
                      
                      <div class="ms-auto">
                        <button class="btn btn-danger">
                          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-shopping-cart fill-white feather-sm"><circle cx="9" cy="21" r="1"></circle><circle cx="20" cy="21" r="1"></circle><path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path></svg>
                          Checkout
                        </button>
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
				Ozai. </footer>
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

	<!--Morris JavaScript -->
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/raphael/raphael.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/morris.js/morris.min.js"></script>
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
		src="<%=request.getContextPath()%>/new/assets/libs/apexcharts/dist/apexcharts.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/dist/js/pages/widget/card-custom.js"></script>
	<!-- Swiper JS -->
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/echarts/dist/echarts-en.min.js"></script>

	<!-- Initialize Swiper -->
	<script>
      var swiper = new Swiper(".mySwiper", {
        
    	  slidesPerView: 1,
    	  spaceBetween: -280,
		  centerInsufficientSlides: true,
    	  centeredSlides: true,
    	  centeredSlidesBounds: true,
		loop: false,
        autoplay: {
          delay: 2500,
          disableOnInteraction: false,
        },
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
    </script>
	<script>
		$('document').ready(function() {
			
			google.load("visualization", "1", {packages:["corechart"]});
    		google.setOnLoadCallback(drawCharts);
    		function drawCharts() {
    		  
    		  // BEGIN PIE CHART
    		  
    		  // pie chart data
    		  var pieData = google.visualization.arrayToDataTable([
    		    ['Property', 'Strength'], ${residentsChartData }]);
    		  // pie chart options
    		  var pieOptions = {
    		    backgroundColor: 'transparent',
    		    pieHole: 0,
    		    colors: [ "#4E5E77", 
    		              "#5FC7EA", 
    		              "#71AE60", 
    		              "#F7685F", 
    		              "#F9B534", 
    		              "purple", 
    		              "turquoise", 
    		              "forestgreen", 
    		              "navy", 
    		              "gray"],
    		    pieSliceText: 'value',
    		    tooltip: {
    		      text: 'percentage'
    		    },
    		    fontName: 'Open Sans',
    		    chartArea: {
    		      width: '100%',
    		      height: '100%'
    		    },
    		    legend: {
    		      textStyle: {
    		        fontSize: 13
    		      }
    		    }
    		  };
    		  // draw pie chart
    		  var pieChart = new google.visualization.PieChart(document.getElementById('basic-pie'));
    		  pieChart.draw(pieData, pieOptions);
    		}
			
			
			$('#hideBack').hide();
			$('#notice-form').submit(function(event){
				event.preventDefault();
				saveNotice();
			});
			
			function saveNotice(){
				var formData=$("#notice-form").serialize();
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/admin/saveNotice",
					data : formData,
					//contentType: "text/json; charset=utf-8",
		            //dataType: "json",
					timeout : 100000,
					beforeSend:function(){
						$("#loading").show();
						$("#notice-form").hide();
					},
					success : function(data) {
						
						console.log("SUCCESS: ", data);
						
						if(data=='success'){
							$("#notice-form")[0].reset();
							$('#successMsg').show();
						}else
						if(data=='failed'){
							$('#errorMsg').show();
						} else if(data=='empty'){
							$('#emptyMsg').click();
						} 
						$("#send").button('reset');
					},
					error : function(e) {
						console.log("ERROR: ", e);
						bootbox.alert(e);
						$("#send").button('reset');
					},
					done : function(e) {
						console.log("DONE");
						$("#send").button('reset');
						
					}
				});
			}
			
			
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
	<script>
		$('document').ready(function() {

			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/admin/properties-count",
				timeout : 100000,
				beforeSend : function() {
					//$('#school-points').append('<i class="fa fa-spinner fa-spin orange" id="loading"></i>');
				},
				success : function(data) {

					console.log("SUCCESS: ", data);
					if(data>0){
						$('#properties-count').empty();
						$('#properties-count').html(+data);
					}

				},
				error : function(e) {
					console.log("ERROR: ", e);

				},
				done : function(e) {
					console.log("DONE");
					//$('#loading').remove();

				}
			});

			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/admin/tickets-count",
				timeout : 100000,
				beforeSend : function() {
					//$('#school-points').append('<i class="fa fa-spinner fa-spin orange" id="loading"></i>');
				},
				success : function(data) {

					console.log("SUCCESS: ", data);
					if(data>0){
						$('#tickets-count').empty();
						$('#tickets-count').html(+data);
					}

				},
				error : function(e) {
					console.log("ERROR: ", e);

				},
				done : function(e) {
					console.log("DONE");
					//$('#loading').remove();

				}
			});

			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/admin/residents-count",
				timeout : 100000,
				beforeSend : function() {
					//$('#school-points').append('<i class="fa fa-spinner fa-spin orange" id="loading"></i>');
				},
				success : function(data) {

					console.log("SUCCESS: ", data);
					if(data!=0){
						$('#residents-count').empty();
						$('#residents-count').html(data);
					}

				},
				error : function(e) {
					console.log("ERROR: ", e);

				},
				done : function(e) {
					console.log("DONE");
					//$('#loading').remove();

				}
			});
			
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/admin/notifications-count",
				timeout : 100000,
				beforeSend : function() {
					//$('#school-points').append('<i class="fa fa-spinner fa-spin orange" id="loading"></i>');
				},
				success : function(data) {

					console.log("SUCCESS: ", data);
					if(data>0){
						$('#notifications-count').empty();
						$('#notifications-count').html(+data);
					}

				},
				error : function(e) {
					console.log("ERROR: ", e);

				},
				done : function(e) {
					console.log("DONE");

				}
			});
			
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/admin/expenses-count",
				timeout : 100000,
				beforeSend : function() {
					//$('#school-points').append('<i class="fa fa-spinner fa-spin orange" id="loading"></i>');
				},
				success : function(data) {

					console.log("SUCCESS: ", data);
					if(data!=null){
						$('#expenses-count').empty();
						$('#expenses-count').html(data);
					}

				},
				error : function(e) {
					console.log("ERROR: ", e);

				},
				done : function(e) {
					console.log("DONE");
					//$('#loading').remove();

				}
			});

			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/admin/payments-sum",
				timeout : 100000,
				beforeSend : function() {
					//$('#school-points').append('<i class="fa fa-spinner fa-spin orange" id="loading"></i>');
				},
				success : function(data) {

					console.log("SUCCESS: ", data);
					if(data>0){
						$('#payments-sum').empty();
						$('#payments-sum').html(""+numberWithCommas(data)+"/-");
					}

				},
				error : function(e) {
					console.log("ERROR: ", e);

				},
				done : function(e) {
					console.log("DONE");
					//$('#loading').remove();

				}
			});
			
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/admin/collected-sum",
				timeout : 100000,
				beforeSend : function() {
					$('#collected-sum').html('<i class="fa fa-spinner loader text-warning"></i>');
				},
				success : function(data) {

					console.log("SUCCESS: ", data);
					if(data){
						$('#collected-sum').empty();
						$('#collected-sum').html(""+numberWithCommas(data)+"/-");
					} else {
						$('#collected-sum').html("0");						
					}

				},
				error : function(e) {
					console.log("ERROR: ", e);

				},
				done : function(e) {
					console.log("DONE");
					//$('#loading').remove();

				}
			});
			
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/admin/pending-sum",
				timeout : 100000,
				beforeSend : function() {
					$('#pullData').html('<div class="text-center"><i class="fa fa-spinner text-center fa-2x loader text-warning"></i></div>');
				},
				success : function(data) {

					console.log("SUCCESS: ", data);
					if(data){
						$('#pullData').empty();
						$('#pullData').html(data);
					} else {
						$('#pullData').html("0");						
					}

				},
				error : function(e) {
					console.log("ERROR: ", e);

				},
				done : function(e) {
					console.log("DONE");
				}
			});
			
		});
	</script>
	<script>
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		$('document').ready(function(){
			$('#month').change(function(){
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/admin/pending-sum/"+$('#month').val()+"",
					timeout : 100000,
					beforeSend : function() {
						$('#pullData').html('<div class="text-center"><i class="fa fa-spinner text-center fa-2x loader text-warning"></i></div>');
					},
					success : function(data) {
			
						console.log("SUCCESS: ", data);
						if(data){
							$('#pullData').empty();
							$('#pullData').html(data);
						} else {
							$('#pullData').html(0);
						}
			
					},
					error : function(e) {
						console.log("ERROR: ", e);
			
					},
					done : function(e) {
						console.log("DONE");			
					}
				});
			});
		});
	</script>
</body>
</html>