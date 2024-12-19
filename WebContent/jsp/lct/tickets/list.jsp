<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="keywords"
	content="admin dashboard, tikaana, pg, tikaana admin" />
<meta name="description" content="Tikaana Admin Dashboard" />
<meta name="robots" content="noindex,nofollow" />
<title>Tickets List | Ozai</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin/" />
<link
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css"
	rel="stylesheet" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/new/assets/images/favicon.png" />
<!-- This page css -->
<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/new/dist/css/style.min.css"
	rel="stylesheet" />
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;700&display=swap" rel="stylesheet" />
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
	.form-select {
		font-size: .475rem;
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
		<a href="<%=request.getContextPath()%>/lct"
			class="card pt-2 ps-2" id="back1"
			style="z-index: 10; margin-bottom: 50px; top: 70px; position: fixed; width: 100%; border-radius: unset; box-shadow: none; background: #233242;">
			<i class="bi bi-arrow-left fa-2x text-white"
			style="vertical-align: bottom;"></i>
		</a>
		<jsp:include page="/common/lctsidebar.jsp"></jsp:include>
		
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<div class="page-breadcrumb">
				<div class="row">
					<div class=" text-center">
						<p style="font-weight: 800; color: #000;">TICKETS LIST</p>
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
				<!-- basic table -->
				<div class="row">
					<div class="col-12">
						<c:if test="${ClientUser.role eq 'Admin' || ClientUser.role eq 'Cluster head' }">
							<div class="card alert">
								<div class="row m-0">
									<form id="month-form"
										action="<%=request.getContextPath()%>/lct/tickets/month-property"
										role="form" method="post">
										<div class="row m-0">
											<div class="col-5">
												<label class="mb-2 col-12">Month</label>
												<input type="month"
													name="month" id="month"
													style="width: 100%; height: 25px !important; line-height: 2.5 !important;"
													class="form-select" required />
											</div>
											<div class="col-5">
												<label class="mb-2 col-12">Property</label> <select
													name="property_id" id="property_id"
													style="line-height: 1.5 !important;"
													class="form-control form-select" required>
													<option value="">Choose</option>
													<option value="0">All</option>
													<c:forEach items="${properties }" var="property">
														<option value="${property.id }">${property.name }</option>
													</c:forEach>
												</select>
											</div>
											<div class="col-2">
												<label class="mb-2 col-12"></label>
												<input style="line-height: 1.5 !important;"
													class="btn btn-rounded mt-0 btn-info font-medium"
													type="submit" id="submitThis2" value="Go" />
											</div>
										</div>
									</form>
								</div>
							</div>
							<div class="card alert">
								<div id="basic-pie" style="width: 100%;"></div>
							</div>
						</c:if>
						<div class="row mb-3">	
							<div class="col-5"></div>						
						    <div class="col-7">
						        <label for="statusFilter" class="mb-2">Filter by Status</label>
						        <select id="statusFilter" class="form-select form-control"
						        	style="background: #FFF; font-size: .975rem;">
						            <option value="">All</option>
						            <option value="Raised">Raised</option>
						            <option value="Opened">Opened</option>
						            <option value="In Progress">In Progress</option>
						            <option value="Closed">Closed</option>
						        </select>
						    </div>
						</div>
						<c:if test="${not empty tickets }">
							<c:forEach items="${tickets}" var="ticket">
								<div class="card ticket-card" data-status="${ticket.status}" style="background: #FFF; border-radius: 15px;">
									<div class="card-body row">
										<div class="col-3" style="writing-mode: vertical-lr;">
											<div class="text-center">
												<c:if test="${ticket.status eq 'Raised' }">
													<i class="fas fa-exclamation-triangle fa-2x text-dark"></i>
													<p class="m-0 p-0"><small>#${ticket.id }</small></p>
												</c:if>
												<c:if test="${ticket.status eq 'Opened' }">
													<i class="fas fa-folder-open fa-2x text-warning"></i>
													<p class="m-0 p-0"><small>#${ticket.id }</small></p>
												</c:if>
												<c:if test="${ticket.status eq 'In Progress' }">
													<img src="<%=request.getContextPath() %>/assets/images/statsicons/progress.png" 
														style="width: -webkit-fill-available;"/>
													<p class="m-0 p-0"><small>#${ticket.id }</small></p>
													<!-- <i class="fas fa-play fa-2x text-info"></i> -->
												</c:if>
												<c:if test="${ticket.status eq 'Closed' }">
													<i class="fas fa-check-circle fa-2x text-success"></i>
													<p class="m-0 p-0"><small>#${ticket.id }</small></p>
												</c:if>
											</div>
										</div>
										<div class="col-9">
											<h5 style="font-weight: 700; color: #000; margin-bottom: 0px;">${ticket.title }</h5>
											<small class="text-muted" style="margin-bottom: 0;">
												${ticket.raised_date } | Room: ${ticket.bdetails.room.room_no } | ${ticket.bdetails.property.name }</small>
											<p style="color: #000; font-size: 12px; margin-top: 15px;">${ticket.summary }</p>
											<div class="row">
												<div class="col-6">
												<button class="btn btn-sm" style="background: #F8D8D8; font-weight: 700;
														border-radius: 10px; text-transform: uppercase; width: 100%; color: #000;">
													${ticket.status }</button>													
												</div>
												<div class="col-6">
													<a class="btn btn-sm" style="background: #E0DBEF;
														border-radius: 10px; color: #000; font-weight: 700; width: 100%;"
														href="<%=request.getContextPath() %>/lct/tickets/view/${ticket.id }">DETAILS</a>
												</div>
											</div>
										</div>
									</div>										
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- footer -->
			<!-- ============================================================== -->
			<footer class="footer text-center"> All Rights Reserved by
				Ozai. </footer>
			<!-- ============================================================== -->
			<!-- End footer -->
			<!-- ============================================================== -->
		</div>
	</div>

	<div class="chat-windows"></div>
	<!-- ============================================================== -->
	<!-- All Jquery -->
	<!-- ============================================================== -->
	<script
		src="<%=request.getContextPath()%>/new/assets/libs/jquery/dist/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/extra-libs/taskboard/js/jquery.ui.touch-punch-improved.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/extra-libs/taskboard/js/jquery-ui.min.js"></script>
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
    <script src="<%=request.getContextPath()%>/new/assets/libs/echarts/dist/echarts-en.min.js"></script>
	<script>
		$('document').ready(function() {
			
			google.load("visualization", "1", {packages:["corechart"]});
    		google.setOnLoadCallback(drawCharts);
    		function drawCharts() {
    		  
    		  // BEGIN PIE CHART
    		  
    		  // pie chart data
    		  var pieData = google.visualization.arrayToDataTable([
    		    ['Category', 'Count'], ${ticketsChartData2 }]);
    		  // pie chart options
    		  var pieOptions = {
    		    backgroundColor: 'transparent',
    		    pieHole: 0,
    		    colors: [ "#4E5E77", 
    		              "#5FC7EA", 
    		              "#71AE60", 
    		              "#F7685F", 
    		              "#F9B534", 
    		              "purple", 
    		              "turquoise", 
    		              "forestgreen", 
    		              "navy", 
    		              "gray"],
    		    pieSliceText: 'value',
    		    tooltip: {
    		      text: 'percentage'
    		    },
    		    fontName: 'Open Sans',
    		    chartArea: {
    		      width: '100%',
    		      height: '100%'
    		    },
    		    legend: {
    		      textStyle: {
    		        fontSize: 13
    		      }
    		    }
    		  };
    		  // draw pie chart
    		  var pieChart = new google.visualization.PieChart(document.getElementById('basic-pie'));
    		  pieChart.draw(pieData, pieOptions);
    		}
			
			
			$('#tickets').DataTable({
				sorting : true
			});
			$('#hideBack').hide();
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
	<script>
	    document.addEventListener("DOMContentLoaded", function () {
	        const filterDropdown = document.getElementById("statusFilter");
	        const ticketsContainer = document.getElementById("ticketsContainer");
	        const tickets = document.querySelectorAll(".ticket-card");
	
	        filterDropdown.addEventListener("change", function () {
	            const selectedStatus = this.value;
	
	            tickets.forEach(ticket => {
	                if (selectedStatus === "" || ticket.getAttribute("data-status") === selectedStatus) {
	                    ticket.style.display = "block";
	                } else {
	                    ticket.style.display = "none";
	                }
	            });
	        });
	    });
	</script>
</body>
</html>