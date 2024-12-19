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
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="keywords"
	content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, nice admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, " />
<meta name="description"
	content="Nice is powerful and clean admin dashboard template, inpired from Google's Material Design" />
<meta name="robots" content="noindex,nofollow" />
<title>Employ Module | Admin | Ozai</title>
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
					<div class="col-12 align-self-center">
						<h4 class="page-title">Employ Module</h4>
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
				<!-- Row -->
				<div class="row">
					<div class="">
						<div class="card">
							<div class="row">
								<div class="col-12">
									<c:if test="${AdminUser.access_level eq 1 }">
										<div class="card-body ">
											<div class="row border-bottom">
												<c:if test="${not empty payments }">
													<div class="table-responsive mt-4">
														<table class="table table-bordered no-wrap fs-3">
															<thead>
																<tr>
																	<th><b>Screen Shot</b></th>
																	<th><b>Payment Id</b></th>
																	<th><b>Expense Code</b></th>
																	<th><b>Amount To Be Paid</b></th>
																	<th><b>Amount Paid</b></th>
																	<th><b>Pending Amount</b></th>
																	<th><b>Payment Date</b></th>
																	<th><b>Txn Ref No</b></th>
																</tr>
															</thead>
															<tbody>
																<c:forEach items="${payments}" var="payment">
																	<tr>
																		<td>
																			<button class="btn btn-light-warning text-warning"
																				data-bs-toggle="modal"
																				data-bs-target="#bs-example-modal-xlg${payment.id }">
																				<i class="ri-attachment-2"></i>
																			</button>
																			<div class="modal fade"
																				id="bs-example-modal-xlg${payment.id }"
																				tabindex="-1" aria-labelledby="bs-example-modal-lg"
																				aria-hidden="true">
																				<div class="modal-dialog modal-xl">
																					<div class="modal-content">
																						<div
																							class="modal-header d-flex align-items-center">
																							<h4 class="modal-title" id="myLargeModalLabel">
																							</h4>
																							<button type="button" class="btn-close"
																								data-bs-dismiss="modal" aria-label="Close"></button>
																						</div>
																						<div class="modal-body">
																							<iframe
																								src="https://tikaana.com/uploaded_files/DOC/SALARIES/${payment.screen_shot }"
																								style="height: 500px; width: 100%;"></iframe>
																						</div>
																						<div class="modal-footer">
																							<button type="button"
																								class="btn btn-light-danger text-danger
											                                font-weight-medium waves-effect text-start"
																								data-bs-dismiss="modal">Close</button>
																						</div>
																					</div>
																				</div>
																			</div>
																		</td>
																		<td>${payment.id }</td>
																		<td>${payment.expense_id }</td>
																		<td>${payment.amount_to_be_paid }</td>
																		<td>${payment.amount_paid }</td>
																		<td>${payment.pending_amount }</td>
																		<td>${payment.payemnt_date }</td>
																		<td>${payment.txn_ref_no }</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</div>
												</c:if>
												<c:if test="${empty payments }">
													<h4>No payments added so far for this expense.</h4>
												</c:if>
											</div>
										</div>
										<%-- <c:if test="${finance.status == 'Due' }"> --%>
										<div class="card-header bg-info">
											<h4 class="card-title text-white">Add Payment</h4>
										</div>
										<c:if test="${expense.status == 'Due' }">
											<div class="row">
												<form
													action="<%=request.getContextPath()%>/admin/addSalaryPayment"
													id="payment-form" method="post" modelAttribute="payment"
													enctype="multipart/form-data">
													<div class="">
														<div class="card-body ">
															<div class="align-content-center text-center">
																<button class="btn btn-light-danger text-danger">Bank
																	Identifier : ${employ.identifier }</button>
															</div>
														</div>
														<div class="card-body">
															<!--/row-->
															<div class="row">
																<div class="col-md-12">
																	<div class="mb-3 row">
																		<label
																			class="control-label text-start 
					                            							col-md-3">Amount
																			to be paid</label>
																		<div class="col-md-9">
																			<input type="text" name="amount_to_be_paid"
																				id="amount_to_be_paid" class="form-control"
																				value="${expense.amount_to_be_paid }" />
																		</div>
																	</div>
																</div>
																<div class="col-md-12">
																	<div class="mb-3 row">
																		<label class="control-label text-start col-md-3">Payment
																			Date</label>
																		<div class="col-md-9">
																			<input type="date" name="payemnt_date"
																				id="payemnt_date" required class="form-control"
																				value="${today }" />
																		</div>
																	</div>
																</div>
															</div>
															<!--/row-->
															<div class="row">
																<!--/span-->
																<div class="col-md-12">
																	<div class="mb-3 row">
																		<label class="control-label text-start col-md-3">Amount
																			Paid</label>
																		<div class="col-md-9">
																			<input type="text" name="amount_paid"
																				id="amount_paid" required class="form-control"
																				value="${pendingAmount }" />
																		</div>
																	</div>
																</div>
															</div>
															<!--/row-->
															<div class="row">
																<input type="hidden" name="amount_cleared"
																	id="amount_cleared" value="${totalAmountPaid }" />
																<input type="hidden" name="employ_id" id="employ_id"
																	value="${expense.employ_id }" />
																<input type="hidden" name="expense_id" id="expense_id"
																	value="${expense.id }" />
																<input type="hidden" name="admin_id" id="admin_id"
																	value="${expense.admin_id }" />
																<!--/span-->
																<div class="col-md-12">
																	<div class="mb-3 row">
																		<label class="control-label text-start col-md-3">Txn
																			Reference No</label>
																		<div class="col-md-9">
																			<input type="text" name="txn_ref_no" id="txn_ref_no"
																				required class="form-control" />
																		</div>
																	</div>
																</div>
																<!--/span-->

																<div class="col-md-12">
																	<div class="mb-3 row">
																		<label class="control-label text-start col-md-3">Select
																			File Attachment</label>
																		<div class="col-md-9">
																			<input name="payment_file" id="payment_file"
																				type="file" accept="image/*" class="form-control"
																				onchange="readURL(this)" required />
																			<!-- <small class="form-text text-muted">This is some placeholder block-level help text for the above input. It's a bit lighter and easily wraps to a new line.</small> -->
																		</div>
																	</div>
																</div>
															</div>

															<!--/span-->
														</div>

														<div class="p-3 border-top">
															<div class="text-start">
																<button type="submit"
																	class="btn btn-info
					                            rounded-pill px-4 waves-effect waves-light">
																	Save</button>

															</div>
														</div>
													</div>
												</form>
											</div>
										</c:if>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<button type="button"
				class="btn btn-light-success
        	text-success font-weight-medium
            btn-lg px-4 fs-4 font-weight-medium"
				style="display: none;" data-bs-toggle="modal" id="onSuccess"
				data-bs-target="#al-success-alert">Success Alert</button>

			<div class="modal fade" id="al-success-alert" tabindex="-1"
				aria-labelledby="vertical-center-modal" aria-hidden="true">
				<div class="modal-dialog modal-sm">
					<div
						class="
                  modal-content modal-filled
                  bg-light-success
                  text-success
                ">
						<div class="modal-body p-4">
							<div class="text-center text-success">
								<i data-feather="check-circle" class="fill-white feather-lg"></i>
								<h4 class="mt-2 text-success">Thank You!</h4>
								<p class="mt-3 text-success-50">Details have been submitted.
								</p>
								<a
									href="<%=request.getContextPath() %>/ops/employees/salary/${employ.id }"
									class="btn btn-light my-2"> Close </a>
							</div>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
			</div>

			<button type="button"
				class="btn btn-light-warning text-warning
              font-weight-medium btn-lg
              px-4 fs-4 font-weight-medium"
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
									data-bs-dismiss="modal">
									Close</button>
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
				data-bs-target="#al-danger-alert">
				Danger Alert</button>

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
									data-bs-dismiss="modal">
									Close</button>
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
			<footer class="footer text-center"> All Rights Reserved by
				Ozai admin. </footer>
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
	<c:if test="${added eq 'true' }">
		<script>
			$('document').ready(function() {
				$('#onSuccess').click();
			});
		</script>
	</c:if>
	<c:if test="${added eq false }">
		<script>
			$('document').ready(function() {
				$('#errorMsg').click();
			});
		</script>
	</c:if>
	<script type="text/javascript">
		function readURL(input) {

			var image = input;
			var image_obj = $('#payment_file');

			if ((image.files[0].size / 1024).toFixed(0) > 50 * 1024) {

				alert("Attachment must be less or equal to 50MB");
				image_obj.replaceWith(image_obj.val('').clone(true));
				return;
			}
		}
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