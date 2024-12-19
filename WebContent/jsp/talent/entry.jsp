<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Language" content="en">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${talent.name }'s Entry for Talent Showcase at Tikaana | Tikaana</title>
<meta
	content="${talent.summary }"
	name="description">
<meta
	content="Tikaana, Hostel, PG, coliving, app, make friends, coliving space"
	name="keywords">

<!-- Favicons -->
<link href="<%=request.getContextPath()%>/assets/img/favicon.jpeg"
	rel="icon">

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

<!-- =======================================================
  * Template Name: EstateAgency - v2.1.0
  * Template URL: https://bootstrapmade.com/real-estate-agency-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<body>

	<!-- ======= Property Search Section ======= -->
	<jsp:include page="/common/header.jsp"></jsp:include>
	<!-- End Header/Navbar -->

	<main id="main"> <!-- ======= Intro Single ======= -->
	<section class="intro-single" style="padding: 8rem 0 3rem !important;">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-lg-8">
					<div class="title-single-box">
						<h1 class="title-single">${talent.name }</h1>
						<span class="color-text-a">${talent.organisation }</span>
					</div>
				</div>
				<div class="col-md-12 col-lg-4">
					<nav aria-label="breadcrumb"
						class="breadcrumb-box d-flex justify-content-lg-end">
						<!-- <ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="index.html">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">News
								Grid</li>
						</ol> -->
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Intro Single--> <!-- =======  Blog Grid ======= -->
	<section class="news-grid grid">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-justify" style=" border: 2px #393939;">
					<div class="row" style="padding: 40px;">
						<div class="row col-md-12" style="color: #6b6b6b; padding: 0px; border-bottom: 2px solid #666;">
							<div class="col-md-6">
								<h6 style="text-transform: capitalize;"><i class="fa fa-user"></i>&nbsp;  ${talent.name }</h6>
							</div>
							<div class="col-md-6 col-6">
								<h6 class=" pull-right" style="text-transform: capitalize;"><i class="fa fa-globe"></i>&nbsp; ${talent.organisation }</h6>
							</div>
						<br>
						</div>
						
						<div class="alert alert-info row col-md-12" style="margin-top: 10px;">
			                <p class="mb-4"><i class="fa fa-star"></i>&nbsp; ${talent.summary }</p>
			                <%-- <footer class="blockquote-footer">
			                  <strong>Albert Vargas</strong>
			                  <cite title="Source Title">Author</cite>
			                </footer> --%>
			              </div>
						<br>
						<div class="thumbnailembed-responsive embed-responsive-16by9" style="width: 100%;">
							<video width="400" controls class="embed-responsive-item" style="width: 100%;">
								<source
									src="https://tikaana.com/uploaded_files/DOC/TALENT/${talent.submission_file_name}"
									type="video/mp4">
								<source
									src="https://tikaana.com/uploaded_files/DOC/TALENT/${talent.submission_file_name}"
									type="video/ogg">
								<p>Your browser does not support HTML5 video.</p>
							</video>
						</div>
					</div>
				</div>
				
				<div class="col-md-4">
					<a href="<%=request.getContextPath() %>/talent/upload"
						class="btn btn-info btn-block">UPLOAD TALENT</a>
				</div>
				<!-- /.col -->
			</div>
		</div>
	</section>
	<!-- End Blog Grid--> </main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->

	<jsp:include page="/common/footer.jsp"></jsp:include>
	<!-- End  Footer -->

	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
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
		$('document')
				.ready(
						function() {
							//$('#about').addClass("active");
							$('.fb-icon')
									.click(
											function() {

												window
														.open(
																'http://www.facebook.com/sharer.php?u=http://tikaana.com/blogs/article/${article.article_id}',
																'Tikaana Blog Article',
																'width=626,height=436');
												return false;
											});
							$('.tw-icon')
									.click(
											function() {
												window
														.open(
																'https://twitter.com/share?url=http://tikaana.com/blogs/article/${article.article_id}',
																'Tikaana Blog Article',
																'width=626,height=436');
												return false;

											});
						});
	</script>
</body>
</html>