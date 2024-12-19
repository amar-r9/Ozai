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
    <title>Ozai Admin Dashboard for tenants details, paymeent updates</title>
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
            <div class="col-12 align-self-center">
              <h5 class="text-dark fw-bold">Edit Employ Details</h5>
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
          <!-- File export -->
          <div class="row">
            <div class="col-12">
              <!-- ---------------------
                            start File export
                        ---------------- -->
              <div class="card">
                
                <div class="card-body">
                	<c:if test="${AdminUser.access_level le 1 }">
	                	<div class="row">
	                		<form id="tenant-form" method="get" role="form">
			                  	<div class="row pt-3">
			                        <div class="col-md-6">
			                          <div class=" has-danger">
			                            <label class="control-label">Move out Date</label> 
										<input type="date" name="resign_date" id="resign_date" class="form-control" />
										
			                          </div>
										<input type="hidden" name="id" id="id" value="${employ.id }" />
			                        </div>
									<div class="col-md-6 form-actions">
				                      <div class="card-body">
										<button type="submit" id="send1" class="btn btn-success">Save</button>
									  </div>
									</div>
								</div>
								
							</form>
	                	</div>
                  		<div class="justify-content-end">
                  	
		                  	<form action="#" method="get" role="form"
								id="employ-form">
			                  	<div class="row pt-3">
			                        <div class="col-md-12">
			                          <div class="mb-3">
			                            <label class="control-label">First Name</label>  
										<input type="text" name="first_name" id="first_name" class="form-control" value="${employ.first_name }" />
			                          </div>
			                        </div>
			                        <!--/span-->
			                        <div class="col-md-12">
			                          <div class="mb-3 ">
			                            <label class="control-label">Last Name</label>
			                            <input type="text" name="last_name" id="last_name" class="form-control" value="${employ.last_name }" />
										
			                          </div>
			                        </div>
			                        <!--/span-->
			                        <div class="col-md-12">
			                          <div class="mb-3 ">
			                            <label class="control-label">Salary</label>
										<input type="text" name="salary" id="salary" class="form-control" value="${employ.salary }" />
										
		                          </div>
		                        </div>
		                        <div class="col-md-12">
		                          <div class="mb-3 ">
		                            <label class="control-label">Role</label>
									<input type="text" name="role" id="role" value="${employ.role }" class="form-control" />
		                          </div>
		                        </div>
		                        <!--/span-->
		                        <div class="col-md-12">
		                          <div class="mb-3 ">
		                            <label class="control-label">Mobile</label> 
									<input type="text" name="mobile" id="mobile" class="form-control" value="${employ.mobile }" />
									
		                          </div>
		                        </div>
		                        <!--/span-->
		                        <div class="col-md-12">
		                          <div class="mb-3 ">
		                            <label class="control-label">Email</label> 
									<input type="email" name="email" id="email" class="form-control" value="${employ.email }" />
		                          </div>
		                        </div>
		                        <!--/span-->
		                        <div class="col-md-12">
		                          <div class="mb-3 ">
		                            <label class="control-label">Joining Date</label>
		                            <input type="text" class="form-control disabled" value="${employ.join_date }" id="join_date" name="join_date" />
		                          </div>
		                        </div>
		                        <!--/span-->
		                        <div class="col-md-12">
		                          <div class="mb-3 ">
		                            <label class="control-label">PAN</label> 
									<input type="text" name="pan" id="pan" class="form-control" value="${employ.pan }" />
									
		                          </div>
		                        </div>
		                        <div class="col-md-12">
		                          <div class="mb-3">
		                            <label class="control-label">Account</label>  
									<input type="text" name="account" id="account" class="form-control" value="${employ.account }" />
		                          </div>
		                        </div>
		                        <!--/span-->
		                        <div class="col-md-12">
		                          <div class="mb-3 ">
		                            <label class="control-label">IFSC</label>
									<input type="text" name="ifsc" id="ifsc" class="form-control" value="${employ.ifsc }" />
									
		                          </div>
		                        </div>
		                        <!--/span-->
		                        <div class="col-md-12">
		                          <div class="mb-3 ">
		                            <label class="control-label">Identifier</label>
									<input type="text" name="identifier" id="identifier" class="form-control" value="${employ.identifier }" />
									
		                          </div>
		                        </div>
		                        <!--/span-->
		                        
		                        <div class="col-md-12">
		                          <div class="mb-3 ">
		                            <label class="control-label">Status</label>
									<select name="status" id="status" class="form-control"> 
										<option value="${employ.status }">${employ.status }</option>
										<option value="Active">Active</option>
										<option value="Resigned">Resigned</option>
									</select>
									
		                          </div>
		                        </div>
		                        <!--/span-->
		                        
		                        <%-- <div class="col-md-12" style="display: none;" id="resignShow">
		                          <div class=" ">
		                            <label class="control-label">Resign Date</label> 
									<input type="date" name="resign_date" id="resign_date" class="form-control" value="${employ.resign_date }" />
									
		                          </div>
		                        </div> --%>
		                        <!--/span-->
									<input type="hidden" name="id" id="id" value="${employ.id }" />
								</div>
								<div class="form-actions">
			                      <div class="card-body border-top">
									<button type="submit" id="send1" class="btn btn-success">Save</button>
								  </div>
								</div>
							</form>
                  		</div>
                  	</c:if>
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
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- footer -->
        <!-- ============================================================== -->
        <footer class="footer">All right reserved by Ozai Living Private Limited.</footer>
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
			$("#employ-form").submit(function(event) {
				event.preventDefault();
				updateEmploy();
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
          SidebarColor: "skin6", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
          SidebarPosition: false, // it can be true / false ( true means Fixed and false means absolute )
          HeaderPosition: false, // it can be true / false ( true means Fixed and false means absolute )
          BoxedLayout: false, // it can be true / false ( true means Boxed and false means Fluid )
        });
      });
    </script>
    <script>
    	
	    function moveoutTenant() {
			var formData = $("#tenant-form").serialize();
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/admin/employ/move-out",
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
						window.location.href = '${pageContext.request.contextPath}/admin/employ-module/list';
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
    
	    function updateEmploy() {
			var formData = $("#employ-form").serialize();
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/admin/employ/update-employ",
				data : formData,
				//contentType: "text/json; charset=utf-8",
				//dataType: "json",
				timeout : 100000,
				beforeSend : function() {
					$(".loading").show();
				},
				success : function(data) {
	
					console.log("SUCCESS: ", data);
	
					if (data == 'Paid') {
						$('#onSuccess').click();
					} else if (data == 'Due') {
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