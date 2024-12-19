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
	content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, nice admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, " />
<meta name="description" content="Tikaana Admin Dashboard " />
<meta name="robots" content="noindex,nofollow" />
<title>Ozai Admin Dashboard</title>
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
					<div class="col-12 text-center">
						<h5 class="text-dark fw-bold">EDIT ROOM
							<span style="float: right;">
								<a href="<%=request.getContextPath() %>/lct/properties/add-bed/${room.property_id }">Add beds</a></span>
						</h5>
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
					<div class="col-9 col-md-9 col-sm-12 col-12">
						<!-- ---------------------
                            start File export
                        ---------------- -->
						<div class="card card-body text-center"
							style="border-radius: 10px; box-shadow: 2px 2px 2px 2px #c7c4d7;">
							<span class="fw-bold">${room.property.name }</span> <i
								class="bi bi-door-closed fa-2x text-info"></i> <span><span
								class="text-muted">Room no:</span> ${room.room_no }</span>
						</div>

						<div id="openForm"
							class="card bg-success text-white w-100 card-hover"
							style="box-shadow: 3px 3px 3px !important;">
							<div class="card-body">
								<div class="d-flex align-items-center">
									<span class="display-6 fw-bold">${room.sharing }</span>
									<div class="ms-auto">
										<i data-feather="arrow-right" class="fill-white"></i>
									</div>
								</div>
								<div class="mt-4">
									<h4 class="card-title mb-1 fw-bold text-white">Sharing</h4>
									<h6 class="card-text fw-normal text-white">Click here
										to change sharing.</h6>
								</div>
							</div>
						</div>

						<div class="card card-body" id="sharingForm"
							style="display: none;">
							<span class="text-end" id="closeForm"><i
								class="fas fa-2x text-danger fa-window-close"></i></span>
							<form action="#" id="sharing-form">
								<input type="hidden" name="room_id" value="${room.id }" />
								<div class="form-group">
									<div class="mb-3 controls">
										<label class="control-label">Sharing</label> <select
											class="form-control" name="sharing" id="sharing" required>
											<option value="${room.sharing }">${room.sharing }</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
										</select>
									</div>
								</div>
								<br>
								<div class="col-12 text-center">
									<input type="submit" class="btn btn-dark" value="SUBMIT" />
								</div>
							</form>
						</div>
						<div class="card alert">
							<div class="card-header">
								<h6 class="text-dark fw-bold">ADD INVENTORY</h6>
							</div>
							<form action="#"
								id="inventory-form" method="post">
								<div class="row">
									<div class="col-6 form-group">
										<div class="mb-3 controls">
											<label class="control-label">Item</label>
											<input class="form-control" type="text" 
												name="item" id="item" required />
										</div>
									</div>
									<!--/span-->
									<div class="col-6 form-group">
										<div class="mb-3 controls">
											<label class="control-label">Quantity</label>
											<input class="form-control" type="text" name="quantity" 
												id="quantity" required />
										</div>
									</div>
								</div>										
								<input type="hidden" name="property_id" value="${room.property_id }" />
								<input type="hidden" name="room_id" value="${room.id }" />
								<input type="hidden" name="client_code" value="${ClientUser.client_code }" />										
								<div id="education_fields" class="my-4"></div>											
								<div class="row">
									<div class="mb-3">
										<button onclick="education_fields();"
											class="btn rounded-pill px-4 btn-light-success
	                         						text-success font-weight-medium waves-effect waves-light"
											type="button">
											<i data-feather="plus-circle" class="feather-sm fill-white"></i>
										</button>
									</div>
								</div>
								<div class="form-actions">
									<div class="card-body border-top text-center">
										<button type="submit" id="send"
											class="btn btn-dark">
											<div class="d-flex align-items-center">
												SUBMIT
											</div>
										</button>
									</div>
								</div>
							</form>
						</div><br>
						<div class="card">
							<div class="card-body">
								<c:choose>
									<c:when test="${not empty ins }">
										<div class="row">
											<table class="table search-table v-middle">
												<thead>
													<tr>
														<th style="font-weight: 900; color: #000;">Item</th>
														<th>															
															<h5 style="font-weight: 900; color: #000;">Quantity</h5>
														</th>
													</tr>
												</thead>
												<tbody>													
													<c:forEach items="${ins }" var="in">
														<tr>
															<td>${in.item }</td>
															<td>${in.quantity }</td>
														</tr>														
													</c:forEach>
												</tbody>
											</table>
										</div>
									</c:when>
									<c:otherwise>
										<h6>There's no inventory added for this room.</h6>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="card">
							<div class="card-header">Residents</div>
							<div class="card-body">
								<c:forEach items="${details }" var="user">
									<div class="card alert" style="background: #5f9ea0ab;">
										<div class="row">
											<div class="col-3">
												<img class="img-circle" style="border-radius: 50%; width: 100%;"
													onerror="this.onerror=null; this.src='https://www.ozailiving.com/assets/images/profiledefault.png'"
													src="https://www.ozailiving.com/profile-user/image/${user.user_id }" alt="User Pic">
											</div>
											<div class="col-9">
												<div class="row">
													<div class="col-6 text-center">
														<h4 class="text-center text-dark fw-bold">${user.user.name }</h4>
														<span class="text-center text-white">Bed - ${user.bed.bed_no }</span>
													</div>
													<div class="col-6 text-end">
														<a href=""><i class="fa-2x text-dark ri-arrow-right-s-fill"></i></a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
								<c:forEach items="${bdetails }" var="user">
									<div class="card alert" style="background: #5f9ea0ab;">
										<div class="row">
											<div class="col-3">
												<img class="img-circle" style="border-radius: 50%; width: 100%;"
													onerror="this.onerror=null; this.src='https://www.ozailiving.com/assets/images/profiledefault.png'"
													src="https://www.ozailiving.com/profile-user/image/${user.user_id }" alt="User Pic">
											</div>
											<div class="col-9">
												<div class="row">
													<div class="col-6 text-center">
														<h4 class="text-center text-dark fw-bold">${user.user.name }</h4>
														<span class="text-center text-white">Bed - ${user.bed.bed_no }</span>
													</div>
													<div class="col-6 text-end">
														<a href=""><i class="fa-2x text-dark ri-arrow-right-s-fill"></i></a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
								<c:if test="${empty details && empty bdetails }">
									No residents in this room.
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>

			<button type="button"
				class="btn btn-light-success
	        	text-success font-weight-medium
	            btn-lg px-4 fs-4 font-weight-medium"
				data-bs-toggle="modal" id="onSuccess" style="display: none;"
				data-bs-target="#al-success-alert">Success Alert</button>
			<div class="modal fade" id="al-success-alert" tabindex="-1"
				aria-labelledby="vertical-center-modal" aria-hidden="true">
				<div class="modal-dialog modal-sm">
					<div
						class="
                  modal-content modal-filled
                  bg-light-success
                  text-success">
						<div class="modal-body p-4">
							<div class="text-center text-success">
								<i data-feather="check-circle" class="fill-white feather-lg"></i>
								<h4 class="mt-2 text-success">Thank You!</h4>
								<p class="mt-3 text-success-50">Details have been submitted.
								</p>
								<button type="button" class="btn btn-light my-2"
									data-bs-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
			</div>

			<button type="button"
				class="
                btn btn-light-warning
                text-warning
                font-weight-medium
                btn-lg
                px-4
                fs-4
                font-weight-medium
              "
				id="errorMsg" data-bs-toggle="modal" style="display: none;"
				data-bs-target="#al-warning-alert">Warning Alert</button>

			<!-- Vertically centered modal -->
			<div class="modal fade" id="al-warning-alert" tabindex="-1"
				aria-labelledby="vertical-center-modal" aria-hidden="true">
				<div class="modal-dialog modal-sm">
					<div class="modal-content modal-filled bg-light-warning">
						<div class="modal-body p-4">
							<div class="text-center text-warning">
								<i data-feather="alert-octagon" class="fill-white feather-lg"></i>
								<h4 class="mt-2">Sorry</h4>
								<p class="mt-3">Submission failed, Please try again later.</p>
								<button type="button" class="btn btn-light my-2"
									data-bs-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
			</div>

			<button type="button"
				class="
                btn btn-light-danger
                text-danger
                font-weight-medium
                btn-lg
                px-4
                fs-4
                font-weight-medium"
				style="display: none;" data-bs-toggle="modal" id="emptyMsg"
				data-bs-target="#al-danger-alert">Danger Alert</button>

			<!-- Vertically centered modal -->
			<div class="modal fade" id="al-danger-alert" tabindex="-1"
				aria-labelledby="vertical-center-modal" aria-hidden="true">
				<div class="modal-dialog modal-sm">
					<div class="modal-content modal-filled bg-light-danger">
						<div class="modal-body p-4">
							<div class="text-center text-danger">
								<i data-feather="x-octagon" class="fill-white feather-lg"></i>
								<h4 class="mt-2">Oh snap!</h4>
								<p class="mt-3">Please fill in all the fields to submit.</p>
								<button type="button" class="btn btn-light my-2"
									data-bs-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
			</div>
			<!-- ============================================================== -->

			<button type="button"
				class="
                btn btn-light-danger
                text-danger
                font-weight-medium
                btn-lg
                px-4
                fs-4
                font-weight-medium"
				style="display: none;" data-bs-toggle="modal" id="alreadyMsg"
				data-bs-target="#al-danger-alert1">Danger Alert</button>

			<!-- Vertically centered modal -->
			<div class="modal fade" id="al-danger-alert1" tabindex="-1"
				aria-labelledby="vertical-center-modal" aria-hidden="true">
				<div class="modal-dialog modal-sm">
					<div class="modal-content modal-filled bg-light-danger">
						<div class="modal-body p-4">
							<div class="text-center text-danger">
								<i data-feather="x-octagon" class="fill-white feather-lg"></i>
								<h4 class="mt-2">Oh snap!</h4>
								<p class="mt-3">This payment details are already been
									updated.</p>
								<button type="button" class="btn btn-light my-2"
									data-bs-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
					<!-- /.modal-content -->
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
	<script src="<%=request.getContextPath()%>/assets/country-state.js"></script>
	<!-- Template Main JS File -->
	<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
	<script
		src="<%=request.getContextPath()%>/new/assets/extra-libs/jqbootstrapvalidation/validation.js"></script>
	<script src="<%=request.getContextPath()%>/new/assets/libs/jquery.repeater/jquery.repeater.min.js"></script>
    <script src="<%=request.getContextPath()%>/new/assets/extra-libs/jquery.repeater/repeater-init.js"></script>
    <script src="<%=request.getContextPath()%>/new/assets/extra-libs/jquery.repeater/inventory.js"></script>
	<script>
		$('document').ready(function() {
			$('#openForm').click(function() {
				$('#sharingForm').slideDown();
			});
			$('#closeForm').click(function() {
				$('#sharingForm').slideUp();
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
	<script>
		$('document').ready(function() {
			$("#sharing-form").submit(function(event) {
				event.preventDefault();
				saveVacateNotice();
			});
			
			$("#inventory-form").submit(function(e) {
				e.preventDefault();
				saveInventory();
			});
		});
		function saveVacateNotice() {
			var formData = $("#sharing-form").serialize();
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/updateRoom",
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
						$('#sharingForm').hide();
						$('#error-alert').empty();
						$('#error-alert')
								.html(
										'<div class=\"alert alert-success\">Updated successfully.</div>');
					} else if (data == 'error') {
						$('#error-alert').empty();
						$('#error-alert')
								.html(
										'<div class=\"alert alert-warning\">Technical error, Please try later.</div>');
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
		}
		
		function saveInventory() {
			var formData = $("#inventory-form").serialize();
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/lct/addRoomInventory",
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
						$('#onSuccess').click();
					} else if (data == 'error') {
						$('#errorMsg').click();
					} else if (data == 'empty') {
						$('#emptyMsg').click();
					} else if (data == 'already-updated') {
						$('#alreadyMsg').click();
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
</body>
</html>