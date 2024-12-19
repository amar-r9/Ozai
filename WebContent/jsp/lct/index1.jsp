<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
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
	
	@-webkit-keyframes spin {
	  0% { -webkit-transform: rotate(0deg); }
	  100% { -webkit-transform: rotate(360deg); }
	}
	
	@keyframes spin {
	  0% { transform: rotate(0deg); }
	  100% { transform: rotate(360deg); }
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
		<div class="page-wrapper"  style="margin-top: 0px;">
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
				<div class="">
					<div class="row">
						<div class="col-md-6 col-6 col-sm-12 col-12">
							<div class="d-block d-lg-none">
								<c:if test="${not empty ClientUser}">
									<div class="card" style="border-radius: 10px; background: #fff;">
										<div class="card-body text-dark" style="border-radius: 30px; font-weight: 700;">Hi, ${ClientUser.name}</div>
									</div>
								</c:if>
							</div>
							<div class="d-none d-lg-block">
								<c:if test="${not empty ClientUser}">
									<div class="card" style="border-radius: 10px; background: #fff;">
										<div class="card-body text-dark" style="border-radius: 30px; font-weight: 700;">Hi, ${ClientUser.name}</div>
									</div>
								</c:if>
							</div>
							
							
							<div class="card card-body pt-2 pb-0"
								style="border-radius: 20px; box-shadow: 2px 2px 2px #c7c4d7; background: #e4d4d4;">
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
													<h2 class="text-dark fw-bold mb-n1 pt-3 pb-2" id="residents-count">00</h2>
													<p>Residents</p>
												</div>
											</div>
										</div>
									</div>
									<div class="col-4 text-end">
										<a href="<%=request.getContextPath() %>/lct/residents/list">
											<img
												src="<%=request.getContextPath() %>/assets/images/statsicons/right.png"
												style="width: 90%;" />
										</a>
									</div>
								</div>
							</div>
							<div class="card card-body pt-2 pb-0"
								style="border-radius: 20px; box-shadow: 2px 2px 2px #c7c4d7; background: #d7e4d4;">
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
													<h2 class="text-dark fw-bold mb-n1 pt-3 pb-2" id="tickets-count">00</h2>
													<p>Tickets</p>
												</div>
											</div>
										</div>
									</div>
									<div class="col-4 text-end">
										<a href="<%=request.getContextPath() %>/lct/tickets/list">
											<img
												src="<%=request.getContextPath() %>/assets/images/statsicons/right.png"
												style="width: 90%;" />
										</a>
									</div>
								</div>
							</div>
							<div class="card card-body pt-2 pb-0"
								style="border-radius: 20px; box-shadow: 2px 2px 2px #c7c4d7; background: #d4e2e4;">
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
													<h2 class="text-dark fw-bold mb-n1 pt-3 pb-2" id="properties-count">00</h2>
													<p>Properties</p>
												</div>
											</div>
										</div>
									</div>
									<div class="col-4 text-end">
										<a href="<%=request.getContextPath() %>/lct/properties/list">
											<img
												src="<%=request.getContextPath() %>/assets/images/statsicons/right.png"
												style="width: 90%;" />
										</a>
									</div>
								</div>
							</div>
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
														id="notifications-count">00</h2>
													<p>Notifications</p>
												</div>
											</div>
										</div>
									</div>
									<div class="col-4 text-end">
										<a href="<%=request.getContextPath() %>/lct/notifications/list">
											<img
												src="<%=request.getContextPath() %>/assets/images/statsicons/right.png"
												style="width: 90%;" />
										</a>
									</div>
								</div>
							</div>
							
							
							<!-- <div class="row col-12 text-start">
								<h5 style="font-weight: 700; color: #000; margin-top: 25px; ">Recent Payments</h5>
								<p>&nbsp;</p>
							</div>
							<div class="row" id="recent-payments">
								
							</div> -->
							
							
							<%-- <div class="card card-body" style="border-radius: 10px; padding: 23px;">
								<div class="row">	
									<!-- Column -->
									<div class="col-3 col-md-3 col-6 col-sm-6 text-center">
										<a href="<%=request.getContextPath() %>/lct/residents/list">
											<div class="card" style="border-radius: 10px; 
												margin-bottom: 5px; background: #e4eaf2;">
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
										<a href="<%=request.getContextPath() %>/lct/tickets/list">
											<div class="card" style="border-radius: 10px; 
												margin-bottom: 5px; background: #e4eaf2;">
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
										<a href="<%=request.getContextPath() %>/lct/properties/list">
											<div class="card" style="border-radius: 10px; 
												margin-bottom: 5px; background: #e4eaf2;">
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
										<a href="<%=request.getContextPath() %>/lct/notifications/list">
											<div class="card" style="border-radius: 10px; 
												margin-bottom: 5px; background: #e4eaf2;">
												<div class="card-body"> <!--  style="padding: 0.5rem 0.5rem;"> -->
													<div class="row" style="color: #397c93;">
														<i class="fas fa-bell fa-2x"></i>
													</div>
													<div class="row" style="padding-top: 5px;">
														<h5 style="font-weight: 900; color: #000;" id="notifications-count">00</h5>
													</div>
												</div>
											</div>
											<p style="font-weight: 600; color: #000;">Notifications</p>
										</a>
									</div>
									<!-- Column -->
								</div>
							</div> --%>
						</div>

						<div class="alert d-block d-lg-none">
							<div class="">
								<div class="row">
						            <div class="swiper mySwiper">
								      	<div class="swiper-wrapper">
									        <div class="swiper-slide">
												<img src="<%=request.getContextPath() %>/assets/images/ozaismall1.png"
													style="border-radius: 10px; " />
									        </div>
									        <div class="swiper-slide">
												<img src="<%=request.getContextPath() %>/assets/images/ozaismall2.png"
													style="border-radius: 10px; " />
									        </div>
									        <div class="swiper-slide">
									        	<img src="<%=request.getContextPath() %>/assets/images/ozaismall3.png"
													style="border-radius: 10px; " />
									        </div>
								      	</div>
								      	<div class="swiper-pagination"></div>
								    </div>
								</div>
							</div>
						</div>
						
						<div class="col-12">
							<div class="alert" style="border-radius: 10px; background: #FFF;">
								<h6 class="text-dark fw-bold text-start" style="font-family: monospace;">Quick Links</h6><br>
								<div class="row">
									<div class="col-3 mb-3 text-center">
										<a href="<%=request.getContextPath() %>/lct/residents/list">
											<label class="form-check-label img-circle"
												for="radio1" >
												<img style="height: 50px;"
													src="<%=request.getContextPath()%>/assets/images/statsicons/1.png" />
											</label><br>
											<small
												style="color: #000; font-size: .775em;">Residents</small>
										</a>
									</div>
									<div class="col-3 mb-3 text-center">
										<a href="<%=request.getContextPath() %>/lct/expenses/list">
											<label class="form-check-label img-circle"
												for="radio1" >
												<img style="height: 50px;"
													src="<%=request.getContextPath()%>/assets/images/statsicons/3.png" />
											</label><br>
											<small
												style="color: #000; font-size: .775em;">Expenses</small>
										</a>
									</div>
									<div class="col-3 mb-3 text-center">
										<a href="<%=request.getContextPath() %>/lct/properties/list">
											<label class="form-check-label img-circle"
												for="radio1" >
												<img style="height: 50px;"
													src="<%=request.getContextPath()%>/assets/images/statsicons/5.png" />
											</label><br>
											<small
												style="color: #000; font-size: .775em;">Properties</small>
										</a>
									</div>
									<div class="col-3 mb-3 text-center">
										<a href="<%=request.getContextPath() %>/lct/events/updates">
											<label class="form-check-label img-circle"
												for="radio1" >
												<img style="height: 50px;"
													src="<%=request.getContextPath()%>/assets/images/statsicons/updates.png" />
											</label><br>
											<small
												style="color: #000; font-size: .775em;">Updates</small>
										</a>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-12">
							<div class="card"
								style="background: #FFF; border-radius: 10px; box-shadow: 3px 3px 3px #c7c4d7;">
								<div class="card-body">
									<div class="row">
										<h6 class="text-dark fw-bold text-start" style="font-family: monospace;">Updates</h6>
										<div class="">
											<div class="row text-center">
												<div class="col-sm-6 col-6">
													<a href="<%=request.getContextPath()%>/lct/events/updates"
														class="btn btn-circle btn-lg btn-light-info"> <i
														class="fas fa-plus"></i></a> <br> <span class="text-dark ">Delivery</span>
												</div>
												<div class="col-sm-6 col-6">
													<a href="<%=request.getContextPath()%>/lct/events/daily-updates"
														class="btn btn-circle btn-lg btn-light-info"> <i
														class="fas fa-list"></i></a><br> <span class="text-dark">Daily Updates</span>
												</div>
											</div>
										</div>
									<!-- 7. Stats card -->				
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-md-6 col-6 col-sm-12 col-12">
						
							<div class="card bg-white" style="border-radius: 10px;">
				                <div class="card-body">
				                  	<p style="font-weight: 900; color: #000;">Send Updates</p>
				                  	<form id="notice-form" method="post">
				                  		<div class="mb-3">
				                      		<input type="text" name="title" id="title" style="border-radius: 50px;"
					                        	class="form-control" id="exampleInputname2"
					                        	placeholder="Title" required />
				                    	</div>
				                    	<input type="hidden" name="client_code" value="${ClientUser.client_code }" />
				                    	<div class="mb-3">
				                    		<textarea id="message" style="border-radius: 20px;"
				                        		class="form-control" name="message" rows="4"
				                        		placeholder="Message" required></textarea>
				                    	</div>
				                    	<div class="text-center">
				                    	<button type="submit" id="send"
				                      		class="btn btn-dark btn-rounded 
				                        	font-weight-medium">
				                      		SUBMIT
				                    	</button></div>
				                  	</form>
				                  	<div class="alert alert-success" id="successMsg" style="display: none;">
				                  		<i class="fas fa-check-circle"></i> Notification sent.
				                  	</div>
				                </div>
				        	</div>
			        	</div>
			        	
			        	<div class="row">
							<h5 class="text-dark fw-bold">Events</h5>
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
											<h6 class="card-text fw-normal text-white-50">View events
												list</h6>
										</div>
									</div>
								</a>
							</div>
						</div>
			        	
			        	
			        	<div class="col-sm-12 col-12">
							<a href="#">
								<img class="card" style="border-radius: 10px; width: 100%;"
									src="<%=request.getContextPath() %>/assets/img/ResidentWelfare.gif" />
							</a>
						</div>			        	
					</div>
					<div class="row">						
						<div class="col-md-6 col-6 col-sm-12 col-12">
				        	<div class="card" style="border-radius: 10px;">
								<div class="card-body">
									<p style="font-weight: 700;"><span style="color: #000;">Recent Tickets</span>
										<span style="float: right;">
											<a href="<%=request.getContextPath() %>/lct/tickets/list">View all</a></span></p>
									<div class="todo-widget">
										<ul class="list-task todo-list list-group mb-0"
											data-role="tasklist">
											<c:forEach items="${tickets }" var="ticket">
												<li
													class="list-group-item todo-item border-0
				                          			mb-0 py-3 pe-3 ps-0 border-bottom"
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
														
															<div>
																<p><strong style="color: #000;">${ticket.title }</strong></p>
																<span style="color: #021740;"><i class="fa fa-calendar"></i> <fmt:formatDate value="${ticket.raised_date }" pattern="MMM dd, yyyy"/> &nbsp;&nbsp; <i class="fa fa-map-pin"></i> ${ticket.bdetails.room.room_no}
																(${ticket.bdetails.property.name })</span>
															</div>										
														
													</div>
												</li>
											</c:forEach>								
										</ul>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-sm-12 col-12">
							<!-- <a href="<%=request.getContextPath() %>/lct/expenses/approve-list"> 
								<img class="card" style="border-radius: 10px; width: 100%;"
									onclick="window.JSInterface.openInBrowser('https://ozailiving.com/make-payment/2');" src="<%=request.getContextPath() %>/assets/img/trackozai.png" />
							<!-- </a> -->
						</div>

						
						
						<div class="col-lg-12 col-xl-6">
			              <div class="card">
			                <div class="border-bottom title-part-padding">
			                  <h4 class="card-title mb-0">Resident Breakup</h4>
			                </div>
			                <div class="card-body analytics-info">
			                  <div id="basic-pie" style="height: 400px"></div>
			                </div>
			              </div>
			            </div>
						
						
					</div>
					
					<div class="col-12">
							<div class="card col-12"
								style="background: #ddd8fd; border-radius: 10px; box-shadow: 3px 3px 3px #c7c4d7;">
								<div class="card-body">
									<div class="row">
										<div class="">
											<h6 class="text-dark fw-bold text-start" style="font-family: monospace;">Residents</h6>
											<div class="">
												<div class="row text-center">
													<div class="col-sm-4 col-4">
														<a
															href="<%=request.getContextPath()%>/lct/residents/add-b2b"
															class="btn btn-circle btn-lg btn-light"> <i
															class="fas fa-plus"></i></a> <br> <span
															class="text-dark fw-bold" style="font-size: .875em !important;">Add</span>
													</div>
													<div class="col-sm-4 col-4">
														<a href="<%=request.getContextPath()%>/lct/residents/list"
															class="btn btn-circle btn-lg btn-light"> <i
															class="fas fa-list"></i></a><br> <span
															class="text-dark fw-bold" style="font-size: .875em !important;">List</span>
													</div>
													<div class="col-sm-4 col-4">
														<a
															href="<%=request.getContextPath()%>/lct/residents/pending-rents"
															class="btn btn-circle btn-lg btn-light"> <i
															class="fas fa-rupee-sign"></i></a><br> <span
															class="text-dark fw-bold" style="font-size: .875em !important;">Pending Rents</span>
													</div>
												</div>
											</div>
										</div>
										<!-- 7. Stats card -->
									</div>
								</div>
							</div>
						</div>
					
		        	<div class="col-sm-12 col-12">
						<img class="card" style="border-radius: 10px; width: 100%;" src="<%=request.getContextPath() %>/assets/img/trackozai.png" />
						<!-- <a href="<%=request.getContextPath() %>/lct/expenses/approve-list">
							<img class="card" style="border-radius: 10px; width: 100%;"
								onclick="window.JSInterface.openInBrowser('https://tikaana.com/');" src="<%=request.getContextPath() %>/assets/img/trackozai.png" />
						<!-- </a> -->
					</div>
					<div class="row">
						<%-- <div class="col-md-4 col-4 col-12 col-sm-12">
							<div class="card" style="border-radius: 10px; background: #fff;">
								<div class="card-body">
									<p style="font-weight: 900; color: #000;">Residents Corner</p>
									<div class="row">									
										<ul class="list-group list-group-flush">
		                    				<li class="list-group-item">                      
												<a href="<%=request.getContextPath() %>/lct/residents/list"
											 		style="color: #000 !important;">
													<span>Residents List</span><span style="float: right;">
													<i class="fas fa-angle-right"></i></span></a>
		                    				</li>
		                    				<li class="list-group-item">                      
												<a href="<%=request.getContextPath() %>/lct/residents/add"
											 		style="color: #000 !important;">
													<span>Add Residents</span><span style="float: right;">
													<i class="fas fa-angle-right"></i></span></a>
		                    				</li>
		                    				<li class="list-group-item">                      
												<a href="<%=request.getContextPath() %>/lct/residents/pending-rents"
											 		style="color: #000 !important;">
													<span>Pending Rents</span><span style="float: right;">
													<i class="fas fa-angle-right"></i></span></a>
		                    				</li>
		                    				<li class="list-group-item">                                            
												<a href="<%=request.getContextPath() %>/lct/residents/list"
											 		style="color: #000 !important;">
													<span>Benefits</span><span style="float: right;">
													<i class="fas fa-angle-right"></i></span></a>
		                    				</li>
		                    				<li class="list-group-item">
						                      
		                    				</li>
		                  				</ul>
									</div>
								</div>
							</div>
						</div> --%>
						
						<div class="col-12">
							<div class="card col-12"
								style="background: #F3F1F0; border-radius: 10px; box-shadow: 3px 3px 3px #c7c4d7;">
								<div class="card-body">
									<div class="row">
										<div class="">
											<h6 class="text-dark fw-bold text-start" style="font-family: monospace;">Properties</h6>
											<div class="">
												<div class="row text-center">
													<div class="col-sm-4 col-4">
														<a
															href="<%=request.getContextPath()%>/lct/properties/add-property"
															class="btn btn-circle btn-lg btn-light-primary"> <i
															class="fas fa-plus"></i></a> <br> <span
															class="text-dark fw-bold">Add</span>
													</div>
													<div class="col-sm-4 col-4">
														<a href="<%=request.getContextPath()%>/lct/properties/list"
															class="btn btn-circle btn-lg btn-light-primary"> <i
															class="fas fa-list"></i></a><br> <span
															class="text-dark fw-bold">List</span>
													</div>
													<div class="col-sm-4 col-4">
														<a
															href="<%=request.getContextPath()%>/lct/properties/worksites"
															class="btn btn-circle btn-lg btn-light-primary"> <i
															class="fas fa-map-pin"></i></a><br> <span
															class="text-dark fw-bold">Worksites</span>
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
							<a href="<%=request.getContextPath() %>/lct/properties/transport">
								<img class="card" style="border-radius: 10px; width: 100%;"
									src="<%=request.getContextPath() %>/assets/img/transport.gif" />
							</a>
						</div>
					
						<%-- <div class="col-sm-12 col-12 col-md-4 col-4">
							<div class="card" style="border-radius: 10px; background: #fff;">
								<div class="card-body">
									<p style="font-weight: 900; color: #000;">Properties</p>
									<div class="row">									
										<ul class="list-group list-group-flush">
		                    				<li class="list-group-item">                      
												<a href="<%=request.getContextPath() %>/lct/properties/list"
											 		style="color: #000 !important;">
													<span>Camps List</span><span style="float: right;">
													<i class="fas fa-angle-right"></i></span></a>
		                    				</li>
		                    				<li class="list-group-item">                      
												<a href="<%=request.getContextPath() %>/lct/properties/add-property"
											 		style="color: #000 !important;">
													<span>Add Camp</span><span style="float: right;">
													<i class="fas fa-angle-right"></i></span></a>
		                    				</li>
		                    				<li class="list-group-item">                      
												<a href="<%=request.getContextPath() %>/lct/properties/worksites"
											 		style="color: #000 !important;">
													<span>Work sites</span><span style="float: right;">
													<i class="fas fa-angle-right"></i></span></a>
		                    				</li>
		                    				<li class="list-group-item">                                            
												<a href="<%=request.getContextPath() %>/lct/properties/add-worksite"
											 		style="color: #000 !important;">
													<span>Add Work site</span><span style="float: right;">
													<i class="fas fa-angle-right"></i></span></a>
		                    				</li>
		                    				<li class="list-group-item">
						                      
		                    				</li>
		                  				</ul>
									</div>
								</div>
							</div>
						</div> --%>
						
						<div class="col-12">
							<div class="card col-12"
								style="background: #FFF; border-radius: 10px; box-shadow: 3px 3px 3px #c7c4d7;">
								<div class="card-body">
									<div class="row">
										<div class="">
											<h6 class="text-dark fw-bold text-start" style="font-family: monospace;">Expenses</h6>
											<div class="">
												<div class="row text-center">
													<div class="col-sm-4 col-4 ">
														<a
															href="<%=request.getContextPath()%>/lct/expenses/add"
															class="btn btn-circle btn-lg btn-warning"> <i
															class="fas fa-plus"></i></a> <br> <span
															class="text-dark fw-bold">Add</span>
													</div>
													<div class="col-sm-4 col-4 ">
														<a href="<%=request.getContextPath()%>/lct/expenses/list"
															class="btn btn-circle btn-lg btn-primary"> <i
															class="fas fa-list"></i></a><br> <span
															class="text-dark fw-bold">Due List</span>
													</div>
													<div class="col-sm-4 col-4 ">
														<a
															href="<%=request.getContextPath()%>/lct/expenses/vendor-list"
															class="btn btn-circle btn-lg btn-success"> <i
															class="fas fa-user"></i></a><br> <span
															class="text-dark fw-bold">Vendors</span>
													</div>
													<%-- <div class="col-sm-4 col-4">
														<a
															href="<%=request.getContextPath()%>/lct/expenses/paid-list"
															class="btn btn-circle btn-lg btn-info"> <i
															class="fas fa-rupee-sign"></i></a><br> <span
															class="text-dark fw-bold">Paid List</span>
													</div> --%>
													<%-- <div class="col-sm-4 col-4">
														<a
															href="<%=request.getContextPath()%>/lct/expenses/approve-list"
															class="btn btn-circle btn-lg btn-light-primary"> <i
															class="fas fa-check"></i></a><br> <span
															class="text-dark fw-bold">Approve List</span>
													</div> --%>
												</div>
											</div>
										</div>
										<!-- 7. Stats card -->
									</div>
								</div>
							</div>
						</div>
						
						
						<%-- <div class="col-sm-12 col-12 col-md-4 col-4">
							<div class="card" style="border-radius: 10px; background: #fff;">
								<div class="card-body">
									<p style="font-weight: 900; color: #000;">Expenses</p>
									<div class="row">									
										<ul class="list-group list-group-flush">
		                    				<li class="list-group-item">                      
												<a href="<%=request.getContextPath() %>/lct/expenses/list"
											 		style="color: #000 !important;">
													<span>Expenses List</span><span style="float: right;">
													<i class="fas fa-angle-right"></i></span></a>
		                    				</li>
		                    				<li class="list-group-item">                      
												<a href="<%=request.getContextPath() %>/lct/expenses/add"
											 		style="color: #000 !important;">
													<span>Add Expense</span><span style="float: right;">
													<i class="fas fa-angle-right"></i></span></a>
		                    				</li>
		                    				<li class="list-group-item">                      
												<a href="<%=request.getContextPath() %>/lct/expenses/approve-list"
											 		style="color: #000 !important;">
													<span>Approve Expense</span><span style="float: right;">
													<i class="fas fa-angle-right"></i></span></a>
		                    				</li>
		                    				<li class="list-group-item">                                            
												<a href="<%=request.getContextPath() %>/lct/expenses/vendor-list"
											 		style="color: #000 !important;">
													<span>Vendor List</span><span style="float: right;">
													<i class="fas fa-angle-right"></i></span></a>
		                    				</li>
		                    				<li class="list-group-item">
						                      
		                    				</li>
		                  				</ul>
									</div>
								</div>
							</div>
						</div> --%>
						<div class="col-sm-12 col-12 d-none d-lg-block">
							<a href="<%=request.getContextPath() %>/lct/properties/transport">
								<img class="card" style="border-radius: 10px; width: 100%;"
									src="<%=request.getContextPath() %>/assets/img/transport.gif" />
							</a>
						</div>
					</div>
					<%-- <div class="card" style="border-radius: 10px;">
						<div class="card-body">
							<div class="row">
								<div class="">
									<h5 style="font-weight: 700; color: #474040;">Services
									<span style="float: right;">
										<a href="<%=request.getContextPath() %>/lct/services" class="small">View More</a>
									</span></h5>
						            <div class="swiper mySwiper">
								      	<div class="swiper-wrapper"">
									        <div class="swiper-slide">
								        		<img src="<%=request.getContextPath() %>/assets/img/vendorservices.png"
													style="border-radius: 10px; width: 100%;" />
									        </div>
									        <div class="swiper-slide">
								        		<img src="<%=request.getContextPath() %>/assets/img/DubaiTrip.png"
													style="border-radius: 10px; width: 100%;" />
									        </div>
								      	</div>
								      	<div class="swiper-pagination"></div>
								    </div>
								</div>
							</div>
						</div>
					</div> --%>					
				</div>
	            <%-- <c:if test="${not empty notification }">
		            <div class="card">
		            	<div class="card-body">
		                	<h5 style="font-weight: 700; color: #474040;">Notifications
		                		<span style="float: right;">
								<a href="<%=request.getContextPath() %>/lct/notifications/list">View all</a></span></h5>
		                  	<div class="message-box position-relative mt-3">
		                    	<div
		                      		class="message-widget contact-widget position-relative">
		                      		<!-- Message -->
		                      		<c:forEach items="${notification }" var="note">
			                      		<div class="py-3 px-2 border-bottom d-flex
			                          		align-items-start text-decoration-none">
			                        		<div class="user-img position-relative d-inline-block me-2">
			                          			<span class="round text-white d-inline-block
			                              			text-center rounded-circle bg-primary">
			                              			<i data-feather="mail" class="feather-sm"></i>
			                              		</span>
			                        		</div>
			                        		<div class="w-75 d-inline-block v-middle pl-2">
			                          			<h5 class="text-truncate mb-0 text-dark
			                              			font-weight-medium">
			                            			${note.title }
			                          			</h5>
			                          			<span class="mail-desc fs-2 mt-1 text-truncate
			                              			overflow-hidden text-nowrap d-block fw-normal text-muted">
			                              			<fmt:formatDate value="${note.date}" pattern="MMMM dd, yyyy"/></span>
			                          			<span class="time fs-2 text-truncate overflow-hidden
			                              			text-nowrap d-block font-weight-medium"><fmt:formatDate value="${note.post_time}" pattern="hh:mm a"/></span>
			                        		</div>
			                      		</div>
		                      			<!-- Message -->
		                      		</c:forEach>
		                    	</div>
		                  	</div>
		            	</div>
		        	</div>
		       	</c:if> --%>
	             				
				<!-- Swiper -->			    

				<%-- <div class="row" style="margin-bottom: 10px;">
					<a href="<%=request.getContextPath() %>/lct/badminton-league">
						<img src="<%=request.getContextPath() %>/assets/img/badminton.jpeg"
							style="border-radius: 10px; width: 100%;" />
					</a>
				</div> --%>
				
				

				<%-- <div class="card" style="border-radius: 10px;">
					<div class="card-body">
						<div class="row">
							<div class="">
								<h5 style="font-weight: 700; color: #474040;">Properties</h5>
								<div class="">
									<div class="row text-center">
										<div class="col-sm-4 col-4">
											<a href="<%=request.getContextPath()%>/lct/properties/add-property"
												class="btn btn-circle btn-lg text-white"
												style="background: #7c806d;"><i class="fas fa-building"></i></a>
											<br> <small style="font-size: .775em;">Add
												Property</small>
										</div>
										<div class="col-sm-4 col-4">
											<a href="<%=request.getContextPath()%>/lct/properties/list"
												class="btn btn-circle btn-lg text-white"
												style="background: #1d2a2c;"><i class="fas fa-list"></i></a>
											<br> <small style="font-size: .775em;">Properties</small>
										</div>
										<div class="col-sm-4 col-4">
											<a
												href="<%=request.getContextPath()%>/lct/properties/add-worksite"
												class="btn btn-circle btn-lg text-white"
												style="background: #4c92a9;"><i
												class="bi-door-open-fill"></i></a> <br> <small
												style="font-size: .775em;">Add WorkSite</small>
										</div>
										<div class="col-sm-4 col-4">
											<a href="<%=request.getContextPath()%>/lct/properties/worksites"
												class="btn btn-circle btn-lg text-white"
												style="background: #fdad50;"><i class="fas fa-list"></i></a>
											<br> <small style="font-size: .775em;">WorkSites</small>
										</div>
										<div class="col-sm-4 col-4">
											<a href="<%=request.getContextPath()%>/lct/properties/amenities"
												class="btn btn-circle btn-lg text-white"
												style="background: #88bf50;"><i class="fas fa-paperclip"></i></a>
											<br> <small style="font-size: .775em;">Amenities</small>
										</div>
										<div class="col-sm-4 col-4">
											<a href="<%=request.getContextPath()%>/lct/properties/transport"
												class="btn btn-circle btn-lg text-white"
												style="background: #7266ba;"><i class="fas fa-bus"></i></a>
											<br> <small style="font-size: .775em;">Transport</small>
										</div>
										<div class="col-sm-4 col-4">
											<a href="<%=request.getContextPath()%>/lct/properties/maintenance"
												class="btn btn-circle btn-lg text-white"
												style="background: #49d5a5;"><i class="fas fa-cogs"></i></a>
											<br> <small style="font-size: .775em;">Maintenance</small>
										</div>
									</div>
								</div>
							</div>
							<!-- 7. Stats card -->

						</div>
					</div>
				</div> --%>
				
				<%-- <div class="card" style="background: #cda6a666; border-radius: 10px;">
					<div class="card-body">
						<div class="row">
							<div class="">
								<h5 style="font-weight: 700; color: #474040;">Expense tracker</h5>
								<div class="text-center"><br>
									<div class="row">
							          	<p class="row">
											<a href="<%=request.getContextPath() %>/lct/expenses/add-vendor">
												<span style="width: 30%; font-weight: 900;">
													<i class="fa fa-plus text-dark"></i></span>
												<button class="btn text-white" style="border-radius: 10px;
													width: 70%; background: #2C346B;">
														 VENDOR</button>
											</a>
											<br>
										</p>
							          	<p class="row">
											<a href="<%=request.getContextPath() %>/lct/expenses/add">
												<span style="width: 30%;">
													<i class="fa fa-plus text-dark"></i></span>
												<button class="btn text-white" style="border-radius: 10px;
													width: 70%; background: #E1C63C;">
													ADD EXPENSE</button>
											</a>
										</p>
							          	<p class="row">												
											<a
												href="<%=request.getContextPath()%>/lct/expenses/approve-list">
												<span style="width: 30%;">
													<i class="fa fa-list text-dark"></i></span>
												<button class="btn text-white" style="border-radius: 10px;
													width: 70%; background: #7ED957;">
													EXPENSES</button>
											</a>
										</p>
									</div>
								</div>
							</div>
							<!-- 7. Stats card -->

						</div>
					</div>
				</div> --%>
				
				
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
    <script src="<%=request.getContextPath()%>/new/assets/libs/echarts/dist/echarts-en.min.js"></script>
    
	
	
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
				localStorage.username = ${ClientUser.username};
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
						$('#notifications-count').empty();
						$('#notifications-count').html(+data);
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
				url : "${pageContext.request.contextPath}/lct/tickets-count",
				timeout : 100000,
				beforeSend : function() {
					//$('#school-points').append('<i class="fa fa-spinner fa-spin orange" id="loading"></i>');
				},
				success : function(data) {

					console.log("SUCCESS: ", data);
					if(data>0){
						$('#tickets-count').empty();
						$('#tickets-count').html(
								+data);
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
						$('#residents-count').empty();
						$('#residents-count').html(+data);
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
				url : "${pageContext.request.contextPath}/lct/getRecentPayments",
				timeout : 100000,
				beforeSend:function(){
					//$('#school-toppers').append('<i class="fa fa-spinner text-center fa-2x fa-spin orange" id="loading"></i>');
				},
				success : function(data) {					
					console.log("SUCCESS: ", data);					
					$('#recent-payments').empty();
					$('#recent-payments').html(data);					
				},
				error : function(e) {
					console.log("ERROR: ", e);					
				},
				done : function(e) {
					console.log("DONE");
					$('#loading').remove();					
				}
			});
			
		});
	</script>
	<script>
	$(function () {
	    "use strict";

	    // Initialize ECharts instance for basic-pie chart
	    var basicpieChart = echarts.init(document.getElementById("basic-pie"));

	    // Define the option for the basic-pie chart
	    var option = {
	        // Add title
	        title: {
	            text: "Browser popularity",
	            subtext: "Open source information",
	            x: "center",
	        },

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
	    basicpieChart.setOption(option);

	    // Resize chart on window resize
	    $(window).on("resize", function () {
	        basicpieChart.resize();
	    });
	});

	</script>
</body>
</html>