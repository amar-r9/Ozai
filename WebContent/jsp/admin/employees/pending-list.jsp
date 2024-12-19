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
<title>Ozai Admin Dashboard for Employees</title>
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
					<div class="col-5 align-self-center">
						<h4 class="page-title"></h4>
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
					<div class="card">
						<div class="border-bottom title-part-padding">
							<h4 class="card-title mb-0 fw-bold text-center">Employees
								List</h4>
						</div>
						<div class="card-body">
							<div class="alert alert-success" id="successMsg"
								style="display: none;">
								<i class="fa fa-check-circle text-white"></i>&nbsp;Updated
								successfully.
							</div>
							<div class="alert alert-warning" id="existMsg"
								style="display: none;">
								<i class="fas fa-exclamation-triangle text-white"></i>&nbsp;Already
								been generated for the month.
							</div>
							<div class="alert alert-danger" id="failMsg"
								style="display: none;">
								<i class="fas fa-exclamation-triangle text-white"></i>&nbsp;Updating
								failed, Try again.
							</div>
							<form id="month-form"
								action="<%=request.getContextPath()%>/admin/employees/salaries-to-be-generated/month"
								role="form" method="get">
								<label class="control-label col-md-3">Choose month to generate salary expenses.</label>
								<div class="row">
									<div class="col-8">
										<div class="mb-3 row">
											<div class="col-md-9">
												<input type="month" name="month" id="month"
													class="form-control" />
											</div>
										</div>
									</div>
									<div class="col-4">
										<input class="btn btn-dark text-white"
											type="submit" id="submitThis" value="GO" />
									</div>
								</div>
							</form>

							<div class="row bg-info text-white text-center" style="border-radius: 10px;">
								<h4>List of salaries to be generated for the month
									${requestedMonth }</h4>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-4 text-start">
							<a href="<%=request.getContextPath()%>/admin/employees/list">
								<div class="card card-body bg-info text-white" style="border-radius: 10px;">
									<i class="fas fa-users fa-2x"></i><br>
									<small>Employ List</small>
								</div>
							</a>
						</div>
						<div class="col-4">
							<a href="<%=request.getContextPath()%>/admin/employees/salary-list">
								<div class="card card-body bg-warning text-white" style="border-radius: 10px;">
									<i class="fas fa-rupee-sign fa-2x"></i><br>
									<small>Pay Salary</small>
								</div>
							</a>
						</div>
						<div class="col-4">
							<a href="<%=request.getContextPath()%>/admin/employees/salary-paid">
								<div class="card card-body bg-danger text-white" style="border-radius: 10px;">
									<i class="fas fa-rupee-sign fa-2x"></i><br>
									<small>Paid Salary</small>
								</div>
							</a>
						</div>
					</div>
					<div class="">
						<div class="table-responsive">
							<c:if test="${not empty employees }">
								<table id="tenants">
									<thead>
									</thead>
									<tbody>
										<!-- start row -->
										<c:forEach items="${employees}" var="employ">
											<tr>
												<td><c:if test="${AdminUser.access_level eq 1 }">
														<div class="card" style="border-radius: 20px;">
															<div class="card-body">
																<div class="row">
																	<div class="col-auto">
																		<div class="avatar avatar-44 shadow-sm rounded-10">
																			<img
																				src="http://www.ozailiving.com/assets/images/default-user.png"
																				style="width: 44px; border-radius: 5px;">
																		</div>
																	</div>
																	<div class="col align-self-center ps-0">
																		<p class="mb-n2 text-color-theme fw-bold">${employ.first_name }</p>
																		<small class="mt-n2 text-muted small">${employ.role }</small>
																	</div>
																	<div class="col-auto">
																		${employ.salary }/-
																	</div>
																</div>
																<div class="card bg-light" style="border-radius: 20px;">
																	<div class="card-body">
																		<div class="row">
																			<div class="col align-self-center ps-0">
																				<div class="row">
																					<div class="col-auto">
																						<span class="text-muted size-12 ">Join Date:
																							${employ.join_date }</span>
																					</div>
																				</div>
																				<div class="row">
																					<label class="control-label col-12">Service
																						Month</label>
																					<div class="row">
																						<div class="col-10">
																							<input type="month" name="month"
																								id="month${employ.id }"
																								class="form-control form-control-sm" />
																								<small>Select month and generate salary expense.</small>
																						</div>
																						<div class="col-2">
																							<button class="btn btn-sm btn-info"
																								onclick="getRentDue${employ.id}()">
																								<i class="fa fa-arrow-right"></i>
																							</button>
																						</div>
																					</div>
																					<script>
																				        function getRentDue${employ.id}(){
																				        	$('document').ready(function() {
																				        		
																				        		$.ajax({
																				    				type : "GET",
																				    				url : "${pageContext.request.contextPath}/admin/createSalaryExpense/${employ.id}/"+$('#month${employ.id}').val()+"",
																				    				//contentType: "application/json; charset=utf-8",
																				    	            //dataType: "json",
																				    				timeout : 100000,
																				    				beforeSend:function(){
																				    					//$('#rent-due-${tenant.id }').html('<i class="fa fa-spinner fa-spin orange"></i>');
																				    				},
																				    				success : function(data) {
																				    					console.log("SUCCESS: ", data);
																				    					if(data=="Success") {
																					    					$("#successMsg").hide();
																				    						$("#failMsg").hide();
																				    						$("#existMsg").hide();
																					    					$("#successMsg").fadeIn();
																					    					//location.reload();
																				    					} else if(data=="Filed") {
																				    						$("#failMsg").hide();
																				    						$("#failMsg").fadeIn();
																				    						$("#existMsg").hide();
																					    					$("#successMsg").hide();
																				    					} else if(data=="Exist") {
																				    						$("#existMsg").hide();
																				    						$("#existMsg").fadeIn();
																				    						$("#failMsg").hide();
																					    					$("#successMsg").hide();
																				    						
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
																				        	});
																				        }
																					</script>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</c:if>
												</td>
											</tr>
										</c:forEach>
										<!-- end row -->
									</tbody>
								</table>
							</c:if>
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
	$('document').ready(function(){
		$('#tenants').DataTable({
			sorting: false,
			"footerCallback": function ( row, data, start, end, display ) {
	            var api = this.api();
	 
	            // Remove the formatting to get integer data for summation
	            var intVal = function ( i ) {
	                return typeof i === 'string' ?
	                    i.replace(/[\$,]/g, '')*1 :
	                    typeof i === 'number' ?
	                        i : 0;
	            };
	 
	            // Total over all pages
	            total = api
	                .column( 4 )
	                .data()
	                .reduce( function (a, b) {
	                    return intVal(a) + intVal(b);
	                }, 0 );
	 
	            // Total over this page
	            pageTotal = api
	                .column( 4, { page: 'current'} )
	                .data()
	                .reduce( function (a, b) {
	                    return intVal(a) + intVal(b);
	                }, 0 );
	 
	            // Update footer
	            $( api.column( 4 ).footer() ).html(
	                '&#8377;'+pageTotal +' ( &#8377;'+ total +' total)'
	            );
	        }
	    } );
		$('.buttonJoin').click();
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