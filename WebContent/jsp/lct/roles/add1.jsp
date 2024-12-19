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
    <title>Ozai Admin Dashboard</title>
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
      <div class="page-wrapper" style="margin-top: 50px;">
        <!-- ============================================================== -->
        <!-- Bread crumb and right sidebar toggle -->
        <!-- ============================================================== -->
        <a href="<%=request.getContextPath() %>/lct/roles/list" class="btn btn-warning btn-sm btn-rounded"
        	style="position: fixed; z-index: 10; top: 300px; right: 10px;
		    width: fit-content;"><i class="fa fa-list"></i> &nbsp;ADMIN LIST</a>
        <div class="page-breadcrumb">
          <div class="row">
            <div class="col-12 text-center">
              <h5 class="text-dark fw-bold">ADD ADMIN</h5>
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
              <div class="card">
                <div class="card-body">
                	<c:choose>
                		<c:when test="${ClientUser.access_level eq 1 }">
		                  	<form action="<%=request.getContextPath()%>/lct/registerClientUserRoleAction"
								id="tenant-form" method="post" modelAttribute="client">
								<div class="row">
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
											<label class="control-label">Username</label>
											<input type="text" name="username" id="username" required
												class="form-control"
												placeholder="" data-rule="minlen:4"
												data-msg="Please enter 4 digits minimum" minlength="4" maxlength="10">
											<div class="validate"></div>
											<p id="mobile-error" class="bg-danger"></p>
										</div>
									</div>
									<div class="col-12 mb-3">
										<div class="form-group">
											<label class="control-label">Mobile</label> 
											<input type="text" name="mobile" id="mobile" required
												class="form-control"
												placeholder="" data-rule="minlen:10"
												data-msg="Please enter your least 10 chars">
											<div class="validate"></div>
										</div>
									</div>
									<div class="col-12 mb-3">
										<div class="form-group">
											<label class="control-label">Email</label>
											<input type="email" name="email" id="email" required
												class="form-control">
											<div class="validate"></div>
											<p id="mobile-error" class="bg-danger"></p>
										</div>
									</div>
									<div class="col-12 mb-3">
										<div class="form-group">
											<label class="control-label">Property</label>
											<select class="form-control form-select"
			                    				style="width: 100%; height: 36px;"
								                data-placeholder="Choose a Property" name="property"
												id="select2-theme" required>
												<option value="">Property</option>
												<c:forEach items="${pgs }" var="pg">
													<option value="${pg.id }">${pg.name } | ${pg.location }</option>
												</c:forEach>
											</select>
											<div class="validate"></div>
										</div>
									</div>
									<div class="col-12 mb-3">
										<div class="form-group">
											<label class="control-label">Role</label>
											<select name="access_level" id="access_level" required
												class="form-control"
												data-msg="Please select option">
												<option value="">Select Role</option>
												<option value="4">Property Manager</option>
												<option value="3">Zonal Head</option>
												<option value="2">State Head</option>
												<option value="1">Head Office</option>
											</select>
											<div class="validate"></div>
											<p id="sharing-error" class="bg-light-danger text-danger"></p>
										</div>
									</div>
			
									<div class="col-md-12 text-center">
										<button type="submit" class="btn btn-info btn-lg btn-wide" id="send">SUBMIT</button>
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
                      Admin Role has been added.
                    </p>
                    <p>Username : ${username }</p>
                    <p>Password : ${password }</p>
                    <button
                      type="button"
                      class="btn btn-light my-2"
                      data-bs-dismiss="modal">
                      Close
                    </button>
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
          All Rights Reserved by Ozai Living Private Limited.
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
     <script src="<%=request.getContextPath() %>/new/assets/libs/select2/dist/js/select2.full.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/assets/libs/select2/dist/js/select2.min.js"></script>
    <script src="<%=request.getContextPath() %>/new/dist/js/pages/forms/select2/select2.init.js"></script>
    <c:if test="${success eq true }">
    	<script>
        	$('document').ready(function(){
        		$('#onSuccess').click();
        	});
        </script>
    </c:if>
    <c:if test="${success eq false }">
	     <script>
	     	$('document').ready(function(){
	     		$('#errorMsg').click();
	     	});
	     </script>
    </c:if>
    <script type="text/javascript">
		
		$('document').ready(function() {
			
			
			$('#username').change(function() {
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/lct/checkClientUserNameAction",
					data : {"username" : $('#username').val()},
					//contentType: "text/json; charset=utf-8",
		            //dataType: "json",
					timeout : 100000,
					beforeSend:function(){
						$(".loading").show();
					},
					success : function(data) {
						
						console.log("SUCCESS: ", data);
						
						if(data=='success'){
							$('#username').empty();
							$('#mobile-error').show();
							$('#mobile-error').html("Username not available");
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
  </body>
</html>