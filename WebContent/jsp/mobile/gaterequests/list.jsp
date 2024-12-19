<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>Gate Requests | Ozai</title>
<link rel="canonical"
	href="https://www.wrappixel.com/templates/niceadmin/" />
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="<%=request.getContextPath()%>/assets/images/favicon.png" />
<!-- This page css -->
<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/new/dist/css/style.min.css"
	rel="stylesheet" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<!-- loader section -->
	<jsp:include page="/common/preloader.jsp"></jsp:include>
	<!-- loader section ends -->

	<!-- Begin page -->
	<div id="main-wrapper">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->
		<jsp:include page="/common/mobileheader.jsp"></jsp:include>
		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<!-- Chat list   -->
		<div class="row">
			<div class="col-12">
				<c:if test="${not empty requests }">
					<div class="container m-0 p-0 mb-4" id="gateRequest">
						<h4 class="text-center mb-3">Gate entry requests</h4>
						<div class="list-group" id="gateRequestAlert">
							<!-- Request Card Start -->
							<c:forEach items="${requests }" var="req">
								<c:choose>
									<c:when test="${req.type eq 'Guest' }">
										<a
											href="<%=request.getContextPath() %>/mobile/user/gaterequests/view/${req.id}"
											class="mb-3 text-dark"
											style="background: linear-gradient(#b6a0a0b5, rgb(255 224 224 / 64%)), url('<%=request.getContextPath() %>/assets/images/guests.png'); 
										        border-radius: 10px; background-size: contain; background-position: right center; 
												background-repeat: no-repeat;">
											<c:choose>
												<c:when test="${req.status eq 'Pending'}">
													<span style="float: right;" class="p-2 bg-dark text-white">${req.status }</span>
												</c:when>
												<c:otherwise>
													<span style="float: right;" class="p-2 bg-success">${req.status }</span>
												</c:otherwise>
											</c:choose>
											<div
												class="d-flex justify-content-between align-items-center p-2">
												<div class="d-flex flex-column">
													<h5 class="mb-1">Guest</h5>
													<p class="mb-1">
														You have a guest, <b>${req.name}</b> is waiting for your
														approval.
													</p>
													<small class="mb-1">Mobile: ${req.mobile}</small> <small>Requested
														at: <fmt:formatDate value="${req.time}"
															pattern="MMM dd, yyyy" />, <fmt:formatDate
															value="${req.time}" pattern="hh:mm aa" />
													</small>
												</div>
											</div>
										</a>
										<!-- Request Card End -->
									</c:when>
									<c:otherwise>
										<a
											href="<%=request.getContextPath() %>/mobile/user/gaterequests/view/${req.id}"
											class="mb-3 text-dark"
											style="background: linear-gradient(#b6a0a0b5, rgb(255 224 224 / 64%)), url('<%=request.getContextPath() %>/assets/images/delivery-guy.png'); 
										        background-size: contain; background-position: right center; background-repeat: no-repeat;
										        border-radius: 10px;">
											<c:choose>
												<c:when test="${req.status eq 'Pending'}">
													<span style="float: right;" class="p-2 bg-dark text-white">${req.status }</span>
												</c:when>
												<c:otherwise>
													<span style="float: right;" class="p-2 bg-success">${req.status }</span>
												</c:otherwise>
											</c:choose>
											<div
												class="d-flex justify-content-between align-items-center p-2">
												<div class="d-flex flex-column">
													<h5 class="mb-1">Delivery</h5>
													<p class="mb-1">${req.name }
														from <b>${req.from }</b> is waiting for your approval.
													</p>
													<small>Requested at: <fmt:formatDate
															value="${req.time}" pattern="MMM dd, yyyy" />, <fmt:formatDate
															value="${req.time}" pattern="hh:mm aa" />
													</small>
												</div>
											</div>
										</a>
										<!-- Request Card End -->
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
					</div>
				</c:if>
			</div>
		</div>
		<jsp:include page="/common/mobilefooter.jsp"></jsp:include>
	</div>

	<!-- Required jquery and libraries -->
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
    <script src="<%=request.getContextPath()%>/new/dist/js/pages/chat/chat.js"></script>
    <script>
    	$('document').ready(function(){
    		$('#hideBack').hide();
    	});
   		function searchFunction() {
   		    var input, filter, ul, li, a, i, txtValue;
   		    input = document.getElementById("searchInput");
   		    filter = input.value.toUpperCase();
   		    ul = document.getElementById("messagesList");
   		    li = ul.getElementsByTagName("li");
   		    for (i = 0; i < li.length; i++) {
   		        a = li[i].getElementsByTagName("a")[0];
   		        txtValue = a.textContent || a.innerText;
   		        if (txtValue.toUpperCase().indexOf(filter) > -1) {
   		            li[i].style.display = "";
   		        } else {
   		            li[i].style.display = "none";
   		        }
   		    }
   		}
    </script>
</body>
</html>