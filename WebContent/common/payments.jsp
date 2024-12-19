<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<button class="btn text-danger" type="button" data-bs-toggle="offcanvas"
	data-bs-target="#offcanvasRight" aria-controls="offcanvasRight" id="clickThisForPopUP">
	<img id="clickForCount"
		src="<%=request.getContextPath()%>/assets/images/user.jpg" alt="user"
		class="rounded-circle" height="40" width="40"
		style="vertical-align: bottom;" />
</button>
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight"
	aria-labelledby="offcanvasRightLabel">
	<div class="offcanvas-header">
		<img
			src="<%=request.getContextPath()%>/assets/images/background/user1.jpg"
			alt="user" class="rounded-circle" width="40" />
		<button type="button" class="btn-close text-reset"
			data-bs-dismiss="offcanvas" aria-label="Close"></button>
	</div>
	<div class="offcanvas-body">
		<c:if test="${not empty User }">
			<div class="card">
				<div class="" style="padding-bottom: 0px;">
					<div class="card text-center">
						<div class="card-body">
							<c:if test="${not empty sds }">
								<c:forEach items="${sds }" var="sd">
									<div class="col-sm-12 col-md-6 col-xl-3">
										<a
											href="<%=request.getContextPath() %>/mobile/user/sd-payment/${sd.id}"
											class="card bg-dark"
											style="border-radius: 20px !important;">

											<div class="card-body text-dark">
												<div class="d-flex flex-row align-items-center">
													<div
														class="round rounded-circle d-inline-block  
				                        text-center bg-light-danger text-dark">
														Pay</div>
													<div class="ms-3">
														<h4 class="mb-0 text-white">Security Deposit</h4>
														<span class="text-white-50"></span>
													</div>
													<div class="ms-auto">
														<h4 class="font-weight-medium mb-0 text-white">
															<i class="fas fa-rupee-sign"></i> &nbsp;${sd.amount }

														</h4>
													</div>
												</div>
											</div>
										</a>
									</div>
								</c:forEach>
							</c:if>
							<c:if test="${not empty bills }">
								<c:forEach items="${bills }" var="bill">
									<div class="col-sm-12 col-md-6 col-xl-3">
										<a
											href="<%=request.getContextPath() %>/mobile/user/electricity-payment/${bill.id}"
											class="card bg-primary"
											style="border-radius: 20px !important;">

											<div class="card-body text-dark">
												<div class="d-flex flex-row align-items-center">
													<div
														class="round rounded-circle d-inline-block  
				                        text-center bg-light-danger text-dark">
														Pay</div>
													<div class="ms-3">
														<h4 class="mb-0 text-white">Electricity Bill</h4>
														<span class="text-white-50"></span>
													</div>
													<div class="ms-auto">
														<h4 class="font-weight-medium mb-0 text-white">
															<i class="fas fa-rupee-sign"></i> &nbsp;${bill.amount }

														</h4>
													</div>
												</div>
											</div>
										</a>
									</div>
								</c:forEach>
							</c:if>
							<c:if test="${User.tenant_type eq 'B2C' }">
								<c:if test="${not empty rentStatus2 }">
									<div class="col-sm-12 col-md-6 col-xl-3">
										<a
											href="<%=request.getContextPath() %>/mobile/user/make-payment/${rentStatus2}"
											class="card bg-danger"
											style="border-radius: 20px !important;">

											<div class="card-body text-dark">
												<div class="d-flex flex-row align-items-center">
													<div
														class="round rounded-circle d-inline-block  
				                        					text-center bg-light-danger text-dark">
														Pay</div>
													<div class="ms-3">
														<h4 class="mb-0 text-white">${rentStatus2 }RentDue</h4>
														<span class="text-white-50"></span>
													</div>
													<div class="ms-auto">
														<h4 class="font-weight-medium mb-0 text-white">
															<i class="fas fa-rupee-sign"></i> &nbsp;${User.rent }

														</h4>
													</div>
												</div>
											</div>
										</a>
									</div>
								</c:if>

								<c:if test="${not empty rentStatus1 }">
									<div class="col-sm-12 col-md-6 col-xl-3">
										<a
											href="<%=request.getContextPath() %>/mobile/user/make-payment/${rentStatus1}"
											class="card bg-light-warning"
											style="border-radius: 20px !important;">

											<div class="card-body text-dark">
												<div class="d-flex flex-row align-items-center">
													<div
														class="round rounded-circle d-inline-block  
					                        			text-center bg-light-danger text-dark">
														Pay</div>
													<div class="ms-3">
														<h4 class="mb-0 text-dark">${rentStatus1 }RentDue</h4>
														<span class="text-dark-50"></span>
													</div>
													<div class="ms-auto">
														<h4 class="font-weight-medium mb-0 text-dark">
															<i class="fas fa-rupee-sign"></i> &nbsp;${User.rent }

														</h4>
													</div>
												</div>
											</div>
										</a>
									</div>
								</c:if>
								<c:if test="${not empty rentStatus }">
									<div class="col-sm-12 col-md-6 col-xl-3">
										<a
											href="<%=request.getContextPath() %>/mobile/user/make-payment/${rentStatus}"
											class="card bg-light-info"
											style="border-radius: 20px !important;">

											<div class="card-body text-dark">
												<div class="d-flex flex-row align-items-center">
													<div
														class="round rounded-circle d-inline-block  
						                        text-center bg-light-danger text-dark">
														Pay</div>
													<div class="ms-3">
														<h4 class="mb-0 text-dark">${rentStatus }RentDue</h4>
														<span class="text-dark-50"></span>
													</div>
													<div class="ms-auto">
														<h4 class="font-weight-medium mb-0 text-dark">
															<i class="fas fa-rupee-sign"></i> &nbsp;${User.rent }
														</h4>
													</div>
												</div>
											</div>
										</a>
									</div>
								</c:if>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</c:if>
	</div>
</div>