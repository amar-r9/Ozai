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
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="keywords"
	content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, nice admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, " />
<meta name="description" content="Tikaana Admin Dashboard" />
<meta name="robots" content="noindex,nofollow" />
<title>Ozai Admin Dashboard</title>
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
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/new/assets/libs/select2/dist/css/select2.min.css" />
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
						<h5 class="text-center text-dark fw-bold">${param.type }</h5>
						<div class="card">
							<div class="card-body">
								<c:choose>
									<c:when test="${param.type eq 'Delivery' }">
										<form id="delivery-form" action="<%=request.getContextPath() %>/lct/addGateRequest"
						                	method="post" modelAttribute="request">
						                    <input type="hidden" value="Delivery" id="type" name="type" />
						                    <input type="hidden" value="${ClientUser.client_code }" id="client_code" name="client_code" />
						                    <input type="hidden" value="Pending" id="status" name="status" />
						                    
						                    <div class="mb-3">
						                        <label for="serviceDetails" class="form-label">Name</label>
						                        <input type="text" class="form-control" id="name" name="name" required />
						                    </div>
						                    <div class="mb-3">
						                        <label for="serviceDetails" class="form-label">From</label>
						                        <input type="text" class="form-control" id="from" name="from" required />
						                    </div>
						                    <div class="mb-3">
						                        <label for="serviceDetails" class="form-label">Resident</label>
						                        <select class=" form-select form-control" id="user_id" name="user_id" required>
						                        	<option value="">Select</option>
						                        	<c:forEach items="${details }" var="det">
						                        		<option value="${det.user_id }">${det.user.name } | ${det.room.room_no }</option>
						                        	</c:forEach>
						                        </select>
						                    </div>
						                    <div class="text-center">
						                    	<button type="submit" class="btn btn-primary">Submit Request</button>
						                    </div>
						                </form>
						                <div id="loading2" style="display: none;">
						                	<div class="spinner-border text-primary" role="status">
						                    </div>
						                    <span class="sr-only">Loading...</span>
						                </div>
									</c:when>
									<c:when test="${param.type eq 'Guest' }">
										<form id="guest-form" action="<%=request.getContextPath() %>/lct/addGateRequest"
						                	method="post" modelAttribute="request">
						                    <input type="hidden" value="Guest" id="type" name="type" />
						                    <input type="hidden" value="Pending" id="status" name="status" />
						                    <input type="hidden" value="${ClientUser.client_code }" id="client_code" name="client_code" />
						                    <div class="mb-3">
						                        <label for="serviceDetails" class="form-label">Name</label>
						                        <input type="text" class="form-control" id="name" name="name" required />
						                    </div>
						                    <div class="mb-3">
						                        <label for="serviceDetails" class="form-label">Mobile</label>
						                        <input type="text" class="form-control" id="mobile" name="mobile" required />
						                    </div>
						                    <div class="mb-3">
						                        <label for="serviceDetails" class="form-label">Resident</label>
						                        <select class=" form-select form-control" id="user_id" name="user_id" required>
						                        	<option value="">Select</option>
						                        	<c:forEach items="${details }" var="det">
						                        		<option value="${det.user_id }">${det.user.name } | ${det.room.room_no }</option>
						                        	</c:forEach>
						                        </select>
						                    </div>
						                    <div class="text-center">
						                    	<button type="submit" class="btn btn-primary">Submit Request</button>
						                    </div>
						                </form>
						                <div id="loading1" style="display: none;">
						                	<div class="spinner-border text-primary" role="status">
						                    </div>
						                    <span class="sr-only">Loading...</span>
						                </div>
									</c:when>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
				<!-- -------------------------------------------------------------- -->
				<!-- End PAge Content -->
				<!-- -------------------------------------------------------------- -->
			</div>
			
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- footer -->
			<!-- ============================================================== -->
			<footer class="footer text-center"> All Rights Reserved by
				Ozai Living Private Limited. </footer>
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
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap tether Core JavaScript -->
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!-- apps -->
	<script src="<%=request.getContextPath()%>/new/dist/js/app.min.js"></script>
	<script src="<%=request.getContextPath()%>/new/dist/js/app.init.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/dist/js/app-style-switcher.js"></script>
	<!-- slimscrollbar scrollbar JavaScript -->
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/jquery-sparkline/jquery.sparkline.min.js"></script>
	<!--Wave Effects -->
	<script src="<%=request.getContextPath()%>/new/dist/js/waves.js"></script>
	<!--Menu sidebar -->
	<script src="<%=request.getContextPath()%>/new/dist/js/sidebarmenu.js"></script>
	<!--Custom JavaScript -->
	<script src="<%=request.getContextPath()%>/new/dist/js/feather.min.js"></script>
	<script src="<%=request.getContextPath()%>/new/dist/js/custom.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/select2/dist/js/select2.full.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/select2/dist/js/select2.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/dist/js/pages/forms/select2/select2.init.js"></script>
	<script>
	    $(document).ready(function() {
	        $("#guest-form").submit(function(event) {
	            //event.preventDefault(); // Prevent the default form submission
	            //$("#loading1").show();
	            //var formData = $("#guest-form").serialize();
				$.ajax({
					type : "POST",
					//url : "${pageContext.request.contextPath}/mobile/addGateRequest",
					data : formData,
					timeout : 100000,
										
					success: function(response) {
	                    alert(response); // Display a success message or handle response
	                    $("#loading1").hide();
	                    $("#guest-form")[0].reset(); // Reset the form fields
	                    $("#guestModal").modal('hide'); // Hide the modal after submission
	                },
	                error: function() {
	                    alert("There was an error submitting the form. Please try again.");
	                    $("#loading1").hide();
	                }
				});
	        });
	        $("#delivery-form").submit(function(event) {
	            //event.preventDefault(); // Prevent the default form submission
	            //$("#loading2").show();
	            //var formData = $("#delivery-form").serialize();
				$.ajax({
					type : "POST",
					//url : "${pageContext.request.contextPath}/mobile/addGateRequest",
					data : formData,
					timeout : 100000,
										
					success: function(response) {
	                    alert(response); // Display a success message or handle response
	                    $("#loading2").hide();
	                    $("#delivery-form")[0].reset(); // Reset the form fields
	                    $("#deliveryModal").modal('hide'); // Hide the modal after submission
	                },
	                error: function() {
	                    alert("There was an error submitting the form. Please try again.");
	                    $("#loading2").hide();
	                }
				});
	        });
	    });
	</script>
	<script>
		$('document').ready(function() {
			$('.sidebartoggler').toggle();
		});
		$(function() {
			"use strict";
			$("#main-wrapper").AdminSettings({
				Theme : true, // this can be true or false ( true means dark and false means light ),
				Layout : "horizontal",
				LogoBg : "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
				NavbarBg : "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
				SidebarType : "overlay", // You can change it full / mini-sidebar / iconbar / overlay
				SidebarColor : "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
				SidebarPosition : false, // it can be true / false ( true means Fixed and false means absolute )
				HeaderPosition : false, // it can be true / false ( true means Fixed and false means absolute )
				BoxedLayout : false, // it can be true / false ( true means Boxed and false means Fluid )
			});
		});
	</script>
</body>
</html>