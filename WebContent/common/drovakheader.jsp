<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="topbar" style="height: 6px;">
<style>
	.page-wrapper {
		background: #ffffff;
		padding-top: 40px !important;
		padding-bottom: 50px !important;
	}
	.topbar .top-navbar {
		min-height: 50px;
	}
</style>
	<nav class="navbar top-navbar navbar-expand-md navbar-dark">
		<div class="navbar-header" style="background: #55affc !important; line-height: 45px;">
			<!-- This is for the sidebar toggle which is visible on mobile only -->

			<!-- ============================================================== -->
			<!-- Logo -->
			<!-- ============================================================== -->
			<div class="navbar-brand">
				<a href="<%=request.getContextPath() %>/mobile" style="padding-top: 5%;">
				<!-- Logo icon -->
				<b class="logo-icon"> <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
					<!-- Dark Logo icon --> <img
					src="<%=request.getContextPath()%>/assets/images/logo.png"
					alt="Drovak Logo" style="height: 50px; vertical-align: -webkit-baseline-middle;" class="dark-logo" /> <!-- Light Logo icon -->
					<img
					src="<%=request.getContextPath()%>/assets/images/logo.png"
					alt="Drovak Logo" style="height: 50px; vertical-align: -webkit-baseline-middle;" class="light-logo" />
				</b>
				<!--End Logo icon -->
				<!-- Logo text -->
				<span class="logo-text" style="color: #081c24; vertical-align: -webkit-baseline-middle;"> <!-- dark Logo text --> <b>Drovak</b>
					<!-- Light Logo text -->

				</span></a>
			</div>
			<!-- ============================================================== -->
			<!-- End Logo -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Toggle which is visible on mobile only -->
			<!-- ============================================================== -->
			<c:if test="${empty User }">
				<a class="nav-link dropdown-toggle waves-effect waves-dark pro-pic"
					href="<%=request.getContextPath()%>/mobile/login"> 
					<!-- <i class="fa fa-user-circle fa-3x text-primary"></i> -->
					<img
					src="<%=request.getContextPath()%>/assets/images/user.jpg"
					alt="user" class="rounded-circle" height="40" width="40" style="vertical-align: bottom;" />

				</a>
			</c:if>
			<c:if test="${not empty User }">
				<button class="btn text-danger" type="button"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight"
					aria-controls="offcanvasRight">
					<img  id="clickForCount"
						src="<%=request.getContextPath()%>/assets/images/user.jpg"
						alt="user" class="rounded-circle" height="40" width="40" style="vertical-align: bottom;"  />
				</button>
			</c:if>
		</div>
		<!-- ============================================================== -->
		<!-- End Logo -->
		<!-- ============================================================== -->
		<div class="navbar-collapse collapse" id="navbarSupportedContent">
			<!-- ============================================================== -->
			<!-- toggle and nav items -->
			<!-- ============================================================== -->

			<!-- ============================================================== -->
			<!-- Right side toggle and nav items -->
			<!-- ============================================================== -->

		</div>
	</nav>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/assets/extra-libs/prism/prism.css" />
	<script src="<%=request.getContextPath() %>/assets/extra-libs/prism/prism.js"></script>
</header>
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight"
	aria-labelledby="offcanvasRightLabel">
	<div class="offcanvas-header">
		<img src="<%=request.getContextPath()%>/assets/images/background/user1.jpg"
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
	               <img
	                 src="<%=request.getContextPath() %>/assets/images/users/1.jpg"
	                 class="rounded-3 img-fluid"
	                 width="90"
	               />
	               <div class="mt-n2">
	                 <span class="badge bg-primary">${User.phone }</span>
	                 <h3 class="card-title mt-3">${User.name }</h3>
	                 <h6 class="card-subtitle">${User.city }, ${User.state }</h6>
	               </div>
	               <div class="row mt-3 justify-content-center">
	                 <div class="col-6 col-xl-3">
	                   <div
	                     class="
	                       py-2
	                       px-3
	                       bg-light
	                       rounded-pill
	                       d-flex
	                       align-items-center
	                     "
	                   >
	                     <span class="text-warning"
	                       ><i class="ri-star-fill display-7"></i
	                     ></span>
	                     <div class="ms-2 text-start">
	                       <h6 class="fw-normal text-muted mb-0">Points</h6>
	                       <h4 class="mb-0">${User.points }</h4>
	                     </div>
	                   </div>
	                 </div>
	                 <div class="col-6 col-xl-3">
	                   <div
	                     class="
	                       py-2
	                       px-3
	                       bg-light
	                       rounded-pill
	                       d-flex
	                       align-items-center
	                     "
	                   >
	                     <span class="text-primary"
	                       ><i class="ri-question-answer-fill display-7"></i
	                     ></span>
	                     <div class="ms-2 text-start">
	                       <h6 class="fw-normal text-muted mb-0">Feedback</h6>
	                       <h4 class="mb-0"><span id="feedback-count"></span></h4>
	                     </div>
	                   </div>
	                 </div>
	               </div>
	             </div>
	           </div>
           </div>
           <div>
             <hr>
           </div>
           <div class="card-body">
             <a href="<%=request.getContextPath() %>/mobile/user/vehicles-list">
             <div class="row pb-3 border-bottom">
               <div class="col-3 col-xl-2">
                 <div class="
                     bg-light-primary
                     text-primary text-center
                     py-2
                     rounded-3
                   ">
                   <i class="fas fa-car fa-2x"></i>
                 </div>
               </div>
               <div class="col-9 col-xl-10 d-flex align-items-center">
                 <div>
                   <h5 class="card-title mb-1">Vehicles</h5>
                   <p class="text-muted mb-0">
                     View your vehicles
                   </p>
                 </div>
               </div>
             </div></a>
             <a href="<%=request.getContextPath() %>/mobile/user/expenses-list">
             <div class="row py-3 border-bottom">
               <div class="col-3 col-xl-2">
                 <div class="
                     bg-light-danger
                     text-danger text-center
                     py-2
                     rounded-3
                   ">
                   <i class="fas fa-rupee-sign fa-2x"></i>
                 </div>
               </div>
               <div class="col-9 col-xl-10 d-flex align-items-center">
                 <div>
                   <h5 class="card-title mb-1">Expenses</h5>
                   <p class="text-muted mb-0">
                     View your expenses
                   </p>
                 </div>
               </div>
             </div></a>
             <a href="<%=request.getContextPath() %>/mobile/user/vehicle/feedbacks-list">
             <div class="row pt-3">
               <div class="col-3 col-xl-2">
                 <div class="
                     bg-light-info
                     text-info text-center
                     py-2
                     rounded-3
                   ">
                   <i class="fas fa-bullhorn fa-2x"></i>
                 </div>
               </div>
               <div class="col-9 col-xl-10 d-flex align-items-center">
                 <div>
                   <h5 class="card-title mb-1">Feedback</h5>
                   <p class="text-muted mb-0">View your feedback</p>
                 </div>
               </div>
             </div></a>
           </div>
         </div>
         <div><hr></div>
         <a href="<%=request.getContextPath() %>/mobile/logout" style="width: 100%;"
          		class="btn btn-lg btn-wide btn-block btn-danger"><i class="fas fa-sign-out-alt"></i>&nbsp;&nbsp;LOGOUT</a>
          <div><br><br><br></div>
         </c:if>
	</div>
</div>
<!-- <script>
	$('document').ready(function(){
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/mobile/getFeedbackCount",
			timeout : 10000,
			beforeSend:function(){
				$('#feedback-count').append('<i class="fa fa-spinner text-center fa-spin orange" id="loading"></i>');
			},
			success : function(data) {
				
				console.log("SUCCESS: ", data);
				alert(+data);
				$('#feedback-count').empty();
				$('#feedback-count').html(+data);
				
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
</script> -->