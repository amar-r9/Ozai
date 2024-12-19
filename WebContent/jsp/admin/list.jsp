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
<meta name="description"
	content="Tikaana admin dashboard for finacne module" />
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
<!-- This page plugin CSS -->
<link
      href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css"
      rel="stylesheet"/>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<link href="<%=request.getContextPath()%>/assets/css/user-list.css"
	rel="stylesheet" />
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<style>
.loader {
	-webkit-animation: spin 2s linear infinite;
	animation: spin 2s linear infinite;
	/*margin-left: 32%;*/
}

@
-webkit-keyframes spin { 0% {
	-webkit-transform: rotate(0deg);
}

100%
{
-webkit-transform


:

 

rotate


(360
deg
);

 

}
}
@
keyframes spin { 0% {
	transform: rotate(0deg);
}

100%
{
transform


:

 

rotate


(360
deg
);

 

}
}
.btn-pill {
	border-radius: 50px;
	float: right;
}

.img-circle {
	width: 100% !important;
}

.rating {
	float: left;
}

/* :not(:checked) is a filter, so that browsers that don’t support :checked don’t 
  follow these rules. Every browser that supports :checked also supports :not(), so
  it doesn’t make the test unnecessarily selective */
.rating:not (:checked ) >input {
	position: absolute;
	top: -9999px;
	clip: rect(0, 0, 0, 0);
}

.rating:not (:checked ) >label {
	float: right;
	width: 1em;
	/* padding:0 .1em; */
	overflow: hidden;
	white-space: nowrap;
	cursor: pointer;
	font-size: 200%;
	/* line-height:1.2; */
	color: #ddd;
}

.rating:not (:checked ) >label:before {
	content: '★ ';
}

.rating>input:checked ~ label {
	color: dodgerblue;
}

.rating:not (:checked ) >label:hover, .rating:not (:checked ) >label:hover 
	 ~ label {
	color: dodgerblue;
}

.rating>input:checked+label:hover, .rating>input:checked+label:hover ~
	label, .rating>input:checked ~ label:hover, .rating>input:checked ~
	label:hover ~ label, .rating>label:hover ~ input:checked ~ label {
	color: dodgerblue;
}

.rating>label:active {
	position: relative;
	top: 2px;
	left: 2px;
}

.card-body {
	box-shadow: 2px 2px 2px #c7c4d7;
	border-radius: 10px;
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
		<a href="<%=request.getContextPath()%>/admin"
			class="card pt-2 bg-light" id="back1"
			style="z-index: 10; margin-bottom: 50px; top: 70px; position: fixed; width: 100%; border-radius: unset; box-shadow: none; background: none;">
			<i class="bi bi-arrow-left fa-2x text-secondary"
			style="vertical-align: bottom;"></i>
		</a>
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
			<div class="page-breadcrumb"></div>
			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid ">
				<!-- -------------------------------------------------------------- -->
				<!-- Start Page Content -->
				<!-- -------------------------------------------------------------- -->
				<!-- Row selection (multiple rows) -->
				<div class="row">
					<div class="col-md-12 col-12">
						<div class="card card-body">
							<h6 class="text-dark fw-bold">Generate rent below</h6>
							<form action="#" id="generate-form" method="get">
								<div class="row">
									<label>Select month</label>
									<div class="col-8">
										<div class="form-group w-100 d-block">
											<input type="month" class="form-control form-control-sm"
												name="month" id="month" style="border-radius: unset;" />
										</div>
									</div>
									<div class="col-4">
										<div class=" text-start">
											<input type="submit" id="sendRent"
												class="btn btn-dark btn-lg" value="GO" />
										</div>
									</div>
								</div>
							</form>
							<div class="row">
								<br>
								<div id="generateMessage"></div>
							</div>
						</div>
						<h5 class="text-center text-dark fw-bold">RESIDENTS</h5>
						<div class="d-block d-lg-none">
							<div class="card">
								<div class=" title-part-padding">
									<h4 class="card-title mb-0"></h4>
								</div>
								<div class="card-body">
									<c:if test="${not empty tenants }">
										<c:forEach items="${tenants}" var="tenant" varStatus="sno">
											<div class="row user-row card-body"
												style="border-radius: 10px; background: #f4eaf3bf;">
												<div class="col-sm-3 col-3 col-md-3 col-lg-3">
													<img class="img-circle" style="border-radius: 50%;"
														onerror="this.onerror=null; this.src='https://www.ozailiving.com/assets/images/default-user.png'"
														src="http://www.ozailiving.com/profile-user/image/${tenant.user_id }"
														alt="User Pic">
												</div>
												<div class="col-sm-7 col-7 col-md-7 col-lg-7">
													<strong>${tenant.user.name }</strong><br> <span
														class="text-muted">User status: Active</span>
												</div>
												<div class="col-sm-2 col-2 col-md-2 col-lg-2 dropdown-user"
													style="margin: 0;" data-for=".${tenant.user_id }">
													<i class="fas fa-plus-circle fa-2x text-dark"></i>
												</div>
												<div style="float: right;">
													<label
														class="btn align-items-center btn-light-secondary
	                          			 				text-secondary font-weight-medium"
														style="float: right;">Rental Credit Score : <span
														class="badge ms-auto bg-secondary"
														id="${tenant.user_id }rating">300</span></label>
												</div>

												<script>
													$('document')
															.ready(
																	function() {
																		$
																				.ajax({
																					type : "GET",
																					url : "${pageContext.request.contextPath}/admin/getUserRating/${tenant.user_id}",
																					timeout : 100000,
																					beforeSend : function() {
																						//$('#rent-due-${tenant.id }').html('<i class="fa fa-spinner fa-spin orange"></i>');
																					},
																					success : function(
																							data) {
																						console
																								.log(
																										"SUCCESS: ",
																										data);
																						if (data != 0) {
																							$(
																									'#${tenant.user_id }rating')
																									.html(
																											data);
																						} else {
																							$(
																									'#${tenant.user_id }rating')
																									.html(
																											data);
																						}

																					},
																					error : function(
																							e) {
																						console
																								.log(
																										"ERROR: ",
																										e);

																					},
																					done : function(
																							e) {
																						console
																								.log("DONE");
																					}
																				});
																	});
												</script>
											</div>
											<div class="row user-infos ${tenant.user_id }">
												<div class="col-sm-12 col-md-10">
													<div class="panel panel-primary">
														<div class="panel-heading">
															<h3 class="panel-title">User information</h3>
														</div>
														<div class="panel-body">
															<div class="row">
																<div class="col-sm-3 col-3">
																	<img class="img-circle"
																		onerror="this.onerror=null; this.src='https://www.ozailiving.com/assets/images/default-user.png'"
																		src="<%=request.getContextPath() %>/profile-user/image/${tenant.user_id }"
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
																			<td>${tenant.property.name }</td>
																		</tr>
																		<tr>
																			<td>Room:</td>
																			<td>${tenant.room.room_no }</td>
																		</tr>
																		<tr>
																			<td>Rent</td>
																			<td>${tenant.rent }</td>
																		</tr>
																		<tr>
																			<td>Join Date</td>
																			<td>${tenant.joining_date }</td>
																		</tr>
																	</tbody>
																</table>
															</div>
														</div>
														<div class="panel-footer">
															<a class="btn btn-primary" href="#" data-toggle="tooltip"
																data-original-title="See Profile"> <i
																class="fas fa-user"></i>
															</a> <span style="float: right;"> <a
																class="btn btn-warning"
																href="<%=request.getContextPath() %>/admin/residents/generate-rent/${tenant.user.id }"
																data-toggle="tooltip"
																data-original-title="Move out this user"> Generate
																	Rent </a> <a class="btn btn-danger"
																href="<%=request.getContextPath() %>/admin/residents/edit/${tenant.user.id }"
																data-toggle="tooltip" data-original-title="Edit details">
																	<i class="fas fa-edit"></i>
															</a>
															</span>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:if>
									<c:if test="${empty tenants }">
										<h5>No residents added yet.</h5>
									</c:if>
								</div>
							</div>
						</div>
						<div class="d-none d-lg-block">
							<div class="card card-body">
								<c:if test="${not empty tenants }">
									<table id="tenants"
										class="table customize-table mb-0 v-middle no-wrap align-items-stretch text-center">
										<thead class="">
											<!-- start row -->
											<tr>
												<th>#</th>
												<th>Name</th>
												<th>Property</th>
												<th>Room</th>
												<th>Bed</th>
												<th>Sharing</th>
												<th>Joined on</th>
												<th>Rent</th>
												<th>Action</th>
											</tr>
										</thead>
										<tfoot>
											<tr>
												<th>#</th>
												<th>Name</th>
												<th>Property</th>
												<th>Room</th>
												<th>Bed</th>
												<th>Sharing</th>
												<th>Joined on</th>
												<th>Rent</th>
												<th>Action</th>
											</tr>
										</tfoot>
										<tbody>
											<!-- start row -->
											<c:forEach items="${tenants}" var="tenant" varStatus="sno">
												<tr>
													<td>${sno.index+1}</td>
													<td>${tenant.user.name }</td>
													<td>${tenant.property.name }</td>
													<td>${tenant.room.room_no }</td>
													<td>${tenant.bed.bed_no }</td>
													<td>${tenant.sharing }</td>
													<td>${tenant.joining_date }</td>
													<td>${tenant.rent }</td>
													<td><a
															href="<%=request.getContextPath() %>/admin/residents/generate-rent/${tenant.user.id }"
															class="btn btn-sm btn-info">Generate Rent</a>
													
														<a
														href="<%=request.getContextPath() %>/admin/residents/edit/${tenant.user_id}"
														class="btn btn-sm btn-warning"><i class="fa fa-edit"></i></a></td>
												</tr>
											</c:forEach>
											<!-- end row -->
										</tbody>
									</table>
								</c:if>
								<c:if test="${empty tenants }">
									<h5>No residents added yet.</h5>
								</c:if>
							</div>
						</div>
					</div>

				</div>
				<!-- Form inputs -->

				<!-- row selection & deletion -->

				<!-- -------------------------------------------------------------- -->
				<!-- End PAge Content -->
				<!-- -------------------------------------------------------------- -->
				<!-- -------------------------------------------------------------- -->
				<!-- Right sidebar -->
				<!-- -------------------------------------------------------------- -->
				<!-- .right-sidebar -->
				<!-- -------------------------------------------------------------- -->
				<!-- End Right sidebar -->
				<!-- -------------------------------------------------------------- -->
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
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <!-- start - This is for export functionality only -->
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
	<!--This page plugins -->
	<script>
   
	$('document').ready(function(){
		$('#tenants').DataTable({
		       "paging":   true,
				dom: "Bfrtip",
				buttons: ["copy", "csv", "excel", "pdf", "print"]
			});
			$(".buttons-copy, .buttons-csv, .buttons-print, .buttons-pdf, .buttons-excel"
			).addClass("btn btn-warning btn-sm mr-1");
		$('.buttonJoin').click();
	});	
	</script>
	<script>
		$('document').ready(function() {
			$('#generate-form').submit(function(e) {
				e.preventDefault();
				generateRent();
			});
		});
		function generateRent() {
			$
					.ajax({
						type : "GET",
						url : "${pageContext.request.contextPath}/admin/generateRent/"
								+ $('#month').val() + "",
						timeout : 100000,
						beforeSend : function() {
							$('#generate-form').hide();
							$('#generateMessage')
									.html(
											'<div class="text-center"><i class="fa fa-spinner fa-2x loader text-warning"></i></div>');
						},
						success : function(data) {
							console.log("SUCCESS: ", data);
							if (data != 0) {
								$('#generateMessage').html(data);
							} else {
								$('#generateMessage').html(data);
							}

						},
						error : function(e) {
							console.log("ERROR: ", e);

						},
						done : function(e) {
							console.log("DONE");
							//$('#loading').remove();

						}
					});
		}
	</script>
	<script>
		$('document')
				.ready(
						function() {
							var panels = $('.user-infos');
							var panelsButton = $('.dropdown-user');
							panels.hide();

							//Click dropdown
							panelsButton
									.click(function() {
										//get data-for attribute
										var dataFor = $(this).attr('data-for');
										var idFor = $(dataFor);

										//current button
										var currentButton = $(this);
										idFor
												.slideToggle(
														400,
														function() {
															//Completed slidetoggle
															if (idFor
																	.is(':visible')) {
																currentButton
																		.html('<i class="fas fa-window-close fa-2x text-muted"></i>');
															} else {
																currentButton
																		.html('<i class="fas fa-plus-circle fa-2x text-dark"></i>');
															}
														})
									});

							$('[data-toggle="tooltip"]').tooltip();
						});
	</script>
	<script>
		$(function() {
			"use strict";
			$("#main-wrapper").AdminSettings({
				Theme : true, // this can be true or false ( true means dark and false means light ),
				Layout : "horizontal",
				LogoBg : "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
				NavbarBg : "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
				SidebarType : "overlay", // You can change it full / mini-sidebar / iconbar / overlay
				SidebarColor : "skin5", // You can change the Value to be skin1/skin2/skin3/skin4/skin5/skin6
				SidebarPosition : true, // it can be true / false ( true means Fixed and false means absolute )
				HeaderPosition : false, // it can be true / false ( true means Fixed and false means absolute )
				BoxedLayout : false, // it can be true / false ( true means Boxed and false means Fluid )
			});
		});
		$('document').ready(function() {
			$('#hideBack').hide();
			$('.sidebartoggler').toggle();
		});
	</script>
</body>
</html>