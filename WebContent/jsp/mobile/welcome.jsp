<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta
      name="keywords"
      content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, nice admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, "
    />
    <meta
      name="description"
      content="Nice is powerful and clean admin dashboard template, inpired from Google's Material Design"
    />
    <meta name="robots" content="noindex,nofollow" />
    <title>Welcome | Tikaana</title>
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
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <jsp:include page="/common/preloader.jsp"></jsp:include>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Page wrapper  -->
      <!-- ============================================================== -->
      <div class="row auth-wrapper gx-0">
        	<div class="col-lg-8 col-xl-9
            d-flex align-items-center
            justify-content-center">
          <div class="row justify-content-center w-100 mt-4 mt-lg-0">
            <div class="col-lg-6 col-xl-3 col-md-7">
	        	
				<div class="card" id="loginform">
					<div class="text-center">
            				<h1 style="line-height: 60px; font-weight: 700; color: black; font-size: 44px;"></h1>
            				<%-- <img src="<%=request.getContextPath() %>/assets/img/favicon.jpeg" /> --%></div>
                <div class="card-body">        	
                	
                	<div class="alert alert-success" id="otpMsg">Please verify with your OTP.</div>
                	<div class="row gx-3">
			         	<div class="container">
						    <div class="row m-0">
						    	<form id="otp-verify">
									<input type="hidden" name="otp" id="otp" value="${otp }" />
									<div class="position-relative form-group">
										<label for="exampleEmail" class="">Enter OTP</label>
										<input name="verify" id="verify" placeholder="Enter OTP here..." 
											type="text" class="form-control">
										<input type="hidden" name="phone" id="phone" value="${phone }" />
									</div>
									<div class="col-md-12 text-center"><br>
										<a href="#" id="validate" class="btn btn-dark btn-lg">VERIFY</a>
									</div>
								</form>
								<div class="alert alert-success" id="verified" style="display: none;">Verified, Change your password.</div>
								<div class="alert alert-danger" id="notVerified" style="display: none;">Wrong input, Try again.</div>
								<form action="<%=request.getContextPath() %>/mobile/update-password"
									method="post" id="password-form" style="display: none;">
										<input type="hidden" name="mobile" id="mobile" value="${mobile }" />
									<div class="position-relative form-group">
										<label for="exampleEmail" class="">New Password</label>
										<input name="password" id="password" placeholder="New Password" 
										type="password" class="form-control" required>
									</div>
									<div class="col-md-12 text-center"><br>
										<button type="submit" id="passwordUpdate" class="btn btn-dark btn-lg">UPDATE</button>
									</div>
								</form>
						    </div>
						</div>
			          </div>
                </div>
              </div>
        	</div>
       	</div>
      </div>
      <!-- -------------------------------------------------------------- -->
      <!-- Login box.scss -->
      <!-- -------------------------------------------------------------- -->
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- footer -->
        <!-- ============================================================== -->
        <footer class="footer text-center">
          All Rights Reserved by Tikaana.
        </footer>
        <!-- ============================================================== -->
        <!-- End footer -->
        <!-- ============================================================== -->
      </div>
      <!-- ============================================================== -->
      <!-- End Page wrapper  -->
      <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- customizer Panel -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="<%=request.getContextPath() %>/new/assets/libs/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="<%=request.getContextPath() %>/new/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <!-- apps -->
    <script src="<%=request.getContextPath() %>/new/dist/js/app.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/dist/js/app.init.js"></script>
    <script src="<%=request.getContextPath() %>/new/dist/js/app-style-switcher.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="<%=request.getContextPath() %>/new/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/assets/libs/jquery-sparkline/jquery.sparkline.min.js"></script>
    <!--Wave Effects -->
    <script src="<%=request.getContextPath() %>/new/dist/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="<%=request.getContextPath() %>/new/dist/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="<%=request.getContextPath() %>/new/dist/js/feather.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/dist/js/custom.min.js"></script>
    <script>
       	$('document').ready(function() {
       		$('#validate').click(function() {
				if($('#verify').val()!=null){
					if($('#verify').val()==$('#otp').val()){
						$('#notVerified').hide();
						$("#verified").show();
						$("#password-form").show();
						$('#otp-verify').hide();
						$('#otpMsg').hide();
					} else {
						$('#otpMsg').show();
						$('#notVerified').show();
					}
				}
			});
       	});
	</script>
  </body>
</html>
