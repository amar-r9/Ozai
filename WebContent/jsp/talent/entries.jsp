<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Talent Entries | Tikaana | Our story, philosophy, vision and mission</title>
<meta
	content="Our aim at Tikaana is to change the coliving space landscape, one property at a time."
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

	<main id="main">

    <!-- ======= Intro Single ======= -->
    <section class="intro-single" style="padding: 8rem 0 3rem !important;">
      <div class="container">
        <div class="row">
          <div class="col-md-12 col-lg-8">
            <div class="title-single-box">
              <h1 class="title-single">Talent Entries</h1>
              <!-- <span class="color-text-a">Grid News</span> -->
            </div>
          </div>
          <div class="col-md-12 col-lg-4">
            <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
              <!-- <ol class="breadcrumb">
                <li class="breadcrumb-item">
                  <a href="index.html">Home</a>
                </li>
                <li class="breadcrumb-item active" aria-current="page">
                  News Grid
                </li>
              </ol> -->
            </nav>
          </div>
        </div>
      </div>
    </section><!-- End Intro Single-->

    <!-- =======  Blog Grid ======= -->
    <section class="news-grid grid">
      <div class="container">
        <div class="row">
        	<div class="col-md-8">
				<c:if test="${not empty talents }">
					<table class="table table-bordered" id="talents">
						<tbody>
							<c:forEach items="${talents}" var="talent">
								<tr>
									<td>
										<div class="row">
        									<div class="col-md-12">
									            <div class="card-box-c foo">
									              	<div class="card-header-c d-flex">
									                	<div class="">
									                  		<span class="fa fa-gamepad fa-3x"></span>
									                	</div>
									                	<div class="card-title-c align-self-center">
									                  		<h2 class="title-c"></h2>
									                	</div>
									              	</div>
									              	<div class="card-body-c">
									              		<h3 class="content-c" style="color: #393939;">${talent.name }</h3>
									                	<p class="content-c">
									                  	${talent.summary }
									                	</p>
									              	</div>
									              	<div class="card-footer-c pull-right">
										                <a href="<%=request.getContextPath() %>/talent/entry/${talent.id }" class="link-c link-icon">View
										                  <span class="ion-ios-arrow-forward"></span>
										                </a>
									            	</div>
									        	</div>
									        </div>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>
				<c:if test="${empty talents }">
					<h3>There are no entries uploaded.</h3>
				</c:if>
			</div>
			<div class="col-md-4">
				<a href="<%=request.getContextPath() %>/talent/upload"
					class="btn btn-info btn-block">UPLOAD TALENT</a>
			</div>
        </div>
        
      </div>
    </section><!-- End Blog Grid-->

  </main><!-- End #main -->

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
		$('document').ready(function() {
			//$('#about').addClass("active");
		});
	</script>
</body>

</html>