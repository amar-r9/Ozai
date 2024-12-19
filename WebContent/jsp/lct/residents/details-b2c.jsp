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
    <title>Ozai Admin Dashboard for tenants details</title>
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
            <div class="col-5 col-ms-5 col-sm-12 col-12 align-self-center">
              <h4 class="page-title">User Details</h4>
            </div>
            <div class="col-7 align-self-center d-none d-lg-block">
              <div class="d-flex align-items-center justify-content-end">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                      <a href="<%=request.getContextPath() %>/lct">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">
                      User Details
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
          <!-- File export -->
          <div class="row">
            <div class="col-9 col-md-9 col-sm-12 col-12">
              <!-- ---------------------
                            start File export
                        ---------------- -->
              <div class="card">
                <div class="border-bottom title-part-padding">
                  <h4 class="card-title mb-0 text-success">User already registered</h4>
                  <small class="text-danger">Add him/her as resident.</small>
                </div>
                
                  <!-- Add Contact Popup Model -->
                  
                <div class="card-body">
                  <div class="justify-content-end">
                  	
                  	<c:choose>
                  		<c:when test="${userD.is_resident eq 'NO' }">
		                  	<form action="<%=request.getContextPath() %>/admin/addUserAsResidentAction" 
								id="tenant-form" method="post">
			                  	<div class="col-md-6 mb-3">
									<div class="form-group">
										<label class="control-label">Joining Date</label>
										<input type="date" name="joining_date" id="joining_date" 
											placeholder="" class="form-control" required />
									</div>
								</div>
								<div class="col-md-6 mb-3">
									<div class="form-group">
										<label class="control-label">Property</label>
										<select class="form-control form-select"
		                    				style="width: 100%; height: 36px;"
							                data-placeholder="Choose a Property" name="property_id"
											id="select2-theme" required>
											<option value="">Property</option>
											<c:forEach items="${pgs }" var="pg">
												<option value="${pg.id }">${pg.name } | ${pg.location } | ${pg.city }</option>
											</c:forEach>
										</select>
										<div class="validate"></div>
									</div>
								</div>
								<div class="col-md-6 mb-3">
							<div class="form-group">
								<label class="control-label">Room</label>
								<select name="room_id" id="room_id" required
									class="form-control"
									data-msg="Please select option">
								</select>
								<div class="validate"></div>
								<span class="text-danger" id="room_error"></span>
							</div>
						</div>
						<div class="col-md-6 mb-3">
							<div class="form-group">
								<label class="control-label">Bed</label>
								<select name="bed_id" id="bed_id" required
									class="form-control"
									data-msg="Please select option">
								</select>
								<div class="validate"></div>
							</div>
						</div>
								<input type="hidden" name="user_id" value="${userD.id }" />
								<div class="col-md-6 mb-3">
									<div class="form-group">
										<label class="control-label">Sharing</label>
										<select name="sharing" id="sharing" required
											class="form-control"
											data-msg="Please select option">
											<option value="">Select sharing option</option>
											<option value="1">Single</option>
											<option value="2">Double</option>
											<option value="3">Three</option>
											<option value="4">Four</option>
										</select>
										<div class="validate"></div>
										<p id="sharing-error" class="bg-light-danger text-danger"></p>
									</div>
								</div>
								<div class="col-md-6 mb-3">
									<div class="form-group">
										<label class="control-label">Rent</label>
										<input type="text" name="rent" id="rent" required
											class="form-control"
											placeholder="" data-rule="minlen:3"
											data-msg="Please enter your least 3 chars">
										<div class="validate"></div>
									</div>
								</div>
								<div class="form-actions">
			                      <div class="card-body border-top">
									<button type="submit" id="send" class="btn btn-success">SAVE</button>
								  </div>
								</div>
							</form>
						</c:when>
						<c:otherwise>
							<h4 class="text-dark fw-bold">User already added as resident.</h4>
							<div id="tenantInfo">
								<table class="table table-bordered">
									<tbody>
										<tr>
											<td><b>Name:</b> </td>
											<td>${userD.name }</td>
										</tr>
										<tr>
											<td><b>Mobile:</b> </td>
											<td>${userD.mobile }</td>
										</tr>
										<tr>
											<td><b>Email:</b> </td>
											<td>${userD.email }</td>
										</tr>
									</tbody>
								</table>
							</div>
						</c:otherwise>
					</c:choose>
					
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
        <footer class="footer">All right reserved by Ozai.</footer>
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

	

	<!-- Template Main JS File -->
	<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
	<script>
		$('document').ready(function(){
			
			$('#select2-theme').change(function() {
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/getRoomsList/"+$('#select2-theme').val()+"",
					timeout : 100000,
					beforeSend:function(){
						$(".loading").show();
					},
					success : function(data) {
						
						console.log("SUCCESS: ", data);
						
						if(data){
							$('#room_id').empty();
							$('#room_id').html(data);
						} else {
							$("#send").show();
						}
						
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
			
			$('#room_id').change(function() {
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/getBedsList/"+$('#room_id').val()+"",
					timeout : 100000,
					beforeSend:function(){
						$(".loading").show();
					},
					success : function(data) {
						
						console.log("SUCCESS: ", data);
						
						if(data=="No beds found"){
							$('#room_error').html("*Choose another room please.");
							$('#bed_id').empty();
						} else {
							$('#room_error').empty();
							$('#bed_id').empty();
							$('#bed_id').html(data);
						}
						
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
			
			$('#send').click(function() {
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/lct/tenant-details"+$('#mobile').val()+"",
					//data : {"categoryText": $('#category-expenses').val()},
					timeout : 1000000,
					beforeSend : function() {
						$('#tenantInfo').empty();
						$('#tenantInfo').addClass('loader text-center');
					},
					success : function(data) {
						console.log("SUCCESS: ", data);
						//setTimeout(function() {
						$('#tenantInfo').empty();
						$('#tenantInfo').removeClass('loader');
						$('#tenantInfo').html(data);
						//$('#is-texts-loaded').text('yes');
						//}, 800);
					},
				error : function(e) {
						console.log("ERROR: ", e);
					},
				done : function(e) {
						console.log("DONE");
						$('#loading').remove();
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
