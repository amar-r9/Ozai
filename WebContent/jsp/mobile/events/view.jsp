<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Login | Tikaana</title>
<meta content="" name="descriptison">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="<%=request.getContextPath()%>/assets/img/favicon.jpeg"
	rel="icon">
<link
	href="<%=request.getContextPath()%>/assets/img/favicon.jpeg"
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

<!-- =======================================================
  * Template Name: EstateAgency - v2.1.0
  * Template URL: https://bootstrapmade.com/real-estate-agency-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  
<style>
	
.btn-sq-bg {
  padding-top: 3rem;
  padding-bottom: 2rem;
  min-width: 180px;
  min-height: 150px;
  font-size: 18px;
}
.btn-outline-primary {
	border-color: #007bff;
}

.btn-outline-sucess {
	border-color: #28a745;
}

.btn-outline-info {
	border-color: #17a2b8;
}
</style>
  
</head>

<body>

	<!-- ======= Property Search Section ======= -->
	<jsp:include page="/common/mobileheader.jsp"></jsp:include>
	<!-- End Header/Navbar -->

	<main id="main"> <!-- ======= Intro Single ======= -->
	<section class="intro-single" style="padding-bottom: 0px;">
		
	</section>
	<!-- End Intro Single--> <!-- ======= Contact Single ======= -->
	<section class="contact">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 section-t8" style="padding-top: 0px;">
					<div class="row">
						<div class="col-md-2"></div>
						<div class="col-md-6 alert ">
							<p>&nbsp;</p>
							<c:choose>
								<c:when test="${empty User}">
									<h2>Login</h2>
									<form:form method="POST" action="validateMobileLogin"
										modelAttribute="user" autocomplete="off" class="">
		                                <div class="row">
											<div class="col-md-12 mb-3">
												<div class="form-group">
		                                        	<div class="position-relative form-group">
		                                        		<label for="exampleEmail" class="">Username</label>
		                                        		<input name="username" id="username" placeholder="Username here..." type="text" class="form-control">
		                                        	</div>
		                                    	</div>
		                                    </div>
		                                    <div class="col-md-12 mb-3">
												<div class="form-group">
		                                        	<div class="position-relative form-group"><label for="examplePassword" class="">Password</label>
		                                        		<input name="password" id="password" placeholder="Password here..." type="password" class="form-control">
		                                        	</div>
		                                    	</div>
		                                	</div>
		                                	<input type="hidden" name="next" value="${param.next }">
		                                	<div class="divider row"></div>
			                                <div class="col-md-12 text-center">
												<button class="btn btn-primary btn-lg" type="submit">LOGIN</button>
			                                </div>
			                        	</div>
		                            </form:form>
                            	</c:when>
                            	<c:otherwise>
                            		<div class="row">
										<a href="<%=request.getContextPath() %>/user/details"
											class="btn btn-sq-bg btn-outline-info btn-block"><i class="fa fa-user fa-3x"></i><br/>Your Details</a>
										
									</div>
									<div class="row" style="text-align: center;">
										<div class="col-xs-6">
											<a href="<%=request.getContextPath() %>/events/list" class="btn btn-block btn-sq-bg btn-outline-info">
										        <i class="fa fa-list fa-2x"></i><br/>
										        Events 
										    </a>
										</div>
										<div class="col-xs-6">
											<a href="<%=request.getContextPath() %>/tickets/list"
												class="btn btn-sq-bg btn-outline-info btn-block"><i class="fa fa-flag fa-2x"></i><br/>Tickets</a>
										</div>
									</div>
									<div class="row">
										<a href="<%=request.getContextPath() %>/mobile/talent/upload"
											class="btn btn-sq-bg btn-outline-info btn-block"><i class="fa fa-globe fa-3x"></i><br/>&nbsp;&nbsp;Showcase Talent</a>
									</div>
                            	</c:otherwise>
                            </c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Contact Single--> 
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<!-- ======= Footer ======= -->
	<jsp:include page="/common/mobilefooter.jsp"></jsp:include>
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
	$('document').ready(function(){
		$("#converz-form").submit(function(event) {
			event.preventDefault();
			saveEnquiry();
		});
	});	

	function saveEnquiry(){
		var formData=$("#converz-form").serialize();
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/save-enquiry",
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
	<script>
		$('document').ready(function() {
			$('#converz').addClass("active");
		});
	</script>
</body>

</html>