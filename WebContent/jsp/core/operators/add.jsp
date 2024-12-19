<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html dir="ltr">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="keywords"
	content="Tikaana Admin Dashboard" />
<meta name="description"
	content="Tikaana Admin Dashboard" />
<meta name="robots" content="noindex,nofollow" />
<title>Admin Dashboard | Ozai</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/new/assets/images/favicon.png" />
<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/new/dist/css/style.min.css"
	rel="stylesheet" />
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
.loader {
  -webkit-animation: spin 2s linear infinite;
  animation: spin 2s linear infinite;
}
		
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}
		
@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>
</head>

<body>
		<!-- -------------------------------------------------------------- -->
		<!-- Preloader - style you can find in spinners.css -->
		<!-- -------------------------------------------------------------- -->
		<jsp:include page="/common/preloader.jsp"></jsp:include>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper">
      <!-- ============================================================== -->
      <!-- Topbar header - style you can find in pages.scss -->
      <!-- ============================================================== -->
      <jsp:include page="/common/coreheader.jsp"></jsp:include>
      <!-- ============================================================== -->
      <!-- End Topbar header -->
      <!-- ============================================================== -->
      <!-- ============================================================== -->
      <!-- Left Sidebar - style you can find in sidebar.scss  -->
      <!-- ============================================================== -->
      <jsp:include page="/common/coresidebar.jsp"></jsp:include>
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
            <div class="col-5 col-md-5 col-sm-12 col-12 align-self-center">
              <h4 class="page-title">ADD AN OPERATOR</h4>
            </div>
            <div class="col-7 align-self-center d-none d-lg-block">
              <div class="d-flex align-items-center justify-content-end">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                      <a href="#">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">
                      Operators
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
          
          <!-- Row selection (multiple rows) -->
          <div class="row">
            <div class="col-md-9 col-9">
              <!-- ---------------------
                            start Row selection (multiple rows)
                        ---------------- -->
              <div class="card">
                <div class="card-body">
					<div class="row">
	                	<form action="#"
							id="admin-form" method="post" modelAttribute="client">
							<div class="col-12 mb-3">
								<div class="form-group">
									<label class="control-label" for="client">Entity Name</label> 
									<input name="client" id="client" required
										class="form-control">
								</div>
							</div>
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
							<input type="hidden" name="access_level" value="1" />
							<div class="col-12 mb-3">
								<div class="form-group">
									<label class="control-label">Mobile</label> 
									<input type="text" name="mobile" id="mobile" required
										class="form-control" onkeypress="return isNumber(event);"
										minlength="10" maxlength="10" />
										<span id="loading" style="display: none;"><i class="fa fa-spinner loader text-info"></i></span>
									<p id="mobile-error" class="bg-danger text-white"></p>
									<p id="mobile-success" class="bg-success text-white"></p>
									<div class="validate"></div>
								</div>
							</div>
							<div class="col-12 mb-3">
								<div class="form-group">
									<label class="control-label">Password</label> 
									<input type="text" name="password" id="password" required
										class="form-control" minlength="6">
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
	
							<div class="col-md-12 text-center">
								<button type="submit" class="btn btn-info btn-lg btn-wide" id="send">Submit</button>
							</div>
						</form>
         			 </div>				
				</div>
              </div>
              <!-- ---------------------
                end Row selection (multiple rows)
               ---------------- -->
            </div>
          </div>
          <!-- Form inputs -->
          <!-- row selection & deletion -->
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
    <script>
	    function isNumber(e){
			e = e || window.event;
			var charCode = e.which ? e.which : e.keyCode;
			return /\d/.test(String.fromCharCode(charCode));
		}
    	$("#admin-form").submit(function(event) {
			event.preventDefault();
			saveAdmin();
		});
    	function saveAdmin() {
			var formData = $("#admin-form").serialize();
			$.ajax({
				type : "GET",
				url : "${pageContext.request.contextPath}/registerAdmin",
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
						window.location.href = "${pageContext.request.contextPath}/core/operators/list?success=yes";
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
					url : "${pageContext.request.contextPath}/checkAdminUserNameAction",
					data : {"username" : $('#mobile').val()},
					timeout : 100000,
					beforeSend:function(){
						$('#mobile-error').empty();
						$("#loading").show();
					},
					success : function(data) {
						
						console.log("SUCCESS: ", data);
						
						if(data=='success'){
							$('#mobile').empty();
							$('#mobile-error').show();
							$('#mobile-success').empty();
							$("#loading").hide();
							$('#mobile-error').html('<i class="fa fa-exclamation-triangle"></i> Username not available.');
							$("#send").hide();
						} else if(data=='empty'){
							$('#mobile').empty();
							$('#mobile-error').show();
							$('#mobile-success').empty();
							$("#loading").hide();
							$('#mobile-error').html('<i class="fa fa-exclamation-circle"></i> Invalid input.');
							$("#send").hide();
						} else {
							$("#send").show();
							$("#loading").hide();
							$('#mobile-error').empty();
							$('#mobile-success').html('<i class="fa fa-check-circle"></i> Username available.');
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