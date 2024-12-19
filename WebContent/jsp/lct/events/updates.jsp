<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<meta name="description"
	content="Nice is powerful and clean admin dashboard template, inpired from Google's Material Design" />
<meta name="robots" content="noindex,nofollow" />
<title>Updates | Ozai</title>
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
		<jsp:include page="/common/lctheader.jsp"></jsp:include>
		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<jsp:include page="/common/lctsidebar.jsp"></jsp:include>
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<div class="page-wrapper" style="margin-top: 120px;">
			<!-- ============================================================== -->
			<!-- End Left Sidebar - style you can find in sidebar.scss  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Page wrapper  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<div class="row">
					<div class="col-12">
						<div class="card alert">							
							<div class="row">
								<!-- <div class="col-4 text-start">
									<a href="<%=request.getContextPath()%>/lct/events/daily-updates">
										<div class="card card-body bg-info text-white" style="border-radius: 10px;">
											<i class="fas fa-plus fa-2x"></i><br>
											<small>Daily Updates</small>
										</div>
									</a>
								</div> -->
								<div class="col-6">
									<a href="<%=request.getContextPath()%>/lct/events/delivery-updates">
										<div class="card card-body bg-warning text-white" style="border-radius: 10px;">
											<i class="fas fa-gift fa-2x"></i><br>
											<small>Delivery Updates</small>
										</div>
									</a>
								</div>
								<div class="col-6">
									<a href="<%=request.getContextPath()%>/lct/events/daily-updates">
										<div class="card card-body bg-danger text-white" style="border-radius: 10px;">
											<i class="fas fa-envelope fa-2x"></i><br>
											<small>Daily Updates</small>
										</div>
									</a>
								</div>
							</div>							
						</div>	
						
						<div class="card alert">
							<h5>Delivery</h5>
							<form id="delivery-form" method="post">
								<div class="mb-3">
									<label class="col-sm-12 col-12">Select property</label>
									<select name="property_id" id="property_id"
										class="form-control form-select mt-2" required>
										<option value="">Choose</option>
										<c:forEach items="${pgs }" var="property">
											<option value="${property.id }">${property.name }</option>
										</c:forEach>
									</select>
								</div>
								<div class="mb-3">
									<input type="text" name="name" id="name"
										style="border-radius: 50px;" class="form-control"
										id="exampleInputname2" placeholder="Name" required />
								</div>
								<div class="mb-3">
									<label class="col-sm-12 col-12">Date</label>
									<input type="date" name="submit_dat" id="submit_date"
										style="border-radius: 50px;" class="form-control"
										id="exampleInputname2" required />
								</div>
								<div class="mb-3">
									<label class="col-sm-12 col-12">Delivery Partner</label>
									<input type="text" name="entry_by" id="entry_by"
										style="border-radius: 50px;" class="form-control"
										id="exampleInputname2" required />
								</div>
								<input type="hidden" name="client_code"
									value="${ClientUser.client_code }" />
								
								<div class="text-center">
									<button type="submit" id="send"
										class="btn btn-dark btn-rounded 
				                        	font-weight-medium">
										SUBMIT</button>
								</div>
							</form>
							<div class="alert alert-success" id="successMsg"
								style="display: none;">
								<i class="fas fa-check-circle"></i> Saved.
							</div>
						</div>


					</div>
					<!-- -------------------------------------------------------------- -->
					<!-- Login box.scss -->
					<!-- -------------------------------------------------------------- -->
				</div>
			</div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- End footer -->
	<!-- ============================================================== -->
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
	<!-- This Page JS -->
	<script
		src="<%=request.getContextPath()%>/new/assets/extra-libs/prism/prism.js"></script>
	<script>
		$('#delivery-form').submit(function(event){
			event.preventDefault();
			saveNotice();
		});
		
		function saveNotice(){
			var formData=$("#delivery-form").serialize();
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/lct/addDelivery",
				data : formData,
				//contentType: "text/json; charset=utf-8",
	            //dataType: "json",
				timeout : 100000,
				beforeSend:function(){
					$(':input[type="submit"]').prop('disabled', true);
				},
				success : function(data) {
					
					console.log("SUCCESS: ", data);
					
					if(data=='success'){
						$("#delivery-form")[0].reset();
						$('#successMsg').show();
					}else
					if(data=='failed'){
						$('#errorMsg').show();
					} else if(data=='empty'){
						$('#emptyMsg').click();
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
	</script>
</body>

</html>