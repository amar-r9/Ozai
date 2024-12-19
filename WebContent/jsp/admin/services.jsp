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
<meta name="description" content="Tikaana Admin Dashboard" />
<meta name="robots" content="noindex,nofollow" />
<title>Ozai Admin Dashboard</title>
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
<style>
.error .help-block {
	width: max-content;
}

.chooseFrom {
	border-radius: 50%;
	border-color: #94b9de !important;
}
.img-circle {
	border-radius: 50%;
	background: #00000012;
    padding: 15px;
}
.chechedClass {
}

[type=radio] {
	position: absolute;
	opacity: 0;
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
					<div class="row align-self-center">
						<div class="col-8">
							<h4 class="page-title" style="font-weight: 900;">SERVICES</h4>
						</div>
						<div class="col-4">
							<a href="<%=request.getContextPath() %>/admin/orders/list"
								class="btn btn-sm btn-wide btn-primary btn-block d-block w-100">ORDERS</a>
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
				<div class="row">
					<div class="col-12">
						<div class="row">
							
							<div class="card">
								<div class="card-body">
									<div class="row">
										<h4 class="card-title">Categories</h4>
										<p class="text-danger">*Choose category</p>
										<div class="col-sm-4 col-4 mb-3">
											<div class="text-center">
												<a href="<%=request.getContextPath() %>/admin/orders/create/Groceries">
													<img style="height: 30px;"
														src="<%=request.getContextPath()%>/assets/img/services/groceries.png" />
													<br>
													<small  style="color: #000; font-size: .775em;">Groceries</small>
												</a>
											</div>
										</div>
										<div class="col-sm-4 col-4 mb-3">
											<div class="text-center">
												<a href="<%=request.getContextPath() %>/admin/orders/create/Vegetables">
													<img style="height: 30px;"
														src="<%=request.getContextPath()%>/assets/img/services/vegetables.png" />
													<br>
													<small style="color: #000; font-size: .775em;">Vegetables</small>
												</a>
											</div>
										</div>
										<div class="col-sm-4 col-4 mb-3">
											<div class="text-center">
												<a href="<%=request.getContextPath() %>/admin/orders/create/Dairy">
													<img style="height: 30px;"
														src="<%=request.getContextPath()%>/assets/img/services/dairy.png" />
													<br>
													<small style="color: #000; font-size: .775em;">Dairy</small>
												</a>
											</div>
										</div>
										<div class="col-sm-4 col-4 mb-3">
											<div class="text-center">
												<a href="<%=request.getContextPath() %>/admin/orders/create/Poultry">
													<img style="height: 30px;"
														src="<%=request.getContextPath()%>/assets/img/services/poultry.png" />
													<br>
													<small style="color: #000; font-size: .775em;">Poultry</small>
												</a>
											</div>
										</div>
										<div class="col-sm-4 col-4 mb-3">
											<div class="text-center">
												<a href="<%=request.getContextPath() %>/admin/orders/create/Food">
													<img style="height: 30px;"
														src="<%=request.getContextPath()%>/assets/img/services/food.png" />
													<br>
													<small style="color: #000; font-size: .775em;">Food</small>
												</a>
											</div>
										</div>
										<div class="col-sm-4 col-4 mb-3">
											<div class="text-center">
												<a href="<%=request.getContextPath() %>/admin/orders/create/Electrical">
													<img style="height: 30px;"
														src="<%=request.getContextPath()%>/assets/img/services/electrical.png" />
													<br>
													<small style="color: #000; font-size: .775em;">Electrical</small>
												</a>
											</div>
										</div>
										<div class="col-sm-4 col-4 mb-3">
											<div class="text-center">
												<a href="<%=request.getContextPath() %>/admin/orders/create/Electronics">
													<img style="height: 30px;"
														src="<%=request.getContextPath()%>/assets/img/services/electronics.png" />
													<br>
													<small style="color: #000; font-size: .775em;">Electronics</small>
												</a>
											</div>
										</div>
										<div class="col-sm-4 col-4 mb-3">
											<div class="text-center">
												<a href="<%=request.getContextPath() %>/admin/orders/create/Furniture">
													<img style="height: 30px;"
														src="<%=request.getContextPath()%>/assets/img/services/furniture.png" />
													<br>
													<small style="color: #000; font-size: .775em;">Furniture</small>
												</a>
											</div>
										</div>
										<div class="col-sm-4 col-4 mb-3">
											<div class="text-center">
												<a href="<%=request.getContextPath() %>/admin/orders/create/Security">
													<img style="height: 30px;"
														src="<%=request.getContextPath()%>/assets/img/services/security.png" />
													<br>
													<small style="color: #000; font-size: .775em;">HK & Security</small>
												</a>
											</div>
										</div>
										<div class="col-sm-4 col-4 mb-3">
											<div class="text-center">
												<a href="<%=request.getContextPath() %>/admin/orders/create/CCTV">
													<img style="height: 30px;"
														src="<%=request.getContextPath()%>/assets/img/services/cctv.png" />
													<br>
													<small style="color: #000; font-size: .775em;">CC TV</small>
												</a>
											</div>
										</div>
										<div class="col-sm-4 col-4 mb-3">
											<div class="text-center">
												<a href="<%=request.getContextPath() %>/admin/orders/create/Laundry">
													<img style="height: 30px;"
														src="<%=request.getContextPath()%>/assets/img/services/laundry.png" />
													<br>
													<small style="color: #000; font-size: .775em;">Laundry</small>
												</a>
											</div>
										</div>
										<div class="col-sm-4 col-4 mb-3">
											<div class="text-center">
												<a href="<%=request.getContextPath() %>/admin/orders/create/Water">
													<img style="height: 30px;"
														src="<%=request.getContextPath()%>/assets/img/services/water.png" />
													<br>
													<small style="color: #000; font-size: .775em;">Water</small>
												</a>
											</div>
										</div>
										<div class="col-sm-4 col-4 mb-3">
											<div class="text-center">
												<a href="<%=request.getContextPath() %>/admin/orders/create/Carpenter">
													<img style="height: 30px;"
														src="<%=request.getContextPath()%>/assets/img/services/carpenter.png" />
													<br>
													<small style="color: #000; font-size: .775em;">Carpenter</small>
												</a>
											</div>
										</div>
										<div class="col-sm-4 col-4 mb-3">
											<div class="text-center">
												<a href="<%=request.getContextPath() %>/admin/orders/create/Kitchen Equipments">
													<img style="height: 30px;"
														src="<%=request.getContextPath()%>/assets/img/services/kitchen-equipments.png" />
													<br>
													<small style="color: #000; font-size: .775em;">Kitchen Equipments</small>
												</a>
											</div>
										</div>
										<div class="col-sm-4 col-4 mb-3">
											<div class="text-center">
												<a href="<%=request.getContextPath() %>/admin/orders/create/Lift Service">
													<img style="height: 30px;"
														src="<%=request.getContextPath()%>/assets/img/services/liftservice.png" />
													<br>
													<small style="color: #000; font-size: .775em;">Lift Service</small>
												</a>
											</div>
										</div>
										<div class="col-sm-4 col-4 mb-3 chooseFrom">
											<div class="text-center">
												<a href="<%=request.getContextPath() %>/admin/orders/create/Man Power">
													<img style="height: 30px;"
														src="<%=request.getContextPath()%>/assets/img/services/manpower.png" />
													<br>
													<small style="color: #000; font-size: .775em;">Man Power</small>
												</a>
											</div>
										</div>
										<div class="col-sm-4 col-4 mb-3">
											<div class="text-center">
												<a href="<%=request.getContextPath() %>/admin/orders/create/Marketing">
													<img style="height: 30px;"
														src="<%=request.getContextPath()%>/assets/img/services/marketing.png" />
													<br>
													<small style="color: #000; font-size: .775em;">Marketing</small>
												</a>
											</div>
										</div>
										<div class="col-sm-4 col-4 mb-3">
											<div class="text-center">
												<a href="<%=request.getContextPath() %>/admin/orders/create/Software">
													<img style="height: 30px;"
														src="<%=request.getContextPath()%>/assets/img/services/software.png" />
													<br>
													<small style="color: #000; font-size: .775em;">Software</small>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
							
							
							<%-- <div class="card" style="display: none;" id="successScreen">
								<div class="card-img">
									<img class="img-fluid"
										src="<%=request.getContextPath()%>/assets/img/success.gif">
								</div>
								<div class="card-title text-center">
									<p>YOUR REQUEST HAS BEEN SUBMITTED.</p>
								</div>
								<button class="btn btn-dark btn-lg">Thank you.</button>
							</div> --%>

							<%-- <div class="card" id="formScreen">
								<div class="card-body">
									<form action="<%=request.getContextPath() %>/admin/saveProcurementRequest"
										method="post" role="form" id="request-form"
										class="mt-4" novalidate>
										<div class="row">
											<!--/span-->
											<!-- <h4 class="card-title">Categories</h4> -->
											<div class="col-md-12">
												<div class="mb-3">
													<div class="row">
														<div class="form-group row text-center">
															<h4 class="card-title">Categories</h4>
															<p class="text-danger">*Choose category</p>
															<div class="col-sm-4 col-4 mb-3 chooseFrom">
																<div class="text-center">
																	<input type="radio" id="category1" name="category" value="Groceries"
																		required />																		
																</div>
																<label class="form-check-label img-circle"
																	for="radio1" >
																	<img style="height: 30px;"
																		src="<%=request.getContextPath()%>/assets/img/services/groceries.png" />
																</label><br>
																<small
																	style="font-size: .775em;">Groceries</small>
															</div>
															<div class="col-sm-4 col-4 mb-3 chooseFrom">
																<div class="text-center">
																	<input type="radio" id="category2" name="category" value="Vegetables"
																		required />
																</div>
																<label class="form-check-label img-circle"
																	for="radio2">
																	<img style="height: 30px;"
																		src="<%=request.getContextPath()%>/assets/img/services/vegetables.png" />
																</label><br>
																<small style="font-size: .775em;">Vegetables</small>
															</div>
															<div class="col-sm-4 col-4 mb-3 chooseFrom">
																<div class="text-center">
																	<input type="radio" id="category3" name="category" value="Dairy"
																		required />
																</div>
																<label class="form-check-label img-circle"
																	for="radio3"><img style="height: 30px;"
																		src="<%=request.getContextPath()%>/assets/img/services/dairy.png" />
																</label><br>
																<small style="font-size: .775em;">Dairy</small>
															</div>
															<div class="col-sm-4 col-4 mb-3 chooseFrom">
																<div class="text-center">
																	<input type="radio" id="category4" name="category" value="Poultry"
																		required /> 
																</div>
																<label class="form-check-label img-circle"
																	for="radio4">
																	<img style="height: 30px;"
																		src="<%=request.getContextPath()%>/assets/img/services/poultry.png" />
																</label><br>
																<small style="font-size: .775em;">Poultry</small>
															</div>
															<div class="col-sm-4 col-4 mb-3 chooseFrom">
																<div class="text-center">
																	<input type="radio" id="category5" name="category" value="Food"
																		required />
																</div>
																<label class="form-check-label img-circle"
																	for="radio5">
																	<img style="height: 30px;"
																		src="<%=request.getContextPath()%>/assets/img/services/food.png" />
																</label><br>
																<small style="font-size: .775em;">Food</small>
															</div>
															<div class="col-sm-4 col-4 mb-3 chooseFrom">
																<div class="text-center">
																	<input type="radio" id="category6" name="category" value="Electrical"
																		required />
																</div>
																<label class="form-check-label img-circle"
																	for="radio6">
																	<img style="height: 30px;"
																		src="<%=request.getContextPath()%>/assets/img/services/electrical.png" />
																</label><br>
																<small style="font-size: .775em;">Electrical</small>
															</div>
															<div class="col-sm-4 col-4 mb-3 chooseFrom">
																<div class="text-center">
																	<input type="radio" id="category7" name="category" value="Electronics"
																		required />
																</div>
																<label class="img-circle">
																	<img style="height: 30px;"
																		src="<%=request.getContextPath()%>/assets/img/services/electronics.png" />
																</label><br>
																<small style="font-size: .775em;">Electronics</small>
															</div>
															<div class="col-sm-4 col-4 mb-3 chooseFrom">
																<div class="text-center">
																	<input type="radio" id="category8" name="category" value="Furniture"
																		required /> 
																</div>
																<label class="img-circle">
																	<img style="height: 30px;"
																		src="<%=request.getContextPath()%>/assets/img/services/furniture.png" />
																</label><br>
																<small style="font-size: .775em;">Furniture</small>
															</div>
															<div class="col-sm-4 col-4 mb-3 chooseFrom">
																<div class="text-center">
																	<input type="radio" id="category9" name="category"
																		 value="HK & Security" required /> 
																</div>
																<label class="img-circle">
																	<img
																		style="height: 30px;"
																		src="<%=request.getContextPath()%>/assets/img/services/security.png" />
																</label><br>
																<small style="font-size: .775em;">HK & Security</small>
															</div>
															<div class="col-sm-4 col-4 mb-3 chooseFrom">
																<div class="text-center">
																	<input type="radio" id="category10" name="category" value="CC TV"
																		required /> 
																</div>
																<label class="img-circle">
																	<img style="height: 30px;"
																		src="<%=request.getContextPath()%>/assets/img/services/cctv.png" />
																</label><br>
																<small style="font-size: .775em;">CC TV</small>
															</div>
															<div class="col-sm-4 col-4 mb-3 chooseFrom">
																<div class="text-center">
																	<input type="radio" id="category11" name="category" value="Laundry"
																		required /> 
																</div>
																<label class="img-circle">
																	<img style="height: 30px;"
																		src="<%=request.getContextPath()%>/assets/img/services/laundry.png" />
																</label><br>
																<small style="font-size: .775em;">Laundry</small>
															</div>
															<div class="col-sm-4 col-4 mb-3 chooseFrom">
																<div class="text-center">
																	<input type="radio" id="category12" name="category" value="Water"
																		required />
																</div>
																<label class="img-circle">
																	<img style="height: 30px;"
																		src="<%=request.getContextPath()%>/assets/img/services/water.png" />
																</label><br>
																<small style="font-size: .775em;">Water</small>
															</div>
															<div class="col-sm-4 col-4 mb-3 chooseFrom">
																<div class="text-center">
																	<input type="radio" id="category13" name="category" value="Carpenter"
																		required />
																</div>
																<label class="img-circle">
																	<img style="height: 30px;"
																		src="<%=request.getContextPath()%>/assets/img/services/carpenter.png" />
																</label><br>
																<small style="font-size: .775em;">Carpenter</small>
															</div>
															<div class="col-sm-4 col-4 mb-3 chooseFrom">
																<div class="text-center">
																	<input type="radio" id="category14" name="category"
																		value="Kitchen Equipments" required /> 
																</div>
																<label class="img-circle">
																	<img style="height: 30px;"
																		src="<%=request.getContextPath()%>/assets/img/services/kitchen-equipments.png" />
																</label><br>
																<small style="font-size: .775em;">Kitchen Equipments</small>
															</div>
															<div class="col-sm-4 col-4 mb-3 chooseFrom">
																<div class="text-center">
																	<input type="radio" id="category15" name="category"
																		value="Lift Service" required /> 
																</div>
																<label class="img-circle">
																	<img style="height: 30px;"
																		src="<%=request.getContextPath()%>/assets/img/services/liftservice.png" />
																</label><br>
																<small style="font-size: .775em;">Lift Service</small>
															</div>
															<div class="col-sm-4 col-4 mb-3 chooseFrom">
																<div class="text-center">
																	<input type="radio" id="category16" name="category" value="Man Power"
																		required />
																</div>
																<label class="img-circle">
																	<img style="height: 30px;"
																		src="<%=request.getContextPath()%>/assets/img/services/manpower.png" />
																</label><br>
																<small style="font-size: .775em;">Man Power</small>
															</div>
															<div class="col-sm-4 col-4 mb-3 chooseFrom">
																<div class="text-center">
																	<input type="radio" id="category17" name="category" value="Marketing"
																		required /> 
																</div>
																<label class="img-circle">
																	<img style="height: 30px;"
																		src="<%=request.getContextPath()%>/assets/img/services/marketing.png" />
																</label><br>
																<small style="font-size: .775em;">Marketing</small>
															</div>
															<div class="col-sm-4 col-4 mb-3 chooseFrom">
																<div class="text-center">
																	<input type="radio" id="category18" name="category" value="Software"
																		required />
																</div>
																<label class="img-circle">
																	<img style="height: 30px;"
																		src="<%=request.getContextPath()%>/assets/img/services/software.png" />
																</label><br>
																<small style="font-size: .775em;">Software</small>
															</div>
														</div>
													</div>
													<button type="button" style="display: none;"
														data-bs-toggle="modal" data-bs-target="#signup-modal"
														id="openForm">														
													</button>
													<div id="signup-modal" class="modal fade" tabindex="-1"
														aria-hidden="true">
														<div class="modal-dialog">
															<div class="modal-content">
																<div class="modal-body">
																	<div class="text-center mt-2 mb-4">
										                              <a href="#" class="text-success">
										                                <span id="categoryTitle"></span>
										                              </a>
										                            </div>
																	<div class="form-group">
																		<div class="mb-3 controls">
																			<label class="control-label">Item</label> <input
																				class="form-control" type="text" name="item"
																				minlength="2" id="item" required />
																		</div>
																	</div>
																	<input type="hidden" value="${AdminUser.client_code }" name="admin_id" id="admin_id" />
																	<div class="form-group">
																		<div class="mb-3 controls">
																			<label class="control-label">Quantity</label> <input
																				class="form-control" type="number" name="quantity"
																				id="quantity" required />
																		</div>
																	</div>
																	<div class="form-group">
																		<div class="mb-3 controls">
																			<label class="control-label">When do you need</label> <input
																				class="form-control form-select" type="date" name="needed_by"
																				id="needed_by" required />
																		</div>
																	</div>
					
																	<!--/span-->
																	<div class="form-group">
																		<div class="mb-3 controls">
																			<label class="control-label">Description</label>
																			<textarea class="form-control" name="description"
																				id="description" required></textarea>
																		</div>
																	</div>
																	<!--/row-->
																	<div class="form-actions text-center">
																		<div class="card-body border-top">
																			<button type="submit" id="send1"
																				class="btn btn-dark btn-lg px-4">
																				<div class="d-flex align-items-center">
																					<i data-feather="save" class="feather-sm me-1 fill-icon"></i>
																					SAVE
																				</div>
																			</button>
																		</div>
																	</div>
																</div>
															</div>
															<!-- /.modal-content -->
														</div>
													</div>
													<!-- <select
														class="form-control" name="vendor_type" id="vendor_type"
														required>
														<option value="">Select</option>
														<option value="Food">Food</option>
														<option value="Food">Groceries</option>
														<option value="Food">Vegetables</option>
														<option value="Food">Furniture</option>
														<option value="Food">Electronics</option>
														<option value="Food">Electrical</option>
														<option value="Food">HK & Security</option>
														<option value="Food">CC TV</option>
														<option value="Food">Dairy</option>
														<option value="Food">Poultry</option>
														<option value="Food">Water</option>
														<option value="Food">Lift Service & Maintenance</option>
														<option value="Food">Laundry</option>
														<option value="Food">Kitchen equipment</option>
														<option value="Food">Plumber|Electrician|Carpenter</option>
														<option value="Food">Marketing</option>
														<option value="Food">Software</option>
														<option value="Food">Manpower supply</option>
														<option value="Food">Accountants</option>
													</select> -->
												</div>
											</div>
									</form>
								</div>
							</div> --%>
						</div>
					</div>
				</div>
				<!-- -------------------------------------------------------------- -->
				<!-- End PAge Content -->
				<!-- -------------------------------------------------------------- -->
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
                font-weight-medium"
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
								<h4 class="mt-2">Soory</h4>
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
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- footer -->
			<!-- ============================================================== -->
			<footer class="footer text-center">All Rights Reserved by
				Ozai.</footer>
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
	<script
		src="<%=request.getContextPath()%>/new/assets/extra-libs/jqbootstrapvalidation/validation.js"></script>
	<script>
		!(function(window, document, $) {
			"use strict";
			$("input,select,textarea").not("[type=submit]")
					.jqBootstrapValidation();
		})(window, document, jQuery);
	</script>
	<script>
		$('document').ready(function() {
			$(".chooseFrom").click(function(event) {
				$(this).find('input').prop('checked', true)
				$('#openForm').click();
				$('#categoryTitle').html($('input[name=category]:checked', '#request-form').val());
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