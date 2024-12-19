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
<meta name="keywords"
	content="admin dashboard, tikaana, tikaana client dashboard, tikaana customer" />
<meta name="description"
	content="Admin roles and privileges for Tikaana customers/clients " />
<meta name="robots" content="noindex,nofollow" />
<title>Staff List | Ozai Admin Dashboard</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/new/assets/images/favicon.png" />
<!-- This page plugin CSS -->
<link
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css"
	rel="stylesheet" />
<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/new/dist/css/style.min.css"
	rel="stylesheet" />
<link href="<%=request.getContextPath()%>/assets/css/user-list.css"
	rel="stylesheet" />
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
	p {
		color: #000;
		overflow: hidden;
	    white-space: nowrap;
	    text-overflow: ellipsis;
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
		<div class="page-wrapper" style="margin-top: 50px; background: #fff;">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<a href="<%=request.getContextPath() %>/lct/staff/add" class="btn btn-warning btn-sm btn-rounded"
				style="position: fixed; z-index: 10; top: 300px; right: 10px;
		    	width: fit-content;"><i class="fa fa-plus"></i> &nbsp;ADD STAFF</a>
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-12 text-center">
						<h5 class="text-dark fw-bold">STAFF</h5>
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
					<div class="">
						<div class="">
							<div class="table-responsive">
								<br>
								<c:if test="${not empty staff }">
									<c:forEach items="${staff}" var="s" varStatus="sno">
										<div class="row user-row card-body" style="
											border-radius: 10px; background: #ecf3ef;">
											<div class="col-sm-3 col-3 col-md-3 col-lg-3">
												<img src="https://www.ozailiving.com/assets/images/default-user.png" 
												class="img-rounded" style="width: -webkit-fill-available;" />
											</div>
											<div class="col-sm-7 col-7 col-md-7 col-lg-7">
												<strong>${s.name }</strong><br> 
												<small>
													<span class="text-warning"><i class="fas fa-user"></i> 
														${s.designation }
											  		</span>
											  	</small>
											</div>
											<div
												class="col-sm-2 col-2 col-md-2 col-lg-2 dropdown-user" style="margin: 0;"
												data-for=".${s.id }">
												<i class="ri-more-fill fa-2x"></i>
											</div>							
										</div>
										
										<div class="row user-infos ${s.id }">
											<div
												class="col-sm-12 col-md-10">
												<div class="panel">
													
													<div class="panel-body" style="padding: 0px;">
														<div class="row">
															<div class="col-6">
																<small class="text-muted mb-0">Mobile</small>
																<p>${s.mobile }</p>
																<small class="text-muted mb-0">Email</small>
																<p>${s.email }</p>
															</div>
															<div class="col-6">
																<small class="text-muted mb-0">Property</small>
																<p>${s.property.name }</p>
																<small class="text-muted mb-0">Designation name</small>
																<p>${s.designation }</p>																																
															</div>
														</div>
													</div>
													<div class="panel-footer text-end" style="padding: 10px 10px;">
														<%-- <a class="btn btn-danger"
															href="<%=request.getContextPath() %>/lct/staff/edit/${s.id }"
															data-toggle="tooltip"
															data-original-title="Edit details">
															<i class="fas fa-edit"></i>
														</a> --%>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</c:if>
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
			<footer class="footer">All right reserved by Ozai Living
				Private Limited.</footer>
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
	<!--This page plugins -->
	<script
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
	<!-- start - This is for export functionality only -->
	<script
		src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
	<!-- Template Main JS File -->
	<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
	<script>
		$('document').ready(function() {
		    var panels = $('.user-infos');
		    var panelsButton = $('.dropdown-user');
		    panels.hide();

		    //Click dropdown
		    panelsButton.click(function() {
		        //get data-for attribute
		        var dataFor = $(this).attr('data-for');
		        var idFor = $(dataFor);

		        //current button
		        var currentButton = $(this);
		        idFor.slideToggle(400, function() {
		            //Completed slidetoggle
		            if(idFor.is(':visible'))
		            {
		                currentButton.html('<i class="fas fa-window-close fa-2x text-muted"></i>');
		            }
		            else
		            {
		                currentButton.html('<i class="fas fa-plus-circle fa-2x text-dark"></i>');
		            }
		        })
		    });


		    $('[data-toggle="tooltip"]').tooltip();

		    $('button').click(function(e) {
		        e.preventDefault();
		        alert("This is a demo.\n :-)");
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