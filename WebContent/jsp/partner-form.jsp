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

<title>Partner with us | Tikaana</title>
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
<link rel="stylesheet" type="text/css"
      href="<%=request.getContextPath() %>/new/assets/libs/select2/dist/css/select2.min.css" />
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
						<h1 class="title-single">PARTNER WITH US</h1>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Intro Single--> <!-- ======= Contact Single ======= -->
	<section class="contact">
		<div class="container">
			<div class="row">
				<div class="col-sm-9 text-justify">
					<c:if test="${success eq true }">
						<div class="alert alert-success">
							<h4>Your details have been submitted.</h4>
							<h5>We will get back to you, Thank you.</h5>
						</div>
					</c:if>
					<form action="<%=request.getContextPath()%>/partner-with-us" method="post"
						id="partner-form" class="php-email-form" modelAttribute="partner" enctype="multipart/form-data">
	                  <div>
	                    <div class="card-body">
	                      <!-- <h4 class="card-title">Requirement Info</h4> -->
	                      <div class="row pt-3">
	                        <div class="col-md-6">
	                          <div class="mb-3">
	                            <label class="control-label">Name</label>
	                            <input
	                              type="text"
	                              id="name" name="name"
	                              class="form-control"
	                              placeholder="Enter Name"
	                             required />
	                            <!-- <small class="form-control-feedback">
	                              This is inline help
	                            </small> -->
	                          </div>
	                        </div>
	                        <div class="col-md-6">
	                          <div class="mb-3">
	                            <label class="control-label">Phone</label>
	                            <input
	                              type="text"
	                              id="phone" name="phone"
	                              class="form-control"
	                              placeholder="Enter Mobile number"
	                             required />
	                            <!-- <small class="form-control-feedback">
	                              This is inline help
	                            </small> -->
	                          </div>
	                        </div>
	                        <div class="col-md-6">
	                          <div class="mb-3">
	                            <label class="control-label">Email</label>
	                            <input
	                              type="text"
	                              id="email" name="email"
	                              class="form-control"
	                              placeholder="Enter email"
	                             required />
	                            <!-- <small class="form-control-feedback">
	                              This is inline help
	                            </small> -->
	                          </div>
	                        </div>
	                        <div class="col-md-6">
	                          <div class="mb-3">
	                            <label class="control-label">Location</label>
	                            <input
	                              type="text"
	                              id="location" name="location"
	                              class="form-control"
	                              placeholder="Enter Location"
	                             required />
	                            <!-- <small class="form-control-feedback">
	                              This is inline help
	                            </small> -->
	                          </div>
	                        </div>
	                        <div class="col-md-6">
	                          <div class="mb-3">
	                            <label class="control-label">City</label>
	                            <input
	                              type="text"
	                              id="city" name="city"
	                              class="form-control"
	                              placeholder="Enter City"
	                             required />
	                            <!-- <small class="form-control-feedback">
	                              This is inline help
	                            </small> -->
	                          </div>
	                        </div>
	                        <div class="col-md-6">
	                          <div class="mb-3">
	                            <label class="control-label">Map location</label>
	                            <input
	                              type="text"
	                              id="map" name="map"
	                              class="form-control"
	                              placeholder="Enter Map Location"
	                             required />
	                            <!-- <small class="form-control-feedback">
	                              This is inline help
	                            </small> -->
	                          </div>
	                        </div>
	                        <!--/span-->
	                        <div class="col-md-6">
	                          <div class="mb-3 has-success">
	                            <label class="control-label">Property Type</label>
	                            <select class="form-control custom-select"
	                            	name="property_type" id="property_type" required>
	                              <option value="">Select below</option>
	                              <option value="Rooms">Room</option>
	                              <option value="Flats">Flats</option>
	                            </select>
	                            <small class="form-control-feedback">
	                              Select property type
	                            </small>
	                          </div>
	                        </div>
	                        <div class="col-md-6">
	                          <div class="mb-3 has-danger">
	                            <label class="control-label">No of units</label>
	                            <input
	                              type="text"
	                              id="no_of_units" name="no_of_units"
	                              class="form-control"
	                              placeholder="No of units"
	                             required />
	                            <!-- <small class="form-control-feedback">
	                              This field has error.
	                            </small> -->
	                          </div>
	                        </div>
	                        <!--/span-->
	                      </div>
	                      <!--/row-->
	                      <div class="row">
	                        
	                        <!--/span-->
	                        <div class="col-md-6">
	                          <div class="mb-3">
	                            <label class="control-label">Available from</label>
	                            <input type="date" name="available_from" id="available_from" class="form-control" required />
	                          </div>
	                        </div>
	                        <!--/span-->
	                      </div>
	                      <!--/row-->
	                      <div class="row">
	                      	<div class="col-md-12">
		                      	<label class="control-label">Amenities</label>
		                        <select class="select2 form-control" multiple="multiple"
		                        	style="height: 36px; width: 100%" name="amenities" id="amenities">
				                    <optgroup label="Select Amenities">
				                      <option value="">Select below</option>
				                      <option value="Lift">Lift</option>
				                      <option value="Parking">Parking</option>
				                      <option value="ACs">ACs</option>
				                      <option value="Beds">Beds</option>
				                      <option value="Wardrobes">Wardrobes</option>
				                      <option value="Sofa">Sofa</option>
				                    </optgroup>
				                  </select>
	                        	<!--/span-->
	                        	</div>
	                        
	                        <!--/span-->
	                      </div>
	                      <div class="row">
	                      	<div class="col-md-12">
		                      	<label class="control-label">Video file</label>
									<input name="video_file" id="video_file" type="file" 
										class="form-control-file" onchange="readURL(this)" />
	                                <small class="form-text text-muted">Upload a video of the property.</small>
	                          </div>
	                      </div><br>
	                      <div class="row">
	                      	<div class="col-md-6">
		                      	<label class="control-label">Photo 1</label>
									<input name="photo_1" id="photo_1" type="file" 
										class="form-control-file" onchange="readURL1(this)" />
	                                <small class="form-text text-muted">Upload photo 1 of the property.</small>
	                          </div>
	                          <div class="col-md-6">
		                      	<label class="control-label">Photo 2</label>
									<input name="photo_2" id="photo_2" type="file" 
										class="form-control-file" onchange="readURL2(this)" />
	                                <small class="form-text text-muted">Upload photo 2 of the property.</small>
	                          </div>
	                          <div class="col-md-6">
		                      	<label class="control-label">Photo 3</label>
									<input name="photo_3" id="photo_3" type="file" 
										class="form-control-file" onchange="readURL3(this)" />
	                                <small class="form-text text-muted">Upload photo 3 of the property.</small>
	                          </div>
	                          <div class="col-md-6">
		                      	<label class="control-label">Photo 4</label>
									<input name="photo_4" id="photo_4" type="file" 
										class="form-control-file" onchange="readURL4(this)" />
	                                <small class="form-text text-muted">Upload photo 4 of the property.</small>
	                          </div>
	                      </div>
	                    </div>
	                    
	                    <div class="form-actions">
	                      <div class="card-body border-top">
	                        <button
	                          type="submit" id="send"
	                          class="btn btn-success rounded-pill px-4">
	                          <div class="d-flex align-items-center">
	                            <i data-feather="save"
	                              class="feather-sm me-1 fill-icon"
	                            ></i>
	                            Save
	                          </div>
	                        </button>
	                        <button type="button" class="btn btn-danger rounded-pill
	                            px-4 ms-2 text-white">
	                          Cancel
	                        </button>
	                      </div>
	                    </div>
	                  </div>
	                </form>
	                <div class="col-md-12 mb-3">
						<div class="mb-3">
							<div class="loading" style="display: none;">Loading</div>
							<div class="sent-message" style="display: none;">Your message has been sent.
								Thank you!</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Contact Single--> </main>
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
    <!-- This Page JS -->
    <script src="<%=request.getContextPath() %>/new/assets/libs/select2/dist/js/select2.full.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/assets/libs/select2/dist/js/select2.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/dist/js/pages/forms/select2/select2.init.js"></script>
	<script>
		
		function readURL(input) {
	
			var image=input;
			var image_obj = $('#video_file');
			
			if((image.files[0].size / 1024).toFixed(0) > 50*1024) {
				
				alert("Attachment must be less or equal to 50MB");
				image_obj.replaceWith(image_obj.val('').clone(true));
				return;
			}
		}
		
		function readURL1(input) {
			
			var image=input;
			var image_obj = $('#photo_1');
			
			if((image.files[0].size / 1024).toFixed(0) > 20*1024) {
				
				alert("Attachment must be less or equal to 20MB");
				image_obj.replaceWith(image_obj.val('').clone(true));
				return;
			}
		}
		
		function readURL2(input) {
			
			var image=input;
			var image_obj = $('#photo_2');
			
			if((image.files[0].size / 1024).toFixed(0) > 20*1024) {
				
				alert("Attachment must be less or equal to 20MB");
				image_obj.replaceWith(image_obj.val('').clone(true));
				return;
			}
		}
		
		function readURL3(input) {
			
			var image=input;
			var image_obj = $('#photo_3');
			
			if((image.files[0].size / 1024).toFixed(0) > 20*1024) {
				
				alert("Attachment must be less or equal to 20MB");
				image_obj.replaceWith(image_obj.val('').clone(true));
				return;
			}
		}
		
		function readURL4(input) {
			
			var image=input;
			var image_obj = $('#photo_4');
			
			if((image.files[0].size / 1024).toFixed(0) > 20*1024) {
				
				alert("Attachment must be less or equal to 20MB");
				image_obj.replaceWith(image_obj.val('').clone(true));
				return;
			}
		}
		
		$('document').ready(function() {
			
			$('#partner-form').validate({
				errorElement : 'div',
				errorClass : 'error-msg',
				focusInvalid : true,
				rules : {
					video_file :{
						accept:"video/*"
					},
					photo_1 :{
						accept:"image/*"
					},
					photo_2 :{
						accept:"image/*"
					},
					photo_3 :{
						accept:"image/*"
					},
					photo_4 :{
						accept:"image/*"
					}
				},
				messages : {
				},
				submitHandler : function(form) {
					$('#submitProcess').show();
					$('#partner-form button[type=submit]').prop("disabled", "disabled");		
					form.submit();
				}
			});
		});
	
		/* $('document').ready(function(){
			$("#partner-form").submit(function(event) {
				event.preventDefault();
				addBeds();
			});
		}); */	
		/* function addBeds(){
			var formData=$("#partner-form").serialize();
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/partner-with-us",
				data : formData,
				contentType: "text/json; charset=utf-8",
	            dataType: "json",
				timeout : 100000,
				beforeSend:function(){
					$(".loading").show();
				},
				success : function(data) {
					
					console.log("SUCCESS: ", data);
					
					if(data=='success'){
						$(".loading").hide();
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
		} */
	</script>
</body>

</html>