<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Showcase Talent | Tikaana</title>
<meta content="" name="description">
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
</head>

<body>

	<!-- ======= Property Search Section ======= -->
	<jsp:include page="/common/header.jsp"></jsp:include>
	<!-- End Header/Navbar -->

	<main id="main"> <!-- ======= Intro Single ======= -->
	<section class="intro-single">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-lg-8">
					<div class="title-single-box">
						<h1 class="title-single">Talent</h1>
					</div>
				</div>
				<%-- <div class="col-md-12 col-lg-4">
					<nav aria-label="breadcrumb"
						class="breadcrumb-box d-flex justify-content-lg-end">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="<%=request.getContextPath() %>/">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">
								Admin</li>
						</ol>
					</nav>
				</div> --%>
			</div>
		</div>
	</section>
	<!-- End Intro Single--> <!-- ======= Contact Single ======= -->
	<section class="contact">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 section-t8" style="padding-top: 0px;">
					<div class="row">
						<div class="col-md-8">
							<c:choose>
								<c:when test="${success eq true }">
									<div class="alert alert-success">
										<h6>Talent uploaded successfully.</h6>
									</div>
								</c:when>
								<c:otherwise>
									<div class="alert alert-danger">
										<h6>Talent upload failed, Try again.</h6>
									</div>
								</c:otherwise>
							</c:choose>
							<form action="<%=request.getContextPath()%>/submit-talent"
								id="talent-form" method="post" modelAttribute="talent" enctype="multipart/form-data">
								<div class="row">
									<div class="col-md-6 mb-3">
										<div class="form-group">
											<input type="text" name="name" id="name" required
												class="form-control form-control-lg form-control-a"
												placeholder="Enter Name" data-rule="minlen:4"
												data-msg="Please enter your least 4 chars">
											<div class="validate"></div>
										</div>
									</div>
									
									<div class="col-md-6 mb-3">
										<div class="form-group">
											 <select name="organisation" id="organisation" required
												class="form-control form-control-lg form-control-a">
												<option value="">Select Organisation</option>
												<option value="SIS">SIS</option>
												<option value="KIMS">KIMS</option>
												<option value="Sodexo">SODEXO</option>
												<option value="Compass">COMPASS</option>
												<option value="Kapston">KAPSTON</option>
												<option value="Raxa">RAXA</option>
												<option value="Sunshine">SUNSHINE</option>
												<option value="Terrier">Terrier</option>
												<option value="Medicover">Medicover</option>
												<option value="Radient">Radient</option>
												<option value="DTSS">DTSS</option>
												<option value="Citizens">Citizens</option>
											</select>
											<div class="validate"></div>
										</div>
									</div>
									
									
									
									<div class="col-md-6 mb-3">
										<div class="form-group">
											<input type="text" name="mobile" id="mobile" required
												class="form-control form-control-lg form-control-a"
												placeholder="Enter Mobile Number" data-rule="minlen:10"
												data-msg="Please enter valid mobile number">
											<div class="validate"></div>
										</div>
									</div>
									<div class="col-md-12">
										<div class="form-group">
											<textarea name="summary" class="form-control" name="summary"
												cols="45" rows="8"
												data-msg="Please write something(Optional)"
												placeholder="Summary"></textarea>
											<div class="validate"></div>
										</div>
									</div>
									<div class="col-md-6 mb-3">
										<div class="form-group">
											<div class="position-relative form-group">
												<label for="exampleFile" class="">Select Your Video Attachment</label>
												<input name="talent_file" id="talent_file" type="file" class="form-control-file" onchange="readURL(this)" />
		                                        <!-- <small class="form-text text-muted">This is some placeholder block-level help text for the above input. It's a bit lighter and easily wraps to a new line.</small> -->
		                                    </div>
		                           		</div>
	                               </div>
									
									<!-- <div class="col-md-12 mb-3">
										<div class="mb-3">
											<div class="loading">Loading</div>
											<div class="sent-message">Invoice has been saved.
												Thank you!</div>
										</div>
									</div> -->

									<div class="col-md-12 text-center">
										<button type="submit" class="btn btn-a" id="send">Submit</button>
									</div>
								</div>
							</form>
						</div>
						<div class="col-md-4">
							<br>
							<a href="<%=request.getContextPath() %>/talent/entries"
								class="btn btn-info btn-block">VIEW ENTRIES</a>
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
	<script
		src="<%=request.getContextPath()%>/assets/jquery.inputlimiter.1.3.1.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/jquery.autosize.js"></script>
	<script	
		src="<%=request.getContextPath()%>/assets/jquery.validate.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/additional-methods.js"></script>
	<script type="text/javascript">
		
		function readURL(input) {

			var image=input;
			var image_obj = $('#talent_file');
			
			if((image.files[0].size / 1024).toFixed(0) > 50*1024) {
				
				alert("Attachment must be less or equal to 50MB");
				image_obj.replaceWith(image_obj.val('').clone(true));
				return;
			}
		}
		
		$('document').ready(function() {
			
			$('textarea[class*=autosize]').autosize({
				append : "\n"
			});

			$('textarea.limited').inputlimiter({
				remText : '%n character%s remaining...',
				limitText : 'max allowed : %n.'
			});

			jQuery.validator.addMethod("checkForInvalidData", function(value, element) {
				value = value.replace(/\s+/g,"_");
				return !/(\S)(\1{2,})/g.test(value);
			}, "Invalid summary");
			
			$('#summary').val($.trim($('#summary').val()));
			
			$('#talent-form').validate({
				errorElement : 'div',
				errorClass : 'error-msg',
				focusInvalid : true,
				rules : {
					summary :{
						checkForInvalidData:true
					},
					talent_file :{
						required:true,
						accept:"video/*"
					} 
				},
				messages : {
					talent_file : {
						required:"Please choose your file.",
						accept:"Please select a valid file"
					}
				},
				submitHandler : function(form) {
					$('#submitProcess').show();
					$('#talent-form button[type=submit]').prop("disabled", "disabled");		
					form.submit();
				}
			});
		});
	</script>
</body>

</html>