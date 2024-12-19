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
							<p style="font-weight: 900; color: #000;">Send Updates</p>
							<form id="notice-form" method="post">
								<div class="mb-3">
									<input type="text" name="title" id="title"
										style="border-radius: 50px;" class="form-control"
										id="exampleInputname2" placeholder="Title" required />
								</div>
								<input type="hidden" name="client_code"
									value="${ClientUser.client_code }" />
								<div class="mb-3">
									<textarea id="message" style="border-radius: 20px;"
										class="form-control" name="message" rows="4"
										placeholder="Message" required></textarea>
								</div>
								<div class="text-center">
									<button type="submit" id="send"
										class="btn btn-dark btn-rounded 
				                        	font-weight-medium">
										SUBMIT</button>
								</div>
							</form>
						</div>
						<div class="alert alert-success" id="successMsg"
							style="display: none;">
							<i class="fas fa-check-circle"></i> Notification sent.
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
		$('#notice-form').submit(function(event){
			event.preventDefault();
			saveNotice();
		});
		
		function saveNotice(){
			var formData=$("#notice-form").serialize();
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/lct/saveNotice",
				data : formData,
				//contentType: "text/json; charset=utf-8",
	            //dataType: "json",
				timeout : 100000,
				beforeSend:function(){
					$("#loading").show();
					$("#notice-form").hide();
				},
				success : function(data) {
					
					console.log("SUCCESS: ", data);
					
					if(data=='success'){
						$("#notice-form")[0].reset();
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