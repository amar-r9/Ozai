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
	<link rel="shortcut icon" href="<%=request.getContextPath() %>/images/favicon.ico">

	<!-- BOOTSTRAP -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">

	<!-- ICONS -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/icons/fontawesome/css/style.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/icons/themify/style.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/icons/ionicons/css/style.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/icons/icomoon/style.css">

	<!-- THEME / PLUGIN CSS -->
	<link rel="stylesheet" href="<%=request.getContextPath() %>/js/vendors/flexslider/flexslider.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/js/vendors/slick/slick.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/js/vendors/swipebox/css/swipebox.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
    
	<!-- SKIN -->
	<link rel="stylesheet" title="cyan" href="<%=request.getContextPath() %>/css/skins/skin-cyan.css"/>
	<link rel="alternate stylesheet" title="green" 	href="<%=request.getContextPath() %>/css/skins/skin-green.css"/>

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
					<a class="navbar-brand" href="#"><img src="<%=request.getContextPath() %>/assets/img/logo.png" alt=""></a>
				</div>
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				</button>
				<div class="top-contact pull-right editContent">
					<i class="icon-phone"></i> <span>Call us today</span>1800 1234 5678
				</div>
				<!-- Navmenu -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="<%=request.getContextPath() %>/" class="page-scroll">Home</a></li>
						<li><a class="page-scroll" href="<%=request.getContextPath() %>/about">About Us</a></li>
						<li><a class="page-scroll" href="#services">Services</a></li>
						<li><a class="page-scroll" href="#dual-info">Info</a></li>
						<li><a class="page-scroll" href="#features">Features</a></li>
						<li><a class="page-scroll" href="#testimonials">Testimonials</a></li>
						<li><a class="page-scroll" href="#pricing">Pricing</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<!-- HEADER -->

	<!-- INTRO HEAD -->
	<div class="intro1">
		<div class="overlay"></div>
		<div class="container">
			<div class="row center-content">
				<div class="col-md-12 text-center">
					<h2>Simplified accommodation Management</h2>
					<p class="space30 editContent">Managing accommodation facilities has never been easier. Our AI powered engine is the best thing to have happened for you.</p>
					<a href="#" class="btn btn-default btn-ico">Get Started<i class="ti-shopping-cart"></i></a>
					<a href="<%=request.getContextPath() %>/about" class="btn btn-default2 btn-ico">Learn More<i class="ti-angle-right"></i></a>
				</div>
			</div>
		</div>
	</div>
	<!-- INTRO HEAD -->

	<!-- CLIENTS -->
	<div class="clients">
		<div class="container">
			<div class="row text-center">
				<div class="col-md-3">
					<img class="center-block" src="https://cdn.pixabay.com/photo/2012/04/10/23/03/india-26828_640.png" 
						style="height: 70px; " alt=""><br>India
				</div>
				<div class="col-md-3">
					<img class="center-block" src="https://cdn.britannica.com/82/5782-050-8A763A9A/Flag-United-Arab-Emirates.jpg" alt="">
					<br>UAE
				</div>
				<div class="col-md-3">
					<img class="center-block" src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Flag_of_the_United_Kingdom_%281-2%29.svg/1200px-Flag_of_the_United_Kingdom_%281-2%29.svg.png" alt="">
					<br>UK
				</div>
				<div class="col-md-3">
					<img class="center-block" src="https://cdn.britannica.com/33/4833-004-828A9A84/Flag-United-States-of-America.jpg" alt="">
					<br>USA
				</div>
				<!-- <div class="col-md-2">
					<img class="center-block" src="https://cdn.pixabay.com/photo/2012/04/10/23/03/india-26828_640.png" alt="">
				</div> -->
			</div>
		</div>
	</div>
	<!-- CLIENTS -->

	<!-- SERVICES -->
	<div class="service-content" id="services">
		<div class="container">
			<h2>We have built an amazing AI powered accommodation solution</h2>
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<div class="icon-box text-center">
						<span class="ico">
						<i class="fa icon-monitor fa-stack-1x fa-inverse"></i>
						</span>
						<h4>Responsive</h4>
						<p>Lorem ipsum dolor sit amet consec tetur itaque autem neque adipi sicing elit repudiandae fugiat illo.</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="icon-box text-center">
						<span class="ico">
						<i class="fa icon-albums fa-stack-1x fa-inverse"></i>
						</span>
						<h4>Multiple Concepts</h4>
						<p>Lorem ipsum dolor sit amet consec tetur itaque autem neque adipi sicing elit repudiandae fugiat illo.</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="icon-box text-center">
						<span class="ico">
						<i class="fa icon-bicycle fa-stack-1x fa-inverse"></i>
						</span>
						<h4>Easy Customise</h4>
						<p>Lorem ipsum dolor sit amet consec tetur itaque autem neque adipi sicing elit repudiandae fugiat illo.</p>
					</div>
				</div>
				<div class="col-md-3 col-sm-6">
					<div class="icon-box text-center">
						<span class="ico">
						<i class="fa icon-box2 fa-stack-1x fa-inverse"></i>
						</span>
						<h4>Out of the Box</h4>
						<p>Lorem ipsum dolor sit amet consec tetur itaque autem neque adipi sicing elit repudiandae fugiat illo.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- SERVICES -->

	<!-- INFO CONTENT -->
	<div class="info-content">
		<div class="container">
			<div class="row center-content">
				<div class="col-md-8">
					<img src="<%=request.getContextPath() %>/images/1.png" class="img-responsive " alt="">
				</div>
				<div class="col-md-4">
					<h4>Responsive<br>Design</h4>
					<p>Phasellus enim libero, blandit vel sapien vitae, condimentum ultricies magna et. Quisque euismod orci ut et lobortis aliquam. Aliquam in tortor enim.</p>
					<a href="#" class="btn btn-default">Learn More</a>
				</div>
			</div>
		</div>
	</div>
	<!-- INFO CONTENT -->

	<!-- DUAL CONTENT -->
	<div class="dual-content" id="dual-info">
		<div class="container-fluid">
			<div class="row">
				<div class="dual-img"></div>
				<div class="col-md-6">
				</div>
				<div class="col-md-6">
					<div class="col-md-9">
						<div class="dc-info">
							<h4>Retina-Ready &amp; Responsive</h4>
							<p>The entire idea of the retina-ready technology is to give sharper images, and to create something that would look as sharp as it would in print. This is what you will find in the Monstroid WordPress theme.</p>
							<ul class="space30">
								<li><span class="fa fa-check list-icon" style=""></span><a href="#">Lorem ipsum dolor sit amet</a></li>
								<li><span class="fa fa-check list-icon" style=""></span><a href="#">Elit sed do eiusmod tempor</a></li>
								<li><span class="fa fa-check list-icon" style=""></span><a href="#">Incididunt ut labore</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- DUAL CONTENT -->

	<!-- INFO CONTENT -->
	<div class="info-content">
		<div class="container">
			<div class="row center-content">
				<div class="col-md-7 col-md-push-5">
					<img src="<%=request.getContextPath() %>/images/2.png" class="img-responsive " alt="">
				</div>

				<div class="col-md-5 col-md-pull-7">
					<h4>Multipurpose<br>Template</h4>
					<p>Phasellus enim libero, blandit vel sapien vitae, condimentum ultricies magna et. Quisque euismod orci ut et lobortis aliquam. Aliquam in tortor enim.</p>
					<a href="#" class="btn btn-default">Learn More</a>
				</div>
			</div>
		</div>
	</div>
	<!-- INFO CONTENT -->

	<!-- FEATURES -->
	<section class="feature-content" id="features">
		<div class="container">
			<div class="row">
				<div class="col-md-12 content-head-lite text-center">
					<h2>Features of Minutes</h2>
					<p>Suspendisse egestas mattis rhoncus pellen tesque euismod erat at sed do eiusmod tempor posuere molestie lorem lectus interdum augue</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 fc-inner">
					<div class="fc-thumb">
						<img src="<%=request.getContextPath() %>/images/other/2.jpg" class="img-responsive" alt="">
					</div>
					<h4>Marketing Concepts</h4>
					<p>Sed commodo suscipit neque et libero sed finibus. Morbi elit nulla, rutrum eu nulla eu, lacinia tincidunt ligula. </p>
					<a href="#" class="btn btn-default btn-xs">Learn More <i class="fa fa-long-arrow-right"></i></a>
				</div>
				<div class="col-md-4 fc-inner">
					<div class="fc-thumb">
						<img src="<%=request.getContextPath() %>/images/other/3.jpg" class="img-responsive" alt="">
					</div>
					<h4>Device Optimized</h4>
					<p>Sed commodo suscipit neque et libero sed finibus. Morbi elit nulla, rutrum eu nulla eu, lacinia tincidunt ligula. </p>
					<a href="#" class="btn btn-default btn-xs">Learn More <i class="fa fa-long-arrow-right"></i></a>
				</div>
				<div class="col-md-4 fc-inner">
					<div class="fc-thumb">
						<img src="<%=request.getContextPath() %>/images/other/4.jpg" class="img-responsive" alt="">
					</div>
					<h4>Target Audience</h4>
					<p>Sed commodo suscipit neque et libero sed finibus. Morbi elit nulla, rutrum eu nulla eu, lacinia tincidunt ligula. </p>
					<a href="#" class="btn btn-default btn-xs">Learn More <i class="fa fa-long-arrow-right"></i></a>
				</div>
			</div>
		</div>
	</section>
	<!-- FEATURES -->

	<!-- TESTIMONIALS -->
	<div class="testimonials" id="testimonials">
		<div class="container">
			<div class="row">
				<div class="content-head space60 text-center">
					<h2>What our clients say</h2>
					<p>Suspendisse egestas mattis rhoncus pellen tesque euismod erat at sed do eiusmod tempor posuere molestie lorem lectus interdum augue</p>
				</div>
			</div>
			<div class="row">
				<div class="quote-slider">
					<div class="quote-item">
						<div class="quote-info">
							<p class="quote">It's iaculis lectus sed mattis nibh phasellus iaculis pulvinar purus vitae ligula interdum at mattis dui sodales non neque sit amet enim</p>
							<div class="author">
								<img class="author-avatar" src="<%=request.getContextPath() %>/images/quote/1.jpg" height="48" width="48" alt="" />
								<div class="author-info">
									<div class="name">Joseph Doe</div>
									<div class="company">@company</div>
								</div>
							</div>
						</div>
					</div>
					<div class="quote-item">
						<div class="quote-info">
							<p class="quote">It's iaculis lectus sed mattis nibh phasellus iaculis pulvinar purus vitae ligula interdum at mattis dui sodales non neque sit amet enim</p>
							<div class="author">
								<img class="author-avatar" src="<%=request.getContextPath() %>/images/quote/2.jpg" height="48" width="48" alt="" />
								<div class="author-info">
									<div class="name">Stephen Doe</div>
									<div class="company">@company</div>
								</div>
							</div>
						</div>
					</div>
					<div class="quote-item">
						<div class="quote-info">
							<p class="quote">It's iaculis lectus sed mattis nibh phasellus iaculis pulvinar purus vitae ligula interdum at mattis dui sodales non neque sit amet enim</p>
							<div class="author">
								<img class="author-avatar" src="<%=request.getContextPath() %>/images/quote/1.jpg" height="48" width="48" alt="" />
								<div class="author-info">
									<div class="name">Mary Christopher</div>
									<div class="company">@company</div>
								</div>
							</div>
						</div>
					</div>
					<div class="quote-item">
						<div class="quote-info">
							<p class="quote">It's iaculis lectus sed mattis nibh phasellus iaculis pulvinar purus vitae ligula interdum at mattis dui sodales non neque sit amet enim</p>
							<div class="author">
								<img class="author-avatar" src="<%=request.getContextPath() %>/images/quote/2.jpg" height="48" width="48" alt="" />
								<div class="author-info">
									<div class="name">Joseph Doe</div>
									<div class="company">@company</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- TESTIMONIALS -->

	<!-- PRICING -->
	<div class="pricing bg-gray" id="pricing">
		<div class="container">
			<div class="content-head space60 text-center">
				<h2>Choose your best plan</h2>
				<p>Suspendisse egestas mattis rhoncus pellen erat at sed do eiusmod tempor<br>posuere molestie lorem lectus interdum augue</p>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<!-- Pricing Plan - 1 -->
				<div class="col-md-3">
					<div class="panel panel-default text-center">
						<div class="panel-heading">
							<strong>Basic</strong>
						</div>
						<div class="panel-body">
							<h3 class="panel-title price">$9<span class="price-cents">99</span></h3>
						</div>
						<ul class="list-group">
							<li class="list-group-item">5 Projects</li>
							<li class="list-group-item">5 GB of Storage</li>
							<li class="list-group-item">Up to 100 Users</li>
							<li class="list-group-item">10 GB Bandwidth</li>
							<li class="list-group-item">Security Suite</li>
						</ul>
						<a class="buy-btn" href="#">Sign Up Now!</a>
					</div>
				</div>

				<!-- Pricing Plan - 2 -->
				<div class="col-md-3">
					<div class="panel panel-default text-center">
						<div class="panel-heading">
							<strong>Standard</strong>
						</div>
						<div class="panel-body">
							<h3 class="panel-title price">$19<span class="price-cents">99</span></h3>
						</div>
						<ul class="list-group">
							<li class="list-group-item">10 Projects</li>
							<li class="list-group-item">10 GB of Storage</li>
							<li class="list-group-item">Up to 250 Users</li>
							<li class="list-group-item">25 GB Bandwidth</li>
							<li class="list-group-item">Security Suite</li>
						</ul>
						<a class="buy-btn" href="#">Sign Up Now!</a>
					</div>
				</div>

				<!-- Pricing Plan - 3 -->
				<div class="col-md-3">
					<div class="panel panel-default active text-center">
						<i class="ti-cup"></i>
						<div class="panel-heading">
							<strong>Premium</strong>
						</div>
						<div class="panel-body">
							<h3 class="panel-title price">$29<span class="price-cents">99</span></h3>
						</div>
						<ul class="list-group">
							<li class="list-group-item">Unlimited</li>
							<li class="list-group-item">50 GB of Storage</li>
							<li class="list-group-item">Up to 1000 Users</li>
							<li class="list-group-item">100 GB Bandwidth</li>
							<li class="list-group-item">Security Suite</li>
						</ul>
						<a class="buy-btn" href="#">Sign Up Now!</a>
					</div>
				</div>

				<!-- Pricing Plan - 4 -->
				<div class="col-md-3">
					<div class="panel panel-default text-center">
						<div class="panel-heading">
							<strong>Ultimate</strong>
						</div>
						<div class="panel-body">
							<h3 class="panel-title price">$49<span class="price-cents">99</span></h3>
						</div>
						<ul class="list-group">
							<li class="list-group-item">Unlimited</li>
							<li class="list-group-item">150 GB of Storage</li>
							<li class="list-group-item">Unlimited</li>
							<li class="list-group-item">500 GB Bandwidth</li>
							<li class="list-group-item">Security Suite</li>
						</ul>
						<a class="buy-btn" href="#">Sign Up Now!</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- PRICING -->

	<!-- CALL TO ACTION -->
	<div class="cta-content">
		<div class="container">
			<div class="row text-center">
				<div class="col-md-8 col-md-offset-2">
					<i class="ti-shopping-cart head-ico"></i>
					<h3>Are you impressed ?</h3>
					<p class="space30">Lorem ipsum dolor sit amet curabitur eu dapibus felis. Morbi ut dolor ut mi ultricies lobortis.<br>Morbi et viverra turpis. Donec cursus ornare purus nec porttitor.</p>
					<a href="#" class="btn btn-ico">Download Minutes Now <i class="ti-shopping-cart"></i></a>
				</div>
			</div>
		</div>
	</div>
	<!-- CALL TO ACTION -->

	<!-- FOOTER -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<h1 class="footer-logo"><a href="index.html">Minutes</a></h1>
					<p>Managing accommodation facilities has never been easier. Our AI powered engine is the best thing to have happened for you.</p>
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
						<li><a href="#"><img src="<%=request.getContextPath() %>/images/payment/1.png" alt=""></a></li>
						<li><a href="#"><img src="<%=request.getContextPath() %>/images/payment/2.png" alt=""></a></li>
						<li><a href="#"><img src="<%=request.getContextPath() %>/images/payment/3.png" alt=""></a></li>
						<li><a href="#"><img src="<%=request.getContextPath() %>/images/payment/5.png" alt=""></a></li>
					</ul>
					<br>
					<p>&copy; 2024. Ozai Living PVT LTD. All Rights Reserved.<br>Designed, developed &amp; Maintained by Ozai</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- FOOTER -->
</div>

<!-- JAVASCRIPT =============================-->
<script src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/js/vendors/flexslider/flexslider.js"></script>
<script src="<%=request.getContextPath() %>/js/vendors/slick/slick.min.js"></script>
<script src="<%=request.getContextPath() %>/js/vendors/jquery.placeholder.js"></script>
<script src="<%=request.getContextPath() %>/js/vendors/jquery.easing.min.js"></script>
<script src="<%=request.getContextPath() %>/js/vendors/mc/jquery.ketchup.all.min.js"></script>
<script src="<%=request.getContextPath() %>/js/vendors/mc/main.js"></script>
<script src="<%=request.getContextPath() %>/js/vendors/jquery.countdown.min.js"></script>
<script src="<%=request.getContextPath() %>/js/vendors/swipebox/js/jquery.swipebox.min.js"></script>
<script src="<%=request.getContextPath() %>/js/main.js"></script>

</body>
</html>
