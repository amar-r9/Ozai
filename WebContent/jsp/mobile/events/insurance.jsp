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
      content="Loan, Loan application, easy loan, tikaana" />
    <meta
      name="description"
      content="Please fill out the details below to apply."
    />
    <meta name="robots" content="noindex,nofollow" />
    <title>Insurance | Ozai</title>
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
    <link
      href="<%=request.getContextPath() %>/new/assets/extra-libs/toastr/dist/build/toastr.min.css"
      rel="stylesheet" />
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
      <jsp:include page="/common/mobileheader.jsp"></jsp:include>
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
          <!-- basic table -->
          <div class="card" style="display: none;" id="successScreen">
			<div class="card-img">
				<img class ="img-fluid" src="<%=request.getContextPath() %>/assets/img/success.gif">
			</div>
			<div class="card-title text-center">
				<p>Submitted, We will get back to you shortly with a quote.</p>
			</div>
			<button class="btns">Thank you.</button>
		  </div>
          <div class="row" id="formScreen">
            <div class="col-12">
              <div class="card" style="padding: 5vh 2vh; width: 100%;">
                <div class="card-body" style="padding: 0;">
                	<ul
                      class="nav nav-pills justify-content-end"
                      role="tablist">
                      <li class="nav-item">
                    	<a class="nav-link active" data-bs-toggle="tab" href="#personal" role="tab">
                          <span>Personal</span>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="tab" href="#vehicle" role="tab">
                          <span>Vehicle</span>
                        </a>
                      </li>
                    </ul><br>
                    <div class="tab-content border mt-2">                      
	                    <div class="tab-pane active p-3" id="personal" role="tabpanel">
		                	<h4 class="text-dark fw-bold mb-0">Personal Insurance</h4>
		                  	<small class="text-muted">Please fill out the details below.</small><br>
	                    	<div class="mt-3 d-flex align-items-stretch">
								<form action="#" method="post" role="form"
									id="personal-form" class="php-email-form">
									<div class="row">										
										<div class="col-md-6">
		                         			<div class="mb-3">
		                         				<label>Insurance type</label>
												<select name="type" id="type" required
													class="form-control form-control-lg form-control-a">
													<option>Choose</option>
													<option value="Health">Health Insurance</option>
													<option value="Life">Life Insurance</option>	
												</select>													
												<div class="validate"></div>
											</div>
										</div>
										<div class="col-md-6">
		                         			<div class="mb-3">
		                         				<label>Your age</label>
												<input type="text" name="age" id="age" required
													class="form-control form-control-lg form-control-a" />
												<div class="validate"></div>
											</div>
										</div>
										<input type="hidden" name="user_id" id="user_id" value="${User.id }" />
										
										<div class="form-actions text-center">
					                      <div class="card-body border-top">
					                        <button
					                          type="submit" id="send"
					                          class="btn btn-dark rounded-pill px-4">
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
							</div>
	                    </div>
                    
	                    <div class="tab-pane p-3" id="vehicle" role="tabpanel">
		                	<h4 class="text-dark fw-bold mb-0">Vehicle Insurance</h4>
		                  	<small class="text-muted">Please fill out the details below.</small><br>
	                    	<div class="mt-3 d-flex align-items-stretch">
								<form action="#" method="post" role="form"
									id="vehicle-form" class="php-email-form">
									<div class="row">
										
										<div class="col-md-6">
		                         			<div class="mb-3">
		                         				<label>Vehicle type</label>
												<select name="type" id="type" required
													class="form-control form-control-lg form-control-a">
													<option>Choose</option>
													<option value="2-Wheeler">2-Wheeler</option>
													<option value="4-Wheeler">4-Wheeler</option>	
												</select>													
												<div class="validate"></div>
											</div>
										</div>
										<div class="col-md-6">
		                         			<div class="mb-3">
		                         				<label>Vehicle brand</label>
												<input type="text" name="brand" id="brand" required
													class="form-control form-control-lg form-control-a" />
												<div class="validate"></div>
											</div>
										</div>
										<div class="col-md-6">
		                         			<div class="mb-3">
		                         				<label>Purchase year</label>
												<input type="text" name="year" id="year" required
													class="form-control form-control-lg form-control-a" />
												<div class="validate"></div>
											</div>
										</div>
										<div class="col-md-6">
		                         			<div class="mb-3">
		                         				<label>Insurance end date</label>
												<input type="date" name="end_date" id="end_date" required
													class="form-control form-control-lg form-control-a" />
												<div class="validate"></div>
											</div>
										</div>
										<input type="hidden" name="user_id" id="user_id" value="${User.id }" />
										
										<div class="form-actions text-center">
					                      <div class="card-body border-top">
					                        <button
					                          type="submit" id="send"
					                          class="btn btn-dark rounded-pill px-4">
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
							</div>
	                    </div>
	                   </div>
                  <div class="row mt-4">     	
							
                   	
					<div class="col-md-12 mb-3"><br>
						<div class="col-md-4 col-xl-2 
							d-flex align-items-stretch" id="success-list" style="display: none !important;">
							<a href="#"
			                	class="card bg-success text-white w-100 card-hover">
								<div class="card-body">
									<div class="d-flex align-items-center">
				                    	Submitted successfully.
				                    <div class="ms-auto">
				                      <i data-feather="arrow-right" class="fill-white"></i>
				                    </div>
				                  </div>
								</div>
							</a>
						</div>
						<button type="button" class=" btn btn-lg px-4
	                        fs-4 btn-light-primary text-primary font-weight-medium"
	                      id="success-alert" style="display: none;">
	                      slideDown - slideUp
	                    </button>
	                    <button type="button" class=" btn btn-lg px-4
	                        fs-4 btn-light-primary text-primary font-weight-medium"
	                      id="empty-alert" style="display: none;">
	                      slideDown - slideUp
	                    </button>
	                    <button type="button" class=" btn btn-lg px-4
	                        fs-4 btn-light-primary text-primary font-weight-medium"
	                      id="error-alert" style="display: none;">
	                      slideDown - slideUp
	                    </button>
					</div>
						
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
        
        <!-- footer -->
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
    <script src="<%=request.getContextPath() %>/new/assets/extra-libs/toastr/dist/build/toastr.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/assets/extra-libs/toastr/toastr-init.js"></script>
	<script>
	$('document').ready(function(){
		$("#success-alert").on("click", function () {
		    toastr.success(
		      "Message sent",
		      { showMethod: "slideDown", hideMethod: "slideUp", timeOut: 2000 }
		    );
		  });
		$("#error-alert").on("click", function () {
		    toastr.error(
		      "Error, Please try again later.",
		      { showMethod: "slideDown", hideMethod: "slideUp", timeOut: 2000 }
		    );
		  });
		$("#empty-alert").on("click", function () {
		    toastr.warning(
		      "Please fill in all the details.",
		      { showMethod: "slideDown", hideMethod: "slideUp", timeOut: 2000 }
		    );
		  });
		$("#personal-form").submit(function(event) {
			event.preventDefault();
			savePersonal();
		});
		$("#vehicle-form").submit(function(event) {
			event.preventDefault();
			saveVehicle();
		});
	});	
	function savePersonal(){
		var formData=$("#personal-form").serialize();
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/mobile/savePersonalInsurance",
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
					$('#successScreen').show();
					$('#formScreen').hide();
				}else
				if(data=='error'){
					$('#error-alert').click();
				} else if(data=='empty'){
					$('#empty-alert').click();
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
	function saveVehicle(){
		var formData=$("#vehicle-form").serialize();
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/mobile/savePersonalInsurance",
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
					$('#successScreen').show();
					$('#formScreen').hide();
				}else
				if(data=='error'){
					$('#error-alert').click();
				} else if(data=='empty'){
					$('#empty-alert').click();
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
    	$('document').ready(function(){
    		//$('.sidebartoggler').toggle();
    	});
      $(function () {
        "use strict";
        $("#main-wrapper").AdminSettings({
          LogoBg: "skin6",
		  HeaderPosition: true,
		  Theme: false,
        });
      });
    </script>
</body>

</html>