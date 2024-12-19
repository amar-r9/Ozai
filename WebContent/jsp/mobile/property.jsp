<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>${propertyDetails.name } | Ozai</title>
<meta content="" name="descriptison">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="<%=request.getContextPath()%>/assets/img/favicon.jpeg"
	rel="icon">
<link
	href="<%=request.getContextPath()%>/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="<%=request.getContextPath()%>/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/vendor/ionicons/css/ionicons.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/vendor/animate.css/animate.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/assets/vendor/owl.carousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="<%=request.getContextPath()%>/assets/css/style.css"
	rel="stylesheet">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v6.0.0-beta1/css/all.css">
<script src="https://use.fortawesome.com/1ce05b4b.js"></script>
<link rel="stylesheet" href="https://fonticons-free-fonticons.netdna-ssl.com/kits/1ce05b4b/publications/113295/woff2.css" media="all">
<link rel="canonical" href="https://fontawesome.com/v6.0/icons?d=gallery&amp;p=1&amp;s=solid&amp;m=free">
<link rel="canonical" href="https://fontawesome.com/v6.0/icons?d=gallery&amp;p=1&amp;s=solid&amp;m=free">
<link rel="canonical" href="https://fontawesome.com/v6.0/icons?d=gallery&amp;p=1&amp;q=w&amp;s=solid&amp;m=free">
<link rel="canonical" href="https://fontawesome.com/v6.0/icons?d=gallery&amp;p=1&amp;q=was&amp;s=solid&amp;m=free">

<!-- =======================================================
  * Template Name: EstateAgency - v2.1.0
  * Template URL: https://bootstrapmade.com/real-estate-agency-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

	<!-- ======= Property Search Section ======= -->
	<!-- End Header/Navbar -->

	<main id="main"> <!-- ======= Intro Single ======= -->
	<section class="intro-single" style="padding: 2rem 0 3rem !important;">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-lg-8">
					<div class="title-single-box">
						<h1 class="title-single">${propertyDetails.name }</h1>
						<span class="color-text-a">${propertyDetails.location }, ${propertyDetails.city }</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Intro Single--> <!-- ======= Property Single ======= -->
	<section class="property-single nav-arrow-b">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="row text-center">
						<div class="col-sm-6 col-6">
							<a href="<%=request.getContextPath() %>/mobile/schedule-visit/${propertyDetails.id }"
								class="btn btnsm btn-info" style="border-radius: 0px;">Schedule Visit</a>
						</div>
						<div class="col-sm-6 col-6">
							<a href="#"
								class="btn btnsm btn-dark" style="border-radius: 0px;">Book Now</a>
						</div>
					</div>
					<div class="row justify-content-between">
						<div class="col-md-5 col-lg-4"><br>
							<div class="property-price d-flex justify-content-center foo">
								<iframe src="${propertyDetails.map }" width="600" height="300"
									style="border: 0;" allowfullscreen="" loading="lazy"></iframe>
							</div>
							<c:choose>
								<c:when test="${propertyDetails.client_type == 'B2B' }">
									<h3 class="title-d"></h3>
								</c:when>
								<c:otherwise>
									<div class="property-summary">
										<div class="row">
											<div class="col-sm-12">
												<div class="title-box-d section-t4">
													<h3 class="title-d">Prices</h3>
												</div>
											</div>
										</div>
										<div class="summary-list">
											<ul class="list">
												<li class="d-flex justify-content-between"><strong>Single
														Occupancy:</strong> <span>${propertyDetails.single_share }</span></li>
												<li class="d-flex justify-content-between"><strong>Two
														Sharing:</strong> <span>${propertyDetails.double_share }</span></li>
												<li class="d-flex justify-content-between"><strong>Three
														Sharing:</strong> <span>${propertyDetails.triple_share }</span></li>
												<li class="d-flex justify-content-between"><strong>Four
														Sharing:</strong> <span>${propertyDetails.four_share }</span></li>
											</ul>
										</div>
									</div>
								</c:otherwise>
							</c:choose>							
						</div>
						<div class="col-md-7 col-lg-7 section-md-t3">
							<div class="row">
								<div class="col-sm-12">
									<div class="title-box-d">
										<c:choose>
											<c:when test="${propertyDetails eq null }">
												<h3 class="title-d">Property Description</h3>
											</c:when>
											<c:otherwise>
												<h3 class="title-d"></h3>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
							<div class="property-description text-justify">
								<c:choose>
									<c:when test="${propertyDetails.description eq null }">
										<p class="description color-text-a">Ozai
											${propertyDetails.name } is a high-rise residential project in
											the most desirable neighbourhood of ${propertyDetails.city }, which is
											${propertyDetails.location }. It’s a prestigious ongoing residential project that
											is being built by ${propertyDetails.city } Coliving Group.</p>
										<p class="description color-text-a no-margin">${propertyDetails.name }
											offer incredibly superior homes and unmatched amenities and
											possibly the best location in ${propertyDetails.location }
											area. ${propertyDetails.name } is will be built with the latest
											Aluminium Form work technology. The project is just a stone’s
											throw from large MNCs and with unlimited views to open skies as well as being minutes away from many
											life style necessities you will be truly taking "A STEP INTO
											LUXURY" with Ozai ${propertyDetails.name } .</p>
									</c:when>
									<c:otherwise>
										${propertyDetails.description }
									</c:otherwise>
								</c:choose>
							</div>
							<div class="row section-t3">
								<div class="col-sm-12">
									<div class="title-box-d">
										<h3 class="title-d">Amenities</h3>
									</div>
								</div>
							</div>
							<c:choose>
								<c:when test="${propertyDetails.client_type == 'B2B' }">
									<h3 class="title-d"></h3>
								</c:when>
								<c:otherwise>
									<div class="amenities-list color-text-a">
										<div class="row">
											<div class="col-md-4">
												<i class="fa fa-solid fa-washer"></i>&nbsp;Washing Machine <br> 
											</div><br>
											<div class="col-md-4">
												<i class="fa fa-solid fa-utensils"></i>&nbsp;Food <br>
											</div><br>
											<div class="col-md-4">
												<i class="fa fa-solid fa-television"></i>&nbsp;TV <br>
											</div><br>
										</div>
										<div class="row">
											<div class="col-md-4">
												<i class="fa fa-solid fa-door-closed"></i>&nbsp;Wardrobes <br>
											</div>
											<div class="col-md-4">
												<i class="fa fa-solid fa-wifi"></i>&nbsp;Internet <br>
											</div>
											<div class="col-md-4">
												<i class="fa fa-solid fa-broom"></i>&nbsp;House Keeping <br>
											</div>
										</div>
										<div class="row">
											<div class="col-md-4">
												<i class="fa fa-solid fa-toilet"></i>&nbsp;Attached Washroom <br>
											</div>
											<div class="col-md-4">
												<i class="fa-solid fa-temperature-full"></i>&nbsp;Geyser <br>
											</div>
											<div class="col-md-4">
												<i class="fa-solid fa-square-parking"></i>&nbsp;Parking <br>
											</div>
										</div>
										<!-- <ul class="list-a no-margin" style="list-type: none;">
											<li>Geyser</li>
											<li>Washing machine</li>
											<li>Food</li>
											<li>House keeping</li>
											<li>Internet</li>
											<li>Parking</li>
											<li>Cupboards</li>
											<li>TV</li>
										</ul> -->
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>


				<c:choose>
					<c:when test="${propertyDetails.client_type == 'B2B' }">
						<h3 class="title-d"></h3>
					</c:when>
					<c:otherwise>
						<div class="col-md-10 offset-md-1">
							<section class="section-news section-t8">
								<div class="container">
		
									<div id="new-carousel" class="owl-carousel owl-theme">
										<div class="carousel-item-c">
											<div class="card-box-b card-shadow news-box">
												<div class="img-box-b">
													<img src="<%=request.getContextPath()%>/assets/img/${propertyDetails.id }/1.jpg"
														alt="" class="img-b img-fluid">
												</div>
		
											</div>
										</div>
										<div class="carousel-item-c">
											<div class="card-box-b card-shadow news-box">
												<div class="img-box-b">
													<img
														src="<%=request.getContextPath()%>/assets/img/${propertyDetails.id }/2.jpg"
														alt="" class="img-b img-fluid">
												</div>
		
											</div>
										</div>
										<div class="carousel-item-c">
											<div class="card-box-b card-shadow news-box">
												<div class="img-box-b">
													<img src="<%=request.getContextPath()%>/assets/img/${propertyDetails.id }/3.jpg"
														alt="" class="img-b img-fluid">
												</div>
		
											</div>
										</div>
									</div>
								</div>
							</section>
						</div>
					</c:otherwise>
				</c:choose>



				<div class="col-md-12">
					<div class="row section-t3">
						<div class="col-sm-12">
							<div class="title-box-d">
								<h3 class="title-d">Contact </h3>
							</div>
						</div>
					</div>
					<div class="row">
						
						
						<div class="col-md-12 col-lg-12">
							<div class="property-contact">
								<form action="#" method="post" role="form"
								id="contact-form" class="php-email-form">
								<!-- <form class="form-a"> -->
									<div class="row">
										<div class="col-md-12 mb-1">
											<div class="form-group">
												<input type="text" name="name"
													class="form-control form-control-lg form-control-a"
													id="inputName" placeholder="Name *" required>
											</div>
										</div>
										<div class="col-md-12 mb-1">
											<div class="form-group">
												<input type="email" name="email"
													class="form-control form-control-lg form-control-a"
													id="inputEmail1" placeholder="Email *" required>
											</div>
										</div>
										<div class="col-md-12 mb-1">
											<div class="form-group">
												<textarea id="textMessage" class="form-control"
													placeholder="Comment *" name="message" cols="45" rows="8"
													required></textarea>
											</div>
										</div>
										<div class="col-md-12 mb-1">
											<div class="mb-3">
												<div class="loading">Loading</div>
												<div class="sent-message">Your message has been sent.
													Thank you!</div>
											</div>
										</div>
										<div class="col-md-12">
											<button type="submit" class="btn btn-a">Send Message</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Property Single--> </main>
	<!-- End #main -->
	<div id="preloader"></div>

	<!-- Vendor JS Files -->
	<script
		src="<%=request.getContextPath()%>/assets/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/vendor/php-email-form/validate.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/vendor/scrollreveal/scrollreveal.min.js"></script>

	<!-- Template Main JS File -->
	<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
	<script>
		$('document').ready(function(){
			$("#contact-form").submit(function(event) {
				event.preventDefault();
				saveEnquiry();
			});
		});	
	
		function saveEnquiry(){
			var formData=$("#contact-form").serialize();
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/send-enquiry",
				data : formData,
				//data : {"mail":$('#mail').text()},
				timeout : 100000,
				beforeSend:function(){
					$(".loading").show();
				},
				success : function(data) {
					
					console.log("SUCCESS: ", data);
					
					if(data=='success'){
						$('.sent-message').show();
					}else
					if(data=='error'){
						$('.error-message').html('Please try again later!');
					} else if(data=='empty'){
						$('.error-message').html('Please fill all the fields');
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
	</script>
</body>

</html>