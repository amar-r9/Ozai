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
<title>Login | Ozai Living</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/new/assets/images/favicon.png" />
<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/new/dist/css/style.min.css"
	rel="stylesheet" />
<!-- This Page CSS -->
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
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

		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper" style="margin-top: 0px;">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->

			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->

			<div class="container-fluid">
				<div class="row auth-wrapper">
					<div class="d-flex align-items-center
            			justify-content-center">
						<div class="row justify-content-center w-100">
							<div class="col-lg-6 col-xl-3 col-md-7">
								<div class="row" id="hideOnClick">
									<div class="text-center">
										<img src="<%=request.getContextPath() %>/assets/images/ozaiappicon.png" 
											style="width: 200px;" />
									</div>
									<%-- <div class="col-md-4 col-xl-2 d-flex align-items-stretch">
								<a href="<%=request.getContextPath()%>/mobile/signup" 
									class="card bg-success text-white w-100 card-hover">
									<div class="card-body">
										<div class="d-flex align-items-center">
											<span class="fas fa-user-plus display-6 fw-bold"></span>
											<div class="ms-auto">
												<i data-feather="arrow-right" class="fill-white"></i>
											</div>
										</div>
										<div class="mt-4">
											<h4 class="card-title mb-1 text-white">New User</h4>
											<h6 class="card-text fw-normal text-white-50">Click here to register.</h6>
										</div>
									</div>
								</a>
							</div> --%>
									<!-- <div class="col-md-4 col-xl-2 d-flex align-items-stretch">
								<div id="openForm"
									class="card bg-warning text-white w-100 card-hover">
									<div class="card-body">
										<div class="d-flex align-items-center">
											<span class="fas fa-id-card-alt display-6 fw-bold"></span>
											<div class="ms-auto">
												<i data-feather="arrow-right" class="fill-white"></i>
											</div>
										</div>
										<div class="mt-4">
											<h4 class="card-title mb-1 text-white">Existing User</h4>
											<h6 class="card-text fw-normal text-white-50">Click here to login.</h6>
										</div>
									</div>
								</div>
							</div> -->

									<div class="card card-body"
										style="border-radius: 20px; box-shadow: 2px 2px 2px #c7c4d7; background: #F3F1F0;">
										<h4 class="text-dark fw-bold">Are you a new user?</h4>
										<p>You can register yourself in less than 100 seconds</p>
										<div class="text-center">
											<a href="<%=request.getContextPath()%>/mobile/signup"
												class="btn btn-rounded btn-danger">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;REGISTER&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
										</div>
									</div>

									<div class="card card-body"
										style="border-radius: 20px; box-shadow: 2px 2px 2px #c7c4d7; background: #E5F2F0;">
										
										<h4 class="text-dark fw-bold">Are you a returning user?</h4>
										<p>Login and make your life easy</p>
										<div class="text-center">	
											<button id="openForm" class="btn btn-rounded btn-dark btn-wide">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;LOGIN&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
										</div>
									</div>

								</div>
								<div class="card" id="loginform" style="display: none;">
									<div class="text-center">
										<h1
											style="line-height: 60px; font-weight: 700; color: black; font-size: 44px;">SIGNIN</h1>
										<%-- <img src="<%=request.getContextPath() %>/assets/img/favicon.jpeg" /> --%>
									</div>
									<div class="card-body">
										<p>
											Not registered yet? <a
												href="<%=request.getContextPath()%>/mobile/signup">Register</a>
											now.
											<c:if test="${success eq true }">
												<p class="alert alert-success">
													<i class="fa fa-check-circle"></i>&nbsp;Registered
													successfully, Login.
												</p>
											</c:if>
											<c:if test="${success eq false }">
												<p class="alert alert-danger">
													<i class="fas fa-exclamation-triangle"></i>&nbsp;Registration
													failed, Try again.
												</p>
											</c:if>

											<c:if test="${param.invalidsession eq true }">
												<div
													class="toast mb-2 d-flex
                        								align-items-center text-white bg-dark border-0">
													<div class="toast-body">
														<p>Session Expired!/Login Required.</p>
														<p>Please login below</p>
													</div>
												</div>
											</c:if>
											<c:if test="${AuthError != null}">
												<div class="alert alert-warning">${AuthError }</div>
											</c:if>
											<form method="POST" action="<%=request.getContextPath() %>/validateUserLogin"
												modelAttribute="user" autocomplete="off" id="login-form">
												<div class="row">
													<div class="col-md-12 mb-3">
														<div class="form-group mb-3">
															<label style="color: #000;">Username/Mobile </label> <input
																type="text"
																class="form-control form-control-lg border border-dark"
																placeholder="" required name="username" id="username" />
														</div>
													</div>
													<div class="col-md-12 mb-3">
														<div class="form-group mb-3">
															<label style="color: #000;">Password</label> <input
																name="password" id="password" placeholder="" required
																type="password"
																class="form-control form-control-lg border border-dark" />
														</div>
													</div>
													<div class="mb-3 row">
														<div class="col-md-6 col-6">
															<div class="form-check mr-sm-2">
																<input type="checkbox" class="form-check-input"
																	id="checkbox2" value="check" onclick="myFunction()" />
																<label class="form-check-label" for="checkbox2">Show
																	Password</label>
															</div>
														</div>
														<div class="col-md-6 col-6">
															<div class="form-group mb-3 pull-right"
																style="float: right;">
																<a href="<%=request.getContextPath()%>/mobile/forgot"
																	style="color: RED;">Forgot password?</a>
															</div>
														</div>
													</div>
													<input type="hidden" name="next" value="${param.next }">
													<div class="divider row"></div>
													<div class="col-md-12 text-center">
														<button class="btn btn-dark btn-lg btn-wide" type="submit">&nbsp;&nbsp;LOGIN&nbsp;&nbsp;</button>
													</div>
												</div>
											</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- -------------------------------------------------------------- -->
					<!-- Login box.scss -->
					<!-- -------------------------------------------------------------- -->
				</div>
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
	<c:if test="${param.sessionUser != null }">
		<script>
			$('document').ready(function() {
				localStorage.resident = ${User.username};
			});
		</script>
	</c:if>
	<script>
		$('document').ready(function(){
			if(localStorage.resident != null) {
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/restoreUserSession/"+localStorage.resident+"",
					data : {'next': '${session}'},
					mimeType: "multipart/form-data",
					//contentType: "text/json; charset=utf-8",
					//dataType: "json",
					timeout : 100000,
					beforeSend:function(){
						$("#bodyShow").empty();
						$("#bodyShow").addClass('loader');
					},
					success : function(data) {
						
						console.log("SUCCESS: ", data);
						
						if(data!=null){
							//alert("session");
							window.location.href = '${pageContext.request.contextPath}/mobile';
						}
					},
					error : function(e) {
						console.log("ERROR: ", e);
					},
					done : function(e) {
						console.log("DONE");						
					}
				});
			}
		});
	</script>
	<script>
		function myFunction() {
			var x = document.getElementById("password");
			if (x.type === "password") {
				x.type = "text";
			} else {
				x.type = "password";
			}
		}
		$('document').ready(function() {
			$("#contact-form2").submit(function(event) {
				event.preventDefault();
				saveEnquiry();
			});
		});
		function saveEnquiry() {
			var formData = $("#contact-form2").serialize();
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/resident/register",
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
						$('.sent-message').show();
						$('#contact-form2').hide();
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
	<c:if test="${success eq true }">
		<script>
			$('document').ready(function() {
				$('#hideOnClick').hide();
				$('#loginform').show();
			});
		</script>
	</c:if>
	<c:if test="${AuthError != null}">
		<script>
			$('document').ready(function() {
				$('#hideOnClick').hide();
				$('#loginform').show();
			});
		</script>
	</c:if>
	<script>
		$('document').ready(function() {
			$('#openForm').click(function() {
				$('#hideOnClick').hide();
				$('#loginform').show();
			});
			//$('.sidebartoggler').toggle();
		});
		$(function() {
			"use strict";
			$("#main-wrapper").AdminSettings({
				LogoBg : "skin6",
				HeaderPosition : true,
				Theme : false,
			});
		});
	</script>
</body>
</html>