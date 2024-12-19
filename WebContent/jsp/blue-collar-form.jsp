<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<title>Ozai Living | Simplified accommodation Management</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="keywords" content="">
<meta name="author" content="">

<!-- FAVICON -->
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/images/favicon.ico">

<!-- BOOTSTRAP -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">

<!-- ICONS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/icons/fontawesome/css/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/icons/themify/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/icons/ionicons/css/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/icons/icomoon/style.css">

<!-- THEME / PLUGIN CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/js/vendors/flexslider/flexslider.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/js/vendors/slick/slick.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/js/vendors/swipebox/css/swipebox.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">

<!-- SKIN -->
<link rel="stylesheet" title="cyan"
	href="<%=request.getContextPath()%>/css/skins/skin-cyan.css" />
<link rel="alternate stylesheet" title="green"
	href="<%=request.getContextPath()%>/css/skins/skin-green.css" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
<style>
.mt-4 {
	margin-top: 40px;
}
.mb-3 {
	margin-bottom: 30px;
}
</style>
</head>
<body>
	<div id="page-top"></div>

	<div id="wrapper">
		<!-- HEADER -->
		<header>
			<nav class="navbar navbar-default navbar-fixed-top">
				<div class="container">
					<div class="navbar-header pull-left">
						<!-- Logo -->
						<a class="navbar-brand" href="#"
							style="margin-top: -5px; margin-left: -25px;"><img
							src="<%=request.getContextPath()%>/assets/img/logo.png" alt=""></a>
					</div>
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<div class="top-contact pull-right editContent">
						<i class="icon-phone"></i> <span>Call us today</span>+971 55 925
						6090
					</div>
					<!-- Navmenu -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
							<li><a href="<%=request.getContextPath()%>/"
								class="page-scroll">Home</a></li>
							<li class="active"><a class="page-scroll"
								href="<%=request.getContextPath()%>/about">About Us</a></li>
							<li><a class="page-scroll" href="#services">Services</a></li>
							<li><a class="page-scroll" href="#dual-info">Info</a></li>
							<li><a class="page-scroll" href="#features">Features</a></li>
							<!--<li><a class="page-scroll" href="#testimonials">Testimonials</a></li>
						<li><a class="page-scroll" href="#pricing">Pricing</a></li> -->
						</ul>
					</div>
				</div>
			</nav>
		</header>
		<!-- HEADER -->
		<section class="feature-content" style="padding-top: 20px;">
		</section>
		<!-- TESTIMONIALS -->
		<div class="testimonials" id="about">
			<div class="container">
				<div class="row">
					<div class="content-head space60 text-center">
						<h2>Blue Collar form</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-9 text-justify">
						<form action="#" method="post" role="form" id="beds-form"
							class="php-email-form">
							<div>
								<div class="card-body">
									<h4 class="card-title">Requirement Info</h4>
									<div class="row mt-4 pt-3">
										<div class="col-md-6">
											<div class="mb-3">
												<label class="control-label">Name</label> <input type="text"
													name="name" id="name" required
													class="form-control form-control-lg form-control-a"
													placeholder="Name" data-rule="minlen:4"
													data-msg="Please enter your least 4 chars">
											</div>
										</div>
										<!--/span-->
										<div class="col-md-6">
											<div class="mb-3">
												<label class="control-label">Mobile</label> <input
													type="text" name="mobile" id="mobile" required
													class="form-control form-control-lg form-control-a"
													placeholder="Mobile" minlength="10" maxlength="10"
													data-msg="Please enter 10 digits">
											</div>
										</div>
										<div class="col-md-6">
											<div class="mb-3">
												<label class="control-label">Location</label> <input
													type="text" name="location" id="location" required
													class="form-control form-control-lg form-control-a"
													placeholder="Location">
											</div>
										</div>										
										<!--/span-->
										<div class="col-md-6">
											<div class="mb-3">
												<label class="control-label">No of beds</label>
												<input type="number" name="no_of_beds" id="no_of_beds" required
													class="form-control form-control-lg form-control-a"
													placeholder="No of beds">
											</div>
										</div>
										<!--/span-->
										<div class="col-md-6">
											<div class="mb-3">
												<label class="control-label">Food</label>
												<select name="food" id="food" class="form-control form-select">
													<option value="">Select</option>
													<option value="YES">YES</option>
													<option value="NO">NO</option>
												</select>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-12 mb-3">
									<div class="mb-3 mt-4">
										<div class="loading alert alert-warning" style="display: none;">Loading . . .</div>
										<div class="sent-message alert alert-success" style="display: none;">Your
											message has been sent. Thank you!</div>
									</div>
								</div>
								<hr />								
								<div class="form-actions">
									<div class="card-body border-top">
										<button type="submit" id="send"
											class="btn btn-success rounded-pill px-4">
											<div class="d-flex align-items-center">
												<i data-feather="save" class="feather-sm me-1 fill-icon"></i>
												Save
											</div>
										</button>
										<button type="button"
											class="btn btn-danger rounded-pill
	                            px-4 ms-2 text-white ">
											Cancel</button>
									</div>
								</div>
							</div>
						</form>
						
					</div>
				</div>
			</div>
		</div>

		<!-- PRICING -->

		<!-- FOOTER -->
		<footer>
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<h1 class="footer-logo">
							<a href="<%=request.getContextPath()%>/">Ozai Living</a>
						</h1>
						<p>Managing accommodation facilities has never been easier.
							Our AI powered engine is the best thing to have happened for you.</p>
						<ul class="footer-social">
							<li><a href="#"><i class="fa fa-twitter"></i></a></li>
							<li><a href="#"><i class="fa fa-facebook"></i></a></li>
							<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
							<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
							<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
							<li><a href="#"><i class="fa fa-instagram"></i></a></li>
						</ul>
					</div>
					<div class="col-md-4">
						<h4>Related Links</h4>
						<div class="row">
							<div class="col-md-6">
								<ul class="footer-list">
									<li><a href="#">About Us</a></li>
									<li><a href="#">Testimonials</a></li>
									<li><a href="#">Our Team</a></li>
									<li><a href="#">Contact Us</a></li>
								</ul>
							</div>
							<div class="col-md-6">
								<ul class="footer-list">
									<li><a href="#">Register</a></li>
									<li><a href="#">Forum</a></li>
									<li><a href="#">Affiliate</a></li>
									<li><a href="#">FAQ</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<h4>Payment Methods</h4>
						<ul class="footer-payment">
							<li><a href="#"><img
									src="<%=request.getContextPath()%>/images/payment/1.png"
									alt=""></a></li>
							<li><a href="#"><img
									src="<%=request.getContextPath()%>/images/payment/2.png"
									alt=""></a></li>
							<li><a href="#"><img
									src="<%=request.getContextPath()%>/images/payment/3.png"
									alt=""></a></li>
							<li><a href="#"><img
									src="<%=request.getContextPath()%>/images/payment/5.png"
									alt=""></a></li>
						</ul>
						<br>
						<p>
							&copy; 2024. Ozai Living PVT LTD. All Rights Reserved.<br>Designed,
							developed &amp; Maintained by Ozai
						</p>
					</div>
				</div>
			</div>
		</footer>
		<!-- FOOTER -->
	</div>

	<!-- JAVASCRIPT =============================-->
	<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/vendors/flexslider/flexslider.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/vendors/slick/slick.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/vendors/jquery.placeholder.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/vendors/jquery.easing.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/vendors/mc/jquery.ketchup.all.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/vendors/mc/main.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/vendors/jquery.countdown.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/vendors/swipebox/js/jquery.swipebox.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/main.js"></script>
	<script>
		$('document').ready(function() {
			$("#beds-form").submit(function(event) {
				event.preventDefault();
				addBeds();
			});
		});
		function addBeds() {
			var formData = $("#beds-form").serialize();
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/saveBedRequirment",
				data : formData,
				//contentType: "text/json; charset=utf-8",
				//dataType: "json",
				timeout : 100000,
				beforeSend : function() {
					$(".loading").show();
				},
				success : function(data) {

					console.log("SUCCESS: ", data);

					if (data == 'success') {
						$(".loading").hide();
						$("#beds-form")[0].reset();
						$('.sent-message').show();
					} else if (data == 'error') {
						$('.error-message').html('Please try again later!');
					} else if (data == 'empty') {
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