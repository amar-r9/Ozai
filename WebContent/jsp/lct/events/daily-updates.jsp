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
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="keywords"
	content="Loan, Loan application, easy loan, tikaana" />
<meta name="description"
	content="Please fill out the details below to apply." />
<meta name="robots" content="noindex,nofollow" />
<title>Daily Updates | Ozai</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/new/assets/images/favicon.png" />
<!-- This page css -->
<link
	href="<%=request.getContextPath()%>/new/assets/extra-libs/toastr/dist/build/toastr.min.css"
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
				<!-- basic table -->
				<a href="<%=request.getContextPath()%>/lct/events/send-update">
					<div class="card card-body bg-warning text-white" style="border-radius: 10px;">
						<i class="fas fa-plus fa-2x"></i><br>
						<small>Add Daily Updates </small>
					</div>
				</a>
				<div class="row" id="formScreen">
					<div class="col-12">
						<div class="card alert">						
							<form id="pg-form" action="<%=request.getContextPath() %>/lct/events/dailyUpdates"
								role="form" method="post">
								<div class="input-group">
									<label class="col-sm-12 col-12">Select property</label>
									<select name="property_id" id="property_id"
										class="form-control form-select mt-2" required>
										<option value="">Choose</option>
										<c:forEach items="${pgs }" var="property">
											<option value="${property.id }">${property.name }</option>
										</c:forEach>
									</select>&nbsp;
									<input
										class="btn btn-secondary font-medium btn-rounded"
										type="submit" id="submitThis2" value="Go!" />
								</div>
							</form>
						</div>
						<c:if test="${not empty rooms }">
							<div class="card" style="padding: 5vh 2vh; width: 100%;">
								<div class="card-body" style="padding: 0;">
									<h4 class="card-title">Daily Updates</h4>
									<c:if test="${saved eq true }">
										<div class="alert alert-success">Saved.</div>
									</c:if>
									<div class="row mt-4">
										<c:if test="${ClientUser.access_level ge 2 }">
											<div class=" d-flex align-items-stretch">											
												<form style="width: 100%;"
													action="<%=request.getContextPath() %>/addDailyUpdate/${property_id }"
													method="post" id="daily-form">
													<table class="table">
														<thead>
															<tr>
																<th>#</th>
																<th>Room</th>
																<th colspan="2" class="text-center">Done</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${rooms}" var="room"
																varStatus="sno">
																<tr>
																		<td>${sno.index+1}</td>
																		<td>${room.room_no}
																			
																		<input type="hidden" name="room${sno.index+1}" value="${room.room_no }"
																			id="room_no" />
																		</td>
																		<td class="text-center">		
																			<div class="radio">
																				<label
																					class="mb-2 mr-2 btn-lg btn btn-light btn-block"
																					style="text-align: left;">
																				<input name="val${sno.index+1}" type="radio"
																					value="Done" id="optionValue">
																					<span>Yes</span>
																				</label>
																			</div>
																		</td>
																		<td>
																			<div class="radio">
																				<label
																					class="mb-2 mr-2 btn-lg btn btn-light btn-block"
																					style="text-align: right;">
																				<input name="val${sno.index+1}" type="radio"
																					value="Not Done" id="optionValue">
																					<span>No</span>
																				</label>
																			</div>
																		</td>
																	</tr>			
																</c:forEach>
															</tbody>
														</table>
														<input type="hidden" name="property_id" value="${property_id }"
															id="property_id">
														<input type="hidden"
															name="client_code" id="client_code" value="${ClientUser.client_code }">
														<input type="hidden"
															name="admin_id" id="admin_id" value="0">
												
														<div class="modal-footer text-muted" id="quiz-actions">														
															&nbsp;
															<button type="submit" class="btn btn-success btn-md"
																id="finish">SAVE</button>
															&nbsp;
	
														</div>
													</form>
											</div>										
										</c:if>
									</div>
								</div>
							</div>
						</c:if>
						<div class="card alert">
							<div class="card-header">
								<form id="pg-form" action="<%=request.getContextPath() %>/lct/events/updatesByDay"
									role="form" method="post">
									<div class="input-group">
										<label class="text-dark col-12">Select Date</label>
										<input type="date" name="submit_date" id="submit_date"
											class="form-control mt-2" required />
											&nbsp;
										<input
											class="btn btn-dark font-medium btn-rounded"
											type="submit" id="send" value="Go!" />
									</div>
								</form>
							</div>
							<c:choose>
								<c:when test="${not empty updates }">
									<table class="table display">
										<thead></thead>
										<tbody>
											<c:forEach items="${updates }" var="update">
											<tr>
												<th>${update.room_no }</th>
												<td>${update.status }</td>
												<td>${update.submit_date }</td>
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:when>
								<c:otherwise>
									No updates found.
								</c:otherwise>
							</c:choose>
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
	<!--This page JavaScript -->
	<script
		src="<%=request.getContextPath()%>/new/dist/js/pages/notes/notes.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/extra-libs/toastr/dist/build/toastr.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/extra-libs/toastr/toastr-init.js"></script>
	<script>
		$('document').ready(function() {
			$("#success-alert").on("click", function() {
				toastr.success("Message sent", {
					showMethod : "slideDown",
					hideMethod : "slideUp",
					timeOut : 2000
				});
			});
			$("#error-alert").on("click", function() {
				toastr.error("Error, Please try again later.", {
					showMethod : "slideDown",
					hideMethod : "slideUp",
					timeOut : 2000
				});
			});
			$("#empty-alert").on("click", function() {
				toastr.warning("Please fill in all the details.", {
					showMethod : "slideDown",
					hideMethod : "slideUp",
					timeOut : 2000
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