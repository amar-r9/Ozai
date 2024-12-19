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
              <h4 class="page-title">Resident Details</h4>
            </div>
            <div class="col-7 align-self-center">
              <div class="d-flex align-items-center justify-content-end">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                      <a href="<%=request.getContextPath() %>/admin">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">
                      Resident Details
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
            <div class="col-9 col-md-9">
              <!-- ---------------------
                            start File export
                        ---------------- -->
              <div class="card">
                <div class="border-bottom title-part-padding">
                  <h4 class="card-title mb-0">Admin</h4>
                </div>
                
                  <!-- Add Contact Popup Model -->
                  
                <div class="card-body">
                  <div class="justify-content-end">
                  	
                  	<form action="<%=request.getContextPath() %>/admin/getResidentDetails" 
						id="tenant-form">
	                  	<div class="row pt-3">
	                        <div class="col-md-6">
	                          <div class="mb-3">
	                            <label class="control-label">Mobile</label>  
								<input type="text" name="mobile" id="mobile" required class="form-control" />
	                          </div>
	                        </div>
                       </div>
						<div class="form-actions">
	                      <div class="card-body border-top">
							<button type="submit" id="send" class="btn btn-success">GET</button>
						  </div>
						</div>
					</form>
					<div id="tenantInfo">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<td><b>Name:</b> </td>
									<td>${user.name }</td>
								</tr>
								<tr>
									<td><b>Username:</b> </td>
									<td>${user.username }</td>
								</tr>
								<tr>
									<td><b>Password:</b> </td>
									<td>${user.password }</td>
								</tr>
								<tr>
									<td><b>Room:</b> </td>
									<td>${user.room }</td>
								</tr>
								<tr>
									<td><b>Property:</b> </td>
									<td>${user.property }</td>
								</tr>
							</tbody>
						</table>
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
						<h4 class="card-title mt-3">Residents</h4>
						<div class="row gap-2">
							<div class="col-md-12">
								<a href="<%=request.getContextPath() %>/admin/residents/list"
									class="btn d-flex align-items-center
                          				btn-info w-100 d-block font-weight-medium">
									Residents List <span class="badge ms-auto bg-info"><i class="fa fa-list"></i></span>
								</a>
							</div>
							<div class="col-md-12">
								<a href="<%=request.getContextPath() %>/admin/residents/add"
									class="btn d-flex align-items-center
			                          btn-success w-100 d-block
			                          font-weight-medium">
									Add Resident <span class="badge ms-auto bg-success"><i class="fa fa-plus"></i></span>
								</a>
							</div>
							<div class="col-md-12">
								<a href="<%=request.getContextPath() %>/admin/residents/payments-list"
									class="btn d-flex align-items-center
			                          btn-danger w-100 d-block
			                          font-weight-medium">
									Pending Payments <span class="badge ms-auto bg-danger"><i class="fa fa-rupee-sign"></i></span>
								</a>
							</div>
							<div class="col-md-12">
								<a href="<%=request.getContextPath() %>/admin/residents/details"
									class="btn d-flex align-items-center
			                          btn-warning w-100 d-block
			                          font-weight-medium">
									Resident Details <span class="badge ms-auto bg-warning"><i class="fa fa-user"></i></span>
								</a>
							</div>
							<div class="col-md-12">
								<a href="<%=request.getContextPath() %>/admin/residents/payments"
									class="btn d-flex align-items-center
			                          btn-primary w-100 d-block
			                          font-weight-medium">
									Payments List <span class="badge ms-auto bg-primary"><i class="fa fa-user"></i></span>
								</a>
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

	

	<!-- Template Main JS File -->
	<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
	<script>
		$('document').ready(function(){
			$('#send').click(function() {
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/admin/tenant-details"+$('#mobile').val()+"",
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
