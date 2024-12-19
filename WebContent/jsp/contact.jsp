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
							<li><a class="page-scroll"
								href="<%=request.getContextPath()%>/about">About Us</a></li>
							<li><a class="page-scroll" href="#services">Services</a></li>
							<li><a class="page-scroll" href="#dual-info">Info</a></li>
							<li><a class="page-scroll" href="#features">Features</a></li>
							<li class="active"><a class="page-scroll"
								href="<%=request.getContextPath()%>/contact">Contact</a></li>
							<!-- <li><a class="page-scroll" href="#pricing">Pricing</a></li> -->
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
						<h2>Contact Us</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-1"></div>
					<div class="col-md-10 text-justify">
						<div class="alert alert-success" id="successMessage"
							style="display: none;">
							<h4>Message sent.</h4>
						</div>
						<div class="alert alert-warning" id="emptyMessage"
							style="display: none;">
							<h4>Please fill all fields.</h4>
						</div>
						<div class="alert alert-danger" id="errorMessage"
							style="display: none;">
							<h4>Technical error, Try again later.</h4>
						</div>
						<form action="#" method="post" id="contact-form"
							class="php-email-form">
							<div class="row">
								<div class="col-md-6 form-group">
									<input type="text" name="name" class="form-control" id="name"
										placeholder="Your Name" required>
								</div>
								<div class="col-md-6 form-group mt-3 mt-md-0">
									<input type="email" class="form-control" name="email"
										id="email" placeholder="Your Email" required>
								</div>
							</div>
							<div class="form-group mt-3">
								<input type="text" class="form-control" name="subject"
									id="subject" placeholder="Subject" required>
							</div>
							<div class="form-group mt-3">
								<textarea class="form-control" name="message" rows="5"
									placeholder="Message" required></textarea>
							</div>
							
							<div class="text-center">
								<button class="btn btn-dark" type="submit" id="send">Send Message</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- TESTIMONIALS -->

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
				url : "${pageContext.request.contextPath}/save-contact",
				data : formData,
				//contentType: "text/json; charset=utf-8",
	            //dataType: "json",
				timeout : 100000,
				beforeSend:function(){
					$(".loading").show();
				},
				success : function(data) {
					
					console.log("SUCCESS: ", data);
					
					if(data=='success'){
						$('#successMessage').show();
						$("#loading").hide();
					}else
					if(data=='error'){
						$('#errorMessage').html("Error, Please try later.");
						$("#loading").hide();
					} else if(data=='empty'){
						$('#emptyMessage').html("Fill all the fields.");
						$("#loading").hide();
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