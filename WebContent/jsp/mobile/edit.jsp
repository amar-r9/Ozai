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
      content="Nice is powerful and clean admin dashboard template, inpired from Google's Material Design"
    />
    <meta name="robots" content="noindex,nofollow" />
    <title>Edit Profile | Ozai</title>
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
<style>
	.form-control {
		border: none;
    	border-bottom: 1px solid;
    	border-radius: unset !important;
    	font-size: 0.8375rem !important;
    	padding: 0 !important;
	}
	.control-label {
		font-size: small;
		color: #afb5c1 !important;
	}
	
    #profilepic {
        width: 100px; /* Fixed width */
        height: 100px; /* Fixed height */
        object-fit: cover; /* Ensures the image covers the entire container without stretching */
        border-radius: 50%; /* Makes the image appear as a circle */
    }
	
	#photo {
        width: 180px; /* Adjust the width as needed */
    }
</style>
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
      <div class="card pt-2 ps-2" style="z-index: 100;
	    margin-bottom: 50px; position: fixed; width: 100%;
		border-radius: unset; box-shadow: none; background: teal;">
		<div class="row">
			<a class="col-4" onclick="history.back()">
			<i class="bi bi-arrow-left fa-2x text-white" style="vertical-align: bottom;"></i></a>
			<span class="col-8 mt-2"><span style="vertical-align: bottom; margin-top: 10px;
	    		font-size: 1.5rem; color: #fff;">Edit Profile</span></span>
	    </div>
	  </div>
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
      <div class="page-wrapper" style="background: #fff;">
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
          <div class="row">
            <div class="col-12">
              <div class="">
                <div class="">
                  <h5 class="text-dark fw-bold"></h5>
                  <!-- <div class="row mt-4">
                  		<div class="">
							<div class="card-body">
								<form
									action="<%=request.getContextPath()%>/mobile/user/update-profile-picture"
									id="imageForm" enctype="multipart/form-data" method="POST"
									autocomplete="off" class="text-center">
									<br><img alt="Profile Picture"
										src="<%=request.getContextPath()%>/resources/DisplayUserProfileImage"
										class="img-circle img-thumbnail" id="profilepic">
									<div class="space-24"></div><br>
								    <!-- Centered and spaced file input -->
								   <!-- <div class="d-flex justify-content-center mb-3">
								        <div class="custom-file">
								            <input class="form-control" type="file" name="photo" id="photo" accept="image/*" />
								        </div>
								    </div>
				                      <small class="form-text text-muted">Choose your profile picture </small>			                    
									<div class="form-floating mb-3">
										<button class="col-md-6 btn btn-dark btn-md"
											type="submit" disabled="disabled" id="photo-change">
											<i class="ace-icon fa fa-save"></i> Save
										</button>
									</div>
								</form>
							</div>
						</div>
					</div>-->
                  	
                  <div class="row mt-4">
                    <div class="col-12 d-flex align-items-stretch">
						<c:if test="${not empty user }">
					      <form action="#" method="post" role="form"
								id="user-form">
			                  	<div class="row">
			                        <div class="col-md-12 col-12">
			                          <div class="mb-3">
			                            <label class="control-label text-muted">Name</label>  
										<input type="text" name="name" id="name" class="form-control" value="${user.name }" />
			                          </div>
			                        </div>
									<div class="col-md-12 col-12">
			                          <div class="mb-3 ">
			                            <label class="control-label text-muted">Mobile</label> 
										<input type="text" name="mobile" id="mobile" required minlength="10" class="form-control" value="${user.mobile }" />
										
			                          </div>
			                        </div>
			                        <div class="col-md-12 col-12">
			                          <div class="mb-3 ">
			                            <label class="control-label text-muted">Email</label> 
										<input type="email" name="email" id="email" required minlength="10" class="form-control" value="${user.email }" />
										
			                          </div>
			                        </div>
									<c:choose>
										<c:when test="${not empty user.gender }">
											<input type="hidden" name="gender" id="gender" class="form-control" value="${user.gender }" />										
										</c:when>
										<c:otherwise>
											<div class="col-md-12 col-12">
					                          <div class="mb-3 ">
					                            <label class="control-label text-muted">Gender</label> 
												<select name="gender" id="gender" required class="form-control">
													<option value="">Select</option>
													<option value="Male">Male</option>
													<option value="Female">Female</option>
													<option value="Other">Other</option>
												</select>												
					                          </div>
					                        </div>
					                 	</c:otherwise>
									</c:choose>
			                        <input type="hidden" class="form-control disabled" value="${user.reg_date }" id="reg_date" name="reg_date" />
			                        
			                        <div class="col-md-12 col-12">
			                          <div class="mb-3">
			                            <label class="control-label text-muted">Password</label>  
										<input type="text" name="password" id="password" class="form-control" value="${user.password }" />
			                          </div>
			                        </div>
		                        	<!--/span-->
			                        <div class="col-md-12 col-12">
			                          <div class=" ">
			                            <label class="control-label text-muted">Date of Birth</label> 
										<input type="date" name="dob" id="dob" class="form-control" required value="${user.dob }" />										
			                          </div>
			                        </div>
			                        <!--/span-->
			                        <div class="col-md-12 col-12">
			                          <div class=" ">
			                            <label class="control-label text-muted">City</label> 
										<input type="text" name="city" id="city" class="form-control" required value="${user.city }" />										
			                          </div>
			                        </div>
			                        
			                        <div class="col-md-12 col-12">
			                          <div class=" ">
			                            <label class="control-label text-muted">Company</label> 
										<input type="text" name="company" id="company" class="form-control" required value="${user.company }" />										
			                          </div>
			                        </div>
			                        <div class="col-md-12 col-12">
			                          <div class=" ">
			                            <label class="control-label text-muted">Job Role</label> 
										<input type="text" name="job_role" id="job_role" class="form-control" required value="${user.job_role }" />										
			                          </div>
			                        </div>
			                        <div class="col-md-12 col-12">
			                          <div class=" ">
			                            <label class="control-label text-muted">Home town</label> 
										<input type="text" name="hometown" id="hometown" class="form-control" required value="${user.hometown }" />										
			                          </div>
			                        </div>
			                        <div class="col-md-12 col-12">
			                          <div class="form-group">
			                            <label class="control-label text-muted">Qualification</label> 
										<select name="qualification" id="qualification" class="form-control form-select" required>
											<option value="${user.qualification }">${user.qualification}</option>
											<option value="Post Graduation">Post Graduation</option>
											<option value="Graduation">Graduation</option>
											<option value="Other"></option>
										</select>										
			                          </div>
			                        </div>

									<div class="col-md-12 col-12">
										<label>Interests</label>
										<div class="row text-center">
											<div class="col-6">
												<input type="checkbox" class="btn-check" name="movies"
													id="movies" value="1" /> <label
													class="btn btn-outline-success d-block
						                        	mb-2 font-weight-medium rounded-pill"
													for="movies">Movies</label>
											</div>
											<div class="col-6">
												<input type="checkbox" class="btn-check" name="sports"
													id="sports" value="1" /> <label
													class="btn btn-outline-success d-block
						                        	mb-2 font-weight-medium rounded-pill"
													for="sports">Sports</label>
											</div>
											<div class="col-6">
												<input type="checkbox" class="btn-check" name="arts"
													id="arts" value="1" /> <label
													class="btn btn-outline-success d-block
						                        	mb-2 font-weight-medium rounded-pill"
													for="arts">Arts</label>
											</div>
											<div class="col-6">
												<input type="checkbox" class="btn-check" name="news"
													id="news" value="1" /> <label
													class="btn btn-outline-success d-block
						                        	mb-2 font-weight-medium rounded-pill"
													for="news">News</label>
											</div>
											<div class="col-6">
												<input type="checkbox" class="btn-check" name="technology"
													id="technology" value="1" /> <label
													class="btn btn-outline-success d-block
						                        	mb-2 font-weight-medium rounded-pill"
													for="technology">Technology</label>
											</div>
										</div>
									</div>

									<input type="hidden" name="id_file_name" id="id_file_name" value="${user.id_file_name }" />
									<input type="hidden" name="id" id="id" value="${user.id }" />
									<input type="hidden" name="login_count" id="login_count" value="${user.login_count }" />
									<input type="hidden" name="is_resident" id="is_resident" class="form-control" value="${user.is_resident }" />
									<input type="hidden" name="resident_type" id="resident_type" value="NA" />
									<input type="hidden" name="username" id="username" value="${user.username }" />
									<input type="hidden" name="country" id="country" value="${user.country }" />
									<input type="hidden" name="state" id="state" value="${user.state }" />
									<input type="hidden" name="points" id="points" value="${user.points }" />
								</div>
								<div class="form-actions">
			                      <div class="card-body border-top">
									<button type="submit" id="send" style="width: 100%;"
										class="btn btn-primary">UPDATE</button>
								  </div>
								</div>
							</form>
							<br><br>
						</c:if>	
					</div>
				</div><br><br>
			</div>
            </div>
            </div>
          </div>
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
			
			$("#user-form").submit(function(event) {
				event.preventDefault();
				updateTenant();
			});
			
			function readURL(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();

					reader.onload = function(e) {
						$('#profilepic').attr('src',
								e.target.result);
						$('#photo-change').attr('disabled',
								false);
					}

					reader.readAsDataURL(input.files[0]);
				}
			}

			$("#photo").change(function() {
				readURL(this);
			});
			
			$('#imageForm').validate({
				debug : true,
				errorElement : 'div',
				errorLabelContainer : '.error-div',
				focusInvalid : true,
				rules : {
					photo : {
						required : true,
						extension : "jpg,jpeg,png",
						filesize : 300 * 1024
					}

				},
				messages : {
					photo : {
						extension : "Please select a png,jpg or jpeg file only",
						filesize : "File size must be less than 300KB"
					}
				},
				submitHandler : function(form) {
					form.submit();
				}
			});
		});	
		
	</script>
	<script>
		$('document').ready(function(){
			$("#success-alert").on("click", function () {
			    toastr.success(
			      "Saved",
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
		});	
	</script>
	<script>
	    function updateTenant() {
			var formData = $("#user-form").serialize();
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/mobile/update-user",
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
						$('#success-alert').click();
						setTimeout( function(){
							window.location.href = '${pageContext.request.contextPath}/mobile/user/details';
						}  , 5000 );
					} else if (data == 'failed') {
						$('#error-alert').click();
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