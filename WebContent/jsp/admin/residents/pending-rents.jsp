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
<title>Pending Rents | Ozai Living</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/new/assets/images/favicon.png" />
<!-- This page plugin CSS -->
<link
	href="<%=request.getContextPath()%>/new/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.css"
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
					<div class="col-5 col-md-5 col-sm-12 col-12 align-self-center">
						<h4 class="page-title">Pending rents</h4>
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
				<div class="col-9 col-md-9 col-12 col-sm-12">
					<!-- ---------------------
                            start File export
                        ---------------- -->
					<div class="card">
						<div class="border-bottom title-part-padding">
							<h4 class="card-title mb-0">
								<c:if test="${not empty month }">Month : <span
									class="text-dark" style="font-weight: 700;">${month }</span>.</c:if>
								<c:if test="${not empty pg }">Property : <span
									class="text-dark" style="font-weight: 700;">${pg }</span>.</c:if>
							</h4>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-6">
									<form id="month-form"
										action="<%=request.getContextPath()%>/admin/residents/month/pending-rents"
										role="form" method="post">
										<div class="input-group mb-3">
											<label class="col-sm-12 col-12">Select month</label>
											<input type="month" name="month" id="month"
												class="form-control form-select" required />
											<input
												class="btn btn-light-info text-info font-medium"
												type="submit" id="submitThis" value="Go!" />
										</div>
									</form>
								</div>
								<div class="col-6">
									<form id="month-form"
										action="<%=request.getContextPath()%>/admin/residents/property/pending-rents"
										role="form" method="post">
										<div class="input-group mb-3">
											<label class="col-sm-12 col-12">Select property</label>
											<select name="property" id="property"
												class="form-control form-select" required>
												<option value="">Choose</option>
												<c:forEach items="${properties }" var="property">
													<option value="${property.id }">${property.name }</option>
												</c:forEach>
											</select>
											<input
												class="btn btn-light-info text-info font-medium"
												type="submit" id="submitThis2" value="Go!" />
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
						<c:if test="${not empty rents }">
							<c:forEach items="${rents}" var="rent">
								<div class="card" style="border-radius: 20px;">
									<div class="card-body">
										<div class="row mb-3">
											<div class="col-auto">
												<div class="avatar avatar-44 shadow-sm rounded-10">
													<img src="http://www.ozailiving.com/profile-user/image/${rent.user_id}"
														onerror="this.onerror=null; this.src='http://www.ozailiving.com/assets/images/default-user.png'"
														style="width: 44px; border-radius: 5px;">
												</div>
											</div>
											<div class="col align-self-center ps-0">
												<p class="mb-0 text-color-theme">${rent.user.name }</p>
												<p class="text-muted small">Mobile: ${rent.user.mobile }</p>
											</div>
											<div class="col-auto">
												<a href="#"
													class="btn btn-default btn-44 shadow-sm"> <i
													class="bi bi-arrow-up-right-circle"></i>
												</a>
											</div>
										</div>
										<div class="card bg-light" style="border-radius: 20px;">
											<div class="card-body">
												<div class="row">
													<div class="col-auto">
														<div
															class="avatar avatar-60 shadow-sm rounded-10 text-white">
															<img style="width: 60px; height: 60px;"
																src="<%=request.getContextPath() %>/assets/images/rupee.png" /> 
														</div>
													</div>
													<div class="col align-self-center ps-0">

														<p class="text-color-theme">
															${rent.service_month } 
															<a href="<%=request.getContextPath() %>/admin/residents/update-rent-payment/${rent.id }"
																class="btn btn-sm btn-warning text-white px-2 float-end">UPDATE <i class="fas fa-arrow-alt-circle-right"></i></a>
														</p>

														<div class="row">
															<div class="col">${rent.amount }</div>
															<div class="col-auto align-self-center text-end">
																<span class="text-muted size-12 ">Date:
																	${rent.raised_date }</span>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>


							<%-- <table id="tenants"
                      class="table table-bordered display text-nowrap">
                      <thead>
                        <!-- start row -->
                        <tr>
                          <th>Name</th>
                          <th>Room</th>
                          <th>Property</th>
                          <th>Amount</th>
                          <th>Mobile</th>
                          <th>Month</th>
                          <th>Join Date</th>
                        </tr>
                        <!-- end row -->
                      </thead>
                      <tbody id="pulledData">
                        <!-- start row -->
                        <c:forEach items="${rents}" var="rent">
                        <tr>
                          <td>${rent.user.name }</td>
                          <td>${rent.details.room }</td>
						  <td>${rent.details.property }</td>
						  <td>${rent.amount }</td>
                          <td>${rent.user.mobile }</td>
						  <td>${rent.service_month }</td>
						  <td>${rent.details.joining_date }</td>
                        </tr>
                        </c:forEach>
                        <!-- end row -->
                      </tbody>
                      <tfoot>
			            <tr>
			                <th colspan="4" style="text-align:right">Total:</th>
			                <th></th>
			            </tr>
			        </tfoot>
                    </table> --%>
						</c:if>
				</div>
				<div class="col-lg-3 d-flex align-items-stretch d-lg-block d-none">
					<div class="card w-100">
						<div
							class="d-flex border-bottom title-part-padding
                    	align-items-center">
							<div>
								<h4 class="card-title mb-0">Links</h4>
							</div>
						</div>
						<div class="card-body">
							<h4 class="card-title mt-3">Tenants</h4>
							<div class="row gap-2">
								<div class="col-md-12">
									<a href="<%=request.getContextPath()%>/admin/residents/list"
										class="btn d-flex align-items-center
                          				w-100 d-block btn-info font-weight-medium">
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
										href="<%=request.getContextPath()%>/admin/residents/pending-rents"
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
								<div class="col-md-12">
									<a
										href="<%=request.getContextPath()%>/admin/residents/payments"
										class="btn d-flex align-items-center
			                          btn-primary w-100 d-block
			                          font-weight-medium">
										Payments List <span class="badge ms-auto bg-primary"><i
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
		src="<%=request.getContextPath()%>/new/assets/libs/datatables/media/js/jquery.dataTables.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/dist/js/pages/datatable/custom-datatable.js"></script>
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
	<script
		src="<%=request.getContextPath()%>/new/dist/js/pages/datatable/datatable-advanced.init.js"></script>
	<!-- Template Main JS File -->
	<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
	<!-- <script>
    	$('document').ready(function(){
    		
   			$('#submitIt').click(function() {
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/tenants/month-payments/"+$('#month').val()+"/"+$('#year').val()+"",
					//data : {"categoryText": $('#category-expenses').val()},
					timeout : 1000000,
					beforeSend : function() {
						$('#pulledData').empty();
						$('#pulledData').addClass('loader text-center');
					},
					success : function(data) {
						console.log("SUCCESS: ", data);
						//setTimeout(function() {
						$('#pulledData').empty();
						$('#pulledData').removeClass('loader');
						$('#pulledData').html(data);
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
   			
   			$('#property-beds').change(function() {
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/tenants/property-payments/"+$('#property-beds').val()+"",
					//data : {"categoryText": $('#category-expenses').val()},
					timeout : 1000000,
					beforeSend : function() {
						$('#pulledData').empty();
						$('#pulledData').addClass('loader text-center');
					},
					success : function(data) {
						console.log("SUCCESS: ", data);
						//setTimeout(function() {
						$('#pulledData').empty();
						$('#pulledData').removeClass('loader');
						$('#pulledData').html(data);
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
    </script> -->
	<script>
		$('document')
				.ready(
						function() {
							$('#tenants')
									.DataTable(
											{
												dom : "Bfrtip",
												buttons : [ "copy", "csv",
														"excel", "pdf", "print" ],
												sorting : false,
												"footerCallback" : function(
														row, data, start, end,
														display) {
													var api = this.api();

													// Remove the formatting to get integer data for summation
													var intVal = function(i) {
														return typeof i === 'string' ? i
																.replace(
																		/[\$,]/g,
																		'') * 1
																: typeof i === 'number' ? i
																		: 0;
													};

													// Total over all pages
													total = api
															.column(3)
															.data()
															.reduce(
																	function(a,
																			b) {
																		return intVal(a)
																				+ intVal(b);
																	}, 0);

													// Total over this page
													pageTotal = api
															.column(
																	3,
																	{
																		page : 'current'
																	})
															.data()
															.reduce(
																	function(a,
																			b) {
																		return intVal(a)
																				+ intVal(b);
																	}, 0);

													// Update footer
													$(api.column(3).footer())
															.html(
																	'&#8377;'
																			+ pageTotal
																			+ ' ( &#8377;'
																			+ total
																			+ ' total)');
												}
											});
							$(
									".buttons-copy, .buttons-csv, .buttons-print, .buttons-pdf, .buttons-excel")
									.addClass("btn btn-warning btn-sm mr-1");
							$('.buttonJoin').click();
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