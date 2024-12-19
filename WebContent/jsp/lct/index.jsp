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
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="keywords"
	content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, nice admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, material design, material dashboard bootstrap 5 dashboard template" />
<meta name="description" content="Ozai Admin Dashboard" />
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
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap" rel="stylesheet" />
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






(360
deg




);
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






(360
deg




);
}
}
.list-task .task-done span {
	text-decoration: none;
}

.list-group-item {
	background: none !important;
}

.img-circle {
	border-radius: 50%;
	background: #f5f5f5c4;
	padding: 5px;
}
body {
	font-size: 0.9rem;
	color: #212529 !important;
}
p {
	font-size: 0.9rem;
}
small {
    font-size: .775em;
	font-weight: 600;
	color: #000;
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
		<div class="page-wrapper" style="margin-top: 0px;">
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
			<c:choose>
				<c:when test="${ClientUser.active eq 0 }">
					<div class="container-fluid">
						<div class="row">
							<div class="col-12">
								<div class="card border-top border-success">
									<div class="card-body text-center">
										<h1>Welcome</h1>
										<h3 class="mt-4">Your account is not approved yet.</h3>
										<h4>Please ask your admin for the approval.</h4>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>			
					<div class="container-fluid">
						<div class="d-none d-sm-block">
							<div class="row">
								<div class="col-lg-3 col-md-6">
									<div class="card border-top border-success">
										<div class="card-body">
											<div class="d-flex no-block align-items-center">
												<div>
													<h2>
														<span id="residents-count1">00</span>
													</h2>
													<h6 class="text-success mb-0">Residents</h6>
												</div>
												<div class="ms-auto">
													<a href="<%=request.getContextPath() %>/lct/residents/list"><span class="text-success display-6"><i
														class="fa fa-users fill-white"></i></span></a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-3 col-md-6">
									<div class="card border-top border-dark">
										<div class="card-body">
											<div class="d-flex no-block align-items-center">
												<div>
													<h2>
														<span id="properties-count1">00</span>
													</h2>
													<h6 class="text-dark mb-0">Properties</h6>
												</div>
												<div class="ms-auto">
													<a href="<%=request.getContextPath() %>/lct/properties/list"><span class="text-dark display-6"><i
														class="far fa-building fill-white"></i></span></a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-lg-3 col-md-6">
									<div class="card border-top border-info">
										<div class="card-body">
											<div class="d-flex no-block align-items-center">
												<div>
													<h2>
														<span id="tickets-count1">00</span>
													</h2>
													<h6 class="text-info mb-0">Tickets</h6>
												</div>
												<div class="ms-auto">
													<a href="<%=request.getContextPath() %>/lct/tickets/list"><span class="text-info display-6"><i
														class="fas fa-ticket-alt"></i></span></a>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- <div class="col-lg-3 col-md-6">
									<div class="card border-top border-cyan">
										<div class="card-body">
											<div class="d-flex no-block align-items-center">
												<div>
													<h2>
														<span id="notifications-count1">00</span>
													</h2>
													<h6 class="text-cyan mb-0">Notification</h6>
												</div>
												<div class="ms-auto">
													<span class="text-cyan display-6"><i
														class="fas fa-bell"></i></span>
												</div>
											</div>
										</div>
									</div>
								</div> -->
								 <!-- Mental Health card -->
					            <div class="col-lg-3 col-md-6">
					                <div class="card border-top border-cyan">
					                    <div class="card-body">
					                        <div class="d-flex no-block align-items-center">
					                            <div>
					                                <h2>
					                                    <span id="emotions-count1">00</span>
					                                </h2>
					                                <h6 class="text-cyan mb-0">Mental Health</h6>
					                            </div>
					                            <div class="ms-auto">
					                                <img src="<%=request.getContextPath() %>/assets/images/statsicons/Mental_health.png" style="width: 50px;" class="ml-3">
					                            </div>
					                        </div>
					                    </div>
					                </div>
					            </div>
							</div>
		
							<div class="row">
								<div class="col-12">
									<div class="card">
										<div class="card-body">
											<h4 class="card-title">Recent Tickets</h4>
										</div>
										<div
											class="comment-widgets scrollable mb-2 common-widget ps-container ps-theme-default ps-active-y"
											style="height: 450px"
											data-ps-id="6d2b87f3-6cdd-fb99-e038-11ea6244fe50">
											<!-- Comment Row -->
											<c:forEach items="${tickets }" var="ticket">
												<div class="d-flex flex-row comment-row p-3">
													<div class="p-2">
														<span><img onerror="this.onerror=null; this.src='https://www.ozailiving.com/assets/images/default-user.png'"
															src="https://www.ozailiving.com/profile-user/image/${ticket.user_id }"
															class="rounded-circle" alt="user" width="50"></span>
													</div>
													<div class="comment-text w-100 p-2">
														<p class="m-0">
															<a href="">${ticket.user.name }</a></p>
														<h5 class="text-nowrap font-weight-medium">${ticket.title }
														</h5>
														<p class="mb-1 fs-3 fw-normal text-muted">${ticket.summary }
														</p>
														<div class="comment-footer d-md-flex align-items-center mt-2">												
			                            					<c:if test="${ticket.status eq 'Raised' }">
																<span class="badge bg-dark text-white
			                           								font-weight-medium py-1">${ticket.status }</span>
															</c:if>
															<c:if test="${ticket.status eq 'Opened' }">
																<span class="badge bg-light-info text-info
			                           								font-weight-medium py-1">${ticket.status }</span>
															</c:if>
															<c:if test="${ticket.status eq 'In Progress' }">
																<span class="badge bg-light-success text-success
			                           								font-weight-medium py-1">${ticket.status }</span>
															</c:if>
															<c:if test="${ticket.status eq 'Closed' }">
																<span class="badge bg-light-danger text-danger
			                           								font-weight-medium py-1">${ticket.status }</span>
															</c:if>
															
															<div class="ms-auto">
																<span class="text-muted fs-2">
																	<fmt:formatDate value="${ticket.raised_date }" pattern="MMM dd, yyyy"/>
																</span>
															</div>
														</div>
													</div>
												</div>
												<!-- Comment Row -->
											</c:forEach>
											<div class="ps-scrollbar-x-rail" style="left: 0px; bottom: 0px;">
												<div class="ps-scrollbar-x" tabindex="0"
													style="left: 0px; width: 0px;"></div>
											</div>
											<div class="ps-scrollbar-y-rail"
												style="top: 0px; right: 3px; height: 450px;">
												<div class="ps-scrollbar-y" tabindex="0"
													style="top: 0px; height: 295px;"></div>
											</div>
										</div>
									</div>
								</div>
							</div>
		
							<div class="card alert mb-3">
								<h4 class="mb-3">GATE ENTRY
									<span class="size-12" style="float: right;">
										<a href="<%=request.getContextPath() %>/lct/gaterequests/list">
											View more
										</a>
									</span>
								</h4>
								<div class="row mb-4">
									<div class="col-6">
										<a href="<%=request.getContextPath() %>/lct/gaterequests/add?type=Guest" class="link-button btn btn-success add-resident">
											Guest
										</a>
									</div>
									<div class="col-6">
										<a href="<%=request.getContextPath() %>/lct/gaterequests/add?type=Delivery" class="link-button btn btn-primary add-security">
											Delivery
										</a>
									</div>
								</div>
							</div>
		
							<div class="col-lg-12 d-flex"
								style="display: flex !important; flex-wrap: wrap; align-content: flex-start;">
								<div class="card w-100">
									<div class="card-body">
										<div class="d-flex align-items-center">
											<div>
												<h3 class="card-title mb-0">Properties List</h3>
											</div>
										</div>
									</div>
									<div class="bg-light">
										<br>
									</div>
		
									<table class="table table-sm mb-0 v-middle">
										<thead class="table-light">
											<tr>
												<th class="border-bottom border-top">Name</th>
												<th class="border-bottom border-top">Rooms</th>
												<th class="border-bottom border-top">City</th>
												<th class="border-bottom border-top">State</th>
												<th class="border-bottom border-top">Gender</th>
												<th class="border-bottom border-top">Address</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${pgs }" var="pg" varStatus="sno">
												<c:choose>
													<c:when test="${sno.index+1 eq 1 }">
														<tr class="bg-light-success table-success border-success"
															style="height: 65px;">
													</c:when>
													<c:when test="${(sno.index+1) % 2 == 0 }">
														<tr class="bg-light-info table-info border-info"
															style="height: 65px;">
													</c:when>
													<c:when test="${(sno.index+1) % 3 == 0 }">
														<tr class="bg-light-primary table-primary border-primary"
															style="height: 65px;">
													</c:when>
													<c:when test="${(sno.index+1) % 4 == 0 }">
														<tr class="bg-light-danger table-danger border-danger"
															style="height: 65px;">
													</c:when>
													<c:when test="${(sno.index+1) % 5 == 0 }">
														<tr class="bg-light-warning table-warning border-warning"
															style="height: 65px;">
													</c:when>
													<c:when test="${(sno.index+1) % 6 == 0 }">
														<tr class="bg-light-success table-success border-success"
															style="height: 65px;">
													</c:when>
													<c:otherwise>
														<tr class="bg-light-danger table-danger border-danger"
															style="height: 65px;">
													</c:otherwise>
												</c:choose>
												<td>
													<div class="d-flex align-items-center card-hover">
														<div class="text-center" style="width: 30px;">${sno.index+1 }</div>
														<span class="ms-3 fw-normal text-uppercase">${pg.name }</span>
													</div>
												</td>
												<td>${pg.rooms }</td>
												<td>${pg.city }</td>
												<td>${pg.state }</td>
												<td>${pg.gender }</td>
												<td>${location }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<div class="row">
								<!-- column -->
								<div class="col-lg-6 d-flex align-items-stretch"
									style="display: flex !important; flex-wrap: wrap; align-content: flex-start;">
									<div class="card w-100">
										<div class="card-body">
											<div class="d-flex align-items-center">
												<div>
													<h3 class="card-title mb-0">Events</h3>
												</div>
											</div>
										</div>
										<div class="bg-light">
											<br>
										</div>
										<div class="alert to-do-widget mt-3 common-widget scrollable"
											style="height: 255px;">
											<c:if test="${not empty events }">
												<table class="table table-hover">
													<thead>
														<tr>
															<th class="border-top-0">NAME</th>
															<th class="border-top-0">STATUS</th>
															<th class="border-top-0">DATE</th>
															<th class="border-top-0">Location</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${events }" var="event">
															<tr>
																<td class="txt-oflo">${event.title }</td>
																<td><span class="badge bg-success rounded-pill">${event.status }</span>
																</td>
																<td class="txt-oflo"><fmt:formatDate
																		value="${event.date }" pattern="MMM dd, yyyy" /></td>
																<td><span class="font-weight-medium">${event.property.name },
																		${event.location }</span></td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
											</c:if>
											<c:if test="${empty events }">
												<h4 class="text-center">No events listed.</h4>
											</c:if>
										</div>
									</div>
								</div>
								<div class="col-lg-6 d-flex align-items-stretch"
									style="display: flex !important; flex-wrap: wrap; align-content: flex-start; min-height: 450px;">
									<div class="card w-100">
										<div class="card-body">
											<div class="d-flex align-items-center">
												<div>
													<h3 class="card-title mb-0">Notifications</h3>
												</div>
											</div>
										</div>
										<div class="bg-light">
											<br>
										</div>
										<div class="alert to-do-widget mt-3 common-widget scrollable"
											style="height: 255px;">
											<ul class="list-task todo-list list-group mb-0"
												data-role="tasklist">
												<c:forEach items="${notification }" var="event"
													varStatus="sno">
													<li class="list-group-item border-0 mb-0 py-3 pe-3 ps-0"
														data-role="task">
														<div class="form-check form-check-inline w-100">
															<input type="checkbox"
																class="form-check-input danger check-light-danger"
																id="inputSchedule" name="inputCheckboxesSchedule" /> <label
																for="inputSchedule" class="form-check-label"> <span>${event.title }</span>
																<span class="badge bg-danger badge-pill ms-1"><fmt:formatDate
																		value="${event.date }" pattern="MMM dd, yyyy" /></span>
															</label>
														</div>
														<div class="assignedto list-style-none m-0 ps-4 ms-1 mt-1">
															> <small>${event.message }</small>
														</div>
													</li>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-6 col-md-6">
									<div class="card" style="min-height: 493px;">
										<div class="border-bottom title-part-padding">
											<h4 class="card-title mb-0">Resident Breakup</h4>
										</div>
										<div class="card-body">
											<div id="basic-pie1" style="width: 100%; height: 400px;"></div>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-md-12 order-lg-2 order-md-3">
									<div class="card align-items-stretch text-center"
										style="min-height: 493px;">
										<div class="border-bottom title-part-padding">
											<h4 class="card-title mb-0">Work Sites</h4>
										</div>
										<div class="card-body">
											<table class="table" style="" id="sites">
												<thead class="text-white" style="background: #1f1947;">
													<tr>
														<th>#</th>
														<th>SITE</th>
														<th>LOCATION</th>
														<th>MAP</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${worksites }" var="site" varStatus="sno">
														<tr>
															<td>${sno.index+1 }</td>
															<td class="text-uppercase">${site.name }</td>
															<td>${site.location },${site.city }</td>
															<td>LAN: ${site.lan }, LAT: ${site.lat }</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
		
							<div
								class="d-flex border-bottom title-part-padding
		              			px-0 mb-3 align-items-center">
								<div>
									<h4 class="mb-0">Quick links</h4>
								</div>
							</div>
							<div class="row">
								<div class="col-md-4 col-xl-2 d-flex align-items-stretch">
									<a href="<%=request.getContextPath() %>/lct/residents/list"
										class="card bg-warning text-white w-100 card-hover">
										<div class="card-body">
											<div class="d-flex align-items-center">
												<span class="fa fa-users display-6 fw-bold"></span>
												<div class="ms-auto">
													<i data-feather="arrow-right" class="fill-white"></i>
												</div>
											</div>
											<div class="mt-4">
												<h4 class="card-title mb-1 text-white">Residents</h4>
												<h6 class="card-text fw-normal text-white-50">Check out
													full list</h6>
											</div>
										</div>
									</a>
								</div>
								<div class="col-md-4 col-xl-2 d-flex align-items-stretch">
									<a href="<%=request.getContextPath()%>/lct/tickets/list"
										class="card bg-danger text-white w-100 card-hover">
										<div class="card-body">
											<div class="d-flex align-items-center">
												<span class="fas fa-ticket-alt display-6 fw-bold"></span>
												<div class="ms-auto">
													<i data-feather="arrow-right" class="fill-white"></i>
												</div>
											</div>
											<div class="mt-4">
												<h4 class="card-title mb-1 text-white">Tickets</h4>
												<h6 class="card-text fw-normal text-white-50">List of all
													tickets raised by residents</h6>
											</div>
										</div>
									</a>
								</div>
								<div class="col-md-4 col-xl-2 d-flex align-items-stretch">
									<a href="<%=request.getContextPath()%>/lct/properties/list"
										class="card bg-primary text-white w-100 card-hover">
										<div class="card-body">
											<div class="d-flex align-items-center">
												<span class="fas fa-building display-6 fw-bold"></span>
												<div class="ms-auto">
													<i data-feather="arrow-right" class="fill-white"></i>
												</div>
											</div>
											<div class="mt-4">
												<h4 class="card-title mb-1 text-white">Camps</h4>
												<h6 class="card-text fw-normal text-white-50">All active
													properties list</h6>
											</div>
										</div>
									</a>
								</div>
							</div>
		
						</div>
		
		
		
		
						<div class="d-block d-sm-none">
							<div class="row">
								<div class="col-md-6 col-6 col-sm-12 col-12">
									<div class="d-block d-lg-none">
										<c:if test="${not empty ClientUser}">
											<div class="card"
												style="border-radius: 10px; background: #fff;">
												<div class="card-body text-dark"
													style="border-radius: 30px; font-weight: 700;">Hi, ${ClientUser.name } - 
													${ClientUser.role}</div>
											</div>
										</c:if>
									</div>
									<div class="d-none d-lg-block">
										<c:if test="${not empty ClientUser}">
											<div class="card"
												style="border-radius: 10px; background: #fff;">
												<div class="card-body text-dark"
													style="border-radius: 30px; font-weight: 700;">Hi, ${ClientUser.name } - 
													${ClientUser.role}</div>
											</div>
										</c:if>
									</div>
		
		
									<div class="card card-body pt-2 pb-0"
										style="border-radius: 20px; box-shadow: 2px 2px 2px #c7c4d7; background: #e4d4d4;">
										<a href="<%=request.getContextPath() %>/lct/residents/list">
										<div class="row">
											<div class="col-8">
												<div class="row">
													<div class="col-6 text-start">
														<img
															src="<%=request.getContextPath() %>/assets/images/statsicons/1.png"
															style="width: 90%;" />
													</div>
													<div class="col-6 text-end">
														<div class="text-center">
															<h2 class="text-dark fw-bold mb-n1 pt-3 pb-2"
																id="residents-count2">00</h2>
															<p class="text-dark">Residents</p>
														</div>
													</div>
												</div>
											</div>
											<div class="col-4 text-end">										
												<img
												src="<%=request.getContextPath() %>/assets/images/statsicons/right.png"
												style="width: 90%;" />
											</div>
										</div></a>
									</div>
									<div class="card card-body pt-2 pb-0"
										style="border-radius: 20px; box-shadow: 2px 2px 2px #c7c4d7; background: #d7e4d4;">
										<a href="<%=request.getContextPath() %>/lct/tickets/list">
										<div class="row">
											<div class="col-8">
												<div class="row">
													<div class="col-6 text-start">
														<img
															src="<%=request.getContextPath() %>/assets/images/statsicons/2.png"
															style="width: 90%;" />
													</div>
													<div class="col-6 text-end">
														<div class="text-center">
															<h2 class="text-dark fw-bold mb-n1 pt-3 pb-2"
																id="tickets-count2">00</h2>
															<p class="text-dark">Tickets</p>
														</div>
													</div>
												</div>
											</div>
											<div class="col-4 text-end">
												<img
												src="<%=request.getContextPath() %>/assets/images/statsicons/right.png"
												style="width: 90%;" />
											</div>
										</div></a>
									</div>
									<c:choose>
										<c:when test="${ClientUser.role eq 'Admin' || ClientUser.role eq 'Cluster head' }">
											<div class="card card-body pt-2 pb-0"
												style="border-radius: 20px; box-shadow: 2px 2px 2px #c7c4d7; background: #d4e2e4;">
												<a href="<%=request.getContextPath() %>/lct/properties/list">
												<div class="row">
													<div class="col-8">
														<div class="row">
															<div class="col-6 text-start">
																<img
																	src="<%=request.getContextPath() %>/assets/images/statsicons/5.png"
																	style="width: 90%;" />
															</div>
															<div class="col-6 text-end">
																<div class="text-center">
																	<h2 class="text-dark fw-bold mb-n1 pt-3 pb-2"
																		id="properties-count2">00</h2>
																	<p class="text-dark">Properties</p>
																</div>
															</div>
														</div>
													</div>
													<div class="col-4 text-end">
														<img
														src="<%=request.getContextPath() %>/assets/images/statsicons/right.png"
														style="width: 90%;" />
													</div>
												</div></a>
											</div>
										</c:when>
										<c:otherwise>
											<div class="card card-body pt-2 pb-0"
												style="border-radius: 20px; box-shadow: 2px 2px 2px #c7c4d7; background: #dcd8c6;">
												<div class="row">
													<div class="col-8">
														<div class="row">
															<div class="col-6 text-start">
																<img
																	src="<%=request.getContextPath() %>/assets/images/statsicons/4.png"
																	style="width: 90%;" />
															</div>
															<div class="col-6 text-end">
																<div class="text-center">
																	<h2 class="text-dark fw-bold mb-n1 pt-3 pb-2"
																		id="notifications-count2">00</h2>
																	<p>Notifications</p>
																</div>
															</div>
														</div>
													</div>
													<div class="col-4 text-end">
														<a
															href="<%=request.getContextPath() %>/lct/notifications/list">
															<img
															src="<%=request.getContextPath() %>/assets/images/statsicons/right.png"
															style="width: 90%;" />
														</a>
													</div>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
									<!-- For Mental Health list -->
									<div class="card card-body pt-2 pb-0"
										style="border-radius: 20px; box-shadow: 2px 2px 2px #c7c4d7; background: #e4e5f1;">
										<a href="<%=request.getContextPath() %>/lct/mental_health/list">
										<div class="row">
											<div class="col-8">
												<div class="row">
													<div class="col-6 text-start">
														<img src="<%=request.getContextPath() %>/assets/images/statsicons/Mental_health.png" style="width: 90%;" />
													</div>
													<div class="col-6 text-end">
														<div class="text-center">
															<h2 class="text-dark fw-bold mb-n1 pt-3 pb-2" id="emotions-count2">00</h2>
															<p class="text-dark" style="white-space: nowrap;">Mental Health</p>
														</div>
													</div>
												</div>
											</div>
											<div class="col-4 text-end">										
												<img
													src="<%=request.getContextPath() %>/assets/images/statsicons/right.png"
													style="width: 90%;" />
											</div>
										</div></a>
									</div>
								</div>						
								
								<div class="card card-body m-2" style="background-color: #4d3952;">
									<h4 style="color: #FFF;">GATE ENTRY
										<small class="size-18" style="float: right;">
											<a href="<%=request.getContextPath() %>/lct/gaterequests/list">
												View list
											</a>
										</small>
									</h4>
									<div class="row mt-3">
										<div class="col-6 text-center">
											<a
												href="<%=request.getContextPath() %>/lct/gaterequests/add?type=Guest"
												class="mb-2 mr-2 btn-pill  btn btn-light">Guest</a>
										</div>
										<div class="col-6 text-center">
											<a
												href="<%=request.getContextPath() %>/lct/gaterequests/add?type=Delivery"
												class="mb-2 mr-2 btn-pill btn-wide btn btn-light">Delivery</a>
										</div>
									</div>
								</div>
		
		
								<div class="alert d-block d-lg-none">
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
								</div>
		
								<!-- <div class="col-12">
									<div class="card"
										style="border-radius: 10px; background: #26c6da;">
										<div class="card-body">
											<div class="row">
												<h6 class="text-dark fw-bold text-start"
													style="font-family: monospace;">Medical Enquiries</h6>
												<div class="">
													<div class="row text-center">
														<div class="col-sm-6 col-6">
															<a href="<%=request.getContextPath()%>/lct/chat/psychic-list"
																class="btn btn-circle btn-lg btn-light-info"> <i
																class="fas fa-plus"></i></a> <br> <span
																style="color: #000; font-size: .775em;">Psychiatrist</span>
														</div>
														<div class="col-sm-6 col-6">
															<a
																href="<%=request.getContextPath()%>/lct/chat/gynic-list"
																class="btn btn-circle btn-lg btn-light-info"> <i
																class="fas fa-notes-medical"></i></a><br> <span
																style="color: #000; font-size: .775em;">Gynaecologist</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div> -->
		
								<div class="col-12">
									<div class="alert" style="border-radius: 10px; background: #FFF;">
										<h6 class="ps-2 mb-4 text-dark fw-bold text-start"
											style="font-family: ;">Quick Links</h6>
										<br>
										<div class="row">
											<div class="col-3 mb-3 text-center">
												<a href="<%=request.getContextPath() %>/lct/residents/list">
													<label class="form-check-label img-circle" for="radio1">
														<img style="height: 50px;"
														src="<%=request.getContextPath()%>/assets/images/statsicons/1.png" />
												</label><br> <small
													style="color: #000; font-size: .775em;">Residents</small>
												</a>
											</div>
											<div class="col-3 mb-3 text-center">
												<a href="<%=request.getContextPath() %>/lct/expenses/list">
													<label class="form-check-label img-circle" for="radio1">
														<img style="height: 50px;"
														src="<%=request.getContextPath()%>/assets/images/statsicons/3.png" />
												</label><br> <small
													style="color: #000; font-size: .775em;">Expenses</small>
												</a>
											</div>
											<div class="col-3 mb-3 text-center">
												<a href="<%=request.getContextPath() %>/lct/properties/list">
													<label class="form-check-label img-circle" for="radio1">
														<img style="height: 50px;"
														src="<%=request.getContextPath()%>/assets/images/statsicons/5.png" />
												</label><br> <small
													style="color: #000; font-size: .775em;">Properties</small>
												</a>
											</div>
											<div class="col-3 mb-3 text-center">
												<a href="<%=request.getContextPath() %>/lct/events/updates">
													<label class="form-check-label img-circle" for="radio1">
														<img style="height: 50px;"
														src="<%=request.getContextPath()%>/assets/images/statsicons/updates.png" />
												</label><br> <small
													style="color: #000; font-size: .775em;">Updates</small>
												</a>
											</div>
										</div>
									</div>
								</div>
		
								<div class="col-12">
									<div class="card"
										style="border-radius: 10px; background: #FFF;">
										<div class="card-body">
											<div class="row">
												<h6 class="ps-3 mb-4 text-dark fw-bold text-start"
													style="font-family: ;">Updates</h6>
												<div class="">
													<div class="row text-center">
														<div class="col-sm-6 col-6">
															<a href="<%=request.getContextPath()%>/lct/events/updates"
																class="btn btn-circle btn-lg btn-light-info"> <i
																class="fas fa-plus"></i></a> <br> <span
																style="color: #000; font-size: .775em;">Delivery</span>
														</div>
														<div class="col-sm-6 col-6">
															<a
																href="<%=request.getContextPath()%>/lct/events/daily-updates"
																class="btn btn-circle btn-lg btn-light-info"> <i
																class="fas fa-list"></i></a><br> <span
																style="color: #000; font-size: .775em;">Daily
																Updates</span>
														</div>
													</div>
												</div>
												<!-- 7. Stats card -->
											</div>
										</div>
									</div>
								</div>
		
								<div class="col-sm-12 col-12">
									<img class="card" style="border-radius: 10px; width: 100%;"
										src="<%=request.getContextPath() %>/assets/img/trackozai.png" />
									<!-- <a href="<%=request.getContextPath() %>/lct/expenses/approve-list">
										<img class="card" style="border-radius: 10px; width: 100%;"
											onclick="window.JSInterface.openInBrowser('https://tikaana.com/');" src="<%=request.getContextPath() %>/assets/img/trackozai.png" />
									<!-- </a> -->
								</div>
		
								<div class="col-md-6 col-6 col-sm-12 col-12">
		
									<div class="card bg-white" style="border-radius: 10px;">
										<div class="card-body">
											<h6 class="ps-2 mb-4 text-dark fw-bold text-start"
												style="font-family: ;">Send Notice</h6>
												<div class="text-center text-info" id="loading" style="display: none;">
													<i class="fa-4x fa fa-spinner fa-spin orange"></i>
												</div>
											<form id="notice-form" method="post">
												<div class="mb-3">
													<input type="text" name="title" id="title"
														style="border-radius: 50px;" class="form-control"
														id="exampleInputname2" placeholder="Title" required />
												</div>
												<input type="hidden" name="client_code"
													value="${ClientUser.client_code }" />
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
											<div class="alert alert-danger" id="errorMsg"
												style="display: none;">
												Error, Try again later..
											</div>
										</div>
									</div>
								</div>
		
								<div class="row">
									<h6 class="ps-3 mb-4 text-dark fw-bold text-start"
										style="font-family: ;">Events</h6>
									<div class="col-6">
										<a href="<%=request.getContextPath()%>/lct/events/add"
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
										<a href="<%=request.getContextPath()%>/lct/events/list"
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
													<h6 class="card-text fw-normal text-white-50">View
														events list</h6>
												</div>
											</div>
										</a>
									</div>
								</div>
		
								<div class="col-sm-12 col-12">
									<a href="#"> <img class="card"
										style="border-radius: 10px; width: 100%;"
										src="<%=request.getContextPath() %>/assets/img/ResidentWelfare.gif" />
									</a>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 col-6 col-sm-12 col-12">
									<div class="card" style="border-radius: 10px;">
										<div class="card-body">
											<h6 class="ps-1 mb-4 text-dark fw-bold text-start"
												style="font-family: ;">
												Recent Tickets <span style="float: right;"> <a
													href="<%=request.getContextPath() %>/lct/tickets/list">View
														all</a></span>
											</h6>
											<div class="todo-widget">
												<c:forEach items="${tickets }" var="ticket">
													<div class="row mt-2" style="border-bottom: 1px solid #dfdfdf;">
														<div class="col-3">
															<div class="text-uppercase alert text-center" style="padding: 0.3rem; background: #f2f2f2; 
																border-radius: 5px; box-shadow: none;">
																<p class="fst-bold mb-0"><fmt:formatDate
																	value="${ticket.raised_date }" pattern="dd" /></p>														
																<small class="fw-bold mb-0 mt-0"><fmt:formatDate
																	value="${ticket.raised_date }" pattern="MMM" /></small>	
															</div>
														</div>
														<div class="col-9">
															<h6 style="color: #000; font-weight: 600;">${ticket.title }</h6>
															<!-- <p class="text-dark  mb-0 mt-2"
																style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">${ticket.title }</p> -->
															<p>${ticket.bdetails.user.name }, ${ticket.bdetails.room.room_no}, ${ticket.bdetails.property.name }</p>
															<!-- <small class="mt-0" style="font-size: 0.75em !important;">${ticket.bdetails.user.name }, ${ticket.bdetails.room.room_no}, ${ticket.bdetails.property.name }</small> -->
														</div>											
		
													</div>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
		
								<!-- <div class="col-sm-12 col-12">
									<a href="<%=request.getContextPath() %>/lct/expenses/approve-list"> 
										<img class="card" style="border-radius: 10px; width: 100%;"
											onclick="window.JSInterface.openInBrowser('https://ozailiving.com/make-payment/2');" src="<%=request.getContextPath() %>/assets/img/trackozai.png" />
									<!-- </a>
								</div> -->
		
								<c:if test="${ClientUser.role eq 'Admin' || ClientUser.role eq 'Cluster head' }">
									<div class="col-lg-12 col-xl-6">
										<div class="card">
											<div class="border-bottom title-part-padding">
												<h6 class="text-dark fw-bold text-start"
													style="font-family:;">Resident Breakup</h6>
											</div>
											<div class="card-body analytics-info">
												<div id="basic-pie2" style="height: 400px"></div>
											</div>
										</div>
									</div>
								</c:if>
							</div>
		
							<div class="col-12">
								<div class="card col-12"
									style="border-radius: 10px; background: #FFF;">
									<div class="card-body">
										<div class="row">
											<div class="">
												<h6 class="ps-2 mb-4 text-dark fw-bold text-start"
													style="font-family: ;">Residents</h6>
												<div class="">
													<div class="row text-center">
														<div class="col-sm-4 col-4">
															<a
																href="<%=request.getContextPath()%>/lct/residents/add-b2b"
																class="btn btn-circle btn-lg btn-warning"> <i
																class="fas fa-plus"></i></a> <br> <span
																style="color: #000; font-size: .775em;">Add</span>
														</div>
														<div class="col-sm-4 col-4">
															<a href="<%=request.getContextPath()%>/lct/residents/list"
																class="btn btn-circle btn-lg btn-warning"> <i
																class="fas fa-list"></i></a><br> <span
																style="color: #000; font-size: .775em;">List</span>
														</div>
														<div class="col-sm-4 col-4">
															<a
																href="<%=request.getContextPath()%>/lct/residents/pending-rents"
																class="btn btn-circle btn-lg btn-warning"> <i
																class="fas fa-rupee-sign"></i></a><br> <span
																style="color: #000; font-size: .775em;">Pending
																Rents</span>
														</div>
													</div>
												</div>
											</div>
											<!-- 7. Stats card -->
										</div>
									</div>
								</div>
							</div>
		
		
							<div class="row">
								<div class="col-12">
									<div class="card col-12"
										style="border-radius: 10px; background: #FFF;">
										<div class="card-body">
											<div class="row">
												<div class="">
													<h6 class="ps-2 mb-4 text-dark fw-bold text-start"
														style="font-family: ;">Properties</h6>
													<div class="">
														<div class="row text-center">
															<div class="col-sm-4 col-4">
																<a
																	href="<%=request.getContextPath()%>/lct/properties/add-property"
																	class="btn btn-circle btn-lg btn-light-primary"> <i
																	class="fas fa-plus"></i></a> <br> <span
																	style="color: #000; font-size: .775em;">Add</span>
															</div>
															<div class="col-sm-4 col-4">
																<a
																	href="<%=request.getContextPath()%>/lct/properties/list"
																	class="btn btn-circle btn-lg btn-light-primary"> <i
																	class="fas fa-list"></i></a><br> <span
																	style="color: #000; font-size: .775em;">List</span>
															</div>
															<div class="col-sm-4 col-4">
																<a
																	href="<%=request.getContextPath()%>/lct/properties/worksites"
																	class="btn btn-circle btn-lg btn-light-primary"> <i
																	class="fas fa-map-pin"></i></a><br> <span
																	style="color: #000; font-size: .775em;">Worksites</span>
															</div>
														</div>
													</div>
												</div>
												<!-- 7. Stats card -->
											</div>
										</div>
									</div>
								</div>
		
								<div class="col-sm-12 col-12 d-block d-lg-none">
									<a href="<%=request.getContextPath()%>/lct/properties/transport">
										<img class="card" style="border-radius: 10px; width: 100%;"
										src="<%=request.getContextPath()%>/assets/img/transport.gif" />
									</a>
								</div>
		
								<div class="col-12">
									<div class="card col-12"
										style="background: #FFF; border-radius: 10px; box-shadow: 3px 3px 3px #c7c4d7;">
										<div class="card-body">
											<div class="row">
												<div class="">
													<h6 class="ps-2 mb-4 text-dark fw-bold text-start"
														style="font-family: ;">Expenses</h6>
													<div class="">
														<div class="row text-center">
															<div class="col-sm-4 col-4 ">
																<a href="<%=request.getContextPath()%>/lct/expenses/add"
																	class="btn btn-circle btn-lg btn-warning"> <i
																	class="fas fa-plus"></i></a> <br> <span
																	style="color: #000; font-size: .775em;">Add</span>
															</div>
															<div class="col-sm-4 col-4 ">
																<a href="<%=request.getContextPath()%>/lct/expenses/list"
																	class="btn btn-circle btn-lg btn-primary"> <i
																	class="fas fa-list"></i></a><br> <span
																	style="color: #000; font-size: .775em;">Due
																	List</span>
															</div>
															<div class="col-sm-4 col-4 ">
																<a
																	href="<%=request.getContextPath()%>/lct/expenses/vendor-list"
																	class="btn btn-circle btn-lg btn-success"> <i
																	class="fas fa-user"></i></a><br> <span
																	style="color: #000; font-size: .775em;">Vendors</span>
															</div>
														</div>
													</div>
												</div>
												<!-- 7. Stats card -->
											</div>
										</div>
									</div>
								</div>
		
								<div class="col-sm-12 col-12 d-none d-lg-block">
									<a href="<%=request.getContextPath()%>/lct/properties/transport">
										<img class="card" style="border-radius: 10px; width: 100%;"
										src="<%=request.getContextPath()%>/assets/img/transport.gif" />
									</a>
								</div>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
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
	<c:if test="${param.sessionUser != null }">
		<script>
			$('document').ready(function() {
				var username = "${fn:escapeXml(ClientUser.username)}";
				localStorage.lctUser = username;
			});
		</script>
	</c:if>

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
			$('#hideBack').hide();
			$('#notice-form').submit(function(event){
				event.preventDefault();
				saveNotice();
			});
			
			function saveNotice(){
				var formData=$("#notice-form").serialize();
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/lct/saveNotice",
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
							$("#loading").hide();
							$("#notice-form")[0].reset();
							$('#successMsg').show();
							$("#notice-form").show();
							$("#successMsg").fadeOut(5000);
						}else
						if(data=='failed'){
							$("#loading").hide();
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
	</script>
	<script>
		$('document').ready(function() {

			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/lct/notifications-count",
				timeout : 100000,
				beforeSend : function() {
					//$('#school-points').append('<i class="fa fa-spinner fa-spin orange" id="loading"></i>');
				},
				success : function(data) {

					console.log("SUCCESS: ", data);
					if(data>0){
						$('#notifications-count1').empty();
						$('#notifications-count1').html(+data);
						$('#notifications-count2').empty();
						$('#notifications-count2').html(+data);
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
				url : "${pageContext.request.contextPath}/lct/properties-count",
				timeout : 100000,
				beforeSend : function() {
					//$('#school-points').append('<i class="fa fa-spinner fa-spin orange" id="loading"></i>');
				},
				success : function(data) {

					console.log("SUCCESS: ", data);
					if(data>0){
						$('#properties-count1').empty();
						$('#properties-count1').html(+data);
						$('#properties-count2').empty();
						$('#properties-count2').html(+data);
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
				url : "${pageContext.request.contextPath}/lct/tickets-count",
				timeout : 100000,
				beforeSend : function() {
					//$('#school-points').append('<i class="fa fa-spinner fa-spin orange" id="loading"></i>');
				},
				success : function(data) {

					console.log("SUCCESS: ", data);
					if(data>0){
						$('#tickets-count1').empty();
						$('#tickets-count1').html(+data);
						$('#tickets-count2').empty();
						$('#tickets-count2').html(+data);
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
				url : "${pageContext.request.contextPath}/lct/residents-count",
				timeout : 100000,
				beforeSend : function() {
					//$('#school-points').append('<i class="fa fa-spinner fa-spin orange" id="loading"></i>');
				},
				success : function(data) {

					console.log("SUCCESS: ", data);
					if(data>0){
						$('#residents-count1').empty();
						$('#residents-count1').html(+data);
						$('#residents-count2').empty();
						$('#residents-count2').html(+data);
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
			
		});

		$.ajax({
		    type: "GET",
		    url: "${pageContext.request.contextPath}/lct/emotions-count",
		    timeout: 100000,
		    beforeSend: function() {
		        // Add any loading indicator here if needed
		    },
		    success: function(data) {
		        console.log("SUCCESS: ", data);
		        if (data > 0) {
		            $('#emotions-count1').empty();
		            $('#emotions-count1').html(+data);
		            $('#emotions-count2').empty();
		            $('#emotions-count2').html(+data);
		        }
		    },
		    error: function(e) {
		        console.log("ERROR: ", e);
		    },
		    done: function(e) {
		        console.log("DONE");
		    }
		});
	</script>
	<script>
	$(function () {
	    "use strict";

	    // Initialize ECharts instance for basic-pie chart
	    var basicpieChart1 = echarts.init(document.getElementById("basic-pie1"));
	    var basicpieChart2 = echarts.init(document.getElementById("basic-pie2"));

	    // Define the option for the basic-pie chart
	    var option = {
	        // Add tooltip
	        tooltip: {
	            trigger: "item",
	            formatter: "{a} <br/>{b}: {c} ({d}%)",
	        },

	        // Add legend
	        legend: {
	            orient: "vertical",
	            x: "left",
	            data: ${residentsPrData}, // Ensure residentsPrData is properly formatted
	        },

	        // Add custom colors
	        color: ["#ffbc34", "#7460ee", "#212529", "#f62d51", "#009efb"],

	        // Display toolbox
	        toolbox: {
	            show: true,
	            orient: "vertical",
	            feature: {
	                // Add toolbox features here
	            },
	        },

	        // Enable drag recalculate
	        calculable: true,

	        // Add series
	        series: [{
	            name: "Browsers",
	            type: "pie",
	            radius: "70%",
	            center: ["50%", "57.5%"],
	            data: ${residentsBothData}, // Ensure residentsBothData is properly formatted
	        }],
	    };

	    // Set the option to the basic-pie chart
	    basicpieChart1.setOption(option);
	    basicpieChart2.setOption(option);

	    // Resize chart on window resize
	    $(window).on("resize", function () {
	        basicpieChart1.resize();
	        basicpieChart2.resize();
	    });
	});

	</script>
</body>
</html>