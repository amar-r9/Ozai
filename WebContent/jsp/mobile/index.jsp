<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="keywords"
	content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, nice admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, " />
<meta name="description"
	content="Nice is powerful and clean admin dashboard template, inpired from Google's Material Design" />
<meta name="robots" content="noindex,nofollow" />
<title>Home | Ozai Living</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/assets/images/favicon.png" />
<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/new/dist/css/style.min.css"
	rel="stylesheet" />
<!-- This Page CSS -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/new/assets/extra-libs/prism/prism.css" />
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
<script src="https://js.instamojo.com/v1/checkout.js"></script>
<!-- swiper carousel css -->
<link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
<link href=
"https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity=
"sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap" rel="stylesheet">

<style>
.swiper {
}

.swiper-slide {
      text-align: center;
      width: 100% !important;
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
.card {
	box-shadow: 5px 5px 5px #c7c4d7;
}
.slick-slide {
	/*width: 200px !important; */
	margin: 0px 20px;
}

.slick-slider {
	position: relative;
	display: block;
	box-sizing: border-box;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	-webkit-touch-callout: none;
	-khtml-user-select: none;
	-ms-touch-action: pan-y;
	touch-action: pan-y;
	-webkit-tap-highlight-color: transparent;
}

.slick-list {
	position: relative;
	display: block;
	overflow: hidden;
	margin: 0;
	padding: 0;
}

.slick-list:focus {
	outline: none;
}

.slick-list.dragging {
	cursor: pointer;
	cursor: hand;
}

.slick-slider .slick-track, .slick-slider .slick-list {
	-webkit-transform: translate3d(0, 0, 0);
	-moz-transform: translate3d(0, 0, 0);
	-ms-transform: translate3d(0, 0, 0);
	-o-transform: translate3d(0, 0, 0);
	transform: translate3d(0, 0, 0);
}

.slick-track {
	position: relative;
	top: 0;
	left: 0;
	display: block;
}

.slick-track:before, .slick-track:after {
	display: table;
	content: '';
}

.slick-track:after {
	clear: both;
}

.slick-loading .slick-track {
	visibility: hidden;
}

.slick-slide {
	display: none;
	float: left;
	height: 100%;
	min-height: 1px;
}

[dir='rtl'] .slick-slide {
	float: right;
}

.slick-slide img {
	display: block;
}

.slick-slide.slick-loading img {
	display: none;
}

.slick-slide.dragging img {
	pointer-events: none;
}

.slick-initialized .slick-slide {
	display: block;
}

.slick-loading .slick-slide {
	visibility: hidden;
}

.slick-vertical .slick-slide {
	display: block;
	height: auto;
	border: 1px solid transparent;
}

.slick-arrow.slick-hidden {
	display: none;
}

.city {
	color: #f15a21;
}
#clients {
	padding: 10px 0
}

#clients .clients-wrap {
	border-top: 1px solid #d6eaff;
	border-left: 1px solid #d6eaff;
	margin-bottom: 30px
}

#clients .client-logo {
	padding: 0px;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-justify-content: start;
	/* border: 1px solid #d6eaff;
	border-bottom: 1px solid #d6eaff; */
	overflow: hidden;
	background: #fff;
	height: 160px
}

#clients img {
	transition: all 0.4s ease-in-out
}
</style>
<!-- swiper carousel css -->
<link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
<style>
.team-icon {
	border-radius: 100%;
}

.panel {
	margin: 0;
	padding: 0;
	border-radius: 0;
}

.panel-heading {
	padding: 1em;
	border-radius: 0;
}

.chooseFrom {
	border: 1px solid #564444;
}

.chechedClass {
	/*border: 2px solid BLUE;
			border: 2px solid blueviolet;
    		background: blueviolet; */
	background: #343a40;
	color: #FFF;
}

[type=radio] {
	position: absolute;
	opacity: 0;
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
.img-circle {
	border-radius: 50%;
	background: #f5f5f5c4;
    padding: 15px;
}
.chooseFrom {
	border-radius: 50%;
	border-color: #94b9de !important;
}
body {
	font-size: 0.9rem;
}
p {
	font-size: 0.9rem;
}
small {
    font-size: .775em;
	font-weight: 600;
	color: #000;
}
.col-52 {
	width: 20%;
}
</style>
<style>
	.xsmall {
		font-size: .675em;
	}
    .alert {
    	display: none;
        font-size: 12px; /* Change this value to increase or decrease the text size */
        color: #666; /* Change this color code to a lighter shade */
        font-weight: bold; /* Make the text bolder */
    }
</style>

</head>

<body style="background: #FFF;">
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->
	<jsp:include page="/common/preloader.jsp"></jsp:include>
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper">		
		<jsp:include page="/common/mobileheader.jsp"></jsp:include>
		<!-- ============================================================== -->
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper" style="background: #FFF !important; margin-top: 70px;">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->

			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid" style="margin-top: 30px !important;">
				<!-- -------------------------------------------------------------- -->
				<!-- Start Page Content -->
				<%-- <c:if test="${not empty User}">
					<div class="m-1">
						<h4 class="p-1 text-dark fw-bold">Hi, ${User.name}</h4>
					</div>
				</c:if> --%>
				<%-- <div class="text-center">
					<c:choose>
						<c:when test="${empty User }">
							<br>
							<a href="<%=request.getContextPath() %>/mobile/findabed" style="display: block !important;"
								class="btn btn-warning btn-block btn-pill d-flex text-center">FIND A BED</a>
							<br>
						</c:when>
						<c:otherwise>
							<c:if test="${User.is_resident eq 'NO' }">
								<br>
								<a href="<%=request.getContextPath() %>/mobile/findabed" style="display: block !important;"
									class="btn btn-warning btn-block btn-pill d-flex text-center">FIND A BED</a>
								<br>
							</c:if>
						</c:otherwise>
					</c:choose>
				</div> --%>
				
				<c:choose>
					<c:when test="${empty User }">
						<div class="col-md-4 col-xl-2 d-flex align-items-stretch">
							<a href="<%=request.getContextPath()%>/mobile/signin"
								class="card bg-info text-white w-100 card-hover"
								style="border-radius: 20px !important;
	                			background-image: url(<%=request.getContextPath()%>/assets/img/bg/login.png);">
								<div class="card-body">
									<div class="d-flex align-items-center">
										<span class="fas fa-sign-in-alt display-6 fw-bold"></span>
										<div class="ms-auto">
											<i data-feather="arrow-right" class="fill-white"></i>
										</div>
									</div>
									<div class="mt-4">
										<h4 class="card-title mb-1 text-white">Login as resident
										</h4>
									</div>
								</div>
							</a>
						</div>
					</c:when>
					<c:otherwise>
						<%-- Check if emotion is already selected today --%>
			            <div id="emotionAlreadySelected" class="alert alert-primary" role="alert"></div>
				        <div id="successMessage" class="alert alert-success"></div>
				        <div id="errorMessage" class="alert alert-danger"></div>
						<form id="emotionForm" action="<%=request.getContextPath()%>/mobile/selectEmotion" method="post">
							    <!-- Add hidden inputs for user_emotion properties -->
						    <input type="hidden" id="user_emotion.emotion" name="emotion">
						    <input type="hidden" id="user_emotion.date" name="date">
							<div class="card card-body"
								style="background: #EDF4EE; border-radius: 20px;">
							<div class="">
								<div class="card-body heading">
									<h6 style="color: #000; font-weight: 600;">How was your day?</h6>
								</div>
								<div class="row ratings text-center" id="ratings">
									<!-- <img id="very_sad" src="https://i.imgur.com/TezGH8X.png" style="width: 60px;">
									<img id="sad" src="https://i.imgur.com/P1bKktc.png" style="width: 60px;">
									<img id="ok" src="https://i.imgur.com/LzDqrhA.png" style="width: 60px;">
									<img id="happy" src="https://i.imgur.com/OkdWjCv.png" style="width: 60px;">
									<img id="very_happy" src="https://i.imgur.com/7RHNQPw.png" style="width: 60px;"> -->
									<div class="col-52" onclick="selectEmotion('terrible')"><i id="very_sad" class="bi-emoji-dizzy fa-3x text-warning "></i>
									<br><small class="xsmall">Terrible</small></div>
									<div class="col-52" onclick="selectEmotion('bad')"><i id="sad" class="bi-emoji-frown fa-3x text-warning "></i>
									<br><small class="xsmall">Bad</small></div>
									<div class="col-52" onclick="selectEmotion('ok')"><i id="ok" class="bi-emoji-expressionless fa-3x text-warning "></i>
									<br><small class="xsmall">Ok</small></div>
									<div class="col-52" onclick="selectEmotion('good')"><i id="happy" class="bi-emoji-smile fa-3x text-warning "></i>
									<br><small class="xsmall">Good</small></div>
									<div class="col-52" onclick="selectEmotion('excellent')"><i id="very_happy" class="bi-emoji-laughing fa-3x text-warning "></i>
									<br><small class="xsmall">Excellent</small></div>
								</div>
							</div>
						</div>
						</form>
					</c:otherwise>
				</c:choose>
				
				<c:if test="${User.gender eq 'Female'}">
					<div class="row mb-3">
						<div class="col">
							<h6 class="title">Gate entry request</h6>
						</div>
						<div class="col-auto align-self-center">
							<a href="<%=request.getContextPath() %>/mobile/user/gaterequests/list" class=" small">View all</a>
						</div>
					</div>
					<c:choose>
						<c:when test="${not empty requests }">
							<div class="container m-0 p-0 mb-4" id="gateRequest">
								<h6 class="card-title mb-4"></h6>
								<div class="list-group" id="gateRequestAlert">
									<!-- Request Card Start -->
									<c:forEach items="${requests }" var="req">
										<c:choose>
											<c:when test="${req.type eq 'Guest' }">
												<div id="${req.id }" class="mb-2" style="background: linear-gradient(#b6a0a0b5, rgb(255 224 224 / 64%)), url('<%=request.getContextPath() %>/assets/images/guests.png'); 
													background-size: contain; background-position: right center; background-repeat: no-repeat;
													border-radius: 10px;">
													<div class="d-flex justify-content-between align-items-center p-2">
														<div class="d-flex flex-column">
															<h5 class="mb-1">Guest</h5>
															<p class="mb-1">You have a guest, <b>${req.name}</b> is waiting for your approval.</p>
															<small class="mb-1">Mobile: ${req.mobile}</small>
															<small>Requested at: 
																<fmt:formatDate value="${req.time}" pattern="MMM dd, yyyy"/>,
																<fmt:formatDate value="${req.time}" pattern="hh:mm aa"/>
															</small>
														</div>
													</div>
													<div class="d-flex justify-content-between align-items-center p-2 m-2">
														<div class="slider-container">
															<input type="range" min="0" max="100" value="0" class="slider" id="slider${req.id}" data-id="${req.id}">
															<label for="slider${req.id}" class="slider-label">Slide to Accept</label>
														</div>
													</div>
												</div>
												<!-- Request Card End -->
											</c:when>
											<c:otherwise>
												<div id="${req.id }" class="mb-2" style="background: linear-gradient(#b6a0a0b5, rgb(255 224 224 / 64%)), url('<%=request.getContextPath() %>/assets/images/delivery-guy.png'); 
													background-size: contain; background-position: right center; background-repeat: no-repeat;
													border-radius: 10px;">
													<div class="d-flex justify-content-between align-items-center p-2">
														<div class="d-flex flex-column">
															<h5 class="mb-1">Delivery</h5>
															<p class="mb-1">${req.name } from <b>${req.from }</b> is waiting for your approval.</p>
															<small>Requested at: 
																<fmt:formatDate value="${req.time}" pattern="MMM dd, yyyy"/>,
																<fmt:formatDate value="${req.time}" pattern="hh:mm aa"/>
															</small>
														</div>
													</div>
													<div class="d-flex justify-content-between align-items-center p-2 m-2">
														<div class="slider-container">
															<input type="range" min="0" max="100" value="0" class="slider" id="slider${req.id}" data-id="${req.id}">
															<label for="slider${req.id}" class="slider-label">Slide to Accept</label>
														</div>
													</div>
												</div>
												<!-- Request Card End -->
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="card mb-4">
								<div class="card-body">
									<h6>No pending requests.</h6>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:if>
				
				<!-- <div class="row">
					<div class="col-6">
						<a href="<%=request.getContextPath() %>/mobile/user/residents/list"
							style="text-decoration: none;">
							<div class="card card-body text-center text-dark">
								<h5><b>RESIDENTS</b></h5>
							</div>
						</a>
					</div>
					<div class="col-6">
						<a href="<%=request.getContextPath() %>/mobile/user/staff/list"
							style="text-decoration: none;">
							<div class="card card-body text-center text-dark">
								<h5><b>STAFF</b></h5>
							</div>
						</a>
					</div>
				</div> -->

				<c:if test="${User.is_resident eq 'YES' }">
					<c:if test="${not empty notifications }">
						<div class="row">
			                <h6 class="text-start text-dark fw-bold">Notifications
			                	<span style="float: right;">
			                		<a href="<%=request.getContextPath() %>/mobile/user/notifications/list">View all</a>
			                	</span>
			                </h6>			                
			            	<div class="m-0 p-0">
			            		<section class="mb-3 customer-logos slider" id="clients">
						            <c:forEach items="${notifications }" var="note">
										<a class="slide list-group-item bg-white" style="background: #3bb58e !important;">
							                <div class="row">
							                    <div class="col-auto">
							                        <div class="bg-white" style="border-radius: 10px;">
							                            <div class="m-0 p-0">
							                                <div class="card-body coverimg rounded-15">
			                                            		<i class="bi bi-bell fa-2x"></i>
							                                </div>
							                            </div>
							                        </div>
							                    </div>
							                    <div class="col align-self-center ps-0">
							                        <h6 class="mb-1 text-white"><b>${note.title }</b></h6>
							                        <small class="size-10 text-white">${note.message }</small>
							                    </div>
							                </div>
							            </a>
						        	</c:forEach>
						    	</section>
			            	</div>
			        	</div>
			        </c:if>
				</c:if>

				<div class="text-center">
					<br>
					<a href="<%=request.getContextPath() %>/mobile/talent/entries" style="display: block !important;"
						class="btn btn-warning btn-block btn-pill d-flex text-center">TALENT ENTRIES</a>
					<br>
				</div>


				<div style="background: #F4F1ED; border-radius: 20px;"
					class="card card-body align-items-center">
					<div>
						<h6 style="color: #000; font-weight: 600;">Helpdesk</h6>
					</div>
					<p>We are always just a few clicks away. Reach out to us for
						any service support/tickets.</p>
					<div class="text-center">
						<c:choose>
							<c:when test="${User.is_resident eq 'YES' }">
								<a
									href="<%=request.getContextPath()%>/mobile/user/tickets/list"
									class="btn btn-dark">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									HELP ME!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
							</c:when>
							<c:otherwise>
								<a href="<%=request.getContextPath()%>/mobile/support"
									class="btn btn-dark">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									HELP ME!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

				<div class="m-2 align-items-center" 
					style="border-radius: 20px;">
					<div class="row">
			            <div class="swiper mySwiper">
					      	<div class="swiper-wrapper">
						        <div class="swiper-slide">
									<a href="<%=request.getContextPath() %>/mobile/user/talent/upload">
										<img src="<%=request.getContextPath() %>/assets/images/slider/talents.png"
											style="border-radius: 10px; " />
									</a>
						        </div>
						        <div class="swiper-slide">
						        	<a href="#">
							        	<img src="<%=request.getContextPath() %>/assets/images/slider/events.png"
											style="border-radius: 10px; " />
									</a>
						        </div>
					      	</div>
					      	<div class="swiper-pagination"></div>
					    </div>
					</div>
				</div><hr>

				<c:if test="${User.gender eq 'Female' }">
					<div style="background: #F4F1ED; border-radius: 20px;"
						class="card card-body align-items-center">
						<div>
							<h6 style="color: #000; font-weight: 600;">Consult a
							doctor</h6>
						</div>
						<p>Whenever you need any support from a qualified professional, you just have to visit this section. Connect with Gynaecologists and Psychiatrists at the click of a button.</p>
						<div class="row">
							<div class="col-6 text-start">
									<a
										href="<%=request.getContextPath() %>/mobile/user/doctor/Psychiatrist"
										class="btn btn-dark">Psychiatrist</a>
							</div>
							<div class="col-6 text-end">
								<a href="<%=request.getContextPath() %>/mobile/user/doctor/Gynaecologist"
									class="btn btn-dark">Gynaecologist</a>
							</div>
						</div>
					</div>
				</c:if>

				

<!-- 				<div class="row"> -->
<!-- 					<div class="col-lg-6 col-xl-3"> -->
<!-- 		              <div class="alert"> -->
<!-- 	                    <h6 style="color: #000; font-weight: 600;">Multiplying Fun</h6> -->
<!-- 		                <div class="card-body" style="padding-top: 0px;"> -->
<%-- 		                	<img src="<%=request.getContextPath() %>/assets/images/referfriend.png" --%>
<!-- 		                		style="width: 100%; "alt="Refer a friend" /> -->
<!-- 		                	<p>Life is awesome when you live with your buddies. Now, you  -->
<!-- 		                		can double the fun at Ozai by inviting more friends. You  -->
<!-- 	                			and your friend both get referral bonus.</p> -->
<%-- 	                		<p class="text-center"><a href="<%=request.getContextPath()%>/mobile/user/refer-friend" --%>
<!-- 									class="btn btn-info">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
<!-- 									REFER NOW&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></p> -->
<!-- 		           		</div> -->
<!-- 		           	</div> -->
<!-- 		           </div> -->
<!-- 		       </div> -->

			   <c:if test="${empty User || User.resident_type eq 'B2B' }">
					<div class="col-sm-12 col-12 d-block d-lg-none">
						<a href="<%=request.getContextPath() %>/mobile/user/trips-list">
							<img class="card" style="border-radius: 10px; width: 100%;"
								src="<%=request.getContextPath() %>/assets/img/transport.gif" />
						</a>
					</div>
				</c:if>

				<div class="text-center " style="border-radius: 10px; background: #FFF;">
				<h6 class="text-dark fw-bold text-start">Value Added Services</h6><br>
				<div class="row">
					<!-- <div class="col-sm-3 col-3 mb-3">
						<a href="<%=request.getContextPath() %>/mobile/services">
							<label class="form-check-label img-circle"
								for="radio1" >
								<img style="height: 50px;"
									src="<%=request.getContextPath()%>/assets/img/services/loans.png" />
							</label><br>
							<small
								style="font-size: .775em;">Loans</small>
						</a>
					</div>
					<div class="col-sm-3 col-3 mb-3">
						<a href="<%=request.getContextPath() %>/mobile/services">
							<label class="form-check-label img-circle"
								for="radio2">
								<img style="height: 50px;"
									src="<%=request.getContextPath()%>/assets/img/services/insurance.png" />
							</label><br>
							<small style="font-size: .775em;">Insurance</small>
						</a>
					</div> -->
					<div class="col-sm-3 col-3 mb-3">
						<a href="<%=request.getContextPath() %>/mobile/user/flightTickets">
							<label class="form-check-label img-circle"
								for="radio3"><img style="height: 50px;"
									src="<%=request.getContextPath()%>/assets/img/services/tickets.png" />
							</label><br>
							<small style="font-size: .775em;">Tickets</small>
						</a>
					</div>
					<div class="col-sm-3 col-3 mb-3">
						<a href="<%=request.getContextPath() %>/mobile/services">
							<label class="form-check-label img-circle"
								for="radio4">
								<img style="height: 50px;"
									src="<%=request.getContextPath()%>/assets/img/services/mobiles.png" />
							</label><br>
							<small style="font-size: .775em;">Mobiles</small>
						</a>
					</div>
					<div class="col-sm-3 col-3 mb-3">
						<a href="<%=request.getContextPath() %>/mobile/services">
							<label class="form-check-label img-circle"
								for="radio5">
								<img style="height: 50px;"
									src="<%=request.getContextPath()%>/assets/img/services/upskilling.png" />
							</label><br>
							<small style="font-size: .775em;">Up Skilling</small>
						</a>
					</div>
					<div class="col-sm-3 col-3 mb-3">
						<a href="<%=request.getContextPath() %>/mobile/services">
							<label class="form-check-label img-circle"
								for="radio6">
								<img style="height: 50px;"
									src="<%=request.getContextPath()%>/assets/img/services/clothes.png" />
							</label><br>
							<small style="font-size: .775em;">Clothes</small>
						</a>
					</div>
					<!-- <div class="col-sm-3 col-3 mb-3">
						<a href="<%=request.getContextPath() %>/mobile/services">
							<label class="img-circle">
								<img style="height: 50px;"
									src="<%=request.getContextPath()%>/assets/img/services/money-transfer.png" />
							</label><br>
							<small style="font-size: .775em;">Transfer</small>
						</a>
					</div> -->
					<div class="col-sm-3 col-3 mb-3">
						<a href="<%=request.getContextPath() %>/mobile/services">
							<label class="img-circle">
								<img style="height: 50px;"
									src="<%=request.getContextPath()%>/assets/img/services/vehicles.png" />
							</label><br>
							<small style="font-size: .775em;">Vehicles</small>
						</a>
					</div>
				</div>
			</div>

				<!-- <div class="alert align-items-center" style="border-radius: 10px;">
					<h6 class="card-title" style="font-weight: 700; color: #000;">Loan</h6>
					<div class="row">
						<div class="col-md-4 col-4">
							<span class="pull-right"><img
								src="<%=request.getContextPath()%>/assets/img/loan1.png"
								style="width: 100%;" /></span>
						</div>
						<div class="col-md-8 col-8 text-justify">
							<p style="color: #353535; font-size: .875rem;">We understand
								that you might need a loan at anytime. We work with NBFCs who
								are willing to support you during such times. Apply for a loan
								now!</p>
						</div>
					</div>
					<div class="text-center">
						<a href="<%=request.getContextPath()%>/mobile/user/apply-loan" target="_blank"
							class="btn btn-primary">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							APPLY NOW&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> <br>
						<br>
					</div>
				</div> -->

				<!-- <div class="row mb-2 pb-2">
					<a href="<%=request.getContextPath()%>/mobile/user/apply-loan">
						<img style="border-radius: 20px; width: 100%;"
							src="<%=request.getContextPath() %>/assets/images/loan.jpg" />
					</a>
					<br>
				</div> -->

				<!-- <div style="background: #EDF0F4; border-radius: 10px;"
					class="card card-body align-items-center">
					<div>
						<h6 style="color: #000; font-weight: 600;">Events</h6>
					</div>
					<p>A wide variety of events to have fun, grow professionally
						and interact with people!</p>
					<div class="text-center">
						<a href="<%=request.getContextPath()%>/events/list"
							class="btn btn-dark">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							EVENTS HUB!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
					</div>
				</div> -->



				<!-- <div style="background: #FFF; border-radius: 10px;"
					class="alert align-items-center">
					<div>
						<h6 style="color: #000; font-weight: 600;">Showcase Talents</h6>
					</div>
					<p>Every person is unique with unique talents and interests.
						We, at Tikaana, always believe that we need to celebrate that.
						Upload any of your talents and let the appreciation begin!</p>
					<div class="text-center">
						<a href="<%=request.getContextPath()%>/mobile/user/talent/upload"
							class="btn btn-dark">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							UPLOAD TALENT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
					</div>
				</div> -->
				<c:if test="${not empty  recentArticles}">
					<div
						class="d-flex border-bottom
			              title-part-padding px-0 mb-3
			              align-items-center">
						<div>
							<h6 style="color: #000; font-weight: 600;">Blog</h6>
						</div>
					</div>
					<div class="row">
						<c:forEach items="${recentArticles }" var="article">
							<div
								class="col-md-6 col-lg-4 col-xl-3 d-flex align-items-stretch">
								<div class="card w-100"
									style="background: #ebf6fb96; border-radius: 20px;">
									<div class="p-3 d-flex align-items-stretch h-100"
										style="padding: 0.4rem !important;">
										<div class="row">
											<div style="padding: 5px;"
												class="col-3 col-xl-2 col-md-3 d-flex align-items-center">
												<img
													src="<%=request.getContextPath()%>/new/assets/images/users/2.jpg"
													class="rounded img-fluid"
													style="width: 80px; height: 80px; border-radius: 20px !important;">
											</div>
											<div class="col-9 col-xl-10 col-md-9 d-flex">
												<div style="margin: 10px;">
													<a
														href="<%=request.getContextPath() %>/mobile/article/${article.article_id}"
														class="font-weight-medium fs-4 link lh-sm"
														style="font-size: 13px; color: #353535; font-weight: 500;">${article.title }</a>
													<p class="card-subtitle mt-2 mb-0 fw-normal"
														style="font-size: 12px; color: #8b8b8b;">
														${article.summary }</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:if>
				<!-- <div style="background: #F4EDED; border-radius: 20px;"
					class="alert align-items-center">
					<div>
						<h6 style="color: #000; font-weight: 600;">The Tikaana
							Community</h6>
					</div>
					<div class="row text-center">
						<div class="" style="width: 33%;">
							<h5 style="color: #000; font-weight: 800;">8,000</h5>
							<p>Residents</p>
						</div>
						<div class="" style="width: 33%;">
							<h5 style="color: #000; font-weight: 800;">12</h5>
							<p>Cities</p>
						</div>
						<div class="" style="width: 33%;">
							<h5 style="color: #000; font-weight: 800;">50+</h5>
							<p>Hubs</p>
						</div>
					</div>
				</div> -->
				
				
				<c:if test="${not empty User && User.resident_type eq 'B2C' }">
					<h5 class="text-dark fw-bold">Properties
						<small class="text-end" style="float: right;">
							<a href="<%=request.getContextPath() %>/mobile/user/properties/list">View all</a>
						</small></h5>
					<c:forEach items="${pgs}" var="pg" varStatus="sno">
                    	<div class="card alert" style="border-radius: 10px; 
                    		box-shadow: 3px 3px 3px #c7c4d7; background: #ecf3ef;">
                    		<div class="row">
                    			<div class="col-4 p-0">
                    				<img src="<%=request.getContextPath() %>/assets/img/${pg.id }/1.jpg" 
                    					onerror="this.onerror=null; this.src='https://ozailiving.com/assets/img/logo.png'"
										style="max-width: 100%; border-radius: 5px; border: 1px solid;"/>
									<hr>
                    			</div>
                    			<div class="col-8">
                    				<h5 class="text-dark fw-bold mb-0">${pg.name }</h5>
                    				<small class="text-muted">${pg.location }, ${pg.city }</small>
                    				<div class="card card-body p-1" style="border-radius: 5px;">
                    					<div class="row text-center">
                    						<div class="col-6 text-center">
                    							<i class="ri-door-open-line fw-bold text-dark"></i> <span class="text-muted">${pg.rooms }</span>
                    						</div>
                    						<div class="col-6">
                    							<c:choose>
                    								<c:when test="${pg.gender eq 'Male' }">
                    									<i class="ri-men-line fw-bold text-dark"></i> <span class="text-muted">${pg.gender }</span>
                    								</c:when>
                    								<c:when test="${pg.gender eq 'Female' }">
                    									<i class="ri-women-line fw-bold text-dark"></i> <span class="text-muted">${pg.gender }</span>
                    								</c:when>
                    								<c:otherwise>
                    									<i class="ri-men-line fw-bold text-dark"></i><i class="ri-women-line fw-bold text-dark"></i> <span class="text-muted">${pg.gender }</span>
                    								</c:otherwise>
                    							</c:choose>
                    						</div>
                    					</div>
                    				</div>
                    				<div class="text-end">
                    				<a href="<%=request.getContextPath() %>/mobile/user/properties/details/${pg.id }"
                    					class="btn btn-rounded btn-dark btn-sm">VIEW DETAILS
                    						&nbsp;<i class="fas fa-angle-right"></i></a></div>
                    			</div>
                    		</div>
                    	</div>
					</c:forEach>
				</c:if>
				
				<div class="alert align-items-center">
					<div>
						<h6 style="color: #000; font-weight: 600;">Partners</h6>
					</div>
					<div class="row text-center">
						<div class="" style="width: 33%;">
							<img
								src="<%=request.getContextPath()%>/assets/img/partners/drovak.png"
								style="width: 100%; height: 60px;" />
						</div>
						<div class="" style="width: 33%;">
							<img
								src="<%=request.getContextPath()%>/assets/img/partners/ozai.png"
								style="width: 100%; height: 60px;" />
						</div>
						<div class="" style="width: 33%;">
							<img
								src="<%=request.getContextPath()%>/assets/img/partners/msb.png"
								style="width: 100%; height: 60px;" />
						</div>
					</div>
				</div>


				<!-- <a href="<%=request.getContextPath() %>/mobile/user/sos">
					<div class="card card-body bg-danger text-center text-white">
						<i class="bi bi-exclamation-diamond fa-3x"></i>
						<h5>
							<b style="font-weight: 800;">Emergency/SOS</b>
						</h5>
						<br>
					</div><br><br>
				</a>
				<br>
				<br>-->

				

				<!-- -------------------------------------------------------------- -->
				<!-- End PAge Content -->
				<!-- -------------------------------------------------------------- -->
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
	<script
		src="<%=request.getContextPath()%>/new/assets/extra-libs/toastr/dist/build/toastr.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/extra-libs/toastr/toastr-init.js"></script>
	<!-- swiper js script -->
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script
		src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.js"></script>
	<c:if test="${param.sessionUser != null }">
		<script>
			$('document').ready(function() {
				var username = "${fn:escapeXml(User.username)}";
	            localStorage.resident = username;
	        });
		</script>
	</c:if>
	
	
    <script>
		var swiper = new Swiper(".mySwiper", {
        
	  	  	slidesPerView: 1,
	  	  	spaceBetween: 0,
			centerInsufficientSlides: true,
	  	  	centeredSlides: true,
	  	  	centeredSlidesBounds: true,
			loop: true,
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
    	/* var swiper = new Swiper(".mySwiper", {
	        spaceBetween: 30,
	        centeredSlides: true,
	        autoplay: {
	          delay: 200,
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
      	}); */
    </script>
	<script>
		$('document').ready(function() {
			$('#hideBack').hide();
			$('.customer-logos').slick({
				slidesToShow : 1,
				slidesToScroll : 1,
				autoplay : true,
				autoplaySpeed : 2500,
				arrows : false,
				dots : false,
				pauseOnHover : false,
				responsive : [ {
					breakpoint : 1768,
					settings : {
						slidesToShow : 1
					}
				}, {
					breakpoint : 1520,
					settings : {
						slidesToShow : 1
					}
				} ]
			});
			
			$('.clickOnLoad').click();

			$(".chooseFrom").click(function(event) {
				$(this).find('input').prop('checked', true)
				$('.chooseFrom').not(this).removeClass(
						"chechedClass chooseFrom");
				$(this).addClass("chechedClass chooseFrom");
			});
		});
	</script>
	<script>
		$(document).ready(function() {
			$('.ratings img').click(function() {
				$('.ratings > img').removeClass('enlarge-emoji');
				$(this).addClass('enlarge-emoji');
				$('.form').css('display', 'block');
			});

// 			$('#very_sad').click(function() {
// 				$('#for_very_sad').show();
// 				$('#ratings').hide();
// 			});
// 			$('#sad').click(function() {
// 				$('#for_sad').show();
// 				$('#ratings').hide();
// 			});
// 			$('#ok').click(function() {
// 				$('#for_ok').show();
// 				$('#ratings').hide();
// 			});
// 			$('#happy').click(function() {
// 				$('#for_happy').show();
// 				$('#ratings').hide();
// 			});
// 			$('#very_happy').click(function() {
// 				$('#for_very_happy').show();
// 				$('#ratings').hide();
// 			});
		
		});
	</script>
	
	<script type="text/javascript">    
	    function selectEmotion(emotion) {
	        // Create a Date object for the current date
	        var currentDate = new Date();
	
	        // Format the date as YYYY-MM-DD
	        var formattedDate = currentDate.toISOString().split('T')[0];
	
	        // Set the properties of the userEmotion object
	        var userEmotion = {
	            emotion: emotion,
	            date: formattedDate
	        };
	
	        // Set the form data
	        document.getElementById("user_emotion.emotion").value = emotion;
	        document.getElementById("user_emotion.date").value = formattedDate;
	
	        // Submit the form
	        document.getElementById("emotionForm").submit();
	    }
	</script>
	
	<script type="text/javascript">
	
	  function showEmotionAlreadySelected(message) {
	    const successMessage = document.getElementById("emotionAlreadySelected");
	    successMessage.textContent = message;
	    successMessage.style.display = "block";

	    setTimeout(() => {
	      successMessage.style.display = "none";
	    }, 3000);
	  }
	  
	  function showSuccessMessage(message) {
	    const successMessage = document.getElementById("successMessage");
	    successMessage.textContent = message;
	    successMessage.style.display = "block";
	
	    setTimeout(() => {
	      successMessage.style.display = "none";
	    }, 3000);
	  }
	
	  function showErrorMessage(message) {
	    const errorMessage = document.getElementById("errorMessage");
	    errorMessage.textContent = message;
	    errorMessage.style.display = "block";
	
	    setTimeout(() => {
	      errorMessage.style.display = "none";
	    }, 3000);
	  }
	
	  // Call the showSuccessMessage or showErrorMessage function based on the flash attributes
	  <c:if test="${not empty emotionAlreadySelected}">
	  showEmotionAlreadySelected("${emotionAlreadySelected}");
	  </c:if>
	  
	  <c:if test="${not empty successMessage}">
	    showSuccessMessage("${successMessage}");
	  </c:if>
	
	  <c:if test="${not empty errorMessage}">
	    showErrorMessage("${errorMessage}");
	  </c:if>
	</script>
	
	<script>
		$(function() {
			"use strict";
			$("#main-wrapper").AdminSettings({
				LogoBg : "skin6",
				HeaderPosition : true,
				Theme : false,
			});
		});
	</script>
	<script type="text/javascript">
		$(document).ready(function () {
		    let blinkDuration = 3000; // Total blink duration in milliseconds
		    let blinkInterval = 500; // Interval for each blink in milliseconds
		    let blinks = blinkDuration / blinkInterval; // Number of blinks
	
		    $("#gateRequestAlert").show(); // Show the div first
	
		    for (let i = 0; i < blinks; i++) {
		        setTimeout(function() {
		            $("#gateRequestAlert").fadeOut(250).fadeIn(250);
		        }, i * blinkInterval);
		    }
	
		    // Hide the div after the blinking is done
		    setTimeout(function() {
		        $("#gateRequestAlert").show();
		    }, blinkDuration);
	
		    $('.slider').on('input', function () {
		        let slider = $(this);
		        let value = slider.val();
		        let requestId = slider.data('id'); // Get the req.id

		        if (value == 100) {
		            slider.next('label').text('Accepted').css('color', '#28a745');
		            slider.prop('disabled', true);

		            // Perform the AJAX call
		            $.ajax({
		                url: "${pageContext.request.contextPath}/mobile/approveGateRequest/"+requestId+"", // URL with requestId
		                type: 'POST',
		                success: function(response) {
		                    console.log('Request accepted:', response);
		                    // Optionally fade out the request card
		                    $("#"+requestId+"").removeClass();
		                    $("#"+requestId+"").addClass("bg-white alert text-center");
		                    $("#"+requestId+"").html("<img src='https://dwellite.com/assets/images/success.gif' style='width: 50%;' /><br><h5>Approved.</h5>");
		                    slider.closest('div').fadeOut(1000); // Adjust as needed
		                    $("#"+requestId+"").fadeOut(8000);
		                },
		                error: function(xhr, status, error) {
		                    console.error('Error:', error);
		                }
		            });
		        }
		    });
		});
	</script>
</body>
</html>