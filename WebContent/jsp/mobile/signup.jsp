<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta
      name="keywords"
      content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, nice admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, "
    />
    <meta
      name="description"
      content="Nice is powerful and clean admin dashboard template, inpired from Google's Material Design"
    />
    <meta name="robots" content="noindex,nofollow" />
    <title>SignUp | Ozai</title>
    <link
      rel="canonical"
      href="https://www.wrappixel.com/templates/niceadmin/"
    />
    <!-- Favicon icon -->
    <link
      rel="icon"
      type="image/png"
      sizes="16x16"
      href="<%=request.getContextPath() %>/new/assets/images/favicon.png"
    />
    <!-- Custom CSS -->
    <link href="<%=request.getContextPath() %>/new/dist/css/style.min.css" rel="stylesheet" />
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
      <div class="row auth-wrapper gx-0">
        <div class=" col-lg-8 col-xl-9
            d-flex align-items-center justify-content-center">
          	<div class="row justify-content-center w-100 mt-4 mt-lg-0">
            	<div class="col-lg-6 col-xl-3 col-md-7">
	        	
					<div class="card" id="loginform">
						<div class="text-center">
           					<h1 style="line-height: 60px; font-weight: 700; color: black; font-size: 44px;">SIGNUP</h1>
           				</div> 
						<div class="card-body">
							<p>Already registered? <a href="<%=request.getContextPath() %>/mobile/signin">Signin</a> here.
							<c:if test="${empty User }">
								<form action="<%=request.getContextPath() %>/doUserRegister" method="post" role="form"
									id="signup-form" class="php-email-form" modelAttribute="user">
									<small id="error-message" style="color: RED;"></small>
								
									<div class="is-valid mb-3">
										<label for="mobile">Mobile</label>
										<div class="input-group">
											<div class="input-group-prepend">
												<select class="form-control form-select form-control-a" id="countryCode" name="countryCode" required>
													<option value="">Select country</option>
													<option value="+1" data-length="10">USA (+1)</option>
													<option value="+44" data-length="10">UK (+44)</option>
													<option value="+91" data-length="10">India (+91)</option>
													<option value="+971" data-length="9">UAE/Dubai (+971)</option>
												</select>
											</div>
											<input type="text" class="form-control  form-control-a" id="mobile" name="mobile" required pattern="[0-9]*" required />
										</div>
										<p><small id="mobileError" style="color: RED;"></small></p>
										<small id="mobileExist" style="color: RED;">
											<span style="color: GREEN;">*Mobile number will be your username.</span>
										</small>
									</div>
									<div class="row">
										<div class="col-md-6 mb-3">
											<div class="form-group">
												<label for="register-form-repassword">Password</label>
												<input type="text" name="password" id="password" required
													class="form-control  form-control-a"
													minlength="3" nospace="true" />
												<div class="validate"></div>
											</div>
										</div>
										<div class="col-md-6 mb-3">
											<div class="form-group">
												<label for="register-form-repassword">Name</label>
												<input type="text" name="name" id="name" required
													class="form-control  form-control-a"
													placeholder="" minlength="4" nospace="true" />
												<div class="validate"></div>
											</div>
										</div>
										<div class="col-md-6 mb-3">
											<div class="form-group">
												<label for="register-form-repassword">Email</label>
												<input type="email" name="email" id="email" required
													class="form-control  form-control-a"
													placeholder="" minlength="4" />
												<div class="validate"></div>
											</div>
										</div>
										<div class="col-md-6 mb-3">
											<div class="form-group">
												<label for="register-form-repassword">Company</label>
												<select id="company" name="company" required 
													class="form-control  form-control-a">
													<option value="">Choose</option>
													<option value="AGF Solution">AGF Solution (Female)</option>
													<option value="Al Tayer">Al Tayer (Male)</option>
													<option value="Transguard">Transguard (Male)</option>
													<option value="Transfyard">Transfyard (Female)</option>
													<option value="Emirates Printing Press">Emirates Printing Press (Male/Female)</option>
													<option value="Dulsco LLC">Dulsco LLC (Male)</option>
													<option value="EFS Facility">EFS Facility (Female)</option>
													<option value="Khansaheb">Khansaheb (Male)</option>
													<option value="Dutco">Dutco (Male)</option>
													<option value="Farnek">Farnek (Male)</option>
													<option value="Enoc">Enoc ( Male & Female)</option>
													<option value="EFS">EFS (Male)</option>
													<option value="Sobha">Sobha (Sobha)</option>
													<option value="Berkeley">Berkeley (Male & Female)</option>
													<option value="Hotpack">Hotpack (Male)</option>
													<option value="Dulsco">Dulsco (Male)</option>
													<option value="Ejadah">Ejadah(Male & Female)</option>
													<option value="Drydocks World">Drydocks World (Male)</option>
													<option value="Transguard">Transguard (Male)</option>
													<option value="Dulsco">Dulsco (Male & Female)</option>
													<option value="Nuzul Accommodation">Nuzul Accommodation (Male)</option>																										
												</select>
											</div>
										</div>
										<div class="col-md-6 mb-3">
											<div class="form-group">
												<label for="register-form-repassword">Camp location</label>
												<input type="text" name="hometown" id="hometown" 
													class="form-control form-control-a"
													placeholder="Camp" minlength="3" />
												<div class="validate"></div>
											</div>
										</div>
	
										<div class="col-md-12 text-center">
											<button type="submit" class="btn btn-dark" id="send">SIGN UP</button>
										</div>
									</div>
								</form>
								<div class="spinner-border text-primary" role="status" id="loading-spinner" style="display: none;">
									<span class="sr-only">Loading...</span>
								</div>
							</c:if>
							<c:if test="${not empty User }">
								<div class="col-md-12 text-center">
									<a href="<%=request.getContextPath() %>/mobile" class="btn btn-a">Home</a>
								</div>
							</c:if>						
						</div>
					</div>
        		</div>
       		</div>
      	</div>
    </div>
</div>    
<!-- ============================================================== -->
<!-- All Jquery -->
<!-- ============================================================== -->
<script src="<%=request.getContextPath() %>/new/assets/libs/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="<%=request.getContextPath() %>/new/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!-- apps -->
<script src="<%=request.getContextPath() %>/new/dist/js/app.min.js"></script>
<script src="<%=request.getContextPath() %>/new/dist/js/app.init.js"></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script src="<%=request.getContextPath() %>/new/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/new/assets/libs/jquery-sparkline/jquery.sparkline.min.js"></script>
<!--Wave Effects -->
<script src="<%=request.getContextPath() %>/new/dist/js/waves.js"></script>
<!--Custom JavaScript -->
<script src="<%=request.getContextPath() %>/new/dist/js/feather.min.js"></script>
<script src="<%=request.getContextPath() %>/new/dist/js/custom.min.js"></script>
<script src="<%=request.getContextPath() %>/assets/country-state.js"></script>
<!-- This Page JS -->
<script src="<%=request.getContextPath() %>/new/assets/extra-libs/prism/prism.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script>
	$('document').ready(function(){		
		$('#password, #confirm_password').on('input', function () {
	        validatePasswordMatch(); // Validate password and confirm password match
	    });

		function validatePasswordMatch() {
	        var password = $('#password').val();
	        var confirmPassword = $('#confirm_password').val();

	        if (password != confirmPassword) {
	            $('#send').prop('disabled', true);
	            $('#passwordError').text('Passwords do not match').show();
	        } else {
	            $('#passwordError').text('');
	            $('#send').prop('disabled', false);
	        }
	    }
		//populateCountries("country", "state");
		//$('#country option:contains("India")').prop('selected',true);
		//populateStates("country", "state");
	});
</script>
<script>
	$(document).ready(function () {
	    $('#countryCode').change(function () {
	        validateMobileFormat(); // Validate whenever the country code changes
	    });

	    // Listen for input in the mobile number field
	    $('#mobile').on('input', function () {
	        validateMobileFormat(); // Validate as the user types
	    });

		function validateMobileFormat() {
			var mobileNumber = $('#mobile').val();
			var errorMessage = '';

			// Regular expression to check for invalid characters
			var regex = /^[0-9]*$/;

			if (mobileNumber.length > 0 && !regex.test(mobileNumber)) {
				$('#send').prop('disabled',true);
				errorMessage = 'Mobile number should not contain alphabets, spaces, or special characters.';
				$('#mobileError').text(errorMessage).show();
			} else {
				validateMobileLength();
			}
		}

	    function validateMobileLength() {
	        // Get the selected country's required number length
	        var requiredLength = $('#countryCode option:selected').data('length');
	        var mobile = $('#mobile').val();
	        // Validate the length of the mobile number
	        if (mobile.length != requiredLength) {
				$('#send').prop('disabled',true);
	            $('#mobileError').text('Mobile number must be exactly '+requiredLength+' digits.');
	        } else {
	        	validateMobileNumber();
	        }
	    }
	    
	    function validateMobileNumber() {
	    	$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/mobile/CheckUserMobile",
				data : {"mobile" : $('#mobile').val()},
				timeout : 100000,
				beforeSend:function(){
					$('#send').prop('disabled',false);
				},
				success : function(data) {
					
					console.log("SUCCESS: ", data);
					
					if(data=='success'){
						$('#mobile').empty();
						$('#mobileError').html('');
						$('#mobileExist').html("Mobile number exist already");
						$('#send').prop('disabled',true);
					} else {
						$('#mobileError').html('');
						$('#mobileExist').html('');
						$('#send').prop('disabled',false);
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

	});
</script>
</body>
</html>