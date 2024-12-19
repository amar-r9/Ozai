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
      content="Tikaana Admin Dashboard "
    />
    <meta name="robots" content="noindex,nofollow" />
    <title>Tikaana Admin Dashboard</title>
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
    <!-- This page plugin CSS -->
    <link
      href="<%=request.getContextPath() %>/new/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css"
      rel="stylesheet"
    />
    <!-- Custom CSS -->
    <link href="<%=request.getContextPath() %>/new/dist/css/style.min.css" rel="stylesheet" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
    	.mb-3 {
    		
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
      <jsp:include page="/common/adminheader.jsp"></jsp:include>
      <!-- ============================================================== -->
      <!-- End Topbar header -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Left Sidebar - style you can find in sidebar.scss  -->
      <!-- ============================================================== -->
      <jsp:include page="/common/adminsidebar.jsp"></jsp:include>
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
            <div class="col-5 align-self-center">
              <h4 class="page-title">Admin Role</h4>
            </div>
            <div class="col-7 align-self-center">
              <div class="d-flex align-items-center justify-content-end">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                      <a href="<%=request.getContextPath() %>/admin">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">
                      Admin Role
                    </li>
                  </ol>
                </nav>
              </div>
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
				<div class="col-12">
					<div class="row">
						<div class="col-md-9">
							<div class="card">
								<div class="card-body">
									<div class="card-header bg-info">
										<h4 class="card-title text-white">Edit Role</h4>
									</div>
					                <div class="card-body">
					                  <div class="justify-content-end">
					                  	<c:choose>
                							<c:when test="${AdminUser.access_level eq 1 }">
							                  	<form action="#" method="get" role="form"
													id="user-form">
								                  	<div class="row">
								                        <div class="col-md-6 col-6">
								                          <div class="mb-3">
								                            <label class="control-label">Name</label>  
															<input type="text" name="name" id="name" class="form-control" value="${user.name }" />
								                          </div>
								                        </div>
							                        	<!--/span-->
								                        <div class="col-md-6 col-6 mb-3">
															<div class="form-group">
																<label class="control-label">Role</label>
																<select name="access_level" id="access_level" required
																	class="form-control"
																	data-msg="Please select option">
																	<option value="">Select Role</option>
																	<option value="4">Manager</option>
																	<option value="3">Zonal Head</option>
																	<option value="2">State Head</option>
																	<option value="1">Head Office</option>
																</select>
																<div class="validate"></div>
																<p id="sharing-error" class="bg-light-danger text-danger"></p>
															</div>
														</div>
														<input type="hidden" name="id" id="id" value="${user.id }" />
														<input type="hidden" name="username" id="username" value="${user.username }" />
														<input type="hidden" name="password" id="password" value="${user.password }" />
														<input type="hidden" name="mobile" id="mobile" value="${user.mobile }" />
														<input type="hidden" name="email" id="email" value="${user.email }" />
														<input type="hidden" name="property" id="property" value="${user.property }" />
														<input type="hidden" name="active" id="active" value="${user.active }" />
													</div>
													<div class="form-actions">
								                      <div class="card-body border-top">
														<button type="submit" id="send" style="width: 100%;"
															class="btn btn-primary">UPDATE</button>
													  </div>
													</div>
												</form>
											</c:when>
											<c:otherwise>
												<div class="alert alert-warning">
													<h4>Only Head office can add/edit admin roles</h4>
												</div>
											</c:otherwise>
										</c:choose>
				                  	</div>
			                	</div>
				            </div>
              			</div>
            		</div>
		            <div class="col-lg-3 d-flex align-items-stretch">
						<div class="card w-100">
							<div class="d-flex border-bottom title-part-padding
		                    	align-items-center">
								<div>
									<h4 class="card-title mb-0">Links</h4>
								</div>
							</div>
							<div class="card-body">
								<h4 class="card-title">Roles & Privileges</h4>
								<div class="row gap-2">
									<div class="col-md-12">
										<a href="<%=request.getContextPath() %>/admin/roles/list"
											class="btn d-flex align-items-center
		                          				btn-info w-100 d-block font-weight-medium">
											User Roles List <span class="badge ms-auto bg-info"><i class="fa fa-list"></i></span>
										</a>
									</div>
									<div class="col-md-12">
										<a href="<%=request.getContextPath() %>/admin/roles/add"
											class="btn d-flex align-items-center
					                          btn-success w-100 d-block
					                          font-weight-medium">
											Add User Role <span class="badge ms-auto bg-success"><i class="fa fa-plus"></i></span>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
          		</div>
       	 	</div>
	        <button type="button" class="btn btn-light-success
	        	text-success font-weight-medium
	            btn-lg px-4 fs-4 font-weight-medium"
	            data-bs-toggle="modal" id="onSuccess" style="display: none;"
	            data-bs-target="#al-success-alert">
	           	Success Alert
	         </button>
	        <div
	            class="modal fade"
	            id="al-success-alert"
	            tabindex="-1"
	            aria-labelledby="vertical-center-modal"
	            aria-hidden="true"
	          >
	            <div class="modal-dialog modal-sm">
	              <div
	                class="
	                  modal-content modal-filled
	                  bg-light-success
	                  text-success
	                "
	              >
	                <div class="modal-body p-4">
	                  <div class="text-center text-success">
	                    <i
	                      data-feather="check-circle"
	                      class="fill-white feather-lg"
	                    ></i>
	                    <h4 class="mt-2 text-success">Thank You!</h4>
	                    <p class="mt-3 text-success-50">
	                      Details have been submitted.
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
                btn btn-light-warning
                text-warning
                font-weight-medium
                btn-lg
                px-4
                fs-4
                font-weight-medium
              " id="errorMsg"
              data-bs-toggle="modal" style="display: none;"
              data-bs-target="#al-warning-alert"
            >
              Warning Alert
            </button>

            <!-- Vertically centered modal -->
            <div
              class="modal fade"
              id="al-warning-alert"
              tabindex="-1"
              aria-labelledby="vertical-center-modal"
              aria-hidden="true"
            >
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
                      <h4 class="mt-2">Soory</h4>
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
              data-bs-toggle="modal" id="alreadyMsg"
              data-bs-target="#al-danger-alert1"
            >
              Danger Alert
            </button>

            <!-- Vertically centered modal -->
            <div
              class="modal fade"
              id="al-danger-alert1"
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
                        This payment details are already been updated.
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
        </div></div>
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- footer -->
        <!-- ============================================================== -->
        <footer class="footer">All right reserved by Pradeenav Tikaana Private Limited.</footer>
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
	<c:if test="${added eq 'true' }">
		<script>
	    	$('document').ready(function(){
	    		$('#onSuccess').click();
	    	});
	    </script>
    </c:if>
    <c:if test="${added eq false }">
	     <script>
	     	$('document').ready(function(){
	     		$('#errorMsg').click();
	     	});
	     </script>
    </c:if>
	<!-- Template Main JS File -->
	<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
	<script>
		$('document').ready(function(){
			$("#user-form").submit(function(event) {
				event.preventDefault();
				updateTenant();
			});
			$("#tenant-form").submit(function(event) {
				event.preventDefault();
				moveoutTenant();
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
    <script>
	    function updateTenant() {
			var formData = $("#user-form").serialize();
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/admin/roles/update-role",
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
						window.location.href = '${pageContext.request.contextPath}/admin/roles/list';
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
	    function moveoutTenant() {
			var formData = $("#tenant-form").serialize();
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/admin/b2b-tenant/move-out",
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
						window.location.href = '${pageContext.request.contextPath}/admin/residents/list';
					} else if (data == 'error') {
						$('#errorMsg').click();
					} 
					$("#send1").button('reset');
				},
				error : function(e) {
					console.log("ERROR: ", e);
					alert(e);
					$("#send1").button('reset');
				},
				done : function(e) {
					console.log("DONE");
					$("#send1").button('reset');
	
				}
			});
		}
	</script>
  </body>
</html>
