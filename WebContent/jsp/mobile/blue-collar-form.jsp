<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
    <title>Dost | Tikaana</title>
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
    <!-- This page css -->
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
      <!-- Topbar header - style you can find in pages.scss -->
      <!-- ============================================================== -->
      
      <!-- ============================================================== -->
      <!-- End Topbar header -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Left Sidebar - style you can find in sidebar.scss  -->
      <!-- ============================================================== -->
      
      <!-- ============================================================== -->
      <!-- End Left Sidebar - style you can find in sidebar.scss  -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Page wrapper  -->
      <!-- ============================================================== -->
      <div class="page-wrapper" style="display: block;">
        <!-- ============================================================== -->
        <!-- Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <div class="page-breadcrumb">
          <div class="row">
            <div class="col-12 align-self-center">
              <h4 class="page-title">Blue Collar Housing</h4>
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
        	<br><br>
          <!-- -------------------------------------------------------------- -->
          <!-- Start Page Content -->
          <!-- -------------------------------------------------------------- -->
          <!-- basic table -->
			
        	 <div class="col-lg-4 col-xlg-3 col-md-5">
	        	 
					<div class="card">
	               		<div class="card-body">
							<form action="#" method="post" role="form"
								id="beds-form" class="php-email-form">
			                  <div>
			                    <div class="card-body">
			                      <h4 class="card-title">Requirement Info</h4>
			                      <div class="row pt-3">
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
			                        <!--/span-->
			                        <div class="col-md-6">
			                          <div class="mb-3 has-danger">
			                            <label class="control-label">Beds Needed</label>
			                            <input
			                              type="text"
			                              id="beds_needed" name="beds_needed"
			                              class="form-control"
			                              placeholder="No of beds"
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
			                        <div class="col-md-6">
			                          <div class="mb-3 has-success">
			                            <label class="control-label">Gender</label>
			                            <select class="form-control custom-select"
			                            	name="gender" id="gender" required>
			                              <option value="Male">Male</option>
			                              <option value="Female">Female</option>
			                            </select>
			                            <small class="form-control-feedback">
			                              Select gender
			                            </small>
			                          </div>
			                        </div>
			                        <!--/span-->
			                        <div class="col-md-6">
			                          <div class="mb-3">
			                            <label class="control-label">Date of Joining</label>
			                            <input type="date" name="joining_date" id="joining_date" class="form-control" required />
			                          </div>
			                        </div>
			                        <!--/span-->
			                      </div>
			                      <!--/row-->
			                      <div class="row">
			                        
			                        <!--/span-->
			                        <div class="col-md-6">
			                          <div class="mb-3 has-success">
			                            <label class="control-label">Food</label>
			                            <select class="form-control custom-select"
			                            	name="food" id="food" required>
			                              <option value="Yes">Yes</option>
			                              <option value="No">No</option>
			                            </select>
			                            <small class="form-control-feedback">
			                              Select food option
			                            </small>
			                          </div>
			                        </div>
			                        <!--/span-->
			                      </div>
			                    </div>
			                    <hr />
			                    <div class="card-body">
			                      <!--/row-->
			                      <h4 class="card-title mb-4">Contact Info</h4>
			                      
			                      <div class="row">
			                        <div class="col-md-6">
			                          <div class="mb-3">
			                            <label>Name</label>
			                            <input type="text" name="contact_name" id="contact_name" class="form-control" required />
			                          </div>
			                        </div>
			                        <div class="col-md-6">
			                          <div class="mb-3">
			                            <label>Company</label>
			                            <input type="text" name="company" id="company" class="form-control" required />
			                          </div>
			                        </div>
			                        <!--/span-->
			                        <div class="col-md-6">
			                          <div class="mb-3">
			                            <label>Mobile</label>
			                            <input type="text" name="contact_phone" id="contact_phone" class="form-control" required />
			                          </div>
			                        </div>
			                        <!--/span-->
			                        <div class="col-md-6">
			                          <div class="mb-3">
			                            <label>Email</label>
			                            <input type="text" name="contact_email" id="contact_email" class="form-control" required />
			                          </div>
			                        </div>
			                      </div>
			                      <!--/row-->
			                      
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
			                        
			                      </div>
			                    </div>
			                  </div>
			                </form>
			                <div class="col-md-12 mb-3">
								<div class="mb-3">
									<div class="loading" style="display: none;">Loading</div>
									<div class="alert alert-success" id="sent-message" style="display: none;">Your message has been sent.
										Thank you!</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        
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
    <script src="<%=request.getContextPath() %>/new/assets/extra-libs/taskboard/js/jquery.ui.touch-punch-improved.js"></script>
    <script src="<%=request.getContextPath() %>/new/assets/extra-libs/taskboard/js/jquery-ui.min.js"></script>
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
    <!--This page JavaScript -->
    <script src="<%=request.getContextPath() %>/new/dist/js/pages/notes/notes.js"></script>
	<script>
		$('document').ready(function(){
			$("#beds-form").submit(function(event) {
				event.preventDefault();
				addBeds();
			});
		});	
		function addBeds(){
			var formData=$("#beds-form").serialize();
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/add-beds",
				data : formData,
				//contentType: "text/json; charset=utf-8",
	            //dataType: "json",
				timeout : 100000,
				beforeSend:function(){
					$(".loading").show();
				},
				success : function(data) {
					
					console.log("SUCCESS: ", data);
					
					if(data=='success'){
						$(".loading").hide();
						$('#sent-message').show();
					}else
					if(data=='error'){
						$('#error-message').html('Please try again later!');
					} else if(data=='empty'){
						$('#error-message').html('Please fill all the fields');
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
</body>

</html>