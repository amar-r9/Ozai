<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
      content="Tikaana Admin Dashboard"
    />
    <meta name="robots" content="noindex,nofollow" />
    <title>Register | Ozai Operator</title>
    <link
      rel="canonical"
      href="https://www.wrappixel.com/templates/niceadmin/"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="<%=request.getContextPath() %>/new/assets/libs/select2/dist/css/select2.min.css" />
    <!-- Favicon icon -->
    <link
      rel="icon"
      type="image/png"
      sizes="16x16"
      href="<%=request.getContextPath() %>/new/assets/images/favicon.png"
    />
    <!-- Custom CSS -->
    <link href="<%=request.getContextPath() %>/new/dist/css/style.min.css" rel="stylesheet" />
    
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

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
      <!-- Topbar header - style you can find in pages.scss -->
      <!-- ============================================================== -->
      <jsp:include page="/common/lctheader.jsp"></jsp:include>
      <!-- ============================================================== -->
      <!-- End Topbar header -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Left Sidebar - style you can find in sidebar.scss  -->
      <!-- ============================================================== -->
      <jsp:include page="/common/lctsidebar.jsp"></jsp:include>
      <!-- ============================================================== -->
      <!-- End Left Sidebar - style you can find in sidebar.scss  -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Page wrapper  -->
      <!-- ============================================================== -->
      <div class="page-wrapper">
        <!-- ============================================================== -->
        <!-- Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <div class="page-breadcrumb">
          <div class="row">
            <div class="col-5 col-md-5 col-12 col-sm-12 align-self-center">
              <h4 class="page-title">Register</h4>
            </div>
            
          </div>
        </div>
        <!-- ============================================================== -->
        <!-- End Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- Container fluid  -->
        <!-- ============================================================== -->
        <div class="container-fluid">
          <!-- -------------------------------------------------------------- -->
          <!-- Start Page Content -->
          <!-- -------------------------------------------------------------- -->
          <div class="row">
            <div class="col-9 col-md-9 col-12 col-sm-12">
              <div class="card">
                <div class="card-body">
                	<form action="#"
						id="admin-form" method="post" modelAttribute="client">
						<div class="row card-body col-md-12">
							<div class="col-12 mb-3">
								<div class="form-group">
									<label class="control-label">Name</label> 
									<input type="text" name="name" id="name" required
										class="form-control"
										placeholder="" data-rule="minlen:4"
										data-msg="Please enter your least 4 chars">
									<div class="validate"></div>
								</div>
							</div>
							<div class="col-12 mb-3">
								<div class="form-group">
									<label class="control-label">Mobile</label> 
									<input type="text" name="mobile" id="mobile" required
										class="form-control" />
									<p id="mobile-error" class="bg-danger text-white"></p>
									<div class="validate"></div>
								</div>
							</div>
							<div class="col-12 mb-3">
								<div class="form-group">
									<label class="control-label">Password</label>
									<input type="text" name="password" id="password" required
										class="form-control" />
									<div class="validate"></div>
								</div>
							</div>
							<div class="col-12 mb-3">
								<div class="form-group">
									<label class="control-label">Email</label>
									<input type="email" name="email" id="email" required
										class="form-control" />
									<div class="validate"></div>
								</div>
							</div>
							<div class="col-12 mb-3">
								<div class="form-group">
									<label class="control-label">Company</label>
									<input type="text" name="client" id="client" required
										class="form-control" />
									<div class="validate"></div>
								</div>
							</div>						
	
							<div class="col-md-12 text-center">
								<button type="submit" class="btn btn-info btn-lg btn-wide" id="send">Submit</button>
							</div>
						</div>
					</form>
                </div>
              </div>
            </div>  
            
          </div>
          <!-- -------------------------------------------------------------- -->
          <!-- End PAge Content -->
          <!-- -------------------------------------------------------------- -->
        </div>
        <button type="button" class="btn btn-light-success
        	text-success font-weight-medium
            btn-lg px-4 fs-4 font-weight-medium" style="display: none;"
            data-bs-toggle="modal" id="onSuccess" 
            data-bs-target="#al-success-alert">
           	Success Alert
         </button>
         
        <div
            class="modal fade"
            id="al-success-alert"
            tabindex="-1"
            aria-labelledby="vertical-center-modal"
            aria-hidden="true">
            <div class="modal-dialog modal-sm">
              <div class="modal-content modal-filled
                  bg-light-success text-success">
                <div class="modal-body p-4">
                  <div class="text-center text-success">
                    <i
                      data-feather="check-circle"
                      class="fill-white feather-lg"></i>
                    <h4 class="mt-2 text-success">Thank You!</h4>
                    <p class="mt-3 text-success-50">
                      Registration is successful.
                    </p>
                    <p>Check your mail to verify your email address and login.</p>
                    <a
                      href="<%=request.getContextPath() %>/lct"
                      class="btn btn-light my-2">Login
                    </a>
                  </div>
                </div>
              </div>
              <!-- /.modal-content -->
            </div>
          </div>
          
          <button type="button" class="btn btn-light-warning text-warning
              font-weight-medium btn-lg
              px-4 fs-4 font-weight-medium" id="errorMsg"
              data-bs-toggle="modal" style="display: none;"
              data-bs-target="#al-warning-alert">
             Warning Alert
           </button>

           <!-- Vertically centered modal -->
           <div class="modal fade" id="al-warning-alert"
             tabindex="-1" aria-labelledby="vertical-center-modal"
             aria-hidden="true">
                      <div class="modal-dialog modal-sm">
                        <div
                          class="modal-content modal-filled bg-light-warning"
                        >
                          <div class="modal-body p-4">
                            <div class="text-center text-warning">
                              <i
                                data-feather="alert-octagon"
                                class="fill-white feather-lg"
                              ></i>
                              <h4 class="mt-2">Sorry</h4>
                              <p class="mt-3">
                                Submission failed, Please try again later.
                              </p>
                              <button
                                type="button"
                                class="btn btn-light my-2"
                                data-bs-dismiss="modal"
                              >
                                Close
                              </button>
                            </div>
                          </div>
                        </div>
                        <!-- /.modal-content -->
                      </div>
                    </div>
                    
                    <button
                      type="button"
                      class="
                        btn btn-light-danger
                        text-danger
                        font-weight-medium
                        btn-lg
                        px-4
                        fs-4
                        font-weight-medium" style="display: none;"
                      data-bs-toggle="modal" id="emptyMsg"
                      data-bs-target="#al-danger-alert"
                    >
                      Danger Alert
                    </button>

                    <!-- Vertically centered modal -->
                    <div
                      class="modal fade"
                      id="al-danger-alert"
                      tabindex="-1"
                      aria-labelledby="vertical-center-modal"
                      aria-hidden="true"
                    >
                      <div class="modal-dialog modal-sm">
                        <div class="modal-content modal-filled bg-light-danger">
                          <div class="modal-body p-4">
                            <div class="text-center text-danger">
                              <i
                                data-feather="x-octagon"
                                class="fill-white feather-lg"
                              ></i>
                              <h4 class="mt-2">Oh snap!</h4>
                              <p class="mt-3">
                                Please fill in all the fields to submit.
                              </p>
                              <button
                                type="button"
                                class="btn btn-light my-2"
                                data-bs-dismiss="modal"
                              >
                                Close
                              </button>
                            </div>
                          </div>
                        </div>
                        <!-- /.modal-content -->
                      </div>
                    </div>
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- footer -->
        <!-- ============================================================== -->
        <footer class="footer text-center">
          All Rights Reserved by Ozai.
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
    
    <div class="chat-windows"></div>
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
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
    <!-- <script type="text/javascript" src="https://otpless.com/auth.js"></script> -->
    <!-- Get user's whatsapp number and name -->
	
    <script>
	    $(document).ready(function () {
	        $("#client").autocomplete({
	            source: ${clients}
	        });
	    });
    </script>
    <script>
	    
    	$("#admin-form").submit(function(event) {
			event.preventDefault();
			saveAdmin();
		});
    	function saveAdmin() {
			var formData = $("#admin-form").serialize();
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/registerLCTUser",
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
						$('#onSuccess').click();
					} else if (data == 'failed') {
						$('#errorMsg').click();
					} 
					$("#send").button('reset');
				},
				error : function(e) {
					console.log("ERROR: ", e);
					alert(e);
					$("#send").button('reset');
				},
				done : function(e) {
					console.log("DONE");
					$("#send").button('reset');
	
				}
			});
		}
    </script>
    <script type="text/javascript">
		
		$('document').ready(function() {
			
			$('#mobile').change(function() {
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/checkClientUserNameAction",
					data : {"username" : $('#mobile').val()},
					//contentType: "text/json; charset=utf-8",
		            //dataType: "json",
					timeout : 100000,
					beforeSend:function(){
						$(".loading").show();
					},
					success : function(data) {
						
						console.log("SUCCESS: ", data);
						
						if(data=='success'){
							$('#mobile').empty();
							$('#mobile-error').show();
							$('#mobile-error').html("Mobile number exist already");
							$("#send").hide();
						} else {
							$("#send").show();
							$('#mobile-error').hide();
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
			});
		});
	</script>
    <script>
    	$('document').ready(function(){
    		$('.sidebartoggler').toggle();
    	});
      $(function () {
        "use strict";
        $("#main-wrapper").AdminSettings({
          Theme: true, // this can be true or false ( true means dark and false means light ),
          Layout: "horizontal",
          LogoBg: "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
          NavbarBg: "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
          SidebarType: "overlay", // You can change it full / mini-sidebar / iconbar / overlay
          SidebarColor: "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
          SidebarPosition: false, // it can be true / false ( true means Fixed and false means absolute )
          HeaderPosition: false, // it can be true / false ( true means Fixed and false means absolute )
          BoxedLayout: false, // it can be true / false ( true means Boxed and false means Fluid )
        });
      });
    </script>
    <script type="text/javascript">
    	function otpless(otplessUser) {
       		var waName = otplessUser.waName;
       		var waNumber = otplessUser.waNumber;
       		// Signup/signin the user and redirect to next page
       		$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/registerLCTUserOTPLess",
				data : {name : waName, mobile : waNumber},
				//contentType: "text/json; charset=utf-8",
				//dataType: "json",
				timeout : 100000,
				beforeSend : function() {
					$("#send").hide();
				},
				success : function(data) {
	
					console.log("SUCCESS: ", data);
	
					if (data == 'success') {
						$('#onSuccess').click();
					} else if (data == 'failed') {
						$('#errorMsg').click();
					} 
					$("#send").button('reset');
				},
				error : function(e) {
					console.log("ERROR: ", e);
					alert(e);
					$("#send").button('reset');
				},
				done : function(e) {
					console.log("DONE");
					$("#send").button('reset');
	
				}
			});
      	}
    </script>
  </body>
</html>