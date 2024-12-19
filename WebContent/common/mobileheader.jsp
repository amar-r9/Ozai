<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header class="topbar" style="height: 65px;">
<!-- <script>
  document.write('<a href="' + document.referrer + '">Back</a>');
</script> -->
	<nav class="navbar top-navbar navbar-expand-md navbar-dark">
		<div class="w-100 navbar-header" style="background: #2c3c4c; position: relative;">
			<!-- This is for the sidebar toggle which is visible on mobile only -->

			<!-- ============================================================== -->
			<!-- Logo -->
			<!-- ============================================================== -->
			<div class="navbar-brand">
				<div class="row"> 
					<!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
					<!-- Dark Logo icon -->
					<div class="col-8">
						<c:choose>
							<c:when test="${not empty User }">
								<h4 class="text-dark fst-normal pt-1 ps-2"
									style="vertical-align: -webkit-baseline-middle; color: #000 !important;">
									<span class="text-start">
										<img src="<%=request.getContextPath() %>/assets/images/ozaiappicon.png" style="width: 25px;" /></span>
									${User.name }</h4>
							</c:when>
							<c:otherwise>
								<img src="<%=request.getContextPath()%>/assets/img/adminlogo.png"
									alt="Ozai Logo" style="height: 50px; vertical-align: -webkit-baseline-middle;" class="dark-logo" /> 
								<!-- Light Logo icon -->
								<img src="<%=request.getContextPath()%>/assets/img/adminlogo.png"
									alt="Ozai Logo" style="height: 50px; vertical-align: -webkit-baseline-middle;" class="light-logo" />
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<!--End Logo icon -->
			</div>
			<!-- ============================================================== -->
			<!-- End Logo -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Toggle which is visible on mobile only -->
			<!-- ============================================================== -->
			<div class="text-end">
			<c:if test="${empty User }">
				<a class="nav-link dropdown-toggle waves-effect waves-dark pro-pic"
					href="<%=request.getContextPath()%>/mobile/signin"> 
					<!-- <i class="fa fa-user-circle fa-3x text-primary"></i> -->
					<img
						src="https://www.ozailiving.com/assets/images/user.png"
						alt="user" class="rounded-circle" height="40" width="40" style="vertical-align: bottom;" />

				</a>
			</c:if>
			<c:if test="${not empty User }">
				<a href="<%=request.getContextPath() %>/mobile/user/notifications/list"
					class="btn-rounded m-1 p-1"><i class="far fa-bell text-white"></i></a>
				<a href="<%=request.getContextPath() %>/mobile/user/chat/list"
					class="btn-rounded m-1 p-1"><i class="bi bi-chat-left-dots text-white"></i></a>
				<!-- <button class="btn text-danger" type="button"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight"
					aria-controls="offcanvasRight">
					<img  id="clickForCount"
						src="<%=request.getContextPath()%>/resources/DisplayUserProfileImage"														
						alt="user" class="rounded-circle" height="40" width="40" style="vertical-align: bottom;"  />
				</button> -->
				<a class="btn text-danger" href="<%=request.getContextPath() %>/mobile/user/details">
					<img  id="clickForCount"
						src="<%=request.getContextPath()%>/resources/DisplayUserProfileImage"														
						alt="user" class="rounded-circle" height="40" width="40" style="vertical-align: bottom;"  />
				</a>
			</c:if></div>
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
		<img src="<%=request.getContextPath()%>/resources/DisplayUserProfileImage"
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
	                 src="<%=request.getContextPath()%>/resources/DisplayUserProfileImage"
	                 class="rounded-3 img-fluid"
	                 width="90"
	               />
	               <div class="mt-n2">
	                 <span class="badge bg-primary">${User.username }</span>
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
	                       ><!-- <i class="ri-star-fill display-7"></i
	                     > --></span>
	                     
	                     <div class="ms-2 text-start">
	                       <c:choose>
	                       	<c:when test="${User.is_resident eq 'YES' && User.resident_type eq 'B2C' }">
		                       <h6 class="fw-normal text-muted mb-0">Room</h6>
		                       <h4 class="mb-0"></h4>	                       
	                       </c:when>
	                       <c:otherwise>
	                       		<h6 class="fw-normal text-muted mb-0">Room</h6>
		                       	<h4 class="mb-0"></h4>	
	                       </c:otherwise>
	                       </c:choose>
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
	                       ><!-- <i class="ri-question-answer-fill display-7"></i
	                     > --></span>
	                     <div class="ms-2 text-start">
	                       <c:choose>
	                       	<c:when test="${User.is_resident eq 'YES' && User.resident_type eq 'B2C' }">
	                       		<h6 class="fw-normal text-muted mb-0">Camp</h6>
	                       		<h4 class="mb-0"></h4>
	                       </c:when>
	                       <c:otherwise>
	                       		<h6 class="fw-normal text-muted mb-0">Camp</h6>
	                       		<h4 class="mb-0"></h4>
	                       </c:otherwise>
	                       </c:choose>
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
             <a href="<%=request.getContextPath() %>/mobile/user/tickets/list">
             <div class="row pb-3 border-bottom">
               <div class="col-3 col-xl-2">
                 <div class="
                     bg-light-primary
                     text-primary text-center
                     py-2
                     rounded-3
                   ">
                   <i class="fas fa-ticket-alt fa-2x"></i>
                 </div>
               </div>
               <div class="col-9 col-xl-10 d-flex align-items-center">
                 <div>
                   <h5 class="card-title mb-1">Tickets</h5>
                   <p class="text-muted mb-0">
                     View your tickets
                   </p>
                 </div>
               </div>
             </div></a>
             <a href="#">
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
                   <h5 class="card-title mb-1">Payments</h5>
                   <p class="text-muted mb-0">
                     View your payments
                   </p>
                 </div>
               </div>
             </div></a>
           </div>
         </div>
         <div><hr></div>
         <a href="<%=request.getContextPath()%>/logout" style="width: 100%;"
          		class="btn btn-lg btn-wide btn-block btn-danger"><i class="fas fa-sign-out-alt"></i>&nbsp;&nbsp;LOGOUT</a>
          <div><br><br><br></div>
         </c:if>
	</div>
</div>
<a onclick="history.back()" class="ipadcss card pt-2 ps-2 bg-light" id="hideBack" style="z-index: 10;
    margin-bottom: 50px; top: 70px; position: fixed; width: 100%;
	border-radius: unset; box-shadow: none; background: none;">
	<i class="bi bi-arrow-left fa-2x text-secondary" style="vertical-align: bottom;"></i></a>