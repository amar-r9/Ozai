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
<style>
.form-control {
	border-radius: unset !important;
	font-size: 0.9rem !important;
}

body {
	font-size: 0.9rem;
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
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-5 col-md-5 col-sm-12 col-12 align-self-center">
						<h5 class="text-center text-dark fw-bold">PENDING RENTS</h5>
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
						<div class="alert">
							<div class="row m-0">
								<form id="month-form"
									action="<%=request.getContextPath()%>/lct/residents/month-property/pending-rents"
									role="form" method="post">
									<div class="row m-0">
										<div class="col-5">
											<label class="col-sm-12 col-12">Month</label> <input
												type="month" name="month" id="month"
												style="width: 100%; height: auto; line-height: 2.5 !important;"
												class="form-select" required />
										</div>
										<div class="col-5">
											<label class="col-sm-12 col-12">Property</label> <select
												name="property" id="property"
												style="line-height: 2.5 !important;"
												class="form-control form-select" required>
												<option value="">Choose</option>
												<option value="0">All</option>
												<c:forEach items="${properties }" var="property">
													<option value="${property.id }">${property.name }</option>
												</c:forEach>
											</select>
										</div>
										<div class="col-2">
											<input style="line-height: 2.5 !important;"
												class="btn btn-rounded mt-4 btn-info font-medium"
												type="submit" id="submitThis2" value="Go" />
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<c:if test="${not empty rents }">
						<c:forEach items="${rents}" var="rent">
							<div class="card" style="border-radius: 20px;">
								<div class="alert pb-0 mb-0">
									<div class="row">
										<div class="col-auto">
											<div class="avatar avatar-44 shadow-sm rounded-10">
												<img
													src="https://www.ozailiving.com/profile-user/image/${rent.user_id}"
													onerror="this.onerror=null; this.src='https://www.ozailiving.com/assets/images/profiledefault.png'"
													style="width: 44px; border-radius: 50%;">
											</div>
										</div>
										<div class="col align-self-center mb-0">
											<p class="mb-0 text-color-theme" style="color: #000;">${rent.user.name }</p>
											<p class="text-muted small">AED ${rent.amount }</p>
										</div>
										<div class="col-auto">
											<a
												href="<%=request.getContextPath() %>/lct/residents/update-rent-payment/${rent.id }"
												class="btn btn-default btn-44 shadow-sm"> <i
												class="bi bi-arrow-up-right-circle"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${empty rents }">
						No records found.
					</c:if>
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