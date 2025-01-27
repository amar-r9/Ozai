<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="keywords"
	content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, nice admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, " />
<meta name="description"
	content="Nice is powerful and clean admin dashboard template, inpired from Google's Material Design" />
<meta name="robots" content="noindex,nofollow" />
<title>Services | Ozai</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/new/assets/images/favicon.png" />
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
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->
		<jsp:include page="/common/mobileheader.jsp"></jsp:include>

		<div class="page-wrapper" style="background: #FFF !important; margin-top: 150px;">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->

			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid" style="padding-top: 0 !important;">
				<%-- <div class="row justify-content-center w-100 mt-4 mt-lg-0">
	            <div class="col-lg-6 col-xl-3 col-md-7">
		        	<div style="background: #EDF0F4; border-radius: 20px;"
		            	class="alert align-items-center">
		            	<div>
		              		<h6 style="color: #000; font-weight: 600;">Events</h6>
		            	</div>
		            	<p>We understand that you might need a loan at anytime. 
		            		We work with NBFCs who are willing to support you during such times. 
		            		Apply for a loan now!</p>
		            	<div class="text-center">
		            		<a href="<%=request.getContextPath() %>/mobile/apply-loan"
		            			class="btn btn-dark">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		            				APPLY NOW&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
		            	</div>
		       		</div>
					
	        	</div>
	       	</div> --%>
				<!-- <div style="background: #EDF0F4; border-radius: 20px;"
					class="alert align-items-center">
					<h5 class="card-title" style="font-weight: 700; color: #000;">Loan</h5>
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
						<a href="<%=request.getContextPath()%>/mobile/user/apply-loan"
							class="btn btn-sm btn-dark">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							APPLY NOW&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> <br>
						<br>
					</div>
				</div>
				<div class="card" id="loginform">
	           			<div class="text-center">
	            				<img src="<%=request.getContextPath() %>/assets/images/gift.gif" 
	            					style="width: 100%;"/></div> 
		                	<div class="text-center" style="padding-top: 30px !important; padding: 30px;">
								<h1 style="line-height: 60px; font-weight: 700; color: black; font-size: 44px;">
									CURRENTLY THERE ARE NO OFFERS </h1><br>
							</div>
	              	</div>
				<!-- <div style="background: #EDF0F4; border-radius: 20px;"
					class="alert align-items-center">
					<h5 class="card-title" style="font-weight: 700; color: #000;">Tryitfirst</h5>
					<div class="row">
						
						<div class="text-justify">
							<p style="color: #353535; font-size: .875rem;">
								Best offers on the Oppo and the Samsung products.</p>
							<p>Special offer from Tryitfirst  - on every purchase you get free gifts worth - Rs. 899</p>
						</div>
					</div>
					<div class="text-center">
						<a href="<%=request.getContextPath()%>/mobile/user/shop"
							class="btn btn-sm btn-dark">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							VIEW NOW&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> <br>
						<br>
					</div>
				</div> -->
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
				<!-- -------------------------------------------------------------- -->
				<!-- Login box.scss -->
				<!-- -------------------------------------------------------------- -->
			</div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- End footer -->
	<!-- ============================================================== -->
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
	<!-- Bootstrap tether Core JavaScript -->
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!-- apps -->
	<script src="<%=request.getContextPath()%>/new/dist/js/app.min.js"></script>
	<script src="<%=request.getContextPath()%>/new/dist/js/app.init.js"></script>
	<!-- slimscrollbar scrollbar JavaScript -->
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/jquery-sparkline/jquery.sparkline.min.js"></script>
	<!--Wave Effects -->
	<script src="<%=request.getContextPath()%>/new/dist/js/waves.js"></script>
	<!--Custom JavaScript -->
	<script src="<%=request.getContextPath()%>/new/dist/js/feather.min.js"></script>
	<script src="<%=request.getContextPath()%>/new/dist/js/custom.min.js"></script>
	<!-- This Page JS -->
	<script
		src="<%=request.getContextPath()%>/new/assets/extra-libs/prism/prism.js"></script>
	<script>
		$('document').ready(function() {

		});
	</script>
</body>
</html>