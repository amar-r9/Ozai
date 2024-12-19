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
	content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, nice admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, " />
<meta name="description" content="Tikaana Admin Dashboard " />
<meta name="robots" content="noindex,nofollow" />
<title>Ozai Admin Dashboard for resident details, paymeent
	updates</title>
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
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link href="<%=request.getContextPath()%>/assets/css/user-list.css"
	rel="stylesheet" />
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
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
						<h4 class="page-title">Residents List</h4>
					</div>
					<div class="col-7 align-self-center">
						<div class="d-flex align-items-center justify-content-end">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a
										href="<%=request.getContextPath()%>/admin">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">
										Residents List</li>
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
					<div class="col-md-9 col-9 col-sm-12 col-12">
						<!-- ---------------------
                            start File export
                        ---------------- -->
						<div class="card">
							<div class="border-bottom title-part-padding">
							</div>
							<div class=" row">
								<div class="">
									<br>
									<c:if test="${not empty tenants }">
										<c:forEach items="${tenants}" var="tenant" varStatus="sno">
											<div class="row user-row card-body" style="border: solid 1px #5a5a5a;">
												<div class="col-sm-3 col-3 col-md-3 col-lg-3">
													<img class="img-circle"
														src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=50"
														alt="User Pic">
												</div>
												<div class="col-sm-7 col-7 col-md-7 col-lg-7">
													<strong>${tenant.user.name }</strong><br> <span class="text-muted">User
														status: Active</span>
												</div>
												<div
													class="col-sm-2 col-2 col-md-2 col-lg-2 dropdown-user"
													data-for=".${tenant.id }">
													<i class="fas fa-arrow-alt-circle-down fa-2x text-muted"></i>
												</div>
											</div>
											<div class="row user-infos ${tenant.id }">
												<div
													class="col-sm-12 col-md-10">
													<div class="panel panel-primary">
														<div class="panel-heading">
															<h3 class="panel-title">User information</h3>
														</div>
														<div class="panel-body">
															<div class="row">
																<div class="col-sm-3 col-3">
																	<img class="img-circle"
																		src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=50"
																		alt="User Pic">
																</div>
																<div class="col-md-9 col-sm-9 col-9">
																	<strong>${tenant.user.name }</strong>																	
																</div>
															</div>
															<div class="row">
																<table class="table table-user-information">
																	<tbody>
																		<tr>
																			<td>Property:</td>
																			<td>${tenant.property }</td>
																		</tr>
																		<tr>
																			<td>Room:</td>
																			<td>${tenant.room }</td>
																		</tr>
																		<tr>
																			<td>Rent</td>
																			<td>${tenant.rent }</td>
																		</tr>
																		<tr>
																			<td>Join Date</td>
																			<td>0${tenant.joining_date }</td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>
														<div class="panel-footer">
															<a class="btn btn-primary"
																href="#"
																data-toggle="tooltip"
																data-original-title="See Profile">
																<i class="fas fa-user"></i>
															</a>
															<span style="float: right;">
																<a class="btn btn-warning"
																	href="<%=request.getContextPath() %>/admin/residents/edit/${tenant.user.id }"
																	data-toggle="tooltip"
																	data-original-title="Move out this user">
																	<i class="ri-delete-bin-2-line"></i>
																</a>
																<a class="btn btn-danger"
																	href="<%=request.getContextPath() %>/admin/residents/edit/${tenant.user.id }"
																	data-toggle="tooltip"
																	data-original-title="Edit details">
																	<i class="fas fa-edit"></i>
																</a>
															</span>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
										<!-- end row -->
									</c:if>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-3 d-flex align-items-stretch">
						<div class="card w-100">
							<div
								class="d-flex border-bottom title-part-padding
                  					align-items-center">
								<div>
									<h4 class="card-title mb-0">Links</h4>
								</div>
							</div>
							<div class="card-body">
								<h4 class="card-title mt-3">Residents</h4>
								<div class="row gap-2">
									<div class="col-md-12">
										<a
											href="<%=request.getContextPath()%>/admin/residents/list"
											class="btn d-flex align-items-center
                        							btn-info w-100 d-block font-weight-medium">
											Resident List <span class="badge ms-auto bg-info"><i
												class="fa fa-list"></i></span>
										</a>
									</div>
									<div class="col-md-12">
										<a href="<%=request.getContextPath()%>/admin/residents/add"
											class="btn d-flex align-items-center
					                          btn-success w-100 d-block
					                          font-weight-medium">
											Add Resident <span class="badge ms-auto bg-success"><i
												class="fa fa-plus"></i></span>
										</a>
									</div>
									<div class="col-md-12">
										<a
											href="<%=request.getContextPath()%>/admin/residents/payments-list"
											class="btn d-flex align-items-center
					                          btn-danger w-100 d-block
					                          font-weight-medium">
											Pending Payments <span class="badge ms-auto bg-danger"><i
												class="fa fa-rupee-sign"></i></span>
										</a>
									</div>
									<div class="col-md-12">
										<a
											href="<%=request.getContextPath()%>/admin/residents/details"
											class="btn d-flex align-items-center
					                          btn-warning w-100 d-block
					                          font-weight-medium">
											Resident Details <span class="badge ms-auto bg-warning"><i
												class="fa fa-user"></i></span>
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
		                currentButton.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
		            }
		            else
		            {
		                currentButton.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
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
